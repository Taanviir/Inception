#!/bin/sh

## Wordpress Setup
echo "[info] Setting up Wordpress"

echo "[info] installing wp-cli"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

if ! wp core is-installed; then
    echo "[info] wp is not installed, downloading wordpress files"
    wp core download --allow-root
else
    echo "[info] wp is already installed"
fi


php-fpm81 -F
