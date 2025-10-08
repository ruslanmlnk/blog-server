import type { CollectionConfig } from 'payload'
import { anyone } from '@/app/access/anyone'

export const WeeklyNewsletter: CollectionConfig = {
  slug: 'weekly-newsletters',
  labels: {
    singular: 'Weekly Newsletter',
    plural: 'Weekly Newsletters',
  },
  access: {
    read: anyone,
    create: () => true,
  },
  fields: [
    {
      name: 'email',
      type: 'email',
      label: 'Почта',
    },
  ],
  admin: {
    useAsTitle: 'email',
  },
};

export default WeeklyNewsletter;
