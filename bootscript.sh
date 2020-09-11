#!/bin/bash
sleep 25s

#install default wordpress instance
/root/.composer/vendor/wp-cli/wp-cli/bin/wp core download --allow-root \
    --path=/var/www/html

/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    config create \
    --dbname="wp" --dbuser="wp" --dbpass="secret" --dbhost="db" \
    --path=/var/www/html
    
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    core install \
    --path=/var/www/html \
    --url="http://localhost:8080" --title="Blog Title" \
    --admin_user="admon" --admin_password="enter_your_password" --admin_email="email@email.com"

#copy customisations made from previous runs

#run the web server
/usr/sbin/apachectl start;

#never exit
sleep infinity;