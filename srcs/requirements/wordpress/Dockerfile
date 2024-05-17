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
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php81/php-fpm.d/www.conf

# Expose port 9000
EXPOSE 9000

# making dir to store html files
RUN mkdir -p /var/www/html
COPY tools/run.sh /var/www/html

WORKDIR /var/www/html

CMD ["./run.sh"]
