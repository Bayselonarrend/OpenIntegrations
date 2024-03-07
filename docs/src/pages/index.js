import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';

import Heading from '@theme/Heading';
import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">

        <img src="/img/logo.svg" className={styles.biglogo}/>

        <Heading as="p" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <div className={styles.button}><Link
            className="button button--secondary button--bg" 
            to="/docs/Nachalo-raboty">
            Документация
          </Link>
          </div>
          <div className={styles.button}><Link
            className="button button--secondary button--bg"
            to="https://github.com/Bayselonarrend/OpenIntegrations/releases">
            Релизы
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
      description="ОПИ - пакет интеграций с популярными API для 1С:Enterprise">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
