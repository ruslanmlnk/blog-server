import type { GlobalConfig } from 'payload'
import { seoFields } from '@/fields/seoFields'

export const SiteGlobals: GlobalConfig = {
  slug: 'siteGlobals',
  label: 'Site Globals',
  versions: { drafts: false },
  access: {
    read: () => true,
    update: ({ req }) => Boolean(req.user),
  },
  fields: [
    {
      name: 'menu',
      label: 'Menu Items',
      type: 'group',
      localized: true,
      fields: [
        { name: 'about', type: 'text', label: 'About' },
        { name: 'blog', type: 'text', label: 'Blog' },
        { name: 'press', type: 'text', label: 'Press' },
        { name: 'interview', type: 'text', label: 'Interview' },
        { name: 'contacts', type: 'text', label: 'Contacts' },
      ],
    },
    {
      name: 'categories',
      label: 'Categories UI',
      type: 'group',
      localized: true,
      fields: [
        { name: 'backToHome', type: 'text', label: 'Back To Home Label' },
      ],
    },
    {
      name: 'press',
      label: 'Press Hub Section',
      type: 'group',
      localized: true,
      fields: [
        seoFields,
        { name: 'allTitle', type: 'text', label: 'All Chip Title' },
      ],
    },
    {
      name: 'interview',
      label: 'Interview Hub Section',
      type: 'group',
      localized: true,
      fields: [
        seoFields,
        { name: 'allTitle', type: 'text', label: 'All Chip Title' },
      ],
    },
  ],
}

