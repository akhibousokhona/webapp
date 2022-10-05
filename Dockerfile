FROM ubuntu
MAINTAINER Akhibou(akhibou1sokhona@gmail.com)
RUN apt-get update
RUN apt-get autoclean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD  akhikachmoney/akhikachmoney/ /var/www/html/
RUN chown -R www-data:www-data /var/log/nginx
RUN chmod 777 /var/log/nginx/
RUN chmod 777 /etc/nginx/nginx.conf
RUN chmod 777 /var/run 
RUN chmod 777 /var/log/nginx/error.log
RUN rm -rf /var/log/nginx/access.log
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/akhibousokhona/akhikachmoney.git /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
