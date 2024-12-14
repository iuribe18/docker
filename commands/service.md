# Docker Service
## Running containers
```bash
osboxes@osboxes:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## All containers
```bash
osboxes@osboxes:~$ docker ps -a
CONTAINER ID   IMAGE          COMMAND    CREATED      STATUS                  PORTS     NAMES
11e266692a65   d2c94e258dcb   "/hello"   2 days ago   Exited (0) 2 days ago             beautiful_hofstadter
```

## List Images
```bash
osboxes@osboxes:~/Documents$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
nginx        1.0       2da628f58fe9   22 minutes ago   187MB
ubuntu       20.04     6013ae1a63c2   8 weeks ago      72.8MB
```

## Inspect Images
```bash
osboxes@osboxes:~/Documents$ docker inspect nginx:1.0
[
    {
        "Id": "sha256:2da628f58fe99af4b3a003a9bf1dab8cdd0db1bd7bf6d7fd38c6ac3a2ae6f013",
        "RepoTags": [
            "nginx:1.0"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2024-12-09T16:57:16.72039038-05:00",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "nginx",
                "-g",
                "daemon off;"
            ],
            "ArgsEscaped": true,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "20.04"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 187022187,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/stcu3l1jkk82590343q7j76ms/diff:/var/lib/docker/overlay2/ke1c675i4dvafn2sxjunu9umy/diff:/var/lib/docker/overlay2/baaf5aaf51346355cce4164bb161b29f952e586af913bd8a6598d07d3e195b52/diff",
                "MergedDir": "/var/lib/docker/overlay2/if7g57w56b4q1esjgd166xx72/merged",
                "UpperDir": "/var/lib/docker/overlay2/if7g57w56b4q1esjgd166xx72/diff",
                "WorkDir": "/var/lib/docker/overlay2/if7g57w56b4q1esjgd166xx72/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:fffe76c64ef2dee2d80a8bb3ad13d65d596d04a45510b1956a976a69215dae92",
                "sha256:b53f6bda5d36b245e9554beb7e7b40399e24aacd804b76582e6d0cec0fb70bc9",
                "sha256:4fd1b69a512e466566aece7774bfa8efae9696a462d2290088189d45986ac1c7",
                "sha256:5454482620ed4e876e5b8bad3d24b8c2fb7b3a9148cd01e4f0c7271ea3ccd40a"
            ]
        },
        "Metadata": {
            "LastTagTime": "2024-12-11T17:34:42.99550954-05:00"
        }
    }
]
```