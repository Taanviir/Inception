# NGINX Dockerfile

FROM alpine:3.18

# Updating packages and installing NGINX and openssl
RUN apk update && apk add --no-cache nginx openssl

# Making ssl directory. Requesting for a self signed certificate, valid for 1 year, in the ssl dir.
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:2048 -sha256 -days 365 -nodes \
    -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt \
    -subj "/C=US/ST=None/L=Abu Dhabi/O=Certified Gamers/CN=tanas.42.fr"

# Dir for holding html content
RUN mkdir /etc/nginx/html
COPY html/ /etc/nginx/html

# Copy NGINX config file
COPY conf/wordpress.conf /etc/nginx/http.d

# Expose port 443
EXPOSE 443

# Run NGINX in the foreground to prevent Docker from exiting
CMD ["nginx", "-g", "daemon off;"]
