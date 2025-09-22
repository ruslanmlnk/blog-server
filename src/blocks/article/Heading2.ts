import { Block } from 'payload'

export const Heading2: Block = {
  slug: 'heading2',
  fields: [
    {
      name: 'text',
      type: 'text',
      required: true,
    },
  ],
}