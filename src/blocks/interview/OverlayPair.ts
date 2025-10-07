import type { Block } from 'payload'

export const InterviewOverlayPair: Block = {
  slug: 'interviewOverlayPair',
  labels: { singular: 'Interview Overlay Pair', plural: 'Interview Overlay Pairs' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
