// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import {themes as prismThemes} from 'prism-react-renderer';

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
  onBrokenMarkdownLinks: 'warn',

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
      }),
    ],
  ],

  plugins: [
    


        ['docusaurus-plugin-yandex-metrica', {
          counterID: '97292922',
        }],

  
    
    [ require.resolve('docusaurus-lunr-search'), {
    languages: ['en', 'ru'] // language codes
  }]],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // Replace with your project's social card

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
            sidebarId: 'defaultSidebar',
            position: 'left',
            label: 'Описания методов',
          },
          {
            href: 'https://github.com/Bayselonarrend/OpenIntegrations',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'light',
        links: [
          {
            title: 'Документация',
            items: [
              {
                label: 'Описания методов',
                to: '/docs/Start',
              },
            ],
          },
          {
            title: 'Ресурсы',
            items: [
              {
                label: 'GitHub',
                href: 'https://github.com/Bayselonarrend/OpenIntegrations',
              },
            ],
          },
        ],
        copyright: `${new Date().getFullYear()} OpenItegrations by Bayselonarrend`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.github,
		additionalLanguages: ['powershell','json','bsl']
      },
    }),
};


export default config
