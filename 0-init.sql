CREATE DATABASE IF NOT EXISTS `db-quantica-core` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

CREATE USER IF NOT EXISTS 'quantica_usr'@'%';
ALTER USER 'quantica_usr'@'%' IDENTIFIED BY 'quantica_psw' ;

GRANT ALL ON `db-quantica-core`.* TO 'quantica_usr'@'%';

FLUSH PRIVILEGES;

USE `db-quantica-core`;