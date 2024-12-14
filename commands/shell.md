# Shell
## List Containers
```bash
osboxes@osboxes:~/Documents$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED      STATUS          PORTS                                       NAMES
d065fcdf8feb   nginx:2.0   "nginx -g 'daemon of…"   2 days ago   Up 13 seconds   0.0.0.0:32768->80/tcp, [::]:32768->80/tcp   nginx
```

## Shell
```bash
osboxes@osboxes:~/Documents$ docker exec -it nginx bash
root@d065fcdf8feb:/#
```