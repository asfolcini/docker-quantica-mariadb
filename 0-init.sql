CREATE DATABASE IF NOT EXISTS db-quantica-core;
GRANT ALL PRIVILEGES ON db-quantica-core.* TO 'quantica_usr'@'%' IDENTIFIED BY 'quantica_psw';
FLUSH PRIVILEGES;
