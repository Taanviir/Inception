# Wordpress Dockerfile

FROM alpine:3.18

# Updating packages and installing PHP, PHP-Phar, PHP-FPM, PHP-MySQLI
RUN apk update && apk add --no-cache php php-phar php-fpm php-mysqli

# Expose port 9000
EXPOSE 9000

# making dir to store html files
RUN mkdir -p /var/www/html

COPY conf/www.conf /etc/php81/php-fpm.d
COPY tools/run.sh  /var/www/html

WORKDIR /var/www/html

CMD ["./run.sh"]
