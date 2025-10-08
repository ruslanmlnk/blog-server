import { Block } from 'payload'

export const Quote: Block = {
  slug: 'quote',
  fields: [
    {
      name: 'text',
      type: 'textarea',
      required: true,
    },
  ],
}