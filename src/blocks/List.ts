import { Block } from 'payload'

export const List: Block = {
  slug: 'list',
  fields: [
    {
      name: 'title',
      type: 'text',
    },
    {
      type: 'array',
      name: 'list_items',
      fields: [{ name: 'item_title', type: 'text' }],
    },
  ],
}