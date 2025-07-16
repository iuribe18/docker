FROM ubuntu:20.04

RUN apt update
RUN apt install nginx -y
RUN echo 'Hello world from Docker' > /var/www/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

## For Supervisor
FROM ubuntu:21.04

RUN apt update
RUN apt install nginx -y
RUN apt install supervisor -y
RUN echo 'Hello world from Docker' > /var/www/html/index.html

ADD supervisor_services.conf /etc/supervisor/conf.d/
EXPOSE 80

CMD ["supervisord", "-n", "-c", /etc/supervisor/supervisord.conf]