#!/bin/bash

#install default wordpress instance
/root/.composer/vendor/wp-cli/wp-cli/bin/wp core download --allow-root \
    --path=/var/www/html

/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    config create \
    --url=domain.com \
    --dbname=db --dbuser=wp --dbpass=secret --dbhost=db \
    --path=/var/www/html --user=admon

#copy customisations made from previous runs

#run the web server
/usr/sbin/apachectl start;

#never exit
sleep infinity;
