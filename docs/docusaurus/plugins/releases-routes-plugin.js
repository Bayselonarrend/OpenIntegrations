const fs = require('fs');
const path = require('path');

module.exports = function releasesRoutesPlugin() {
  return {
    name: 'releases-routes-plugin',
    async contentLoaded({ actions }) {
      const archivePath = path.join(__dirname, '../archive/releases-archive.json');

      if (!fs.existsSync(archivePath)) {
        console.warn('[releases-routes-plugin] releases-archive.json not found, skipping version routes');
        return;
      }

      const archive = JSON.parse(fs.readFileSync(archivePath, 'utf8'));
      const versions = archive.versions ?? [];

      versions.forEach((release) => {
        actions.addRoute({
          path: `/releases/${release.version}`,
          component: '@site/src/components/releases/ReleaseDetail.js',
          exact: true,
        });
      });
    },
  };
};
