# Images
## Images and Tags
1. Create the Dockerfile
2. Build a Docker image from a Dockerfile
```bash
docker build .
```
3. Build a Docker image from a Dockerfile with a tag
```bash
docker build -t nginx:1.0 .
```

## Retag Images
```bash
osboxes@osboxes:~/Documents$ docker tag nginx:1.0 nginx:latest
```

## List Images
```bash
osboxes@osboxes:~/Documents$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
nginx        1.0       2da628f58fe9   30 minutes ago   187MB
nginx        latest    2da628f58fe9   30 minutes ago   187MB
ubuntu       20.04     6013ae1a63c2   8 weeks ago      72.8MB
```