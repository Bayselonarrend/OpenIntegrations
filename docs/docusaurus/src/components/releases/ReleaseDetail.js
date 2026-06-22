import React, { useCallback, useMemo, useState } from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useBaseUrl from '@docusaurus/useBaseUrl';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import archive from '@site/archive/releases-archive.json';
import CoverImage from '@site/src/components/releases/CoverImage';
import ChangelogText from '@site/src/components/releases/ChangelogText';
import useReleaseVersion from '@site/src/components/releases/useReleaseVersion';
import MirrorSelectModal from '@site/src/components/releases/MirrorSelectModal';
import { buildMirrorPageLinks } from '@site/src/components/releases/mirrorUtils';
import styles from '@site/src/components/releases/releases.module.css';
import downloadStyles from '@site/src/pages/download.module.css';

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

export default function ReleaseDetail() {
  const version = useReleaseVersion();
  const [mirrorSelection, setMirrorSelection] = useState(null);
  const handleCloseMirrorModal = useCallback(() => {
    setMirrorSelection(null);
  }, []);
  const iconBase = useBaseUrl('/img/releases/icons/');
  const githubIcon = useBaseUrl('/img/github-logo.svg');
  const s3Icon = useBaseUrl('/img/APIs/S3.png');
  const yandexIcon = useBaseUrl('/img/APIs/YandexDisk.png');
  const sourcecraftIcon = useBaseUrl('/img/sourcecraft_c.svg');
  const { i18n } = useDocusaurusContext();
  const locale = i18n.currentLocale === 'en' ? 'en' : 'ru';

  const mirrorLinks = useMemo(
    () => buildMirrorPageLinks(archive, version, {
      github: githubIcon,
      sourcecraft: sourcecraftIcon,
      s3: s3Icon,
      yandex: yandexIcon,
    }),
    [version, githubIcon, s3Icon, yandexIcon, sourcecraftIcon],
  );

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
        <main className={`container margin-vert--lg ${styles.releasesPage}`}>
          <Link className={styles.backLink} to="/releases">
            ← К архиву версий
          </Link>
          <p>Релиз {version} не найден.</p>
        </main>
      </Layout>
    );
  }

  const summary = locale === 'en' ? release.summary_en : release.summary_ru;

  return (
    <Layout title={`Версия ${release.version}`} description={summary}>
      <main className={`container margin-vert--lg ${styles.releasesPage}`}>
        <Link className={styles.backLink} to="/releases">
          ← К архиву версий
        </Link>

        <section className={styles.detailHero}>
          <div className={styles.detailHeroText}>
            <h1>{release.version}</h1>
            <p className={styles.detailSummary}>{summary}</p>
            <div className={styles.mirrorLinks}>
              {mirrorLinks.map((mirror) => (
                <a
                  key={mirror.id}
                  className={styles.mirrorLink}
                  href={mirror.href}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label={mirror.label}
                  title={mirror.label}
                >
                  <img
                    src={mirror.icon}
                    alt=""
                    className={styles.mirrorIcon}
                    loading="lazy"
                  />
                  <span>{mirror.label} →</span>
                </a>
              ))}
            </div>
          </div>
          <CoverImage
            release={release}
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
                  <td>
                    <ChangelogText>{change.description_ru}</ChangelogText>
                  </td>
                  <td>
                    <ChangelogText>{change.description_en}</ChangelogText>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </section>

        <hr />

        <section className={styles.downloadSection}>
          {downloadGroups.map((group) => (
            <div key={group.id} className={downloadStyles.downloadGroup}>
              <h2>{locale === 'en' ? group.label_en : group.label_ru}</h2>
              <div className={downloadStyles.itemsGrid}>
                {group.items.map((item) => (
                  <div key={item.id} className={downloadStyles.downloadItem}>
                    <div className={downloadStyles.downloadItemHeader}>
                      <img
                        src={`${iconBase}${item.icon}.png`}
                        alt=""
                        className={downloadStyles.fileIcon}
                        loading="lazy"
                      />
                      <h3>
                        {locale === 'en' ? item.label_en : item.label_ru}
                      </h3>
                    </div>
                    <p>{locale === 'en' ? item.desc_en : item.desc_ru}</p>
                    <div className={downloadStyles.langButtons}>
                      {Object.entries(item.files).map(([lang, file]) => (
                        <button
                          key={lang}
                          type="button"
                          className={downloadStyles.downloadButton}
                          onClick={() => setMirrorSelection({ file, lang })}
                        >
                          {langLabels[lang] ?? lang}
                        </button>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </section>

        <MirrorSelectModal
          open={Boolean(mirrorSelection)}
          onClose={handleCloseMirrorModal}
          artifact={mirrorSelection?.file}
          version={version}
          archive={archive}
          locale={locale}
        />
      </main>
    </Layout>
  );
}
