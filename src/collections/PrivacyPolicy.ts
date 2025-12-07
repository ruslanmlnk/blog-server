import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import { EXPERIMENTAL_TableFeature } from '@payloadcms/richtext-lexical'
import { TextSizeFeature } from 'payload-lexical-typography'

export const PrivacyPolicy: CollectionConfig = {
  slug: 'privacy-policy',
  labels: {
    singular: 'Privacy Policy',
    plural: 'Privacy Policy',
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
      localized: true,
    },
    {
      name: 'metaTitle',
      label: 'Meta Title',
      type: 'text',
      localized: true,
    },
    {
      name: 'metaDescription',
      label: 'Meta Description',
      type: 'textarea',
      localized: true,
    },
    {
      name: 'richContent',
      type: 'richText',
      label: 'Rich Content',
      editor: lexicalEditor({
        features: ({ defaultFeatures }) => [
          ...defaultFeatures,
          EXPERIMENTAL_TableFeature(),
          TextSizeFeature({
            sizes: [
              { value: '12px', label: '12' },
              { value: '14px', label: '14' },
              { value: '16px', label: '16' },
              { value: '18px', label: '18' },
              { value: '20px', label: '20' },
              { value: '24px', label: '24' },
              { value: '28px', label: '28' },
              { value: '32px', label: '32' },
            ],
            method: 'replace',
            customSize: true,
            scroll: true,
          }),
        ],
      }),
      localized: true,
    },
  ],
}
