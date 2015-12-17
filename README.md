## Install

    composer install

    drush site-install config_installer -y --keep-config \
      config_installer_staging_configure_form.sync_directory=../config/sync \
      --db-url=mysql://dbuser:dbpw@localhost:dbport/dbname \

## Test

    bin/behat