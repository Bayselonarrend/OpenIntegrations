import React, { useEffect, useState } from 'react';
import useBaseUrl from '@docusaurus/useBaseUrl';
import { releaseChangelogIconPaths } from '@site/src/components/releases/releaseImageUtils';

export default function ChangelogIcon({ icon, className, ...props }) {
  const logo = useBaseUrl('/img/logo.png');
  const changelogBase = useBaseUrl('/img/releases/changelog/');
  const apisBase = useBaseUrl('/img/APIs/');
  const [index, setIndex] = useState(0);

  const name = icon?.split('/').pop() ?? 'logo.png';
  const candidates = name === 'logo.png'
    ? [logo]
    : [
      `${changelogBase}${name}`,
      `${apisBase}${name}`,
      logo,
    ];

  const src = candidates[index] ?? logo;

  useEffect(() => {
    setIndex(0);
  }, [icon, changelogBase, apisBase, logo]);

  const handleError = () => {
    if (index < candidates.length - 1) {
      setIndex(index + 1);
    }
  };

  return (
    <img
      src={src}
      alt=""
      className={className}
      onError={handleError}
      {...props}
    />
  );
}
