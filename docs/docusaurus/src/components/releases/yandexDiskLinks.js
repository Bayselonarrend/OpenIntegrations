export function buildYandexDiskWebUrl(publicKey, version, filename = '') {
  const key = publicKey?.trim();
  if (!key) {
    return null;
  }

  const hash = key.match(/\/d\/([^/?#]+)/)?.[1];
  if (!hash) {
    return key;
  }

  const versionPath = encodeURIComponent(version);
  const base = `https://disk.yandex.ru/d/${hash}/${versionPath}`;

  if (!filename) {
    return base;
  }

  return `${base}/${encodeURIComponent(filename)}`;
}
