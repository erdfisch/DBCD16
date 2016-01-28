<?php

/**
 * @file
 * Drupal site-specific configuration file for child sites during testing.
 */

/**
 * The default.settings.php in this repository include default values for the
 * config directories. This breaks tests because Drupal the configuration
 * staging directory setting then points to a valid directory which makes
 * install_begin_request() consider the configuration and in turn settings.php
 * as verified, thus avoiding to rewrite it during installation. This leads to
 * a missing hash salt in the child site.
 */
$config_directories = [];

/**
 * The default.settings.php in this repository includes an override of the
 * 'bootstrap_config_storage' setting. This breaks tests because Drupal then
 * reads the configuration of the parent site and throws an error as the child
 * site that is about to be installed has seemingly already been installed.
 */
$settings['bootstrap_config_storage'] = NULL;
