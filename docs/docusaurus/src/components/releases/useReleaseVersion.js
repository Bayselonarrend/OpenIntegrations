import { useMemo } from 'react';
import { useLocation } from '@docusaurus/router';

export default function useReleaseVersion() {
  const location = useLocation();

  return useMemo(() => {
    const match = location.pathname.match(/\/releases\/([^/]+)\/?$/);
    return match ? decodeURIComponent(match[1]) : undefined;
  }, [location.pathname]);
}
