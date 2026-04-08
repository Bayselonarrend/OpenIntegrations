module.exports = function translationPathSyncPlugin() {
  return {
    name: 'translation-path-sync-plugin',
    getClientModules() {
      return [require.resolve('../src/clientModules/translationPathSync.js')];
    },
  };
};
