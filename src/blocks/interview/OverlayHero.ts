import type { Block } from 'payload'

export const InterviewOverlayHero: Block = {
  slug: 'interviewOverlayHero',
  labels: { singular: 'Interview Overlay Hero', plural: 'Interview Overlay Heroes' },
  fields: [
    { name: 'href', label: 'Link URL', type: 'text', required: true },
    { name: 'title', type: 'text', required: true },
    { name: 'subtitle', type: 'textarea' },
    { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
  ],
}
