module.exports = {
  browserSync: {
    hostname: "drupal-business-community.local",
    port: 8080,
    openAutomatically: false,
    reloadDelay: 50
  },

  drush: {
    enabled: false,
    alias: 'drush @SITE-ALIAS cache-rebuild'
  },

  twig: {
    useCache: false
  }
};
