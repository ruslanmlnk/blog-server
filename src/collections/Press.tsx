import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { CategoryOverlayPair } from '@/blocks/category/OverlayPair'
import { CategoryCardGrid } from '@/blocks/category/CardGrid'
import { CategoryOverlayHero } from '@/blocks/category/OverlayHero'

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
      blocks: [CategoryOverlayPair, CategoryCardGrid, CategoryOverlayHero],
    },
  ],
}
