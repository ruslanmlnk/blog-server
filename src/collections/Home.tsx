import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { CategoryCardGrid } from '@/blocks/category/CardGrid'
import { HomeFeatured } from '@/blocks/home/Featured'

export const Home: CollectionConfig = {
  slug: 'home',
  labels: {
    singular: 'Homepage',
    plural: 'Homepage',
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
      required: true,
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      blocks: [HomeFeatured, CategoryCardGrid],
    },
  ],
}
