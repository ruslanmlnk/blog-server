import { Block } from 'payload'

export const Paragraph: Block = {
  slug: 'paragraph',
  fields: [
    {
      name: 'text',
      type: 'text',
      required: true,
    },
  ],
}