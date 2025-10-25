import type { CollectionConfig } from 'payload'

export const Documents: CollectionConfig = {
  slug: 'documents',
  access: {
    read: () => true,
  },
  upload: {
    mimeTypes: [
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/msword',
    ],
  },
  admin: {
    useAsTitle: 'filename',
    description: 'Upload Word documents (.doc, .docx) for import',
  },
  fields: [
    {
      name: 'description',
      type: 'text',
      required: false,
    },
  ],
}
