# Delete Images
## List Images
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

# Delete Containers
## All containers
```bash
osboxes@osboxes:~$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED        STATUS                    PORTS     NAMES
b86a71a35a91   nginx       "/docker-entrypoint.…"   46 hours ago   Exited (0) 45 hours ago             web02
36d6590d842d   nginx       "/docker-entrypoint.…"   46 hours ago   Exited (0) 45 hours ago             web01
d34a3c1c2b49   nginx       "/docker-entrypoint.…"   47 hours ago   Exited (0) 45 hours ago             devtest
d065fcdf8feb   nginx:2.0   "nginx -g 'daemon of…"   4 days ago     Exited (0) 45 hours ago             nginx
osboxes@osboxes:~$ docker rm $(docker ps -aq)
b86a71a35a91
36d6590d842d
d34a3c1c2b49
d065fcdf8feb
osboxes@osboxes:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## Delete containers
One by one (by CONTAINER ID, $ docker rm CONTAINER ID)
```bash
osboxes@osboxes:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS    PORTS     NAMES
28b6c94dda8e   nginx     "/docker-entrypoint.…"   2 minutes ago   Created             web01
osboxes@osboxes:~$ docker rm 28b6c94dda8e
28b6c94dda8e
osboxes@osboxes:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```