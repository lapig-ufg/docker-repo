# lapig MinIO

### Building the image


### Local build using repository checkout

To build yourself with a local checkout using the docker-compose.build.yaml:

1. Clone the GitHub repository:

   ```shell
   git clone https://github.com/lapig-ufg/docker-repo.git
   ```

   ```shell
   cd  docker-MinIO
   ```
2. Edit the [.env](https://github.com/lapig-ufg/docker-repo/blob/main/docker-MinIO/.env-example) to change the build arguments:
  ```
cp .env-example .env
 ```
   ```
MINIO_ROOT_USER=admin 
MINIO_ROOT_PASSWORD=password123
   ```

3. Build the container and spin up the services
   ```shell
   docker-compouse up -d
   ```
