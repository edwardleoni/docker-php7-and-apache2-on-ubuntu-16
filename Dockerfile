FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install nginx
RUN apt-get install php-fpm
RUN apt-get install php-mysql
RUN apt-get install php-common
RUN apt-get install php-curl