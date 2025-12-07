import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { CategoryCardGrid } from '@/blocks/category/CardGrid'
import { HomeFeatured } from '@/blocks/home/Featured'
import { HomeTrends } from '@/blocks/home/Trends'
import { seoFields } from '@/fields/seoFields'

export const Home: CollectionConfig = {
  slug: 'home',
  labels: {
    singular: 'Homepage',
    plural: 'Homepage',
  },
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
    seoFields,
    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'description',
      type: 'textarea',
      required: true,
      localized: true,
    },
    {
      name: 'trends',
      label: 'Trends',
      type: 'group',
      fields: [
        {
          name: 'title',
          label: 'Title',
          type: 'text',
          required: false,
          defaultValue: 'Trends',
          localized: true,
        },
        {
          type: 'array',
          name: 'items',
          label: 'Items',
          minRows: 0,
          fields: [
            {
              name: 'article',
              label: 'Article',
              type: 'relationship',
              relationTo: 'articles',
              required: true,
            },
          ],
        },
      ],
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      localized: true,
      blocks: [HomeFeatured, CategoryCardGrid],
    },
  ],
}

