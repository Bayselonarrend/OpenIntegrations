// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from 'prism-react-renderer';

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
      }),
    ],
  ],

  plugins: [

    /*
  './plugins/course-protection',
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'legal',
        path: 'legal',
        routeBasePath: 'legal',
        sidebarPath: require.resolve('./sidebars-legal.js'),
      },
    ],

        [
      '@docusaurus/plugin-content-docs',
      {
        id: 'courses',
        path: 'courses',
        routeBasePath: 'courses',
        sidebarPath: require.resolve('./courses/sidebars.js')
      },
    ],
    [
      '@docusaurus/plugin-sitemap',
      {
        ignorePatterns: [
          '/courses/**', 
        ],
      },
    ],
    */

    ['docusaurus-plugin-yandex-metrica', {
      counterID: '97292922',
    }],



    [require.resolve('docusaurus-lunr-search'), {
      languages: ['en', 'ru'] // language codes
    }]],

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
        { name: 'og:image', content: 'https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/media/preview.png' }, // Замените на ваше изображение
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
          {
            to: 'https://boosty.to/bayselonarrend',
            label: 'Поддержать проект',
            position: 'right',
            className: 'navbar-boosty-link', // Класс для кастомизации
            'aria-label': 'Boosty',
          },
          /*{
            to: '/courses',
            label: 'Обучение',
            position: 'left',
            'aria-label': 'Download',
          },*/
          {
            to: '/download',
            label: 'Скачать',
            position: 'left',
            'aria-label': 'Download',
          },
          {
            to: 'https://github.com/Bayselonarrend/OpenIntegrations',
            label: 'GitHub',
            position: 'right',
            className: 'navbar-github-link', // Класс для кастомизации
            'aria-label': 'GitHub repository',
          },
          {
            type: 'dropdown',
            label: 'Translation',
            position: 'right',
            items: [
              {
                label: 'English',
                to: 'https://en.openintegrations.dev',
              }
              // ... more items
            ],
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
