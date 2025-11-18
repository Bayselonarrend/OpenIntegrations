module.exports = function(context) {
  return {
    name: 'course-protection-plugin',
    injectHtmlTags() {
      return {
        headTags: [
          {
            tagName: 'meta',
            attributes: {
              name: 'robots',
              content: 'noindex, nofollow'
            },
          },
        ],
      };
    },
  };
};