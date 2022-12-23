
#It creates a new image from the debian:buster base image.
FROM debian:buster

#It tells Docker to run the Dockerfile in the current directory.
EXPOSE 9000

#1. It uses the FROM instruction to pull the latest image of Ubuntu 16.04.
#2. It uses the RUN instruction to install the PHP 7.3 and MySQL packages.
#3. It uses the RUN instruction to remove the unnecessary files.
#4. It uses the RUN instruction to install the curl package.
#5. It uses the EXPOSE instruction to expose port 80.
#6. It uses the CMD instruction to run the default command.

RUN apt-get update && apt-get install -y \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-client \
	curl && \
	rm -rf /var/lib/apt/lists/*


#It copies the www.conf file to the /etc/php/7.3/fpm/pool.d directory.
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d


#It downloads the latest version of WordPress, and extracts it to the /var/www/html directory.
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz



#It creates a new directory in the /var/www/html directory. And it extracts the WordPress files to the /var/www/html/wordpress directory.

RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

#It downloads the latest version of the wp-cli.phar file from the wp-cli GitHub repository and saves it as wp-cli.phar.

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent


# It gives the wp-cli.phar file executable permissions.

RUN chmod +x ./usr/bin/wp

# It creates a new directory in the /var/www/html directory.

RUN mkdir /run/php

# It copies the wp-config.php file to the /var/www/wordpress directory.

COPY ./conf/config.sh /var/www/wordpress/config.sh

# It changes permission of the config.sh file.

RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]

# CMD command used to run the starting configurational script of wordpress
