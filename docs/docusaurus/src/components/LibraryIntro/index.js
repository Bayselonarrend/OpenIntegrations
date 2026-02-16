import React, { useState, useRef } from 'react';
import styles from './styles.module.css';

export default function LibraryIntro({ module, cli, use, lang = 'ru' }) {
  const [copiedIndex, setCopiedIndex] = useState(null);
  const timeoutRef = useRef(null);

  const translations = {
    ru: {
      moduleLabel: 'Модуль 1С/OS',
      cliLabel: 'Команда CLI',
      useLabel: '#Использовать',
      copied: '✓ Скопировано',
      clickToCopy: 'Нажмите, чтобы скопировать'
    },
    en: {
      moduleLabel: '1C/OS Module',
      cliLabel: 'CLI Command',
      useLabel: '#Use',
      copied: '✓ Copied',
      clickToCopy: 'Click to copy'
    }
  };

  const t = translations[lang] || translations.ru;

  const copyToClipboard = (text, index) => {
    // Очищаем предыдущий таймер, если он есть
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }

    navigator.clipboard.writeText(text).then(() => {
      setCopiedIndex(index);
      timeoutRef.current = setTimeout(() => {
        setCopiedIndex(null);
        timeoutRef.current = null;
      }, 1500);
    });
  };

  const usePrefix = lang === 'en' ? '#Use' : '#Использовать';

  return (
    <div className={styles.libraryIntro}>
      <span 
        className={styles.tag}
        onClick={() => copyToClipboard(module, 0)}
        title={t.clickToCopy}
      >
        <span className={styles.tagLabel}>{t.moduleLabel}</span>
        <span className={styles.tagValue}>
          {copiedIndex === 0 ? t.copied : module}
        </span>
      </span>
      
      {cli && (
        <span 
          className={styles.tag}
          onClick={() => copyToClipboard(cli, 1)}
          title={t.clickToCopy}
        >
          <span className={styles.tagLabel}>{t.cliLabel}</span>
          <span className={styles.tagValue}>
            {copiedIndex === 1 ? t.copied : cli}
          </span>
        </span>
      )}
      
      <span 
        className={styles.tag}
        onClick={() => copyToClipboard(`${usePrefix} ${use}`, 2)}
        title={t.clickToCopy}
      >
        <span className={styles.tagLabel}>{t.useLabel}</span>
        <span className={styles.tagValue}>
          {copiedIndex === 2 ? t.copied : use}
        </span>
      </span>
    </div>
  );
}
