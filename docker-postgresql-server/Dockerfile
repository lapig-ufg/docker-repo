FROM postgres:11

MAINTAINER Renato Gomes renatogomessilverio@gmail.com
LABEL description="A custom POSTGRESQL-SERVER 11 LTS container"

SHELL ["/bin/bash", "-c"]

RUN set -eux; \
apt-get update; \ 
apt-get -y install htop net-tools curl vim procps screen; \
rm -rf /var/lib/apt/lists/*; 

COPY ./postgres_bin/postgresql.conf /var/lib/postgresql/

COPY ./postgres_bin/pg_hba.conf /var/lib/postgresql/

RUN set -eux; \
chmod 700 /var/lib/postgresql/pg_hba.conf; \
chmod 700 /var/lib/postgresql/postgresql.conf;\
chown -R postgres:postgres /var/lib/postgresql/pg_hba.conf; \
chown -R postgres:postgres /var/lib/postgresql/postgresql.conf

COPY docker-entrypoint.sh /usr/local/bin/

