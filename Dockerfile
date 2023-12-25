FROM centos:latest
MAINTAINER roycloud123@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y \
    zip \
    unzip
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html
RUN unzip carvilla.zip
RUN cp -rvf carvilla-v1.0/* .
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
#end of file
