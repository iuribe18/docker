# Containers
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

## Create containers
```bash
osboxes@osboxes:~/Documents$ docker create nginx:1.0
7ca0e0ba8fdaacc988211bf96bef5cde93c8625e8f57af111286bc8d605c3e87
```
## Life Cycle of a Container
Created
```bash
osboxes@osboxes:~/Documents$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS    PORTS     NAMES
7ca0e0ba8fda   nginx:1.0   "nginx -g 'daemon of…"   2 minutes ago   Created             happy_lichterman
```

Up
```bash
osboxes@osboxes:~/Documents$ docker start happy_lichterman
happy_lichterman
osboxes@osboxes:~/Documents$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS          PORTS     NAMES
7ca0e0ba8fda   nginx:1.0   "nginx -g 'daemon of…"   5 minutes ago   Up 45 seconds             happy_lichterman
```

Stop (Exited)
```bash
osboxes@osboxes:~/Documents$ docker stop 7ca0
7ca0
osboxes@osboxes:~/Documents$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
osboxes@osboxes:~/Documents$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS                     PORTS     NAMES
7ca0e0ba8fda   nginx:1.0   "nginx -g 'daemon of…"   6 minutes ago   Exited (0) 7 seconds ago             happy_lichterman
```

## Create containers with a name
```bash
osboxes@osboxes:~/Documents$ docker create --name nginx nginx:1.0
8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1
osboxes@osboxes:~/Documents$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS    PORTS     NAMES
8fd8343931d6   nginx:1.0   "nginx -g 'daemon of…"   17 seconds ago   Created             nginx
```

## Inspect a Container
```bash
osboxes@osboxes:~/Documents$ docker inspect nginx
[
    {
        "Id": "8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1",
        "Created": "2024-12-11T22:50:48.160890095Z",
        "Path": "nginx",
        "Args": [
            "-g",
            "daemon off;"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 3267,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2024-12-11T22:52:17.267665265Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:2da628f58fe99af4b3a003a9bf1dab8cdd0db1bd7bf6d7fd38c6ac3a2ae6f013",
        "ResolvConfPath": "/var/lib/docker/containers/8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1/hostname",
        "HostsPath": "/var/lib/docker/containers/8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1/hosts",
        "LogPath": "/var/lib/docker/containers/8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1/8fd8343931d61ec59ef78bdf75f29c3e562f56463f0d927c22dc5bd4571ebff1-json.log",
        "Name": "/nginx",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                60,
                314
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": [],
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware",
                "/sys/devices/virtual/powercap"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/59eb68b1f2b565859af3199b32be7452dee1436d48d2791150ae18ef999993fc-init/diff:/var/lib/docker/overlay2/if7g57w56b4q1esjgd166xx72/diff:/var/lib/docker/overlay2/stcu3l1jkk82590343q7j76ms/diff:/var/lib/docker/overlay2/ke1c675i4dvafn2sxjunu9umy/diff:/var/lib/docker/overlay2/baaf5aaf51346355cce4164bb161b29f952e586af913bd8a6598d07d3e195b52/diff",
                "MergedDir": "/var/lib/docker/overlay2/59eb68b1f2b565859af3199b32be7452dee1436d48d2791150ae18ef999993fc/merged",
                "UpperDir": "/var/lib/docker/overlay2/59eb68b1f2b565859af3199b32be7452dee1436d48d2791150ae18ef999993fc/diff",
                "WorkDir": "/var/lib/docker/overlay2/59eb68b1f2b565859af3199b32be7452dee1436d48d2791150ae18ef999993fc/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "8fd8343931d6",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": true,
            "AttachStderr": true,
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
            "Image": "nginx:1.0",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "20.04"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "7c0aab8ebfb498b98359da23205e1f9b85652f95aaa011a3f2fbb86bdcfdb608",
            "SandboxKey": "/var/run/docker/netns/7c0aab8ebfb4",
            "Ports": {},
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "f70545bc6f73c8f3e9f45683f53c7d6479d5a9bc7984abfe7a6d6c6779a6423f",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null,
                    "NetworkID": "a59f0e25b096bd092cab9dc6b2eb57a6280b7f2e586fe2e4056bd872117ea0be",
                    "EndpointID": "f70545bc6f73c8f3e9f45683f53c7d6479d5a9bc7984abfe7a6d6c6779a6423f",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": null
                }
            }
        }
    }
]
```

## Test the Container
Accordig with the IPAddress
```bash
osboxes@osboxes:~/Documents$ curl 172.17.0.2
Hello world from Docker
```

## Create containers with a name and port
```bash
osboxes@osboxes:~/Documents$ docker create -p 8080:80 --name nginx nginx:1.0
3385694634eb7ad7c384508e9475f015152554882c5df38637ed3dddc7d5b927
```
Notas:
-p 8080:80
Especifica el mapeo de puertos entre el host (tu máquina) y el contenedor.
**8080**: Es el puerto en el host (tu máquina local o servidor) que se expone al exterior.
**80**: Es el puerto dentro del contenedor donde el servicio (en este caso, NGINX) está escuchando.

With localhost
```bash
osboxes@osboxes:~/Documents$ curl localhost:8080
Hello world from Docker
```

## Create containers with a name and port (Dockerfile include the port)
```bash
osboxes@osboxes:~/Documents$ docker create -P --name nginx nginx:2.0
d065fcdf8febe8ac716086ee2cab46532778152a845dfe032fc176623b9cb822
osboxes@osboxes:~/Documents$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS    PORTS     NAMES
d065fcdf8feb   nginx:2.0   "nginx -g 'daemon of…"   7 seconds ago   Created             nginx
osboxes@osboxes:~/Documents$ docker start nginx
nginx
osboxes@osboxes:~/Documents$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS         PORTS                                       NAMES
d065fcdf8feb   nginx:2.0   "nginx -g 'daemon of…"   23 seconds ago   Up 6 seconds   0.0.0.0:32768->80/tcp, [::]:32768->80/tcp   nginx
osboxes@osboxes:~/Documents$ curl localhost:32768
Hello world from Docker
```

```bash
osboxes@osboxes:~/Documents$ cat /proc/sys/net/ipv4/ip_local_port_range
32768   60999
osboxes@osboxes:~/Documents$ ps aux | grep proxy
osboxes     3713  0.0  0.1 236292  6272 ?        Ssl  17:57   0:00 /usr/libexec/gsd-screensaver-proxy
root        4979  0.0  0.1 1745384 4096 ?        Sl   19:43   0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 32768 -container-ip 172.17.0.2 -container-port 80
root        4986  0.0  0.1 1745128 4096 ?        Sl   19:43   0:00 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 32768 -container-ip 172.17.0.2 -container-port 80
osboxes     5093  0.0  0.0   9080  2560 pts/0    S+   19:48   0:00 grep --color=auto proxy
```