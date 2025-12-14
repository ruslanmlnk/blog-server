import type { Block } from 'payload'

export const InterviewOverlayPair: Block = {
  slug: 'interviewOverlayPairHub',
  labels: { singular: 'Interview Overlay Pair', plural: 'Interview Overlay Pairs' },
  fields: [
    {
      name: 'items',
      label: 'Items',
      type: 'array',
      required: true,
      fields: [
{
  name: 'linkedInterview',
  label: 'Linked Interview',
  type: 'relationship',
  relationTo: 'interview',   // ← конкретна колекція 
  required: false,       // або true, якщо обов'язкове
},
        { name: 'visibleFrom', label: 'publicationDate', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } }, defaultValue: () => new Date().toISOString() },
        { name: 'href', label: 'Link URL', type: 'text', required: true },
        { name: 'title', type: 'text', required: true },
        { name: 'image', label: 'Image', type: 'upload', relationTo: 'media', required: true },
      ],
    },
  ],
}
