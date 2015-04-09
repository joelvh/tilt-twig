<?php
// REQUIRES: Composer, libyaml, PEAR/PECL
// Install Composer
exec('composer install') . "\n";
// Install YAML dependencies
// TODO: Check to see if this is needed first.....
exec('brew install libyaml --universal');
// Install YAML and simulate "enter" for auto-dependency prompt
exec('printf "\n" | pecl install yaml');
?>
