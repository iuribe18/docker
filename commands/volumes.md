# Bind Mounds
**Bind mounts**
When you use a bind mount, a file or directory on the host machine is mounted from the host into a container. By contrast, when you use a volume, a new directory is created within Docker's storage directory on the host machine, and Docker manages that directory's contents.
NOTE: used in development environments

In general, **--mount** is preferred. The main difference is that the --mount flag is more explicit and supports all the available options.

If you use **--volume** to bind-mount a file or directory that does not yet exist on the Docker host, Docker automatically creates the directory on the host for you. It's always created as a directory.

**--mount** does not automatically create a directory if the specified mount path does not exist on the host. Instead, it produces an error

**Options for --mount**
The --mount flag consists of multiple key-value pairs, separated by commas and each consisting of a <key>=<value> tuple. The order of the keys isn't significant.

| Option                     | Description                                                                                 |
| :------------------------- | :------------------------------------------------------------------------------------------ |
| `source, src`              | The location of the file or directory on the host. This can be an absolute or relative path |
| `destination, dst, target` | The path where the file or directory is mounted in the container. Must be an absolute path  |
| `readonly, ro`             | If present, causes the bind mount to be mounted into the container as read-only             |
| `bind-propagation`         | If present, changes the bind propagation                                                    |

## Sintax
To create a bind mount, you can use either the **--mount** or **--volume** flag
```bash
docker run --mount type=bind,src=<host-path>,dst=<container-path>
docker run --volume <host-path>:<container-path>
```

### Create a Container with a BindMount
```bash
osboxes@osboxes:~/Documents$ ls app/
index.php
osboxes@osboxes:~/Documents$ docker create --name devtest --mount type=bind,source="$(pwd)"/app,target=/app nginx
91d36435861d15d38bc333bf939b222ee3c8ad2ab62c00fb10fbb944f46fc6f0
osboxes@osboxes:~/Documents$ docker start devtest
devtest
osboxes@osboxes:~/Documents$ docker exec -it devtest bash
root@d34a3c1c2b49:/# ls
app  bin  boot  dev  docker-entrypoint.d  docker-entrypoint.sh  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@d34a3c1c2b49:/# ls app/
index.php
root@d34a3c1c2b49:/# cat app/index.php
<? php
echo "Hello world from PHP Docker";
?>
```
### Use docker inspect devtest to verify that the bind mount was created correctly. Look for the Mounts section
```bash
osboxes@osboxes:~/Documents$ docker inspect devtest
"Mounts": [
    {
        "Type": "bind",
        "Source": "/home/osboxes/Documents/app",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```


# Volumes
Volumes are persistent data stores for containers, created and managed by Docker. You can create a volume explicitly using the docker volume create command, or Docker can create a volume during container or service creation.

When you create a volume, it's stored within a directory on the Docker host. When you mount the volume into a container, this directory is what's mounted into the container. This is similar to the way that bind mounts work, except that volumes are managed by Docker and are isolated from the core functionality of the host machine.

### A volume's lifecycle
A volume's contents exist outside the lifecycle of a given container. When a container is destroyed, the writable layer is destroyed with it. Using a volume ensures that the data is persisted even if the container using it is removed.

A given volume can be mounted into multiple containers simultaneously. When no running container is using a volume, the volume is still available to Docker and isn't removed automatically. You can remove unused volumes using ``` docker volume prune ```

## Manage volumes
```bash
osboxes@osboxes:~/Documents$ docker volume
Usage:  docker volume COMMAND
Manage volumes
Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove unused local volumes
  rm          Remove one or more volumes
Run 'docker volume COMMAND --help' for more information on a command
```

## Create, list and inspect Docker Volumes
```bash
osboxes@osboxes:~/Documents$ docker volume create nginx
nginx
osboxes@osboxes:~/Documents$ docker volume ls
DRIVER    VOLUME NAME
local     nginx
osboxes@osboxes:~/Documents$ docker volume inspect nginx
[
    {
        "CreatedAt": "2024-12-14T12:14:39-05:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/nginx/_data",
        "Name": "nginx",
        "Options": null,
        "Scope": "local"
    }
]
```

## Mountpoint
```bash
root@osboxes:/var/lib/docker/volumes# pwd
/var/lib/docker/volumes
root@osboxes:/var/lib/docker/volumes# ls
backingFsBlockDev  metadata.db  nginx
```

### Create a Container with a volume
```bash
osboxes@osboxes:~/Documents$ docker create --name web01 --mount source=nginx,target=/app nginx
36d6590d842d1109fc4054c4071c0b16926424433ec6c2572b9d0c81ee8150e3
osboxes@osboxes:~/Documents$ docker create --name web02 -v nginx:/app nginx
b86a71a35a9154c66b1f990587b54b42408997412bfbb8327ecb1dd9eb35e73f
```
## Share info between Containers
```bash
osboxes@osboxes:~/Documents$ docker exec -it web01 bash
root@36d6590d842d:/# cd app/
root@36d6590d842d:/app# touch web01

osboxes@osboxes:~/Documents$ docker exec -it web02 bash
root@b86a71a35a91:/# ls app/
web01
root@b86a71a35a91:/# cd app/
root@b86a71a35a91:/app# ls
web01
root@b86a71a35a91:/app# touch web02

root@osboxes:/home/osboxes# ls /var/lib/docker/volumes/nginx/_data
web01  web02
```
