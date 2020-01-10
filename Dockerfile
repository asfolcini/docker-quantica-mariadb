FROM mariadb/server:latest

LABEL maintainer="a.sfolcini@gmail.com"

ENV MARIADB_ROOT_PASSWORD quantica_psw

COPY *.sql /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

VOLUME ["/var/lib/mysql","/var/log/mysql/"]

#ADD db-quantica-core.sql /tmp/
#RUN chmod 666 /tmp/db-quantica-core.sql
#RUN /usr/bin/mysql --user=root --password=$MARIADB_ROOT_PASSWORD < /tmp/db-quantica-core.sql

EXPOSE 3306

CMD ["mysqld"]




