# Wordpress Dockerfile

FROM alpine:3.18

# Updating packages and installing PHP-FPM
RUN apk update && apk add --no-cache php-fpm

# Expose port 9000
EXPOSE 9000

# making dir to store html files
RUN mkdir -p /var/www/html


COPY conf/www.conf /etc/php81/php-fpm.d

CMD ["php-fpm81", "-F"]
