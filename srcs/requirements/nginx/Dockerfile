# NGINX Dockerfile

FROM alpine:3.18

# Updating packages and installing NGINX and openssl
RUN apk --update add --no-cache nginx openssl

# Expose port 443
EXPOSE 443

# making dir to store html and ssl files
RUN mkdir -p /var/www/html/wordpress /etc/nginx/ssl

# Requesting for a self signed certificate, valid for 1 year, in the ssl dir.
RUN openssl req -x509 -newkey rsa:2048 -sha256 -days 365 -nodes \
    -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt \
    -subj "/C=US/ST=None/L=Abu Dhabi/O=Certified Gamers/CN=tanas.42.fr"

# Copy NGINX config file
COPY conf/wordpress.conf /etc/nginx/http.d

# Run NGINX in the foreground to prevent Docker from exiting
CMD ["nginx", "-g", "daemon off;"]
