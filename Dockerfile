FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install mariadb-server mariadb-client
RUN apt-get -y install openssl
RUN apt-get -y install php7.3-fpm php7.3-mysql
RUN apt-get -y install php-json php-mbstring
RUN apt-get -y install curl

COPY srcs/start.sh ./
COPY srcs/default ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./

CMD bash /start.sh

EXPOSE 80/tcp 443/tcp
