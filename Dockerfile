FROM postgres

ENV POSTGRES_PASSWORD innovet

COPY postgres/build\.db/build_database.sql /docker-entrypoint-initdb.d/
COPY postgres/build\.db/populate_tables.sql /docker-entrypoint-initdb.d/
COPY postgres/data\.access/create_appraisal_methods.sql /docker-entrypoint-initdb.d/