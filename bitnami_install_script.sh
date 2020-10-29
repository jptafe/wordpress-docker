#run this script, but modify with your domain & GIT repo
#!/bin/bash
cd /opt/bitnami/apps/wordpress/htdocs
sudo apt-get install git --allow-unauthenticated --allow-downgrades --allow-remove-essential --allow-change-held-packages
#git repo
git clone https://github.com/jptafe/deleteme4
sudo cp -fr deleteme4/wp-content/* ./wp-content 
wp plugin install wordpress-importer --activate
wp core update
wp plugin update --all
wp cache flush 
wp db import deleteme4/sqldump/export.sql
#domain
wp search-replace 'http://localhost:8080' 'http://wp.cari.mba'
