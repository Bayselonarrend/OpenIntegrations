import React, { useEffect, useState } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import { usePluginData } from '@docusaurus/useGlobalData';
import Layout from '@theme/Layout';
import AlternatingFeatures from '@site/src/components/AlternatingFeatures';
import Heading from '@theme/Heading';
import styles from './index.module.css';

const currentVersion = '2.0.0';

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
          <div className={styles.versionBadge}>Version {currentVersion}</div>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const [showSponsorModal, setShowSponsorModal] = useState(false);
  const [isModalVisible, setIsModalVisible] = useState(false);

  const openModal = () => {
    setShowSponsorModal(true);
    setTimeout(() => setIsModalVisible(true), 10);
  };

  const closeModal = () => {
    setIsModalVisible(false);
    setTimeout(() => setShowSponsorModal(false), 300);
  };

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
            <div className={styles.becomeSponsorWrapper}>
              <button 
                className={styles.becomeSponsorBtn}
                onClick={openModal}
              >
                Стать спонсором
              </button>
            </div>
          </div>
        </section>

        {showSponsorModal && (
          <div 
            className={`${styles.modalOverlay} ${isModalVisible ? styles.modalOverlayVisible : ''}`} 
            onClick={closeModal}
          >
            <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
              <div className={styles.modalScrollable}>
                <div className={styles.modalIconWrapper}>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    strokeWidth="0.8"
                    stroke="currentColor"
                    className={styles.modalIcon}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z"
                    />
                  </svg>
                </div>
                <h1>Станьте спонсором проекта</h1>
                <p className={styles.sponsorModalText}>
                  <strong>Открытый Пакет Интеграций</strong> — это бесплатный open-source проект, который развивается благодаря поддержке сообщества. Мы не используем платные версии и не размещаем рекламу в документации, чтобы сохранить удобство использования для всех
                </p>
                <p className={styles.sponsorModalText}>
                  Ваша поддержка поможет нам продолжать разработку новых интеграций, улучшать документацию и поддерживать актуальность библиотек. Взамен логотип вашей компании будет размещён в блоке спонсоров на главной странице сайта (при желании), а поддержка по работе с проектом будет оказываться вам в приоритетном порядке
                </p>
                <p className={styles.sponsorModalText}>
                  Стоимость спонсорской подписки для компаний: <strong>7 500 ₽</strong> в месяц. Также вы можете поддержать проект единоразово или выбрать другой уровень подписки с другим набором бонусов на Boosty. Мы будем рады любой помощи!
                </p>
                <hr className={styles.modalDivider} />
                <div className={styles.modalButtonsRow}>
                  <Link
                    className={styles.sponsorModalBtn}
                    to="https://boosty.to/bayselonarrend/purchase/3429871?ssource=DIRECT&share=subscription_link"
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    Оформить подписку на Boosty
                  </Link>
                  <button 
                    className={styles.closeButtonSquare} 
                    onClick={closeModal}
                    aria-label="Закрыть"
                  >
                    ×
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </main>
    </Layout>
  );
}