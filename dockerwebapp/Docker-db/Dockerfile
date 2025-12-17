FROM mysql:8.0

ENV MYSQL_DATABASE=taskboard \
    MYSQL_USER=taskuser \
    MYSQL_PASSWORD=taskpass \
    MYSQL_ROOT_PASSWORD=rootpass

COPY db_backup.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
