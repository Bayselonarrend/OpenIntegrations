import React, { useEffect, useState } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import AlternatingFeatures from '@site/src/components/AlternatingFeatures';
import Heading from '@theme/Heading';
import styles from './index.module.css';

const iconList = [
  '/img/APIs/Airtable.png',
  '/img/APIs/VK.png',
  '/img/APIs/Neocities.png',
  '/img/APIs/Telegram.png',
  '/img/APIs/Viber.png',
  '/img/APIs/Bitrix24.png',
  '/img/APIs/CDEK.png',
  '/img/APIs/Dropbox.png',
  '/img/APIs/GoogleCalendar.png',
  '/img/APIs/GoogleDrive.png',
  '/img/APIs/GoogleSheets.png',
  '/img/APIs/GreenAPI.png',
  '/img/APIs/HTTP.png',
  '/img/APIs/MSSQL.png',
  '/img/APIs/MySQL.png',
  '/img/APIs/Notion.png',
  '/img/APIs/OpenAI.png',
  '/img/APIs/Twitter.png',
  '/img/APIs/PostgreSQL.png',
  '/img/APIs/RCON.png',
  '/img/APIs/S3.png',
  '/img/APIs/Slack.png',
  '/img/APIs/SQLite.png',
  '/img/APIs/TCP.png',
  '/img/APIs/VKTeams.png',
  '/img/APIs/FTP.png',
  '/img/APIs/sftp.png',
  '/img/APIs/SSH.png',
];

const FallingIcons = () => {
  const [columns, setColumns] = useState(12);
  const [iconCount, setIconCount] = useState(60);
  const [iconDensity] = useState(0.6); // Плотность иконок (0.1-1.0)

  useEffect(() => {
    const updateLayout = () => {
      // Адаптивное количество колонок
      const width = window.innerWidth;
      const newColumns = width < 768 ? 6 : width < 1024 ? 9 : 12;
      setColumns(newColumns);

      // Адаптивное количество иконок на основе плотности
      const area = width * window.innerHeight;
      const newIconCount = Math.floor(area / (2000 * (1.1 - iconDensity)));
      setIconCount(Math.min(newIconCount, 100)); // Ограничиваем максимум 100 иконками
    };

    updateLayout();
    window.addEventListener('resize', updateLayout);
    return () => window.removeEventListener('resize', updateLayout);
  }, [iconDensity]);

  const maxIconsPerColumn = Math.ceil(iconCount / columns);
  const icons = [];
  const columnCounts = Array(columns).fill(0);

  for (let i = 0; i < iconCount; i++) {
    const randomIcon = iconList[Math.floor(Math.random() * iconList.length)];
    
    // Выбираем колонку с наименьшим количеством иконок
    let column = 0;
    let minCount = columnCounts[0];
    for (let c = 1; c < columns; c++) {
      if (columnCounts[c] < minCount) {
        minCount = columnCounts[c];
        column = c;
      }
    }
    columnCounts[column]++;
    
    // Распределяем иконки внутри колонки
    const positionInColumn = columnCounts[column];
    const left = (column / columns) * 100 + (Math.random() * 100 / columns) - 5;
    const duration = 15 + Math.random() * 10;
    const delay = (positionInColumn / maxIconsPerColumn) * duration * 0.8;

    icons.push(
      <img
        key={i}
        src={randomIcon}
        alt="API icon"
        className="falling-icon"
        style={{
          left: `${left}%`,
          animationDuration: `${duration}s`,
          animationDelay: `${delay}s`,
          opacity: 0.7 + Math.random() * 0.3,
          transform: `scale(${0.8 + Math.random() * 0.4})`
        }}
      />
    );
  }

  return <>{icons}</>;
};

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();

  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className={styles.fallingIconsContainer}>
        <FallingIcons />
      </div>
      <div className="container">
        <img src="/img/logo.svg" className={styles.biglogo} />
        <Heading as="p" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <div className={styles.button}>
            <Link className="button button--secondary button--bg" to="/docs/Instructions/Start">
              🧭 Документация
            </Link>
          </div>
          <div className={styles.button}>
            <Link className="button button--secondary button--bg" to="./download">
              ⬇️ Скачать
            </Link>
          </div>
          <div className={styles.button}>
            <Link className="button button--secondary button--bg" to="https://en.openintegrations.dev">
              🌐 English version
            </Link>
          </div>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();

  // Данные спонсоров: логотип, название, описание, ссылка
  const sponsors = [
    {
      name: 'GreenAPI',
      description: 'Стабильный шлюз WhatsApp API',
      logo: '/img/Sponsors/GreenAPI.png',
      url: 'https://green-api.com/',
    },

  ];

  return (
    <Layout
      title={`Открытый пакет интеграций`}
      description="ОПИ - пакет интеграций с популярными API для 1С:Enterprise и OneScript"
    >
      <HomepageHeader />
      <main>
        <br />
        <hr />
        <AlternatingFeatures />
        <hr/>

        {/* === Спонсоры === */}
        <section className={styles.sponsorsSection}>
          <div className="container">
            <Heading as="h2" className={clsx('text--center', styles.sponsorsTitle)}>
              Наши спонсоры
            </Heading>
            <p className="text--center margin-bottom--lg">
              Благодарим наших спонсоров за поддержку проекта
            </p>
            <br/>
            <div className={styles.sponsorsGrid}>
              {sponsors.map((sponsor, index) => (
                <a
                  key={index}
                  href={sponsor.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className={styles.sponsorLink}
                  aria-label={`${sponsor.name} - ${sponsor.description}`}
                >
                  <div className={styles.sponsorCard}>
                    <img
                      src={sponsor.logo}
                      alt={sponsor.name}
                      className={styles.sponsorLogo}
                    />
                    <div className={styles.sponsorTooltip}>
                      <div>{sponsor.name}</div>
                      <small>{sponsor.description}</small>
                    </div>
                  </div>
                </a>
              ))}
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}