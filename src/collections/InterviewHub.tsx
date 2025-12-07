import type { GlobalConfig } from 'payload'
import { seoFields } from '@/fields/seoFields'
import { InterviewOverlayHero } from '@/blocks/interviewHub/OverlayHero'
import { InterviewCardGrid } from '@/blocks/interviewHub/CardGrid'
import { InterviewOverlayPair } from '@/blocks/interviewHub/OverlayPair'

export const InterviewHub: GlobalConfig = {
  slug: 'interviewHub',
  label: 'Interview — Hub',
  access: {
    read: () => true,
    update: ({ req }) => Boolean(req.user),
  },
  versions: { drafts: false },
  fields: [
    seoFields,
    {
      name: 'title',
      type: 'text',
      required: true,
      localized: true,
    },
    {
      name: 'description',
      type: 'textarea',
      localized: true,
    },
    {
      name: 'content',
      type: 'blocks',
      localized: true,
      blocks: [InterviewOverlayHero, InterviewCardGrid, InterviewOverlayPair],
    },
  ],
}
