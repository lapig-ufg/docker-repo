# GIT-HUB of project

https://github.com/docker-library/postgres

# Docker Hub POSTGRESQL

https://hub.docker.com/_/postgres

# Steps

1- Create network LAPIG

  docker network create \
    --driver=bridge \
    --subnet=172.18.0.0/16 \
    --ip-range=172.18.0.0/24 \
    --gateway=172.18.0.254 \
    rede_lapig

2- Define local for save data

- /data/storage/postgres >> /APP/postgresql/data
- LOCAL FILES		>>  CONTAINER FILES

3- Change docker-compose.yml file to your preferences

POSTGRES_PASSWORD: "Postgres2018!"
PGDATA: "/APP/postgresql/data"

4- Build the image according to your needs

DOCKER_BUILDKIT=1 docker build -t $IMAGE_NAME --no-cache .


5- Modify the docker-compose.yml file to your liking and start the container

docker-compose up -d

