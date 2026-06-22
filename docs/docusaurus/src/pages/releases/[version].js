import React, { useMemo } from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useBaseUrl from '@docusaurus/useBaseUrl';
import { useParams } from '@docusaurus/router';
import archive from '@site/data/releases-archive.json';
import styles from './releases.module.css';

const langLabels = {
  ru: '🇷🇺 Русская',
  en: '🇬🇧 English',
};

function groupArtifacts(artifacts, groups) {
  const grouped = new Map();

  groups.forEach((group) => {
    grouped.set(group.id, {
      ...group,
      items: new Map(),
    });
  });

  artifacts.forEach((artifact) => {
    const group = grouped.get(artifact.group);
    if (!group) return;

    if (!group.items.has(artifact.id)) {
      group.items.set(artifact.id, {
        id: artifact.id,
        label_ru: artifact.label_ru,
        label_en: artifact.label_en,
        desc_ru: artifact.desc_ru,
        desc_en: artifact.desc_en,
        icon: artifact.icon,
        files: {},
      });
    }

    group.items.get(artifact.id).files[artifact.lang] = artifact;
  });

  return Array.from(grouped.values()).map((group) => ({
    ...group,
    items: Array.from(group.items.values()),
  }));
}

const ReleaseDetailPage = () => {
  const { version } = useParams();
  const iconBase = useBaseUrl('/img/releases/icons/');

  const release = useMemo(
    () => archive.versions?.find((item) => item.version === version),
    [version],
  );

  const downloadGroups = useMemo(() => {
    if (!release) return [];
    return groupArtifacts(release.artifacts ?? [], archive.groups ?? []);
  }, [release]);

  if (!release) {
    return (
      <Layout title="Релиз не найден">
        <main className="container margin-vert--lg">
          <Link className={styles.backLink} to="/releases">
            ← К архиву версий
          </Link>
          <p>Релиз {version} не найден.</p>
        </main>
      </Layout>
    );
  }

  return (
    <Layout
      title={`Версия ${release.version}`}
      description={`${release.summary_ru} / ${release.summary_en}`}
    >
      <main className="container margin-vert--lg">
        <Link className={styles.backLink} to="/releases">
          ← К архиву версий
        </Link>

        <section className={styles.detailHero}>
          <div className={styles.detailHeroText}>
            <h1>{release.version}</h1>
            <p className={styles.detailSummaryRu}>🇷🇺 {release.summary_ru}</p>
            <p className={styles.detailSummaryEn}>🇺🇸 {release.summary_en}</p>
            <div className={styles.mirrorLinks}>
              <a
                className={styles.mirrorLink}
                href={`${archive.githubDownloadBase}/${release.version}/`}
                target="_blank"
                rel="noopener noreferrer"
              >
                GitHub →
              </a>
              <a
                className={styles.mirrorLink}
                href={`${archive.s3BaseUrl}/versions/${release.version}`}
                target="_blank"
                rel="noopener noreferrer"
              >
                S3 →
              </a>
              <a
                className={styles.mirrorLink}
                href="https://sourcecraft.dev/bayselonarrend/openintegrations/releases"
                target="_blank"
                rel="noopener noreferrer"
              >
                SourceCraft →
              </a>
            </div>
          </div>
          <img
            src={release.coverUrl}
            alt=""
            className={styles.detailCover}
            loading="lazy"
          />
        </section>

        <section className={styles.changelogSection}>
          <h2>Новые функции / New functions</h2>
          <table className={styles.changelogTable}>
            <thead>
              <tr>
                <th>API</th>
                <th>🇷🇺</th>
                <th>🇺🇸</th>
              </tr>
            </thead>
            <tbody>
              {(release.changes ?? []).map((change, index) => (
                <tr key={`${change.lib}-${index}`}>
                  <td>
                    <div className={styles.libCell}>
                      <img
                        src={change.iconUrl}
                        alt=""
                        className={styles.libIcon}
                        loading="lazy"
                      />
                      <span>{change.lib}</span>
                    </div>
                  </td>
                  <td>{change.description_ru}</td>
                  <td>{change.description_en}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </section>

        <section className={styles.downloadSection}>
          <h2>Скачать / Download</h2>
          {downloadGroups.map((group) => (
            <div key={group.id} className={styles.downloadGroup}>
              <h3>
                {group.label_ru} / {group.label_en}
              </h3>
              <div className={styles.itemsGrid}>
                {group.items.map((item) => (
                  <div key={item.id} className={styles.downloadItem}>
                    <div className={styles.downloadItemHeader}>
                      <img
                        src={`${iconBase}${item.icon}.png`}
                        alt=""
                        className={styles.fileIcon}
                        loading="lazy"
                      />
                      <h4>
                        {item.label_ru} / {item.label_en}
                      </h4>
                    </div>
                    <p>
                      {item.desc_ru}
                      <br />
                      {item.desc_en}
                    </p>
                    <div className={styles.langButtons}>
                      {Object.entries(item.files).map(([lang, file]) => (
                        <a
                          key={lang}
                          className={styles.downloadButton}
                          href={file.s3Url}
                          download={file.filename}
                        >
                          {langLabels[lang] ?? lang}
                        </a>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </section>
      </main>
    </Layout>
  );
};

export default ReleaseDetailPage;
