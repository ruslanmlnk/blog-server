import type { Block } from 'payload'

export const CategoryOverlayHero: Block = {
  slug: 'categoryOverlayHero',
  labels: { singular: 'Overlay Hero', plural: 'Overlay Heroes' },
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
}
