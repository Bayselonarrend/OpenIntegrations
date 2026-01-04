const fs = require('fs');
const path = require('path');

module.exports = function apiIconsPlugin() {
  return {
    name: 'api-icons-plugin',
    async contentLoaded({ actions }) {
      const { setGlobalData } = actions;
      
      const iconsDir = path.join(__dirname, '../static/img/APIs');
      
      try {
        const files = fs.readdirSync(iconsDir);
        const iconList = files
          .filter(file => 
            file.endsWith('.png') && 
            file !== 'default.png' &&
            fs.statSync(path.join(iconsDir, file)).isFile()
          )
          .map(file => `/img/APIs/${file}`);
        
        setGlobalData({ iconList });
      } catch (error) {
        console.error('Error reading API icons:', error);
        setGlobalData({ iconList: [] });
      }
    },
  };
};
