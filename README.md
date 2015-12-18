## Install

    composer install

    drush site-install config_installer -y --keep-config \
      config_installer_staging_configure_form.sync_directory=../config/sync \
      --db-url=mysql://dbuser:dbpw@localhost:dbport/dbname


## Testing

### Requirements

    **Selenium**
    http://www.seleniumhq.org/

### Execution

    export WD_HOST=http://localhost:4444/wd/hub
    export BASE_URL=http://dbcd16.dt/
    export DRUPAL_ROOT=`pwd`/web
    export BEHAT_PARAMS='{"extensions": {"Behat\\MinkExtension": {"selenium2": {"wd_host": "'${WD_HOST}'"}, "base_url": "'${BASE_URL}'"}, "Drupal\\DrupalExtension": {"drupal": {"drupal_root": "'${DRUPAL_ROOT}'"} } } }'

    bin/behat
