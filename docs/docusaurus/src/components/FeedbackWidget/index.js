import React, {useCallback, useEffect, useRef, useState} from 'react';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import {useLocation} from '@docusaurus/router';
import styles from './styles.module.css';

const BACK_TO_TOP_SELECTOR = '.theme-back-to-top-button';

function isBackToTopVisible(button) {
  if (!button) {
    return false;
  }

  return Array.from(button.classList).some((className) =>
    className.startsWith('backToTopButtonShow'),
  );
}

function useBackToTopVisible() {
  const {pathname, hash} = useLocation();
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (typeof document === 'undefined') {
      return undefined;
    }

    let buttonObserver;
    let active = true;

    const watchButton = (button) => {
      const update = () => {
        if (active) {
          setVisible(isBackToTopVisible(button));
        }
      };

      update();
      buttonObserver = new MutationObserver(update);
      buttonObserver.observe(button, {
        attributes: true,
        attributeFilter: ['class'],
      });
    };

    const existingButton = document.querySelector(BACK_TO_TOP_SELECTOR);
    if (existingButton) {
      watchButton(existingButton);
      return () => {
        active = false;
        buttonObserver?.disconnect();
      };
    }

    const bodyObserver = new MutationObserver(() => {
      const button = document.querySelector(BACK_TO_TOP_SELECTOR);
      if (!button) {
        return;
      }

      bodyObserver.disconnect();
      watchButton(button);
    });

    bodyObserver.observe(document.body, {childList: true, subtree: true});

    return () => {
      active = false;
      bodyObserver.disconnect();
      buttonObserver?.disconnect();
    };
  }, [pathname, hash]);

  return visible;
}

const LABELS = {
  ru: {
    toggle: 'Обратная связь',
    telegram: '@openintegrations',
    email: 'support@openintegrations.dev',
    github: 'GitHub Issues',
  },
  en: {
    toggle: 'Contact us',
    telegram: '@openintegrations',
    email: 'support@openintegrations.dev',
    github: 'GitHub Issues',
  },
};

const LINKS = {
  telegram: 'https://t.me/openintegrations',
  email: 'mailto:support@openintegrations.dev',
  github: 'https://github.com/Bayselonarrend/OpenIntegrations/issues',
};

function IconTelegram() {
  return (
    <svg className={styles.icon} viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="currentColor"
        d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm4.64 6.8c-.15 1.58-.8 5.42-1.13 7.19-.14.75-.42 1-.68 1.03-.58.05-1.02-.38-1.58-.75-.88-.58-1.38-.94-2.23-1.5-.99-.65-.35-1.01.22-1.59.15-.15 2.71-2.48 2.76-2.69a.2.2 0 00-.05-.18c-.06-.05-.14-.03-.21-.02-.09.02-1.49.95-4.22 2.79-.4.27-.76.41-1.08.4-.36-.01-1.04-.2-1.55-.37-.63-.2-1.12-.31-1.08-.66.02-.18.27-.36.74-.55 2.92-1.27 4.86-2.11 5.83-2.51 2.78-1.16 3.35-1.36 3.73-1.36.08 0 .27.02.39.12.1.08.13.19.14.27-.01.06.01.24 0 .38z"
      />
    </svg>
  );
}

function IconMail() {
  return (
    <svg className={styles.icon} viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="currentColor"
        d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z"
      />
    </svg>
  );
}

