# Alchemy Docker
Resources for building for Docker images of portable Alchemy Engine trading environments.

## Usage (Docker Protips)
Build a docker image with name IMAGE from the Dockerfile in the current directory:
```
docker build -t IMAGE .
```

Start a docker container with name NAME based on image IMAGE:
```
docker run --name NAME -i -t IMAGE
```

Remove all containers that are not currently running:
```
docker rm $(docker ps -a -q)
```
