FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install php-common -y
RUN apt-get install php-curl -y