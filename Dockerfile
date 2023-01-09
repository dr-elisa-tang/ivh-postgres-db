FROM postgres

ENV POSTGRES_PASSWORD innovet

COPY db\.local\.construction/build_database.sql /docker-entrypoint-initdb.d/
COPY db\.local\.construction/populate_tables.sql /docker-entrypoint-initdb.d/