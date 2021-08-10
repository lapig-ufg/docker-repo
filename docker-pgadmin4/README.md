# Container Deployment DOCS

https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html

# GIT-HUB of project

https://github.com/postgres/pgadmin4

# Docker Hub PGADMIN4

https://hub.docker.com/r/dpage/pgadmin4

# Steps

1- Create network LAPIG

  docker network create \
    --driver=bridge \
    --subnet=172.18.0.0/16 \
    --ip-range=172.18.0.0/24 \
    --gateway=172.18.0.254 \
    rede_lapig

2- Define local for save data

- /data/storage >> /var/lib/pgadmin


3- Change env file to your preferences

PGADMIN_DEFAULT_EMAIL=
PGADMIN_DEFAULT_PASSWORD=
PGADMIN_LISTEN_ADDRESS=
PGADMIN_LISTEN_PORT=

4- Build the image according to your needs

DOCKER_BUILDKIT=1 docker build -t $IMAGE_NAME --no-cache .


5- Modify the docker-compose.yml file to your liking and start the container

docker-compose up -d

