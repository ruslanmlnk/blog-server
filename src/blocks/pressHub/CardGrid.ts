import type { Block } from 'payload'

export const PressCardGrid: Block = {
  slug: 'pressCardGridHub',
  labels: { singular: 'Press Card Grid', plural: 'Press Card Grids' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
	{
  name: 'linkedPress',
  label: 'Linked Press',
  type: 'relationship',
  relationTo: 'press',   // ← конкретна колекція
  required: false,       // або true, якщо обов'язкове
},
        { name: 'visibleFrom', label: 'publicationDate', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } }, defaultValue: () => new Date().toISOString() },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true, localized: true },
        { name: 'description', type: 'textarea', localized: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
