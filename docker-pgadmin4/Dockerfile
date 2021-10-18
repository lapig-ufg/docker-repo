FROM dpage/pgadmin4

MAINTAINER Renato Gomes renatogomessilverio@gmail.com
LABEL description="A custom PGADMIN4 LTS container"

COPY ./env /pgadmin4

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
