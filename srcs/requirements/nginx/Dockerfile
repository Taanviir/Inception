# NGINX Dockerfile

# Using penultimate stable Alpine version as base image
FROM alpine:3.18

# Updating packages and installing NGINX
RUN apk update && apk add nginx

# Copy NGINX config file
COPY conf/nginx.conf /etc/nginx/.

# Expose port 443
EXPOSE 443

# Run NGINX in the foreground to prevent Docker from exiting
CMD ["nginx", "-g", "daemon off;"]
