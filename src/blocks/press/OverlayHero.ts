import type { Block } from 'payload'

export const PressOverlayHero: Block = {
  slug: 'pressOverlayHero',
  labels: { singular: 'Press Overlay Hero', plural: 'Press Overlay Heroes' },
  fields: [
    { name: 'date', label: 'Date', type: 'date', required: false },
    { name: 'href', label: 'Link URL', type: 'text', required: true },
    { name: 'title', type: 'text', required: true },
    { name: 'subtitle', type: 'textarea' },
    { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
  ],
}
