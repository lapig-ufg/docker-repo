FROM debian:bullseye-slim

LABEL maintainer="Renato Gomes <renatogomessilverio@gmail.com>"

WORKDIR /opt/minio

HEALTHCHECK --interval=5s --timeout=3s CMD nc -vz -w 2 localhost 9000 || exit 1

ARG MINIO_ROOT_USER=admin 
ARG MINIO_ROOT_PASSWORD=password
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install wget net-tools procps curl netcat && \
wget https://dl.min.io/server/minio/release/linux-amd64/minio && \
chmod +x /opt/minio/minio && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash", "-c", "/opt/minio/minio server /mnt/data --console-address ':9001'; tail -f /dev/null"]
