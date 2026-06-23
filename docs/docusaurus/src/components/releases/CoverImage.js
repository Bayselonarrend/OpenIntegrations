import React, { useEffect, useState } from 'react';
import useBaseUrl from '@docusaurus/useBaseUrl';
import { releaseCoverPath } from '@site/src/components/releases/releaseImageUtils';

export default function CoverImage({ release, className, ...props }) {
  const logo = useBaseUrl('/img/logo.png');
  const primary = useBaseUrl(releaseCoverPath(release?.cover));
  const [src, setSrc] = useState(primary);

  useEffect(() => {
    setSrc(primary);
  }, [primary, release?.version]);

  const handleError = () => {
    if (src !== logo) {
      setSrc(logo);
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
