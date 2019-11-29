CREATE USER 'root'@'%' IDENTIFIED BY 'root';

CREATE DATABASE skeleton_db_local CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON skeleton_db_local.* TO 'root'@'%';

FLUSH PRIVILEGES;