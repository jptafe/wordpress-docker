#!/bin/bash

#install default wordpress instance
/root/.composer/vendor/wp-cli/wp-cli/bin/wp core download --allow-root \
    --path=/var/www/html

/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    config create \
    --url=domain.com \
    --dbname="wp" --dbuser="wp" --dbpass="secret" --dbhost="db" \
    --path=/var/www/html \
    
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    wp core install \
    --path=/var/www/html \
    --url="https://sitedomain.com"  --title="Blog Title" \
    --admin_user="admon" --admin_password="enter_your_password" --admin_email="email@email.com"

#copy customisations made from previous runs

#run the web server
/usr/sbin/apachectl start;

#never exit
sleep infinity;
