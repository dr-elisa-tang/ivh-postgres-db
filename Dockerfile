FROM postgres

ENV POSTGRES_PASSWORD innovet

COPY scripts/build_database.sql /docker-entrypoint-initdb.d/
COPY scripts/populate_tables.sql /docker-entrypoint-initdb.d/