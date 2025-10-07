import type { Block } from 'payload'

export const HomeFeatured: Block = {
  slug: 'homeFeatured',
  labels: { singular: 'Home Featured', plural: 'Home Featured' },
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
