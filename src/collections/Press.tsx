import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { PressOverlayPair } from '@/blocks/press/OverlayPair'
import { PressCardGrid } from '@/blocks/press/CardGrid'
import { PressOverlayHero } from '@/blocks/press/OverlayHero'
import { seoFields } from '@/fields/seoFields'

export const Press: CollectionConfig = {
  slug: 'press',
  labels: {
    singular: 'Press',
    plural: 'Press',
  },
  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', '_order'],
  },
  fields: [
    seoFields,
    {
  name: 'sortOrder',
  label: 'Sort order',
  type: 'number',
  defaultValue: 1,
  index: true,
  admin: {
    position: 'sidebar',
    description: 'Порядковий номер: 1 — перший, 2 — другий і т.д.',
  },
},

    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'description',
      type: 'textarea',
      required: false,
      localized: true,
    },
    {
      name: 'icon',
      label: 'Icon',
      type: 'upload',
      relationTo: 'media',
      required: false,
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      localized: true,
      blocks: [PressOverlayHero, PressCardGrid, PressOverlayPair],
    },
  ],
}
