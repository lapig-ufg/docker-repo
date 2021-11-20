# GIT-HUB of project

https://github.com/geonetwork/core-geonetwork

# Docker Hub GeonetWork

https://hub.docker.com/_/geonetwork
# Steps

## 1- Create network LAPIG

  docker network create \
    --driver=bridge \
    --subnet=172.18.0.0/16 \
    --ip-range=172.18.0.0/24 \
    --gateway=172.18.0.254 \
    rede_lapig

## 2- Define local for save data

*  /home/user/GeonetWork/data >> /var/lib/geonetwork_data
*  LOCAL FILES		>>  CONTAINER FILES

## 3- Build the image according to your needs

DOCKER_BUILDKIT=1 docker build -t $IMAGE_NAME --no-cache .

## 4- Change docker-compose.yml file to your preferences


## These are some environments variables that can be set to configure the database connection:

* POSTGRES_DB_HOST: database host name.
* POSTGRES_DB_PORT: port where database server is listening (by default 5432).
* POSTGRES_DB_NAME: name of the database. If it doesn't exist the container will try to create it.
* POSTGRES_DB_USERNAME: username.
* POSTGRES_DB_PASSWORD: password.

## To your local directory mapped inside the geonetwork container

* /home/user/GeonetWork/APP:/var/lib/geonetwork_data  

## For the name of your image created with docker build

* image: geonetwork:3.10.8    

## 5- Modify the docker-compose.yml file to your liking and start the container

 * `` docker-compose up -d ``

## Optional - Use nginx in front of tomcat to access GeonetWork

* 1- Enter nginx folder

* 2- Build the image docker build -t nginx-geonetwork .

* 3- Modify docker-compose.yml environment variables referring to your settings

* 4- Run docker-compose.yml ``docker-compose up -d ``

* 5- Access in browser: `` http://localhost/geonetwork ``
