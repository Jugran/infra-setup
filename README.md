## Simple Infra Setup

This is a simple webserver + db docker setup, using 3 node.js services, postgres and nginx.
There are 2 docker compose configs, one for local dev environment and one for production.

### Envrioment Variables
create .env file from .env.example.
>Note: For production setup docker secrets can be implemented as for increased security.
```bash
cp .env.example .env
```

### Local Development
Local developement uses bind mount to make the code changes reflected between host machine and docker container.
Individual service ports are also exposed to host machine.

#### Start Containers
```bash
docker-compose up
```

#### Stop Containers
Press `Ctrl + C` to stop the containers. Run `docker-compose down` to remove the containers.


### Production
Production envrioment includes dependencies in the docker image itself. And uses nginx as reverse proxy to route requests to respective services.
#### Start Containers (In detached mode)
```bash
docker-compose -f docker-compose.prod.yml up -d
```

#### View Logs
```bash
docker-compose -f docker-compose.prod.yml logs -f
```

#### Stop Containers

```bash
docker-compose -f docker-compose.prod.yml down
```