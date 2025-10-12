import type { Block } from 'payload'

export const PressOverlayHero: Block = {
  slug: 'pressOverlayHero',
  labels: { singular: 'Press Overlay Hero', plural: 'Press Overlay Heroes' },
  fields: [
    { name: 'date', label: 'Date', type: 'date', required: false },
    // Optional schedule: if set, show on/after this datetime
    { name: 'visibleFrom', label: 'Visible From', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
    { name: 'href', label: 'Link URL', type: 'text', required: true },
    { name: 'title', type: 'text', required: true, localized: true },
    { name: 'subtitle', type: 'textarea', localized: true },
    { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
  ],
}
