-- remove any empty users
DELETE FROM mysql.user WHERE user='';

-- remove the test database
DROP DATABASE IF EXISTS test;

-- remove any entry related to test in db table
DELETE FROM mysql.db WHERE db='test';

-- restrict remote access to root
DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');

-- changing the root password
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';

-- make new database with env variable as name
CREATE DATABASE IF NOT EXISTS '${MARIADB_DATABASE}';

-- make new user with specific name and grant access from any host identified by set password
CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED by '${WP_DB_PASSWORD}';

-- grants all privileges on wordpress database to the user on any host
GRANT ALL PRIVILEGES ON '${MARIADB_DATABASE}'.* TO '${WP_DB_USER}'@'%';
FLUSH PRIVILEGES;
