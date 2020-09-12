#!/bin/bash
sleep 25s

# download latest wordpress 
/root/.composer/vendor/wp-cli/wp-cli/bin/wp core download --allow-root \
    --path=/var/www/html

# connect database
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    config create \
    --dbname="wp" --dbuser="wp" --dbpass="secret" --dbhost="db" \
    --path=/var/www/html
    
# build new default site
#/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
#    core install \
#    --url="http://localhost:8080" --title="Blog Title" \
#    --admin_user="admon" --admin_password="enter_your_password" --admin_email="email@email.com" \
#    --path=/var/www/html

#copy customisations made from previous runs
cp -r wp-content/uploads /var/www/html/wp-content/uploads
chmod -R 777 /var/www/html/wp-content/uploads

#import database that was exported
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    db import ./sql/exported-wp-sql.sql

# update database with new site URL
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    search-replace "http://old-url.com" "https://new-url.com" \
    --path=/var/www/html

# flush object cache:
/root/.composer/vendor/wp-cli/wp-cli/bin/wp --allow-root \
    cache flush \
    --path=/var/www/html

#run the web server
/usr/sbin/service apache2 restart;

#never exit
sleep infinity;