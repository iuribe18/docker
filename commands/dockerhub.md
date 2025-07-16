# Docker Hub
```bash
osboxes@osboxes:~$ docker login
USING WEB-BASED LOGIN
To sign in with credentials on the command line, use 'docker login -u <username>'

Your one-time device confirmation code is: HBXB-QBQZ
Press ENTER to open your browser or submit your device code here: https://login.docker.com/activate

Waiting for authentication in the browser

WARNING! Your password will be stored unencrypted in /home/osboxes/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credential-stores

Login Succeeded
```

## Tag image
```bash
osboxes@osboxes:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        1.0       673c12380692   6 days ago    187MB
nginx        2.0       673c12380692   6 days ago    187MB
nginx        latest    66f8bdd3810c   2 weeks ago   192MB
osboxes@osboxes:~$ docker tag nginx:1.0 ivanuribe18/nginx:1.0
osboxes@osboxes:~$ docker images
REPOSITORY          TAG       IMAGE ID       CREATED       SIZE
ivanuribe18/nginx   1.0       673c12380692   6 days ago    187MB
nginx               1.0       673c12380692   6 days ago    187MB
nginx               2.0       673c12380692   6 days ago    187MB
nginx               latest    66f8bdd3810c   2 weeks ago   192MB
```

## Pull image
![dockerhub](/Resources/hub.png)
```bash
osboxes@osboxes:~$ docker push ivanuribe18/nginx:1.0
The push refers to repository [docker.io/ivanuribe18/nginx]
5454482620ed: Pushed
4fd1b69a512e: Pushed
b53f6bda5d36: Pushed
fffe76c64ef2: Mounted from library/ubuntu
1.0: digest: sha256:73e3bfd14d030c27779ee28d3d7f5e4589d808af696f92012aaa3d1b76c2c7ff size: 1160
```
![images](/Resources/images.png)