 
#It creates a new image from the debian:buster base image.

FROM debian:buster

#1. Update the image
#2. Install nginx and openssl packages
#3. Remove all the apt-get lists

RUN apt-get update && apt-get install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

#It copies the nginx.conf file to the /etc/nginx directory.

COPY ./conf/nginx.conf /etc/nginx/sites-available/default


#It creates a self-signed certificate for the domain dzivanov.42.fr.

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=dzivanov.42.fr"


# Nginx stays in the foreground, so it needs to be run in the foreground of the container.
CMD ["nginx", "-g", "daemon off;"]