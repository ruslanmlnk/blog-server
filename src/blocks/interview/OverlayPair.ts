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
        { name: 'visibleFrom', label: 'publicationDate', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
