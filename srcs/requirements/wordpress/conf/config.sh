#!bin/bash
cd /var/www/wordpress
wp core config	--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \
				--allow-root

wp core install --title=inception \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
				--allow-root

#It creates a new user called deki and assigns the role of author to the user.
wp user create deki deki@dzivanov.com --role=author --user_pass=password --allow-root
cd -

php-fpm7.3 -F