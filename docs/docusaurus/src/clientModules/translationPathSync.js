const RU_HOST = 'openintegrations.dev';
const EN_HOST = 'en.openintegrations.dev';
const KNOWN_TRANSLATION_HOSTS = new Set([RU_HOST, EN_HOST]);

function getTargetTranslationHost(anchor) {
  if (!anchor) {
    return null;
  }

  try {
    const linkUrl = new URL(anchor.href, window.location.origin);
    const targetHost = linkUrl.hostname.toLowerCase();
    if (!KNOWN_TRANSLATION_HOSTS.has(targetHost)) {
      return null;
    }
    return targetHost;
  } catch (e) {
    return null;
  }
}

function redirectWithCurrentPath(targetHost) {
  if (!targetHost) {
    return;
  }

  const {pathname, search, hash} = window.location;
  window.location.assign(`https://${targetHost}${pathname}${search}${hash}`);
}

function onDocumentClick(event) {
  const anchor = event.target.closest('a');
  const targetHost = getTargetTranslationHost(anchor);
  if (!targetHost) {
    return;
  }

  const currentHost = window.location.hostname.toLowerCase();
  if (currentHost === targetHost) {
    return;
  }

  event.preventDefault();
  redirectWithCurrentPath(targetHost);
}

if (typeof window !== 'undefined' && typeof document !== 'undefined') {
  document.addEventListener('click', onDocumentClick, true);
}
