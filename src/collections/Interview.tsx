import { anyone } from '@/app/access/anyone'
import { authenticated } from '@/app/access/authenticated'
import type { CollectionConfig } from 'payload'
import { InterviewOverlayHero } from '@/blocks/interview/OverlayHero'
import { InterviewCardGrid } from '@/blocks/interview/CardGrid'
import { InterviewOverlayPair } from '@/blocks/interview/OverlayPair'

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
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      blocks: [InterviewOverlayHero, InterviewCardGrid, InterviewOverlayPair],
    },
  ],
}

