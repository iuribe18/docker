# Networking overview
Container networking refers to the ability for containers to connect to and communicate with each other, or to non-Docker workloads.

Containers have networking enabled by default, and they can make outgoing connections. A container has no information about what kind of network it's attached to, or whether their peers are also Docker workloads or not. A container only sees a network interface with an IP address, a gateway, a routing table, DNS services, and other networking details. That is, unless the container uses the none network driver.

Drivers
The following network drivers are available by default, and provide core networking functionality:

| Driver  | Description |
| :-------| :---------------------------------------------------------------------- |
| bridge  |	The default network driver                                              |
| host    |	Remove network isolation between the container and the Docker host      | 
| none    |	Completely isolate a container from the host and other containers       |
| overlay |	Overlay networks connect multiple Docker daemons together               |
| ipvlan  |	IPvlan networks provide full control over both IPv4 and IPv6 addressing |
| macvlan |	Assign a MAC address to a container                                     |

## Manage Networking
```bash
osboxes@osboxes:~$ docker network
Usage:  docker network COMMAND
Manage networks

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks
Run 'docker network COMMAND --help' for more information on a command
```

## Create, list and inspect Docker Networks
```bash
osboxes@osboxes:~$ docker network create --driver bridge web01
170ff4cff605aac4e5638a1e9f5636604c6ad8640144f9a0483210c5b7f3e84a
osboxes@osboxes:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
dd6015478217   bridge    bridge    local
b6bef82572e1   host      host      local
97ad751551c0   none      null      local
170ff4cff605   web01     bridge    local
osboxes@osboxes:~$ docker inspect web01
[
    {
        "Name": "web01",
        "Id": "170ff4cff605aac4e5638a1e9f5636604c6ad8640144f9a0483210c5b7f3e84a",
        "Created": "2024-12-16T09:58:31.236436418-05:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

## Delete networks
```bash
osboxes@osboxes:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
dd6015478217   bridge    bridge    local
b6bef82572e1   host      host      local
97ad751551c0   none      null      local
170ff4cff605   web01     bridge    local
osboxes@osboxes:~$ docker network rm web01
web01
```