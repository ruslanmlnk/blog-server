import type { Block } from 'payload'

export const CategoryOverlayPair: Block = {
  slug: 'categoryOverlayPair',
  labels: { singular: 'Overlay Pair', plural: 'Overlay Pair' },
  fields: [
    {
      type: 'array',
      name: 'items',
      label: 'Items',
      minRows: 1,
      maxRows: 2,
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

