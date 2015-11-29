# IB TWS Docker
Build Docker images of Interactive Brokers TWS instances, accessible through VNC.
The API is exposed on port 4001. Ideal for algorithmic trading on IB!

## Usage
1. Set your username and password in `docker-compose.yml`
2. `docker-compose build`
3. `docker-compose up`

## Viewing via VNC
The VNC server is accessible through port 5900. If you're using docker-machine
(if you're on Windows or OSX), the IP address of the server will be the IP
address of your docker VM. You can discover this IP address with the command:

```
docker-machine ip default
```

You'll need to use an application such as [Chicken of the VNC](http://sourceforge.net/projects/cotvnc/)
for connecting to the VNC server.
