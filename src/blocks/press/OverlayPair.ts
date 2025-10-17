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
        { name: 'visibleFrom', label: 'publicationDate', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true, localized: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
