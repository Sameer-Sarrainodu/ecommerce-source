FROM mysql:5.7

COPY db/01-schema.sql /docker-entrypoint-initdb.d/
COPY db/02-app-user.sql /docker-entrypoint-initdb.d/