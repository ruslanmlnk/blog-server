import { Block } from 'payload'

export const Heading1: Block = {
  slug: 'heading1',
  fields: [
    {
      name: 'text',
      type: 'text',
      required: true,
    },
  ],
}