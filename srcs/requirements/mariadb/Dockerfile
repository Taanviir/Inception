# MariaDB Dockerfile

FROM alpine:3.18

# Updating packages and installing MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

COPY tools/mariadb-wordpress.cnf /etc/my.cnf.d

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

WORKDIR /var/lib/mysql
COPY tools/init.sql .
COPY tools/create_db.sh .
RUN chmod +x create_db.sh && sh ./create_db.sh && rm create_db.sh

# Expose port 3306
EXPOSE 3306

USER mysql
CMD ["mysqld"]
