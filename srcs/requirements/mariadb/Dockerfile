# MariaDB Dockerfile

FROM alpine:3.18

# Updating packages and installing MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

# Expose port 3306
EXPOSE 3306

# copying required files into respective directories
COPY tools/run.sh /var/lib/mysql

# set current working dir to /var/lib/mysql
WORKDIR /var/lib/mysql

CMD ["./run.sh"]
