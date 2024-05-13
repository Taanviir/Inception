#!/bin/sh

echo "[info] Starting MySQL initialization"

MYSQLD_DIR=/var/run/mysqld
MYSQL_DIR=/var/lib/mysql

if [ ! -d $MYSQLD_DIR ]; then
    echo "[info] $MYSQLD_DIR not found, creating now"
    mkdir -p $MYSQLD_DIR
fi

if [ ! -d $MYSQL_DIR ]; then
    echo "[info] $MYSQL_DIR not found, creating now"
    mkdir -p $MYSQL_DIR
fi

# changing ownership of directories to mysql user and group
chown mysql:mysql $MYSQLD_DIR $MYSQL_DIR
echo "[info] Ownership of /var/lib/mysql and /var/run/mysqld changed to mysql user and group"

# checking for data dir and then initializing mysql tables if not found
if [ ! -d $MYSQL_DIR/mysql ]; then
    echo "[info] MySQL data directory not found, creating new one and initializing system tables"
    if mysql_install_db --user=mysql --datadir=$MYSQL_DIR > /dev/null ; then
        echo "[info] MySQL data directory initialization was a success"
    else
        echo "[error] MySQL data directory initialization failed"
        return 1
    fi
fi

SQL_FILE=init.sql
echo "[info] Reading SQL information from $SQL_FILE"

MYSQL_OPTIONS="--user=mysql --skip-name-resolve --skip-networking=0 --bind-address=0.0.0.0"

# Run the SQL daemon to create the database and user and run the daemon in bootstrap mode to init tables
mysqld $MYSQL_OPTIONS --verbose=0 --bootstrap < $SQL_FILE
echo "[info] MySQLD databases are now initialized"

# Run the SQL server in the foreground
echo "[info] MySQL server is now running..."
mysqld $MYSQL_OPTIONS --console < $SQL_FILE
