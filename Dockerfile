FROM ubuntu:xenial
MAINTAINER Edward Leoni <mail@edwardleoni.comm>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C 
RUN apt-get update
RUN apt-get -yq install curl
RUN apt-get -yq install apache2
RUN apt-get install -y sqlite
RUN apt-get -yq install php7.1 --allow-unauthenticated
RUN apt-get -yq install php-mbstring --allow-unauthenticated
RUN apt-get -yq install libapache2-mod-php7.1 --allow-unauthenticated
RUN apt-get -yq install php7.1-mysql --allow-unauthenticated
RUN apt-get -yq install mysql-client --allow-unauthenticated
RUN apt-get -yq install php7.1-mcrypt --allow-unauthenticated
RUN apt-get -yq install php7.1-gd --allow-unauthenticated
RUN apt-get -yq install php7.1-common --allow-unauthenticated
RUN apt-get -yq install php7.1-curl --allow-unauthenticated
RUN apt-get -yq install php-pear --allow-unauthenticated
RUN apt-get -yq install php7.1-dom --allow-unauthenticated
RUN apt-get -yq install php7.1-zip --allow-unauthenticated
RUN apt-get -yq install php7.1-sqlite3
RUN apt-get install -y php-xdebug --allow-unauthenticated
RUN apt-get install -y sendmail
RUN apt-get install -y php-imagick --allow-unauthenticated
RUN apt-get install -y aptitude
RUN apt-get install -y apache2-bin
RUN apt-get install -y libxml2-dev --allow-unauthenticated
RUN apt-get install -y php-dev --allow-unauthenticated
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y pkg-config libssl-dev libsslcommon2-dev
RUN apt-get install -y composer
RUN apt-get install -y php-mongodb --allow-unauthenticated
RUN apt-get install -y php-redis --allow-unauthenticated
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
RUN a2enmod xml2enc
RUN a2enmod ssl

RUN service apache2 restart
ADD hosts.sh /home/hosts.sh


EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
