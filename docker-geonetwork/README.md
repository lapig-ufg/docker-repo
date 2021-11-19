# GIT-HUB of project

https://github.com/geonetwork/core-geonetwork

# Docker Hub GeonetWork

https://hub.docker.com/_/geonetwork
# Steps

1- Create network LAPIG

  docker network create \
    --driver=bridge \
    --subnet=172.18.0.0/16 \
    --ip-range=172.18.0.0/24 \
    --gateway=172.18.0.254 \
    rede_lapig

2- Define local for save data

- /home/user/GeonetWork/data >> /var/lib/geonetwork_data
- LOCAL FILES		>>  CONTAINER FILES

3- Build the image according to your needs

DOCKER_BUILDKIT=1 docker build -t $IMAGE_NAME --no-cache .

4- Change docker-compose.yml file to your preferences

POSTGRES_DB_PASSWORD: "Postgres2018!"

/home/user/GeonetWork/APP:/var/lib/geonetwork_data  #To your local directory mapped inside the geonetwork container

image: geonetwork:3.10.8    #For the name of your image created with docker build


5- Modify the docker-compose.yml file to your liking and start the container

docker-compose up -d
