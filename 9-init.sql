
CREATE USER IF NOT EXISTS 'quantica_usr'@'%';
ALTER USER 'quantica_usr'@'%' IDENTIFIED BY 'quantica_psw' ;

GRANT ALL ON `db-quantica-core`.* TO 'quantica_usr'@'%';

FLUSH PRIVILEGES;