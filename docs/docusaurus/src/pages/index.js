import React, { useEffect } from 'react';
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
  '/img/APIs/Ozon.png',
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
  // ... добавьте все свои иконки
];

const FallingIcons = () => {
  const iconCount = 60; // количество падающих иконок
  const icons = [];

  for (let i = 0; i < iconCount; i++) {
    const randomIcon = iconList[Math.floor(Math.random() * iconList.length)];
    const left = (i / (iconCount - 1)) * 100; // равномерное распределение по ширине
    const duration = Math.random() + 20;// случайная длительность от 6 до 10 секунд
    const delay = Math.random() * 20; // случайная задержка от 0 до 5 секунд

    icons.push(
      <img
        key={i}
        src={randomIcon}
        alt="falling icon"
        className="falling-icon"
        style={{
          left: `${left}%`,
          animationDuration: `${duration}s`,
          animationDelay: `${delay}s`,
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
            <Link className="button button--secondary button--bg" to="https://github.com/Bayselonarrend/OpenIntegrations/releases/latest">
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
  return (
    <Layout
      title={`Открытый пакет интеграций`}
      description="ОПИ - пакет интеграций с популярными API для 1С:Enterprise и OneScript">
      <HomepageHeader />
      <main>
        <br /><hr />
        <AlternatingFeatures />
      </main>
    </Layout>
  );
}