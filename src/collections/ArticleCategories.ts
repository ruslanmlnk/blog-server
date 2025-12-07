import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { CategoryOverlayPair } from '@/blocks/category/OverlayPair'
import { CategoryCardGrid } from '@/blocks/category/CardGrid'
import { CategoryOverlayHero } from '@/blocks/category/OverlayHero'
import { seoFields } from '@/fields/seoFields'

export const ArticleCategories: CollectionConfig = {
  slug: 'article_categories',

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
  name: 'sortOrder',
  label: 'Sort order',
  type: 'number',
  defaultValue: 1,
  index: true,
  admin: {
    position: 'sidebar',
    description: 'Порядковий номер: 1 — перший, 2 — другий і т.д.',
  },
},

    seoFields,
    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'icon',
      label: 'Icon',
      type: 'upload',
      relationTo: 'media',
      required: false,
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      localized: true,
      blocks: [CategoryOverlayPair, CategoryCardGrid, CategoryOverlayHero],
    },
  ],
}
