import type { Block } from 'payload'

export const CategoryCardGrid: Block = {
  slug: 'categoryCardGrid',
  labels: { singular: 'Card Grid (x3)', plural: 'Card Grids (x3)' },
  fields: [
    {
      type: 'array',
      name: 'items',
      label: 'Items',
      minRows: 1,
      // Remove maxRows to allow any number of cards
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
