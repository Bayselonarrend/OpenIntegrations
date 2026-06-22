import { buildYandexDiskWebUrl } from '@site/src/components/releases/yandexDiskLinks';

const DEFAULT_MIRRORS = [
  { id: 'github' },
  { id: 'sourcecraft', minVersion: '1.34.0' },
  { id: 'yandex', minVersion: '1.31.0' },
  { id: 's3', minVersion: '2.3.0' },
];

export function compareVersions(version1, version2) {
  const parts1 = String(version1).trim().split('.');
  const parts2 = String(version2).trim().split('.');
  const maxIndex = Math.max(parts1.length, parts2.length) - 1;

  for (let index = 0; index <= maxIndex; index += 1) {
    const number1 = index < parts1.length ? Number(parts1[index]) : 0;
    const number2 = index < parts2.length ? Number(parts2[index]) : 0;

    if (number1 > number2) {
      return 1;
    }
    if (number1 < number2) {
      return -1;
    }
  }

  return 0;
}

export function getMirrorCatalog(archive) {
  return archive?.mirrors?.length ? archive.mirrors : DEFAULT_MIRRORS;
}

export function isMirrorAvailable(mirror, version) {
  if (!mirror?.minVersion) {
    return true;
  }

  return compareVersions(version, mirror.minVersion) >= 0;
}

export function getAvailableMirrorIds(archive, version) {
  return new Set(
    getMirrorCatalog(archive)
      .filter((mirror) => isMirrorAvailable(mirror, version))
      .map((mirror) => mirror.id),
  );
}

export function buildMirrorPageLinks(archive, version, icons) {
  const availableIds = getAvailableMirrorIds(archive, version);
  const yandexPublicKey = archive.yandexDiskPublicKey?.trim();
  const links = [];

  if (availableIds.has('github')) {
    links.push({
      id: 'github',
      href: `${archive.githubReleaseBase}/${version}`,
      icon: icons.github,
      label: 'GitHub',
    });
  }

  if (availableIds.has('sourcecraft')) {
    links.push({
      id: 'sourcecraft',
      href: `${archive.sourcecraftReleaseBase}/${version}`,
      icon: icons.sourcecraft,
      label: 'SourceCraft',
    });
  }

  if (availableIds.has('s3')) {
    links.push({
      id: 's3',
      href: `${archive.s3BaseUrl}/versions/${version}`,
      icon: icons.s3,
      label: 'S3',
    });
  }

  if (availableIds.has('yandex') && yandexPublicKey) {
    links.push({
      id: 'yandex',
      href: buildYandexDiskWebUrl(yandexPublicKey, version),
      icon: icons.yandex,
      label: 'Yandex.Disk',
    });
  }

  return links;
}

function getDownloadMirrorLabel(id, locale) {
  if (id === 's3') {
    return locale === 'en' ? 'Archive (S3)' : 'Архив (S3)';
  }

  if (id === 'github') {
    return 'GitHub';
  }

  if (id === 'yandex') {
    return 'Yandex.Disk';
  }

  return id;
}

export function buildDownloadMirrors({
  archive,
  version,
  artifact,
  icons,
  locale = 'ru',
}) {
  if (!artifact) {
    return [];
  }

  const availableIds = getAvailableMirrorIds(archive, version);
  const yandexPublicKey = archive?.yandexDiskPublicKey?.trim();
  const yandexWebUrl = yandexPublicKey
    ? buildYandexDiskWebUrl(yandexPublicKey, version, artifact.filename)
    : null;
  const items = [];

  if (availableIds.has('github') && artifact.githubUrl) {
    items.push({
      id: 'github',
      label: getDownloadMirrorLabel('github', locale),
      hint: locale === 'en' ? 'Recommended' : 'Рекомендуется',
      icon: icons.github,
      url: artifact.githubUrl,
    });
  }

  if (availableIds.has('s3') && artifact.s3Url) {
    items.push({
      id: 's3',
      label: getDownloadMirrorLabel('s3', locale),
      icon: icons.s3,
      url: artifact.s3Url,
    });
  }

  if (availableIds.has('yandex') && yandexWebUrl) {
    items.push({
      id: 'yandex',
      label: getDownloadMirrorLabel('yandex', locale),
      icon: icons.yandex,
      url: yandexWebUrl,
      opensWebUi: true,
    });
  }

  return items;
}
