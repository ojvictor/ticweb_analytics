FROM postgres:9.6.24-alpine
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD ticweb123
ENV POSTGRES_DB ticweb
ADD ./schema/a11y.sql /docker-entrypoint-initdb.d/
