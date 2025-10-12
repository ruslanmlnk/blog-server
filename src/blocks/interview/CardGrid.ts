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
        { name: 'visibleFrom', label: 'Visible From', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'description', type: 'textarea' },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
