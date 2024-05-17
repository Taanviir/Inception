#!/bin/sh

## Wordpress Setup
echo "[info] Setting up Wordpress"

echo "[info] installing wp-cli"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

if ! wp core is-installed 2>/dev/null; then
    echo "[info] wp is not installed, downloading wordpress files"
    wp core download --allow-root
else
    echo "[info] wp is already installed"
fi

echo "[info] creating wordpress config file"
wp config create --allow-root \
                 --dbname=$MARIADB_DATABASE \
                 --dbuser=$WP_DB_USER \
                 --dbpass=$WP_DB_PASSWORD \
                 --dbhost=$WP_DB_HOST

php-fpm81 -F
