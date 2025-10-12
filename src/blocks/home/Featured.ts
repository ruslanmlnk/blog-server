import type { Block } from 'payload'

export const HomeFeatured: Block = {
  slug: 'homeFeatured',
  labels: { singular: 'Home Featured', plural: 'Home Featured' },
  fields: [
    { name: 'visibleFrom', label: 'Visible From', type: 'date', required: false, admin: { date: { pickerAppearance: 'dayAndTime', displayFormat: 'yyyy-MM-dd HH:mm' } } },
    {
      name: 'article',
      label: 'Article',
      type: 'relationship',
      relationTo: 'articles',
      required: true,
    },
  ],
}