function IconGitHub() {
  return (
    <svg className={styles.icon} viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="currentColor"
        d="M12 .5C5.65.5.5 5.65.5 12c0 5.08 3.29 9.39 7.86 10.91.58.11.79-.25.79-.56 0-.28-.01-1.02-.02-2-3.2.7-3.88-1.54-3.88-1.54-.53-1.35-1.29-1.71-1.29-1.71-1.06-.72.08-.71.08-.71 1.17.08 1.79 1.2 1.79 1.2 1.04 1.78 2.73 1.27 3.4.97.11-.76.41-1.27.75-1.56-2.55-.29-5.23-1.28-5.23-5.7 0-1.26.45-2.29 1.18-3.1-.12-.29-.51-1.47.11-3.06 0 0 .96-.31 3.15 1.18a10.9 10.9 0 0 1 2.88-.39c.98.01 1.97.13 2.88.39 2.19-1.49 3.15-1.18 3.15-1.18.62 1.59.23 2.77.11 3.06.73.81 1.18 1.84 1.18 3.1 0 4.43-2.69 5.41-5.25 5.69.42.36.8 1.08.8 2.18 0 1.57-.01 2.84-.01 3.22 0 .31.21.68.8.56A10.51 10.51 0 0 0 23.5 12C23.5 5.65 18.35.5 12 .5z"
      />
    </svg>
  );
}

function IconChat() {
  return (
    <svg className={styles.toggleIcon} viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="currentColor"
        d="M20 2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h3l4 4 4-4h5c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H4V4h16v12z"
      />
    </svg>
  );
}

function IconClose() {
  return (
    <svg className={styles.toggleIcon} viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="currentColor"
        d="M18.3 5.71a1 1 0 0 0-1.41 0L12 10.59 7.11 5.7A1 1 0 0 0 5.7 7.11L10.59 12l-4.89 4.89a1 1 0 1 0 1.41 1.41L12 13.41l4.89 4.89a1 1 0 0 0 1.41-1.41L13.41 12l4.89-4.89a1 1 0 0 0 0-1.4z"
      />
    </svg>
  );
}

const MENU_ITEMS = [
  {id: 'telegram', href: LINKS.telegram, Icon: IconTelegram, external: true},
  {id: 'email', href: LINKS.email, Icon: IconMail, external: false},
  {id: 'github', href: LINKS.github, Icon: IconGitHub, external: true},
];

export default function FeedbackWidget() {
  const {i18n} = useDocusaurusContext();
  const backToTopShown = useBackToTopVisible();
  const locale = i18n.currentLocale === 'en' ? 'en' : 'ru';
  const labels = LABELS[locale];
  const [open, setOpen] = useState(false);
  const rootRef = useRef(null);

  const close = useCallback(() => setOpen(false), []);
  const toggle = useCallback(() => setOpen((value) => !value), []);

  useEffect(() => {
    if (!open) {
      return undefined;
    }

    const onKeyDown = (event) => {
      if (event.key === 'Escape') {
        close();
      }
    };

    const onPointerDown = (event) => {
      if (rootRef.current && !rootRef.current.contains(event.target)) {
        close();
      }
    };

    document.addEventListener('keydown', onKeyDown);
    document.addEventListener('pointerdown', onPointerDown);

    return () => {
      document.removeEventListener('keydown', onKeyDown);
      document.removeEventListener('pointerdown', onPointerDown);
    };
  }, [open, close]);

  return (
    <div
      ref={rootRef}
      className={styles.root}
      data-open={open ? 'true' : 'false'}
      data-back-to-top-shown={backToTopShown ? 'true' : 'false'}
    >
      <div className={styles.menuPopover} aria-hidden={!open}>
        <div className={styles.menu} role="menu" id="feedback-widget-menu">
        {MENU_ITEMS.map(({id, href, Icon, external}) => (
          <a
            key={id}
            role="menuitem"
            className={styles.menuItem}
            href={href}
            target={external ? '_blank' : undefined}
            rel={external ? 'noopener noreferrer' : undefined}
            tabIndex={open ? 0 : -1}
            onClick={close}
          >
            <span className={`${styles.menuIcon} ${styles[`menuIcon_${id}`]}`}>
              <Icon />
            </span>
            <span className={styles.menuLabel}>{labels[id]}</span>
          </a>
        ))}
        </div>
      </div>

      <button
        type="button"
        className={styles.toggle}
        aria-label={labels.toggle}
        aria-expanded={open}
        aria-controls="feedback-widget-menu"
        onClick={toggle}
      >
        {open ? <IconClose /> : <IconChat />}
      </button>
    </div>
  );
}
