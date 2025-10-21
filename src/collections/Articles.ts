import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'

import type { CollectionConfig } from 'payload'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import path from 'path'
import fs from 'fs'
import * as mammoth from 'mammoth'
import { htmlToLexicalState } from '@/utils/htmlToLexical'
// word-extractor has no types
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import WordExtractor from 'word-extractor'
import { EXPERIMENTAL_TableFeature } from '@payloadcms/richtext-lexical'
import { TextSizeFeature } from 'payload-lexical-typography'
import { seoFields } from '@/fields/seoFields'

function transliterate(text: string): string {
  const map: Record<string, string> = {
    а: 'a', б: 'b', в: 'v', г: 'g', д: 'd', е: 'e', ё: 'yo', ж: 'zh', з: 'z',
    и: 'i', й: 'y', к: 'k', л: 'l', м: 'm', н: 'n', о: 'o', п: 'p', р: 'r',
    с: 's', т: 't', у: 'u', ф: 'f', х: 'h', ц: 'ts', ч: 'ch', ш: 'sh',
    щ: 'sch', ь: '', ы: 'y', ъ: '', э: 'e', ю: 'yu', я: 'ya',
  }
  return text
    .toLowerCase()
    .split('')
    .map((char) => map[char] ?? char)
    .join('')
    .replace(/[^a-z0-9\s-]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
}

export const Articles: CollectionConfig = {
  slug: 'articles',

  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  admin: {
    useAsTitle: 'title',
  },

  hooks: {
    beforeValidate: [],
    beforeChange: [
      // 1) Import pipeline before save to avoid nested update/locks
      async ({ data, req, operation, originalDoc }) => {
        try {
          const logger: any = (req as any)?.payload?.logger ?? console
          const artId = (originalDoc as any)?.id || (data as any)?.id
          logger.info?.(`[articles/import] beforeChange start op=${operation} id=${artId}`)

          const importRef: any = (data as any)?.importFile ?? (originalDoc as any)?.importFile
          try {
            const preview = typeof importRef === 'object' ? { id: (importRef as any)?.id, filename: (importRef as any)?.filename } : importRef
            logger.info?.(`[articles/import] data.importFile raw=${JSON.stringify(preview)}`)
          } catch { }

          const importId: string | undefined =
            typeof importRef === 'string'
              ? importRef
              : typeof importRef === 'number'
                ? String(importRef)
                : importRef?.id != null
                  ? String(importRef.id)
                  : undefined

          if (!importId) {
            logger.info?.('[articles/import] no importFile set - skipping')
            return data
          }

          logger.info?.(`[articles/import] import media id=${importId}`)
          const mediaDoc = await req.payload.findByID({ collection: 'media', id: importId })
          const filename: string | undefined = (mediaDoc as any)?.filename || (mediaDoc as any)?.file?.filename
          if (!filename) {
            logger.warn?.('[articles/import] media has no filename - abort')
            return data
          }

          logger.info?.(`[articles/import] media filename=${filename}`)
          const candidatePaths = [
            path.resolve(process.cwd(), 'media', filename),
            path.resolve(process.cwd(), 'public', 'media', filename),
          ]
          let fullPath = candidatePaths.find((p) => fs.existsSync(p)) || ''
          logger.info?.(`[articles/import] candidates: ${candidatePaths.join(' | ')}`)
          if (!fullPath) {
            const url: string | undefined = (mediaDoc as any)?.url
            if (url) {
              const clean = url.replace(/^\//, '')
              const fromUrlA = path.resolve(process.cwd(), clean)
              const fromUrlB = path.resolve(process.cwd(), 'public', clean)
              fullPath = [fromUrlA, fromUrlB].find((p) => fs.existsSync(p)) || ''
            }
          }
          if (!fullPath) {
            logger.warn?.('[articles/import] file not found on disk - abort')
            return data
          }

          logger.info?.(`[articles/import] resolved path=${fullPath}`)
          const ext = path.extname(fullPath).toLowerCase()
          logger.info?.(`[articles/import] file ext=${ext}`)

          if (ext === '.docx') {
            logger.info?.('[articles/import] .docx: mammoth.convertToHtml start')
            const styleMap = [
              "p[style-name='Heading 1'] => h1:fresh",
              "p[style-name='Heading 2'] => h2:fresh",
              "p[style-name='Heading 3'] => h3:fresh",
              "p[style-name='Heading 4'] => h4:fresh",
              "p[style-name='Heading 5'] => h5:fresh",
              "p[style-name='Heading 6'] => h6:fresh",
              "p[style-id='Heading1'] => h1:fresh",
              "p[style-id='Heading2'] => h2:fresh",
              "p[style-id='Heading3'] => h3:fresh",
              "p[style-id='Heading4'] => h4:fresh",
              "p[style-id='Heading5'] => h5:fresh",
              "p[style-id='Heading6'] => h6:fresh",
              // Localized/common names
              "p[style-name='Заголовок 1'] => h1:fresh",
              "p[style-name='Заголовок 2'] => h2:fresh",
              "p[style-name='Заголовок 3'] => h3:fresh",
              "p[style-name='Назва'] => h1:fresh",
              "p[style-name='Title'] => h1:fresh",
            ]
            const [{ value: html }, { value: rawText }] = await Promise.all([
              mammoth.convertToHtml({ path: fullPath, styleMap }),
              mammoth.extractRawText({ path: fullPath }),
            ])
            const plain = rawText || ''
            logger.info?.(`[articles/import] .docx: html length=${html?.length ?? 0}`)
            logger.info?.(`[articles/import] .docx: raw text length=${plain.length}`)
            if (html && html.trim()) {
              logger.info?.('[articles/import] .docx: htmlToLexicalState start')
              let lexical: any = await htmlToLexicalState(html)
              logger.info?.('[articles/import] .docx: htmlToLexicalState done')
              try {
                const childCount = lexical?.root?.children?.length ?? 0
                logger.info?.(`[articles/import] .docx: lexical root children=${childCount}`)
                if (!lexical?.root || childCount === 0) {
                  logger.warn?.('[articles/import] .docx: empty root detected - building paragraphs from plain text')
                  const paras = String(plain)
                    .replace(/\r\n/g, '\n')
                    .split(/\n\s*\n/)
                    .map((p) => p.trim())
                    .filter(Boolean)
                  const children = (paras.length ? paras : ['']).map((p, idx) => (
                    idx === 0
                      ? {
                          type: 'heading',
                          tag: 'h1',
                          version: 1,
                          format: '',
                          indent: 0,
                          direction: 'ltr',
                          children: [
                            { type: 'text', version: 1, text: p, detail: 0, format: 0, mode: 'normal', style: '' },
                          ],
                        }
                      : {
                          type: 'paragraph',
                          version: 1,
                          format: '',
                          indent: 0,
                          direction: 'ltr',
                          children: [
                            { type: 'text', version: 1, text: p, detail: 0, format: 0, mode: 'normal', style: '' },
                          ],
                        }
                  ))
                  lexical = {
                    root: { type: 'root', version: 1, format: '', indent: 0, direction: 'ltr', children },
                  }
                  logger.info?.(`[articles/import] .docx: built ${children.length} nodes; first as heading`)
                }
              } catch { }
              ; (data as any).richContent = lexical
              const firstLine = String(plain).split(/\n/).find((l) => l.trim())?.trim()
              logger.info?.(`[articles/import] .docx: firstLine=${firstLine?.slice(0, 80)}`)
              const hasTitle = Boolean((data as any)?.title ?? (originalDoc as any)?.title)
              if (!hasTitle && firstLine) (data as any).title = firstLine.slice(0, 120)
              const compact = String(plain).replace(/\s+/g, ' ').trim()
              const hasDesc = Boolean((data as any)?.description ?? (originalDoc as any)?.description)
              if (!hasDesc && compact) (data as any).description = compact.slice(0, 160)
            }
          } else if (ext === '.doc') {
            logger.info?.('[articles/import] .doc: WordExtractor start')
            const extractor = new WordExtractor()
            const parsed = await extractor.extract(fullPath)
            const text = parsed?.getBody?.() || ''
            logger.info?.(`[articles/import] .doc: text length=${text.length}`)
            if (text) {
              const paras = String(text)
                .replace(/\r\n/g, '\n')
                .split(/\n\s*\n/)
                .map((p) => p.trim())
                .filter(Boolean)
              logger.info?.(`[articles/import] .doc: paragraphs=${paras.length}`)
              const children = (paras.length ? paras : ['']).map((p, idx) => (
                idx === 0
                  ? {
                      type: 'heading',
                      tag: 'h1',
                      version: 1,
                      format: '',
                      indent: 0,
                      direction: 'ltr',
                      children: [
                        { type: 'text', version: 1, text: p, detail: 0, format: 0, mode: 'normal', style: '' },
                      ],
                    }
                  : {
                      type: 'paragraph',
                      version: 1,
                      format: '',
                      indent: 0,
                      direction: 'ltr',
                      children: [
                        { type: 'text', version: 1, text: p, detail: 0, format: 0, mode: 'normal', style: '' },
                      ],
                    }
              ))
                ; (data as any).richContent = {
                  root: { type: 'root', version: 1, format: '', indent: 0, direction: 'ltr', children },
                }
              try {
                const childCount = ((data as any).richContent as any)?.root?.children?.length ?? 0
                logger.info?.(`[articles/import] .doc: lexical root children=${childCount}`)
              } catch { }
              const firstLine = String(text).split(/\n/).find((l) => l.trim())?.trim()
              logger.info?.(`[articles/import] .doc: firstLine=${firstLine?.slice(0, 80)}`)
              const hasTitle = Boolean((data as any)?.title ?? (originalDoc as any)?.title)
              if (!hasTitle && firstLine) (data as any).title = firstLine.slice(0, 120)
              const compact = String(text).replace(/\s+/g, ' ').trim()
              const hasDesc = Boolean((data as any)?.description ?? (originalDoc as any)?.description)
              if (!hasDesc && compact) (data as any).description = compact.slice(0, 160)
            }
          } else {
            logger.warn?.('[articles/import] unsupported file extension - skipping')
          }

          // clear importFile to avoid re-processing loops
          ; (data as any).importFile = null
          logger.info?.('[articles/import] beforeChange set importFile=null')

          // Ensure richContent is never empty on save
          try {
            const current = (data as any)?.richContent ?? (originalDoc as any)?.richContent
            const children = current?.root?.children
            if (!current?.root || !Array.isArray(children) || children.length === 0) {
              ; (data as any).richContent = {
                root: {
                  type: 'root',
                  version: 1,
                  format: '',
                  indent: 0,
                  direction: 'ltr',
                  children: [
                    {
                      type: 'paragraph',
                      version: 1,
                      format: '',
                      indent: 0,
                      direction: 'ltr',
                      children: [
                        { type: 'text', version: 1, text: '', detail: 0, format: 0, mode: 'normal', style: '' },
                      ],
                    },
                  ],
                },
              }
              logger.info?.('[articles/import] beforeChange normalized empty richContent')
            }
          } catch { }

          return data
        } catch (e) {
          const msg = e instanceof Error ? `${e.message}\n${e.stack}` : String(e)
          try {
            ; ((req as any)?.payload?.logger ?? console).error?.(`[articles/import] beforeChange error: ${msg}`)
          } catch { }
          return data
        }
      },
      // 2) Slug generation after import sets title
      ({ data }) => {
        if (data.title && !data.slug) {
          data.slug = transliterate(data.title)
        }
        return data
      },
    ],
    afterChange: [],
    afterRead: [
      ({ doc, req }) => {
        try {
          const logger: any = (req as any)?.payload?.logger ?? console
          const v: any = (doc as any)?.richContent
          const children = v?.root?.children
          if (!v?.root || !Array.isArray(children) || children.length === 0) {
            ; (doc as any).richContent = {
              root: {
                type: 'root',
                version: 1,
                format: '',
                indent: 0,
                direction: 'ltr',
                children: [
                  {
                    type: 'paragraph',
                    version: 1,
                    format: '',
                    indent: 0,
                    direction: 'ltr',
                    children: [
                      { type: 'text', version: 1, text: '', detail: 0, format: 0, mode: 'normal', style: '' },
                    ],
                  },
                ],
              },
            }
            logger.info?.(`[articles/import] afterRead sanitized empty richContent id=${(doc as any)?.id}`)
          }
        } catch { }
        return doc
      },
    ],
  },

  fields: [
    seoFields,
    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'importFile',
      label: 'Import DOC/DOCX',
      type: 'upload',
      relationTo: 'media',
      required: false,
      admin: {
        position: 'sidebar',
        description: 'Upload .doc or .docx to auto-fill Title, Description and Rich Content',
      },
    },
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        description: 'Slug is generated from title, but can be overridden',
      },
    },
    {
      type: 'upload',
      name: 'bg',
      label: 'Background Image',
      relationTo: 'media',
      required: true,
    },
    {
      name: 'category',
      label: 'Category',
      type: 'relationship',
      hasMany: false,
      required: true,
      relationTo: 'article_categories',
    },
    {
      label: 'Description',
      name: 'description',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'richContent',
      type: 'richText',
      label: 'Rich Content',
      editor: lexicalEditor({
        features: ({ defaultFeatures }) => [
          ...defaultFeatures,
          EXPERIMENTAL_TableFeature(),
          TextSizeFeature({
            sizes: [
              { value: '12px', label: '12' },
              { value: '14px', label: '14' },
              { value: '16px', label: '16' },
              { value: '18px', label: '18' },
              { value: '20px', label: '20' },
              { value: '24px', label: '24' },
              { value: '28px', label: '28' },
              { value: '32px', label: '32' },
            ],
            method: 'replace',
            customSize: true,
            scroll: true,
          }),
        ],
      }),
      localized: true,
    },
  ],
}
