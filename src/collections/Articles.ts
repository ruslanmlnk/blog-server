import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import { Heading1 } from '@/blocks/article/Heading1'
import { Heading2 } from '@/blocks/article/Heading2'
import { Heading3 } from '@/blocks/article/Heading3'
import { Heading4 } from '@/blocks/article/Heading4'
import { ImageBlock } from '@/blocks/article/ImageBlock'
import { Quote } from '@/blocks/article/Quote'
import { List } from '@/blocks/List'
import { Paragraph } from '@/blocks/Paragraph'
import type { CollectionConfig } from 'payload'
import { lexicalEditor } from '@payloadcms/richtext-lexical'

// 🔠 Простий мапінг для транслітерації російських символів
function transliterate(text: string): string {
  const map: Record<string, string> = {
    а: 'a', б: 'b', в: 'v', г: 'g', д: 'd', е: 'e', ё: 'yo', ж: 'zh', з: 'z',
    и: 'i', й: 'y', к: 'k', л: 'l', м: 'm', н: 'n', о: 'o', п: 'p', р: 'r',
    с: 's', т: 't', у: 'u', ф: 'f', х: 'h', ц: 'ts', ч: 'ch', ш: 'sh',
    щ: 'sch', ъ: '', ы: 'y', ь: '', э: 'e', ю: 'yu', я: 'ya',
  }
  return text
    .toLowerCase()
    .split('')
    .map(char => map[char] ?? char)
    .join('')
    .replace(/[^a-z0-9\s-]/g, '') // прибираємо зайве
    .trim()
    .replace(/\s+/g, '-') // пробіли -> "-"
    .replace(/-+/g, '-') // подвійні дефіси -> один
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
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        description: 'Автоматично генерується з title, якщо не заповнено',
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
    },
    // {
    //   name: 'content',
    //   label: 'Content',
    //   type: 'blocks',
    //   blocks: [List, Paragraph, Heading1, Heading2, Heading3, Heading4, Quote, ImageBlock],
    // },
    {
      name: 'richContent',
      type: 'richText',
      label: 'Розширений контент',
      editor: lexicalEditor({
        features: ({ defaultFeatures }) => [...defaultFeatures],
      }),
    },
  ],
}
