FROM centos:latest
MAINTAINER roycloud123@gmail.com
RUN yum install -y httpd \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html
WORKDIR /var/www/html
RUN unzip carvilla.zip
RUN cp -rvf carvilla-v1.0/* .
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
