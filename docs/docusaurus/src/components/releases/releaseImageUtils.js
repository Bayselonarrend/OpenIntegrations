export function mediaBasename(mediaPath) {
  if (!mediaPath) {
    return 'logo.png';
  }

  return mediaPath.split('/').pop();
}

export function releaseCoverPath(coverPath) {
  return `/img/releases/covers/${mediaBasename(coverPath)}`;
}

export function releaseChangelogIconPaths(iconPath) {
  const name = mediaBasename(iconPath);

  if (name === 'logo.png') {
    return ['/img/logo.png'];
  }

  return [
    `/img/releases/changelog/${name}`,
    `/img/APIs/${name}`,
    '/img/logo.png',
  ];
}
