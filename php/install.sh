# install Composer if it's not already installed
command -v composer >/dev/null 2>&1 || { echo >&2 "INSTALLING COMPOSER:"; curl -sS https://getcomposer.org/installer | php; }

# install Composer dependencies
composer install

# see if YAML is in the list of PECL packages
yaml_installed=$(pecl list | grep yaml)

# install YAML via PECL if not already installed
if [ "$yaml_installed" != "" ]
then
  echo $yaml_installed
else
  echo "INSTALLING YAML"
  echo $(printf "\n" | pecl install yaml)
fi

