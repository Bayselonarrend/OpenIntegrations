import React, { useEffect, useState } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import { usePluginData } from '@docusaurus/useGlobalData';
import Layout from '@theme/Layout';
import AlternatingFeatures from '@site/src/components/AlternatingFeatures';
import Heading from '@theme/Heading';
import styles from './index.module.css';

const FallingIcons = () => {
  const { iconList } = usePluginData('api-icons-plugin');
  const [columns, setColumns] = useState(12);
  const [iconCount, setIconCount] = useState(60);
  const [iconDensity] = useState(0.6); 

  useEffect(() => {
    const updateLayout = () => {

      const width = window.innerWidth;
      const newColumns = width < 768 ? 6 : width < 1024 ? 9 : 12;
      setColumns(newColumns);

      const area = width * window.innerHeight;
      const newIconCount = Math.floor(area / (2000 * (1.1 - iconDensity)));
      setIconCount(Math.min(newIconCount, 100)); 
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
    
    let column = 0;
    let minCount = columnCounts[0];
    for (let c = 1; c < columns; c++) {
      if (columnCounts[c] < minCount) {
        minCount = columnCounts[c];
        column = c;
      }
    }
    columnCounts[column]++;
    
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