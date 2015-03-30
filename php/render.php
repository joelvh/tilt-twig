<?php
// REQUIRES: Composer, libyaml, PEAR/PECL

// Reference Composer auto-loader
include_once realpath(dirname(__FILE__)) . '/vendor/autoload.php';

$templates_dir_path     = $argv[1];
$template_file_path     = $argv[2];
$context_yaml_file_path = $argv[3];

$context_data = yaml_parse_file($context_yaml_file_path);

Twig_Autoloader::register();

$loader = new Twig_Loader_Filesystem($templates_dir_path);
$twig   = new Twig_Environment($loader);

echo $twig->render($template_file_path, $context_data);
