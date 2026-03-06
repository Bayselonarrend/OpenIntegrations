import React, { useState, useEffect, useRef } from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import Heading from '@theme/Heading';
import styles from './download.module.css';
import useBaseUrl from '@docusaurus/useBaseUrl';

const DownloadPage = () => {
  const [showThankYou, setShowThankYou] = useState(false);
  const [isModalVisible, setIsModalVisible] = useState(false);
  const thankYouClosed = useRef(false); // флаг: пользователь закрыл окно

  const downloadItems = [
    {
      group: 'Для 1С:Enterprise',
      items: [
        {
          name: 'CFE (расширение)',
          files: {
            ru: 'OpenIntegrations_1.34.0_ru.cfe',
            en: 'OpenIntegrations_1.34.0_en.cfe',
          },
          desc: 'Файл расширения 1С в формате .cfe',
        },
        {
          name: 'XML (выгрузка)',
          files: {
            ru: 'XML_RU.zip',
            en: 'XML_EN.zip',
          },
          desc: 'Выгрузка расширения 1С в формате XML',
        },
        {
          name: 'EDT (проект)',
          files: {
            ru: 'EDT_RU.zip',
            en: 'EDT_EN.zip',
          },
          desc: 'Файлы расширения 1С в формате EDT',
        },
      ],
    },
    {
      group: 'Консольное приложение (OInt CLI)',
      items: [
        {
          name: 'Windows Installer',
          files: {
            ru: 'oint_1.34.0_installer_ru.exe',
            en: 'oint_1.34.0_installer_en.exe',
          },
          desc: 'Windows установщик CLI приложения с аддоном Melezh',
        },
        {
          name: 'Debian / Ubuntu (.deb)',
          files: {
            ru: 'oint_1.34.0_all_ru.deb',
            en: 'oint_1.34.0_all_en.deb',
          },
          desc: 'Пакет CLI приложения для систем на базе Debian',
        },
        {
          name: 'Fedora / RHEL (.rpm)',
          files: {
            ru: 'oint-1.34.0-1.noarch_ru.rpm',
            en: 'oint-1.34.0-1.noarch_en.rpm',
          },
          desc: 'Пакет CLI приложения для систем на базе RHEL',
        },
        {
          name: 'Linux (.AppImage)',
          files: {
            ru: 'oint-1.34.0_ru-x86_64.AppImage',
            en: 'oint-1.34.0_en-x86_64.AppImage',
          },
          desc: 'Единый исполняемый файл CLI формата AppImage',
        },
        
      ],
    },
    {
      group: 'Для OneScript',
      items: [
        {
          name: 'Пакет oint (.ospx)',
          files: {
            ru: 'oint-1.34.0_ru.ospx',
            en: 'oint-1.34.0_en.ospx',
          },
          desc: 'Пакет библиотеки для OneScript',
        },
        {
          name: 'Пакет oint-cli (.ospx)',
          files: {
            ru: 'oint-cli-1.34.0_ru.ospx',
            en: 'oint-cli-1.34.0_en.ospx',
          },
          desc: 'Пакет CLI-приложения для OneScript',
        },
      ],
    },
  ];

  const triggerDownload = (filename) => {
    const cleanFilename = filename.trim();
    const url = `https://github.com/Bayselonarrend/OpenIntegrations/releases/latest/download/${cleanFilename}`;
    const link = document.createElement('a');
    link.href = url;
    link.setAttribute('target', '_self');
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const handleDownload = (filename) => {
    if (thankYouClosed.current) {
      triggerDownload(filename);
      return;
    }

    triggerDownload(filename);

    setShowThankYou(true);
    setTimeout(() => {
      setIsModalVisible(true);
    }, 600);
  };

  const handleCloseThankYou = () => {
    setShowThankYou(false);
    setIsModalVisible(false);
    thankYouClosed.current = true; // запоминаем выбор на время сессии
  };

  return (
    <Layout title="Скачать" description="Скачайте последнюю версию OpenIntegrations">
      <main className="container margin-vert--lg">
        <div className={styles.downloadHeaderWrapper}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
            className={styles.downloadIcon}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5M16.5 12 12 16.5m0 0L7.5 12m4.5 4.5V3"
            />
          </svg>
          <div>
            <Heading as="h1" className={styles.downloadTitle}>
              Скачать последнюю версию
            </Heading>
            <p className={styles.downloadSubtitle}>
              Текущая версия: 1.34.0 | Выберите подходящий язык и вариант поставки
            </p>
          </div>
        </div>

        <hr />

        {downloadItems.map((group, idx) => (
          <div key={idx} className={styles.downloadGroup}>
            <h2>{group.group}</h2>
            <div className={styles.itemsGrid}>
              {group.items.map((item, i) => (
                <div key={i} className={styles.downloadItem}>
                  <h3>{item.name}</h3>
                  <p>{item.desc}</p>
                  <div className={styles.langButtons}>
                    <button
                      className={styles.downloadButton}
                      onClick={() => handleDownload(item.files.ru)}
                    >
                      🇷🇺 Русская
                    </button>
                    <button
                      className={styles.downloadButton}
                      onClick={() => handleDownload(item.files.en)}
                    >
                      🇬🇧 English
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}

        <div className={styles.otherVersions}>
          <Link to="https://github.com/Bayselonarrend/OpenIntegrations/releases">
            Другие версии →
          </Link>
        </div>
      </main>

      {showThankYou && (
        <div
          className={`${styles.modalOverlay} ${isModalVisible ? styles.modalOverlayVisible : ''}`}
          onClick={handleCloseThankYou}
        >
          <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
            <div className={styles.modalScrollable}>
              <h1>Скачивание началось...</h1>
              <hr />
              <p className={styles.thankYouText}>
                Большое спасибо за скачивание! Если вам нравится проект, то вы можете поддержать его одним из способов, представленных ниже. Ваша поддержка очень важна: она помогает проекту развиваться, при этом оставаясь бесплатным и независимым ❤️!
              </p>

              <div className={styles.supportGrid}>
                <div className={styles.supportCard}>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    strokeWidth="0.8"
                    stroke="currentColor"
                    className={styles.supportIcon}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z"
                    />
                  </svg>
                  <p>
                    Звездочка на GitHub — самый простой способ поддержать проект! Рост количества звезд помогает другим людям чаще видеть репозиторий в рекомендациях, а для нас является мотиватором развивать проект дальше!
                    <br />
                  </p>
                  <Link
                    className={styles.supportButton}
                    to="https://github.com/Bayselonarrend/OpenIntegrations"
                    target="_blank"
                    rel="noopener"
                  >
                    Перейти на GitHub
                  </Link>
                </div>

                <div className={styles.supportCard}>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    strokeWidth="0.8"
                    stroke="currentColor"
                    className={styles.supportIcon}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z"
                    />
                  </svg>
                  <p>
                    Пожертвования на Boosty — единственный источник дохода проекта. Такой вид монетизации позволяет нам развивать проект дальше, при этом не пряча функционал за платными версиями и не засоряя документацию рекламными блоками.
                  </p>
                  <Link
                    className={styles.supportButton}
                    to="https://boosty.to/bayselonarrend?utm_source=openintegrations.dev"
                    target="_blank"
                    rel="noopener"
                  >
                    Поддержать на Boosty
                  </Link>
                </div>
              </div>
            </div>

            <button className={styles.closeButton} onClick={handleCloseThankYou}>
              Нет, спасибо
            </button>
          </div>
        </div>
      )}
    </Layout>
  );
};

export default DownloadPage;