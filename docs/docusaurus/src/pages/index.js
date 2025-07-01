import React, { useEffect } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import AlternatingFeatures from '@site/src/components/AlternatingFeatures';
import Heading from '@theme/Heading';
import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();

  useEffect(() => {
    // Создаем частицы только для header
    const header = document.querySelector(`.${styles.heroBanner}`);
    if (!header) return;

    const particleCount = 30;
    const particles = [];
    
    for (let i = 0; i < particleCount; i++) {
      const particle = document.createElement('div');
      particle.className = styles.particle;
      
      // Позиционирование внутри header
      particle.style.left = `${Math.random() * 100}%`;
      particle.style.top = `${Math.random() * 100}%`;
      particle.style.width = `${Math.random() * 3 + 1}px`;
      particle.style.height = particle.style.width;
      particle.style.animationDuration = `${Math.random() * 10 + 5}s`;
      particle.style.animationDelay = `${Math.random() * 2}s`;
      
      header.appendChild(particle);
      particles.push(particle);
    }

    return () => {
      particles.forEach(p => p.remove());
    };
  }, []);

  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <img src="/img/logo.svg" className={styles.biglogo}/>
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
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Открытый пакет интеграций`}
      description="ОПИ - пакет интеграций с популярными API для 1С:Enterprise и OneScript">
      <HomepageHeader />
      <main>
        <br/><hr/>
        <AlternatingFeatures />
      </main>
    </Layout>
  );
}