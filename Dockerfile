FROM ubuntu
MAINTAINER Akhibou(akhibou1sokhona@gmail.com)
RUN apt-get update
RUN apt-get autoclean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD  akhikachmoney/akhikachmoney/ /var/www/html/
RUN chown -R www-data:www-data /var/log/nginx
#RUN mkdir -p /var/lib/nginx/body
RUN mkdir  --parents  /var/lib/nginx/body
RUN mkdir  --parents  /var/lib/nginx/fastcgi
RUN mkdir  --parents  /var/lib/nginx/proxy
RUN mkdir  --parents  /var/lib/nginx/uwsgi
RUN mkdir  --parents  /var/lib/nginx/scgi
RUN chown  --recursive  www-data  /var/lib/nginx
RUN chmod 777 /var/log/nginx/
RUN chmod 777 /etc/nginx/nginx.conf
RUN chmod 777 /var/run 
RUN chmod 777 /var/log/nginx/error.log
RUN rm -rf /var/log/nginx/access.log
RUN rm -Rf /var/www/html/*
# support running as arbitrary user which belogs to the root group
#RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
# users are not allowed to listen on priviliged ports
#RUN sed -i.bak 's/listen\(.*\)80;/listen 80;/' /etc/nginx/conf.d/default.conf
# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
RUN git clone https://github.com/akhibousokhona/akhikachmoney.git /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
