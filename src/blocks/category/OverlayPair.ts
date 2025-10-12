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
        { name: 'visibleFrom', label: 'Visible From', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
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
