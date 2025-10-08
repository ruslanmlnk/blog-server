import type { CollectionConfig } from 'payload'
import { anyone } from '@/app/access/anyone'

export const ContactMessages: CollectionConfig = {
  slug: 'contact-messages',
  labels: {
    singular: 'Contact Message',
    plural: 'Contact Messages',
  },
  access: {
    read: anyone,
    create: () => true,
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      label: 'Имя',
      required: true,
    },
    {
      name: 'phone',
      type: 'text',
      label: 'Номер телефона',
    },
    {
      name: 'email',
      type: 'email',
      label: 'Почта',
    },
    {
      name: 'message',
      type: 'textarea',
      label: 'Сообщение',
    },
  ],
  admin: {
    useAsTitle: 'name',
  },
};

export default ContactMessages;
