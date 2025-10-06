import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'

export const About: CollectionConfig = {
  slug: 'about',
  labels: {
    singular: 'About Us',
    plural: 'About Us',
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
    // Main hero image at the top of the page
    {
      name: 'heroImage',
      type: 'upload',
      relationTo: 'media',
      required: false,
      label: 'Hero image',
    },
    // Lead paragraph under the image
    {
      name: 'lead',
      type: 'textarea',
      required: true,
      label: 'Lead text',
    },
    // Dynamic list of cards/blocks displayed in two columns
    {
      name: 'cards',
      type: 'array',
      label: 'Info blocks',
      labels: {
        singular: 'Block',
        plural: 'Blocks',
      },
      required: false,
      fields: [
        {
          name: 'title',
          type: 'text',
          required: true,
        },
        {
          name: 'text',
          type: 'textarea',
          required: true,
        },
      ],
    },
  ],
}
