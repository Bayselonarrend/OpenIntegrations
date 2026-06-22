import React from 'react';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';
import Link from '@docusaurus/Link';
import archive from '@site/archive/releases-archive.json';
import CoverImage from '@site/src/components/releases/CoverImage';
import styles from '@site/src/components/releases/releases.module.css';

export default function ReleasesList() {
  const versions = archive.versions ?? [];

  return (
    <Layout title="Архив версий" description="Архив релизов OpenIntegrations">
      <main className={`container margin-vert--lg ${styles.releasesPage}`}>
        <div className={styles.pageHeader}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
            strokeLinecap="round"
            strokeLinejoin="round"
            className={styles.pageIcon}
            aria-hidden="true"
          >
            <path d="M4.5 3h11c.83 0 1.5.67 1.5 1.5v15c0 .83-.67 1.5-1.5 1.5h-11c-.83 0-1.5-.67-1.5-1.5V4.5c0-.83.67-1.5 1.5-1.5z" />
            <path d="M8 9h6.5" />
            <path d="M8 12h6.5" />
            <path d="M8 15h4.5" />
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
              <div className={styles.releaseCardMain}>
                <div className={styles.versionNumber}>{release.version}</div>
                <div className={styles.summaryBlock}>
                  <p className={styles.summaryRu}>🇷🇺 {release.summary_ru}</p>
                  <p className={styles.summaryEn}>🇺🇸 {release.summary_en}</p>
                </div>
              </div>
              <div className={styles.coverWrap}>
                <div className={styles.coverTone}>
                  <CoverImage
                    release={release}
                    className={styles.coverImage}
                    loading="lazy"
                  />
                </div>
              </div>
            </Link>
          ))}
        </div>
      </main>
    </Layout>
  );
}
