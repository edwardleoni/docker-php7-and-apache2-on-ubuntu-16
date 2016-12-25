FROM ubuntu:xenial
MAINTAINER Eduardo Leoni <eduardoleoni@outlook.com>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get -yq install curl
RUN apt-get -yq install apache2
RUN apt-get -yq install php
RUN apt-get -yq install php-mbstring
RUN apt-get -yq install libapache2-mod-php
RUN apt-get -yq install php-mysql
RUN apt-get -yq install mysql-client
RUN apt-get -yq install php-mcrypt 
RUN apt-get -yq install php-gd 
RUN apt-get -yq install php-common 
RUN apt-get -yq install php-curl 
RUN apt-get -yq install php-pear
RUN apt-get -yq install php-dom 
RUN apt-get -yq install php-zip
RUN apt-get install -y php-xdebug
RUN apt-get install -y sendmail
RUN apt-get install -y php-imagick
RUN apt-get install -y aptitude
RUN aptitude install -y libapache2-mod-proxy-html libxml2-dev
RUN apt-get install -y php-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y pkg-config libssl-dev libsslcommon2-dev
RUN apt-get install -y composer
RUN apt-get install -y php-mongodb
RUN apt-get install -y php-redis
RUN apt-get install -y cron
RUN apt-get install -y supervisor
RUN systemctl enable supervisor

ENV ALLOW_OVERRIDE **False**

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

RUN usermod -u 1000 www-data
RUN apt-get update
RUN apt-get install -y sendmail
RUN apt-get install -y vim

RUN a2enmod expires 
RUN a2enmod headers
RUN phpenmod mcrypt
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod rewrite
RUN a2enmod deflate
RUN a2enmod headers
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html

RUN service apache2 restart
ADD hosts.sh /home/hosts.sh


EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]