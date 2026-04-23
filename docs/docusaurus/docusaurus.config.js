// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
import { themes as prismThemes } from 'prism-react-renderer';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const require = createRequire(import.meta.url);

const coursesSidebarsFile = path.join(__dirname, 'courses', 'sidebars.js');
const hasCoursesContent = fs.existsSync(coursesSidebarsFile);

/** Пункт «Материалы» — только если в дереве есть каталог курсов (сборка ru / после sync). */
const navbarCoursesItem = hasCoursesContent
  ? [
      {
        to: '/courses',
        label: 'Материалы',
        position: 'left',
        'aria-label': 'Courses and materials',
      },
    ]
  : [];

const basePlugins = [
  './plugins/api-icons-plugin',
  './plugins/translation-path-sync-plugin',
];

if (hasCoursesContent) {
  basePlugins.push([
    '@docusaurus/plugin-content-docs',
    {
      id: 'courses',
      path: 'courses',
      routeBasePath: 'courses/private',
      sidebarPath: require.resolve('./courses/sidebars.js'),
    },
  ]);
}

basePlugins.push(
  [
    'docusaurus-plugin-yandex-metrica',
    {
      counterID: '97292922',
    },
  ],
  [require.resolve('docusaurus-lunr-search'), {
    languages: ['en', 'ru'], // language codes
  }],
);

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Открытый Пакет Интеграций',
  tagline: 'Набор инструментов для интеграции с популярными API посредством CLI, 1C:Enterprise и OneScript',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://openintegrations.dev',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'Bayselonarrend', // Usually your GitHub org/user name.
  projectName: 'OpenIntegrations', // Usually your repo name.

  onBrokenLinks: 'throw',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'ru',
    locales: ['ru'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        theme: {
          customCss: './src/css/custom.css',
        },

        docs: {
          sidebarPath: './docs/sidebars.js',
        },
        sitemap: {
          ignorePatterns: [
            '/courses/private/**',
          ],
        },
      }),
    ],
  ],

  plugins: basePlugins,

  themeConfig:
    ({
      docs: {
        sidebar: {
          autoCollapseCategories: true
        }
      },
      metadata: [
        { name: 'description', content: 'Открытый пакет интеграций - набор инструментов для интеграции с некоторыми популярными API посредством CLI, 1C:Enterprise или OneScript' },
        { name: 'keywords', content: '1С, OneScript, библиотеки, расширение, CLI, 1С:Предприятие, обмен, http, сервисы, интеграция, Telegram, Bitrix24, CDEK, VK, VK Teams, Viber, S3, Twitter, Notion, Яндекс Диск, Google Drive, Календарь Google, Google Таблицы, Slack, Airtable, Dropbox, Neocities, MySQL, SQLite, PostgreSQL, Ollama, TCP, RCON' },
        { name: 'og:title', content: 'Открытый Пакет Интеграций - библиотека интеграции для 1С и OneScript' },
        { name: 'og:description', content: 'Открытый пакет интеграций - набор инструментов для интеграции с некоторыми популярными API посредством CLI, 1C:Enterprise или OneScript' },
        { name: 'og:image', content: 'https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/media/preview2.png' },
        { name: 'og:url', content: 'https://openintegrations.dev/' },
      ],

      sitemap: {
        changefreq: 'daily',
        priority: 0.5,
      },

      customFields: {
        yandexAdsBlock: `
<div id="yandex_rtb_R-A-12294791-1"></div>
<script>
window.yaContextCb.push(() => {
    Ya.Context.AdvManager.render({
        "blockId": "R-A-12294791-1",
        "renderTo": "yandex_rtb_R-A-12294791-1",
        "type": "feed"
    })
})
</script>
      `,
      },

      colorMode: {
        defaultMode: 'light',
        disableSwitch: true,
        respectPrefersColorScheme: false,
      },

      navbar: {
        title: 'Открытый пакет интеграций',
        logo: {
          alt: 'OPI',
          src: 'img/logo.png',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'docs',
            position: 'left',
            label: 'Документация',
          },
          {
            type: 'docSidebar',
            sidebarId: 'addonsSidebar',
            position: 'left',
            label: 'Аддоны',
          },
          ...navbarCoursesItem,
          {
            to: '/download',
            label: 'Скачать',
            position: 'left',
            'aria-label': 'Download',
          },
          {
            type: 'dropdown',
            label: 'Translation',
            position: 'right',
            items: [
              {
                label: 'English',
                to: 'https://en.openintegrations.dev',
                className: 'translation-en-link',
              }
            ],
          },
          {
            to: 'https://boosty.to/bayselonarrend',
            position: 'right',
            className: 'navbar-boosty-link',
            'aria-label': 'Boosty',
          },
          {
            to: 'https://github.com/Bayselonarrend/OpenIntegrations',
            position: 'right',
            className: 'navbar-github-link',
            'aria-label': 'GitHub',
          },
          {
            to: 'https://sourcecraft.dev/bayselonarrend/openintegrations',
            position: 'right',
            className: 'navbar-sourcecraft-link',
            'aria-label': 'SourceCraft',
          },

        ],
      },
      footer: {
        style: 'light',
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.github,
        additionalLanguages: ['powershell', 'json', 'bsl', 'batch', 'bash']
      },
    }),
};


export default config
