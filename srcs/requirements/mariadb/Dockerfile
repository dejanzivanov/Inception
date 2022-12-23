#It creates a new image from the debian:buster base image.

FROM debian:buster


# Expose port 3306 for MariaDB service
EXPOSE 3306

# It uses the ARG command to set the variables DB_NAME, DB_USER, DB_PASSWORD, and DB_ROOT_PASSWORD.

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}


#1. It uses the RUN command to update the image. 
#2. It uses the RUN command to install the MariaDB packages.
#3. It uses the RUN command to remove the unnecessary files.

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

# It removes the default MariaDB configuration file.
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

# It copies the mariadb.cnf file to the /etc/mysql/mariadb.conf.d directory.
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d



# It copies the file tools/create_user.sh to the Docker container.

COPY tools/create_user.sh /

# It uses the RUN command to give the create_user.sh file executable permissions.
# and it runs the create_user.sh file.

RUN bash ./create_user.sh

CMD ["mysqld_safe"]

