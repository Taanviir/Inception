#!/bin/sh

echo "[info] installing wp-cli"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

echo "[info] downloading wordpress files"
wp core download --allow-root

php-fpm81 -F
