import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import { Heading1 } from '@/blocks/article/Heading1'
import { Heading2 } from '@/blocks/article/Heading2'
import { Heading3 } from '@/blocks/article/Heading3'
import { Heading4 } from '@/blocks/article/Heading4'
import { List } from '@/blocks/List'
import { Paragraph } from '@/blocks/Paragraph'
import type { CollectionConfig } from 'payload'

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
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      blocks: [List, Paragraph, Heading1, Heading2, Heading3, Heading4],
    },
  ],
}