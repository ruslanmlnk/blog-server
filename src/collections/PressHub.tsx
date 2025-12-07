// globals/PressHub.ts
import type { GlobalConfig } from 'payload'
import { seoFields } from '@/fields/seoFields' // якщо вже є
import { PressOverlayHero } from '@/blocks/pressHub/OverlayHero'
import { PressCardGrid } from '@/blocks/pressHub/CardGrid'
import { PressOverlayPair } from '@/blocks/pressHub/OverlayPair'

export const PressHub: GlobalConfig = {
  slug: 'pressHub',
  label: 'Press — Hub',
  versions: { drafts: false },
  access: {
    read: () => true,
    update: ({ req }) => Boolean(req.user),
  },
  fields: [
    seoFields, // meta.metaTitle/metaDescription (опційно)
    { name: 'title', type: 'text', required: true, localized: true },
    { name: 'description', type: 'textarea', localized: true },

    {
      name: 'content',
      label: 'Content',
      type: 'blocks',
      localized: true,
      blocks: [PressOverlayHero, PressCardGrid, PressOverlayPair],
    },
  ],
}
