import type { Block } from 'payload'

export const CategoryOverlayHero: Block = {
  slug: 'categoryOverlayHero',
  labels: { singular: 'Overlay Hero', plural: 'Overlay Heroes' },
  fields: [
    {
      name: 'article',
      label: 'Article',
      type: 'relationship',
      relationTo: 'articles',
      required: true,
    },
  ],
}

