import React from 'react';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';
import Link from '@docusaurus/Link';
import archive from '@site/archive/releases-archive.json';
import styles from './releases.module.css';

const ReleasesIndexPage = () => {
  const versions = archive.versions ?? [];

  return (
    <Layout title="Архив версий" description="Архив релизов OpenIntegrations">
      <main className="container margin-vert--lg">
        <div className={styles.pageHeader}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
            className={styles.pageIcon}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5"
            />
          </svg>
          <div>
            <Heading as="h1" className={styles.pageTitle}>
              Архив версий
            </Heading>
            <p className={styles.pageSubtitle}>
              Все релизы OpenIntegrations с описанием изменений и файлами для скачивания
            </p>
          </div>
        </div>

        <div className={styles.releaseList}>
          {versions.map((release) => (
            <Link
              key={release.version}
              className={styles.releaseCard}
              to={`/releases/${release.version}`}
            >
              <div className={styles.versionNumber}>{release.version}</div>
              <div className={styles.summaryBlock}>
                <p className={styles.summaryRu}>🇷🇺 {release.summary_ru}</p>
                <p className={styles.summaryEn}>🇺🇸 {release.summary_en}</p>
              </div>
              <div className={styles.coverWrap}>
                <img
                  src={release.coverUrl}
                  alt=""
                  className={styles.coverImage}
                  loading="lazy"
                />
              </div>
            </Link>
          ))}
        </div>
      </main>
    </Layout>
  );
};

export default ReleasesIndexPage;
