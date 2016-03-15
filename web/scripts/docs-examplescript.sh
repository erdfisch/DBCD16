#!/home/michael/.composer/vendor/bin/drush

use \Drupal\user\Entity\User;

//
// This example demonstrates how to write a drush
// "shebang" script.  These scripts start with the
// line "#!/usr/bin/env drush" or "#!/full/path/to/drush".
//
// See `drush topic docs-scripts` for more information.
//
drush_print("Hello world! xxx");
drush_print();
drush_print("The arguments to this command were:");

//
// If called with --everything, use drush_get_arguments
// to print the commandline arguments.  Note that this
// call will include 'php-script' (the drush command)
// and the path to this script.
//
if (drush_get_option('everything')) {
  drush_print("  " . implode("\n  ", drush_get_arguments()));
}
//
// If --everything is not included, then use
// drush_shift to pull off the arguments one at
// a time.  drush_shift only returns the user
// commandline arguments, and does not include
// the drush command or the path to this script.
//
else {
  while ($arg = drush_shift()) {
    drush_print('  ' . $arg);
  }
}

drush_print();

//
// We can check which site was bootstrapped via
// the '@self' alias, which is defined only if
// there is a bootstrapped site.
//
$self_record = drush_sitealias_get_record('@self');
if (empty($self_record)) {
  drush_print('No bootstrapped site.');
}
else {
  drush_print('The following site is bootstrapped:');
  _drush_sitealias_print_record($self_record);
}

drush_print(DRUPAL_ROOT);

$file = fopen(DRUPAL_ROOT . '/scripts/report-2016-03-15T1104.csv', 'r');

$firstline = TRUE;
while (($line = fgetcsv($file)) !== FALSE) {
  drush_print('heoo');
  if (!$firstline) {
    # print_r($line);
    $firstname = $line[2];
    $lastname = $line[3];
    $company = $line[19];
    drush_print($firstname);
    drush_print($lastname);
    drush_print($company);

    # try-catch to prevent duplicate usernames.
    try {
      $user = \Drupal\user\Entity\User::create();
      $password = \Drupal\Component\Utility\Random::string(32);
      $user->setPassword($password);
      $user->enforceIsNew();
      $user->setEmail($firstname . '.' . $lastname . '@example.org');
      $user->setUsername($firstname . ' ' . $lastname);
      $user->activate();
      $result = $user->save();
      drush_print_r($result);
    } catch (\Exception $e) {
    }
  }
  $firstline = FALSE;
}
fclose($file);

drush_print();

drush_print('goodbye');
