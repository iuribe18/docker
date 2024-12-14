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

## List Images
```bash
osboxes@osboxes:~/Documents$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
nginx        1.0       2da628f58fe9   22 minutes ago   187MB
ubuntu       20.04     6013ae1a63c2   8 weeks ago      72.8MB
```

```bash
osboxes@osboxes:~/Documents$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
nginx        1.0       2da628f58fe9   13 minutes ago   187MB
```

## Retag Images
```bash
osboxes@osboxes:~/Documents$ docker tag nginx:1.0 nginx:latest
```

```bash
osboxes@osboxes:~/Documents$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
nginx        1.0       2da628f58fe9   30 minutes ago   187MB
nginx        latest    2da628f58fe9   30 minutes ago   187MB
ubuntu       20.04     6013ae1a63c2   8 weeks ago      72.8MB
```

## Delete Images
One by one (by IMAGE ID, $ docker rm IMAGE ID)
```bash
osboxes@osboxes:~/Documents$ docker image rm 2da628f58fe9
Untagged: nginx:1.0
Deleted: sha256:2da628f58fe99af4b3a003a9bf1dab8cdd0db1bd7bf6d7fd38c6ac3a2ae6f013
```

One by one (by REPOSITORY, $ docker rm REPOSITORY)
```bash
osboxes@osboxes:~/Documents$ docker image rm nginx:1.0
Untagged: nginx:1.0
Deleted: sha256:2da628f58fe99af4b3a003a9bf1dab8cdd0db1bd7bf6d7fd38c6ac3a2ae6f013
```

All Images
```bash
osboxes@osboxes:~/Documents$ docker rmi $(docker images -q) --force
Untagged: nginx:1.0
Untagged: nginx:latest
Deleted: sha256:2da628f58fe99af4b3a003a9bf1dab8cdd0db1bd7bf6d7fd38c6ac3a2ae6f013
Untagged: ubuntu:20.04
Untagged: ubuntu@sha256:8e5c4f0285ecbb4ead070431d29b576a530d3166df73ec44affc1cd27555141b
Deleted: sha256:6013ae1a63c2ee58a8949f03c6366a3ef6a2f386a7db27d86de2de965e9f450b
```