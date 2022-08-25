FROM ubuntu
MAINTAINER Akhibou(akhibou1sokhona@gmail.com)
RUN apt-get update
RUN apt-get autoclean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD  akhikachmoney/akhikachmoney/ /var/www/html/
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/akhibousokhona/akhikachmoney.git /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]