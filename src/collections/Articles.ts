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
    beforeValidate: [
      async ({ data, req }) => {
        try {
          const importRef = (data as any)?.importFile
          const importId = typeof importRef === 'string' ? importRef : importRef?.id
          if (!importId) return data

          const mediaDoc = await req.payload.findByID({ collection: 'media', id: importId })
          const filename: string | undefined = (mediaDoc as any)?.filename || (mediaDoc as any)?.file?.filename
          if (!filename) return data

          const candidatePaths = [
            path.resolve(process.cwd(), 'media', filename),
            path.resolve(process.cwd(), 'public', 'media', filename),
          ]
          let fullPath = candidatePaths.find((p) => fs.existsSync(p)) || ''
          if (!fullPath) {
            const url: string | undefined = (mediaDoc as any)?.url
            if (url) {
              const clean = url.replace(/^\//, '')
              const fromUrlA = path.resolve(process.cwd(), clean)
              const fromUrlB = path.resolve(process.cwd(), 'public', clean)
              fullPath = [fromUrlA, fromUrlB].find((p) => fs.existsSync(p)) || ''
            }
          }
          if (!fullPath) return data

          const ext = path.extname(fullPath).toLowerCase()

          let rawText = ''
          let imported = false
          if (ext === '.docx') {
            const { value: html } = await mammoth.convertToHtml({ path: fullPath })
            if (html && html.trim()) {
              const lexical = await htmlToLexicalState(html)
              ;(data as any).richContent = lexical
              imported = true
            } else {
              const result = await mammoth.extractRawText({ path: fullPath })
              rawText = result.value || ''
            }
          } else if (ext === '.doc') {
            const extractor = new WordExtractor()
            const doc = await extractor.extract(fullPath)
            rawText = doc?.getBody?.() || ''
          } else {
            return data
          }

          if (!((data as any).richContent)) {
            const text = String(rawText || '').replace(/\r\n/g, '\n').trim()
            if (text) {
              const paras = text
                .split(/\n\s*\n/)
                .map((p) => p.trim())
                .filter(Boolean)
              const children = (paras.length ? paras : ['']).map((p) => ({
                type: 'paragraph',
                version: 1,
                format: '',
                indent: 0,
                direction: 'ltr',
                children: [
                  { type: 'text', version: 1, text: p },
                ],
              }))
              const lexical = {
                root: {
                  type: 'root',
                  version: 1,
                  format: '',
                  indent: 0,
                  direction: 'ltr',
                  children,
                },
              }
              ;(data as any).richContent = lexical
            }
          }

          // Set title/description if missing (support localized objects)
          const setLocalized = (target: any, key: string, val: string) => {
            const cur = target[key]
            if (cur && typeof cur === 'object') {
              const locale = req.locale || req?.i18n?.language || 'ru'
              if (!cur[locale] && val) cur[locale] = val
            } else if (!cur && val) {
              target[key] = val
            }
          }

          const plain = String(rawText || '').replace(/\s+/g, ' ').trim()
          const firstLine = String(rawText || '').split(/\n/).find((l) => l.trim())?.trim()
          setLocalized(data as any, 'title', (firstLine || '').slice(0, 120))
          setLocalized(data as any, 'description', (plain || '').slice(0, 160))

          if (imported || (rawText && String(rawText).trim())) {
            ;(data as any).importFile = undefined
          }
          return data
        } catch (e) {
          return data
        }
      },
    ],
    beforeChange: [
      ({ data }) => {
        if (data.title && !data.slug) {
          data.slug = transliterate(data.title)
        }
        return data
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
