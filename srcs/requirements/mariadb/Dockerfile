# MariaDB Dockerfile

FROM alpine:3.18

# Updating packages and installing MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

# RUN mkdir /var/run/mysqld

WORKDIR /var/lib/mysql
COPY tools/create_db.sh .
RUN chmod +x create_db.sh

# init.sql?

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Expose port 3306
EXPOSE 3306

CMD ["./create_db.sh"]
