import type { Block } from 'payload'

export const InterviewCardGrid: Block = {
  slug: 'interviewCardGrid',
  labels: { singular: 'Interview Card Grid', plural: 'Interview Card Grids' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'description', type: 'textarea' },
        { name: 'dateLabel', label: 'Source label (e.g. The Insider Live)', type: 'text' },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}

