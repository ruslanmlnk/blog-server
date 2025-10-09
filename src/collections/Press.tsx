import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { PressOverlayPair } from '@/blocks/press/OverlayPair'
import { PressCardGrid } from '@/blocks/press/CardGrid'
import { PressOverlayHero } from '@/blocks/press/OverlayHero'

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
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
      name: 'description',
      type: 'textarea',
      required: false,
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
      blocks: [PressOverlayHero, PressCardGrid, PressOverlayPair],
    },
  ],
}
