import type { Block } from 'payload'

export const PressOverlayPair: Block = {
  slug: 'pressOverlayPair',
  labels: { singular: 'Press Overlay Pair', plural: 'Press Overlay Pairs' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
        { name: 'date', label: 'Date', type: 'date', required: false },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true, localized: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
