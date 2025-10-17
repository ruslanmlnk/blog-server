// storage-adapter-import-placeholder
import { postgresAdapter } from '@payloadcms/db-postgres'
import { payloadCloudPlugin } from '@payloadcms/payload-cloud'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'

import { Users } from './collections/Users'
import { Media } from './collections/Media'
import { Articles } from './collections/Articles'
import { ArticleCategories } from './collections/ArticleCategories'
import { Home } from './collections/Home'
import { About } from './collections/About'
import { Contact } from './collections/Contact'
import { Press } from './collections/Press'
import { Interview } from './collections/Interview'
import ContactMessages from './collections/ContactMessages'
import WeeklyNewsletter from './collections/WeeklyNewsletter'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  serverURL: 'https://api.parubets.org',
cors: [
  'https://parubets.com',
  'https://parubets.org',
  'http://localhost:3000',
  'https://api.parubets.org',
  'https://api.parubets.com',
  'http://localhost:3001'
],
csrf: [
  'https://parubets.com',
  'https://parubets.org',
  'http://localhost:3000',
  'https://api.parubets.org',
  'https://api.parubets.com',
  'http://localhost:3001'
],

  localization: {
    locales: [
      { code: 'ru', label: 'Русский' },
      { code: 'uk', label: 'Українська' },
      { code: 'en', label: 'English' },
      { code: 'fr', label: 'Français' },
    ],
    defaultLocale: 'ru',
    fallback: true,
  },
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
  },
  collections: [Users, Media, Articles, ArticleCategories, Home, About, Contact, Press, Interview, ContactMessages, WeeklyNewsletter],
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URI || '',
    },
  }),
  sharp,
  plugins: [
    payloadCloudPlugin(),
  ],
  graphQL: {
    disable: false, 
  },
})
