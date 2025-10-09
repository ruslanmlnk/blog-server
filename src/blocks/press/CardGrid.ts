import type { Block } from 'payload'

export const PressCardGrid: Block = {
  slug: 'pressCardGrid',
  labels: { singular: 'Press Card Grid', plural: 'Press Card Grids' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
        { name: 'date', label: 'Date', type: 'date', required: false },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'description', type: 'textarea' },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
