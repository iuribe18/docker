# Environment Variables
## Images and Tags
1. Create a container with environment variables
```bash
osboxes@osboxes:~$ docker create -e db_endpoint=db.nas.local -e db_user=user -e db_passwd=S4nt1Ur1b3 --name web01 nginx:latest
493c90dc2deb0200e54dbc45573d490b0be8c07b14a7202615195c0e3e3dcce8
```

2. Access to container and verify the environment variables
```bash
osboxes@osboxes:~$ docker start web01
web01
osboxes@osboxes:~$ docker exec -it web01 bash
root@493c90dc2deb:/# env
db_endpoint=db.nas.local
HOSTNAME=493c90dc2deb
db_passwd=S4nt1Ur1b3
PWD=/
db_user=user
PKG_RELEASE=1~bookworm
HOME=/root
DYNPKG_RELEASE=1~bookworm
NJS_VERSION=0.8.7
TERM=xterm
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.27.3
NJS_RELEASE=1~bookworm
_=/usr/bin/env

```

# Supervisor
Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

It shares some of the same goals of programs like launchd, daemontools, and runit. Unlike some of these programs, it is not meant to be run as a substitute for init as “process id 1”. Instead it is meant to be used to control processes related to a project or a customer, and is meant to start like any other program at boot time.

## Supervisor Config
```bash
osboxes@osboxes:~/Documents$ docker exec -it supervisor bash
root@8753d5773d5f:/# cat /etc/supervisor/supervisord.conf
; supervisor config file

[unix_http_server]
file=/var/run/supervisor.sock   ; (the path to the socket file)
chmod=0700                       ; sockef file mode (default 0700)

[supervisord]
logfile=/var/log/supervisor/supervisord.log ; (main log file;default $CWD/supervisord.log)
pidfile=/var/run/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
childlogdir=/var/log/supervisor            ; ('AUTO' child log dir, default $TEMP)

; the below section must remain in the config file for RPC
; (supervisorctl/web interface) to work, additional interfaces may be
; added by defining them in separate rpcinterface: sections
[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock ; use a unix:// URL  for a unix socket

; The [include] section can just contain the "files" setting.  This
; setting can list multiple files (separated by whitespace or
; newlines).  It can also contain wildcards.  The filenames are
; interpreted as relative to this file.  Included files *cannot*
; include files themselves.

[include]
files = /etc/supervisor/conf.d/*.conf
```

## Supervisor Config
```bash
root@8753d5773d5f:/# cd /etc/supervisor/
conf.d/           supervisord.conf
root@8753d5773d5f:/# cd /etc/supervisor/conf.d/
root@8753d5773d5f:/etc/supervisor/conf.d# ls
supervisor_services.conf
root@8753d5773d5f:/etc/supervisor/conf.d# cat supervisor_services.conf
[program:nginx]
command=/usr/sbin/nginx -g 'daemon off;'
autostart=true
autorestart=true
```

## Processes
[!NOTE] El comando ps aux --forest en Linux muestra una lista de procesos en ejecución, organizada de manera jerárquica (en árbol) para visualizar las relaciones padre-hijo entre procesos.
```bash
root@8753d5773d5f:/etc/supervisor/conf.d# ps aux --forest
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root          23  0.0  0.0   4628  3712 pts/0    Ss   15:33   0:00 bash
root          36  0.0  0.0   7064  3072 pts/0    R+   15:45   0:00  \_ ps aux --forest
root           1  0.0  0.6  33096 26780 ?        Ss   15:26   0:00 /usr/bin/python3 /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
root           7  0.0  0.2  55228 11904 ?        S    15:26   0:00 nginx: master process /usr/sbin/nginx -g daemon off;
www-data       8  0.0  0.0  55552  3432 ?        S    15:26   0:00  \_ nginx: worker process
www-data       9  0.0  0.0  55552  3432 ?        S    15:26   0:00  \_ nginx: worker process
www-data      10  0.0  0.0  55552  3432 ?        S    15:26   0:00  \_ nginx: worker process
www-data      11  0.0  0.0  55552  3432 ?        S    15:26   0:00  \_ nginx: worker process
```