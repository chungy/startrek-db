FROM postgres:13-alpine

COPY docker-load-db.sh /docker-entrypoint-initdb.d/
COPY schema.sql /dumps/
COPY data.sql /dumps/
