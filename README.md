# IB TWS Docker
Build Docker images of (headless) Interactive Brokers TWS instances.
The API is exposed on port 4001. Ideal for algorithmic trading on IB!

This project assumes you've installed [boot2docker](http://boot2docker.io/)
and/or have experience working with [Docker](http://docker.io).

## Usage
1. Set your IB credentials in tws_credentials.txt.

2. Build the image with the `docker build` command (see below for examples).
The build process will automatically append your TWS credentials to the
IBController.ini file.

3. Run a docker container with the image you just created. When you run
the container, IBController will automatically launch TWS, directing GUI output
to a virtual framebuffer (headless!) and connecting to IB with your credentials.

If you attach to this docker container, you will see (after approximately 20
seconds) that the API is available on port 4001 for you to submit commands.
The message giving you the green light looks like so:

```
22:05:48:797 JTS-SocketListener-60: API server sarting to listening on port 4001
```

## Docker Protips
Build a docker image with name IMAGE from the Dockerfile in the current directory:
```
docker build -t IMAGE .
```

Start a docker container with name NAME based on image IMAGE:
```
docker run --p 4001:4001 --name NAME -i -t IMAGE
```

Remove all containers that are not currently running:
```
docker rm $(docker ps -a -q)
```

## Advanced
If you've been using TWS in the past and you have your own configuration,
replace `tws.xml` in this project with the `tws.xml` file on your trading
machine prior to building the image. This way, your settings (API port, etc.)
should persist in the Dockerized, headless TWS instance.
