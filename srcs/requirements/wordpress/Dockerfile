# Wordpress Dockerfile
# resource: https://make.wordpress.org/hosting/handbook/server-environment/

FROM alpine:3.18

# Updating packages and installing PHP and PHP extensions
RUN apk --update add --no-cache php \
                                php-fpm \
                                php-phar \
                                php-mysqli \
                                php-curl \
                                php-dom \
                                php-exif \
                                php-gd \
                                php-iconv \
                                php-json \
                                php-fileinfo \
                                php-mbstring \
                                php-openssl \
                                php-xml \
                                php-zip

# Editing conf file for PHP
RUN adduser -S www-data -G www-data && \
    sed -i "s|user = nobody|user = www-data|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|group = nobody|group = www-data|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = www-data|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = www-data|listen.group = www-data|g" /etc/php81/php-fpm.d/www.conf

# Expose port 9000
EXPOSE 9000

# making dir to store html files
RUN mkdir -p /var/www/html/wordpress
COPY tools/run.sh /var/www/html/wordpress

WORKDIR /var/www/html/wordpress

CMD ["./run.sh"]
