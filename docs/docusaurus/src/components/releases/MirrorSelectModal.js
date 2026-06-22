import React, { useEffect, useMemo, useState } from 'react';
import { createPortal } from 'react-dom';
import useBaseUrl from '@docusaurus/useBaseUrl';
import { buildDownloadMirrors } from '@site/src/components/releases/mirrorUtils';
import styles from './mirrorSelect.module.css';

function triggerDownload(url, filename) {
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', filename);
  link.setAttribute('target', '_blank');
  link.setAttribute('rel', 'noopener noreferrer');
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}

export default function MirrorSelectModal({
  open,
  onClose,
  onDownloadComplete,
  artifact,
  version,
  archive,
  locale = 'ru',
}) {
  const githubIcon = useBaseUrl('/img/github-logo.svg');
  const s3Icon = useBaseUrl('/img/APIs/S3.png');
  const yandexIcon = useBaseUrl('/img/APIs/YandexDisk.png');
  const [loadingMirror, setLoadingMirror] = useState(null);
  const [error, setError] = useState('');

  const labels = useMemo(
    () => ({
      title: locale === 'en' ? 'Choose download mirror' : 'Выберите зеркало для скачивания',
      cancel: locale === 'en' ? 'Cancel' : 'Отмена',
      loading: locale === 'en' ? 'Preparing download…' : 'Подготовка скачивания…',
      empty: locale === 'en'
        ? 'No download mirrors are available for this version.'
        : 'Для этой версии нет доступных зеркал скачивания.',
    }),
    [locale],
  );

  const mirrors = useMemo(
    () => buildDownloadMirrors({
      archive,
      version,
      artifact,
      locale,
      icons: {
        github: githubIcon,
        s3: s3Icon,
        yandex: yandexIcon,
      },
    }),
    [artifact, archive, githubIcon, locale, s3Icon, version, yandexIcon],
  );

  useEffect(() => {
    if (!open) {
      setLoadingMirror(null);
      setError('');
      return undefined;
    }

    const onKeyDown = (event) => {
      if (event.key === 'Escape' && !loadingMirror) {
        onClose();
      }
    };

    window.addEventListener('keydown', onKeyDown);

    return () => {
      window.removeEventListener('keydown', onKeyDown);
    };
  }, [loadingMirror, onClose, open]);

  if (!open || !artifact || typeof document === 'undefined') {
    return null;
  }

  const handleMirrorClick = (mirror) => {
    setError('');
    setLoadingMirror(mirror.id);

    try {
      if (!mirror.url) {
        throw new Error('Mirror URL is not available');
      }

      if (mirror.opensWebUi) {
        window.open(mirror.url, '_blank', 'noopener,noreferrer');
      } else {
        triggerDownload(mirror.url, artifact.filename);
        onDownloadComplete?.();
      }

      onClose();
    } catch (mirrorError) {
      setError(mirrorError?.message || 'Download failed');
    } finally {
      setLoadingMirror(null);
    }
  };

  return createPortal(
    <div
      className={`${styles.overlay} ${styles.overlayVisible}`}
      onClick={loadingMirror ? undefined : onClose}
      role="presentation"
    >
      <div
        className={styles.dialog}
        onClick={(event) => event.stopPropagation()}
        role="dialog"
        aria-modal="true"
        aria-labelledby="mirror-select-title"
      >
        <h2 id="mirror-select-title" className={styles.title}>
          {labels.title}
        </h2>
        <p className={styles.subtitle}>{artifact.filename}</p>

        {mirrors.length > 0 ? (
          <div className={styles.mirrorList}>
            {mirrors.map((mirror) => (
              <button
                key={mirror.id}
                type="button"
                className={styles.mirrorOption}
                disabled={Boolean(loadingMirror)}
                onClick={() => handleMirrorClick(mirror)}
              >
                <img src={mirror.icon} alt="" className={styles.mirrorIcon} loading="lazy" />
                <span className={styles.mirrorLabelWrap}>
                  <span className={styles.mirrorLabel}>
                    {loadingMirror === mirror.id ? labels.loading : mirror.label}
                  </span>
                  {mirror.hint && loadingMirror !== mirror.id ? (
                    <span className={styles.mirrorHint}>{mirror.hint}</span>
                  ) : null}
                </span>
                <span className={styles.mirrorArrow}>→</span>
              </button>
            ))}
          </div>
        ) : (
          <p className={styles.error}>{labels.empty}</p>
        )}

        {error ? <p className={styles.error}>{error}</p> : null}

        <button
          type="button"
          className={styles.closeButton}
          onClick={onClose}
          disabled={Boolean(loadingMirror)}
        >
          {labels.cancel}
        </button>
      </div>
    </div>,
    document.body,
  );
}
