import React, { useEffect, useState } from 'react';
import useBaseUrl from '@docusaurus/useBaseUrl';

function coverFileName(coverPath) {
  if (!coverPath) {
    return 'logo.png';
  }

  return coverPath.split('/').pop();
}

export default function CoverImage({ release, className, ...props }) {
  const logo = useBaseUrl('/img/logo.png');
  const local = useBaseUrl(`/img/releases/covers/${coverFileName(release?.cover)}`);
  const remote = release?.coverUrl;
  const [src, setSrc] = useState(remote || local);

  useEffect(() => {
    setSrc(remote || local);
  }, [local, remote, release?.version]);

  const handleError = () => {
    if (remote && src === remote) {
      setSrc(local);
      return;
    }

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
