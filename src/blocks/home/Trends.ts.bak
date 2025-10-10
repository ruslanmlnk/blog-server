import type { Block } from 'payload'

export const HomeTrends: Block = {
  slug: 'homeTrends',
  labels: { singular: 'Home Trends', plural: 'Home Trends' },
  fields: [
    {
      name: 'title',
      label: 'Title',
      type: 'text',
      required: false,
      defaultValue: 'Тренды',
    },
    {
      type: 'array',
      name: 'items',
      label: 'Items',
      minRows: 1,
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
}

