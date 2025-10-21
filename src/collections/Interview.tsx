import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { InterviewOverlayHero } from '@/blocks/interview/OverlayHero'
import { InterviewCardGrid } from '@/blocks/interview/CardGrid'
import { InterviewOverlayPair } from '@/blocks/interview/OverlayPair'
import { seoFields } from '@/fields/seoFields'

export const Interview: CollectionConfig = {
  slug: 'interview',
  labels: {
    singular: 'Interview',
    plural: 'Interviews',
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
    seoFields,
{
  name: 'sortOrder',
  label: 'Sort order',
  type: 'number',
  defaultValue: 1,
  index: true,
  admin: {
    position: 'sidebar',
    description: 'Порядковий номер: 1 — перший, 2 — другий і т.д.',
  },
},
    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      localized: true,
      blocks: [InterviewOverlayHero, InterviewCardGrid, InterviewOverlayPair],
    },
  ],
}
