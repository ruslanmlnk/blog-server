import type { Block } from 'payload'

export const HomeTrends: Block = {
  slug: 'homeTrends',
  labels: { singular: 'Home Trends', plural: 'Home Trends' },
  fields: [
    {
      name: 'title',
      label: 'Title',
      type: 'text',
      required: false,
      defaultValue: 'Trends',
      localized: true,
    },
    {
      type: 'array',
      name: 'items',
      label: 'Items',
      minRows: 1,
      fields: [
        { name: 'visibleFrom', label: 'publicationDate', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
        {
          name: 'article',
          label: 'Article',
          type: 'relationship',
          relationTo: 'articles',
          required: true,
        },
      ],
    },
  ],
}


