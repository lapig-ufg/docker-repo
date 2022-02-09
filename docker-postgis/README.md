Essa imagem garante que o banco de dados padrão criada pela `postgres` image oficial [aqui](https://registry.hub.docker.com/_/postgres/).

 imagem master terá as seguintes extensões instaladas:

* `postgis`
* `postgis_topology`
* `postgis_tiger_geocoder`

Nota: A partir do PostGIS v3.x, o raster foi fatorado em uma extensão separada postgis_rasterque deve ser instalada separadamente.

A menos que use -e POSTGRES_DB ele seja passado para o contêiner no momento da inicialização, esse banco de dados será nomeado após o usuário admin ( postgresou o usuário especificado com -e POSTGRES_USER). Se você preferir usar o mecanismo de banco de dados de modelo mais antigo para habilitar o PostGIS, a imagem também fornece um banco de dados de modelo habilitado para PostGIS chamado template_postgis.

## Construir Imagem:

    time DOCKER_BUILDKIT=1 docker build -t postgis/postgis --no-cache . 

## Uso

Criar um .env definindo sua password do banco de dados postgres:

    cp .env-example .env
    defina no seu arquivo sua senha: `PG_PASSWORD=password`

Para executar um contêiner básico capaz de servir um banco de dados habilitado para PostGIS, inicie um contêiner da seguinte forma:

    docker-compose up -d

Para obter instruções mais detalhadas sobre como iniciar e controlar seu contêiner Postgres, consulte a documentação da postgresimagem aqui `postgres` image [aqui](https://registry.hub.docker.com/_/postgres/).

Depois de iniciar um contêiner de banco de dados, você pode se conectar ao banco de dados diretamente no contêiner em execução:

    docker exec -ti some-postgis psql -U postgres
    
... ou iniciando um novo container para rodar como cliente. Nesse caso, você pode usar uma rede definida pelo usuário para vincular os dois contêineres:

    docker network create some-network
    
    # Server container
    docker run --name some-postgis --network some-network -e POSTGRES_PASSWORD=mysecretpassword -d postgis/postgis
    
    # Client container
    docker run -it --rm --network some-network postgis/postgis psql -h some-postgis -U postgres
    
Verifique a documentação sobre a [`postgres` image](https://registry.hub.docker.com/_/postgres/) and [Docker networking](https://docs.docker.com/network/) imagem e a rede do Docker para obter mais detalhes e alternativas sobre como conectar diferentes contêineres.

Consulte a documentação do [PostGIS ](http://postgis.net/docs/postgis_installation.html#create_new_db_extensions) para obter mais detalhes sobre suas opções para criar e usar um banco de dados habilitado para o espaço.