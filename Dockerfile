FROM mariadb/server:latest

LABEL maintainer="a.sfolcini@gmail.com"

ENV MARIADB_ROOT_PASSWORD quantica_psw

COPY *.sql /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

VOLUME ["/var/lib/mysql","/var/log/mysql/"]

EXPOSE 3306

CMD ["mysqld"]




