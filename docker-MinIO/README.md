# LAPIG MinIO
![alt text]([http://url/to/img.png](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgbLzy_Dc44a7a1TIMPy5tOe3RNHQpmzpGPWDm9NaxuvTgDPDdBCPfoTWAiv4iZPYPJiU&usqp=CAU))

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
2. Edit the [.env](https://github.com/lapig-ufg/docker-repo/blob/main/docker-MinIO/.env-example) to set user and password:
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
