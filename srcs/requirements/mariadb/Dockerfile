# MariaDB Dockerfile

FROM alpine:3.18

# Updating packages and installing MariaDB
RUN apk --update add --no-cache mariadb

# Expose port 3306
EXPOSE 3306

# copying required files into respective directories
COPY tools/run.sh /var/lib/mysql

# set current working dir to /var/lib/mysql
WORKDIR /var/lib/mysql
RUN chmod +x run.sh

CMD ["./run.sh"]
