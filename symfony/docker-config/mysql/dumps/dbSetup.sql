CREATE USER 'db_user'@'%' IDENTIFIED BY 'db_user';

CREATE DATABASE skeleton_db_local CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON skeleton_db_local.* TO 'db_user'@'%';

FLUSH PRIVILEGES;