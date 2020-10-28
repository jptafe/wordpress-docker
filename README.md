 ``` 
      
     |           W O R D P R E S S  
     |
     |           D O C K E R 
     |
     |           D E P L O Y 

```

### A exploration of the technologies necessary to build WordPress in Microservices

# OBJECTIVES 
* develop a persistent service with an epheremal microservice 
* maintain dev, staging and production with a single platform 
* automate backup by pushing configuration & content to a git repository TODO 

# TECHNOLOGY
* docker, docker-compose
* composer, wp-cli, wordpress 
* linux, bash 

# FOLDER STRUCTURE
* /wp-content - A direct copy of Wordpress custom configurations
* /sql - Database dump WordPress

# INSTALLATION:

See Dockerfile & docker-compose
```
docker system prune // remove all persistence 
eocker-compose build
docker-compose up
```

# TODO
* develop cron event to export configurations & content
* push to a private repository
* remove passwords from implementation

# Run in Google Cloud

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)

```
#EXPORT these ENV variables in the gcloud shell
CLOUDSDK_PYTHON: python3
LD_LIBRARY_PATH: "/usr/local/lib"
```


```
#beta test script 

#goto wordpress folder
cd /opt/bitnami/apps/wordpress/htdocs
#install git
apt-get install git --force-yes
git clone https://github.com/jptafe/wpsie
#update wp
wp core update
wp plugin update --all
```
```
### CREATE

mkdir my_new_wp_project
cd my_new_wp_project

composer init -n
composer require wp-cli/wp-cli-bundle

wp core download
mysql -u root -e 'create database my_wp'
#mysql -u root -e "grant all privileges on my_wp.* To sombody@localhost IDENTIFIED  BY 'pass'"

./wp config create --dbname="my_wp" --dbuser="root" --dbpass="" --dbhost="localhost"
./wp core install --url="http://localhost:8080" --title="Blog Title" --admin_user="admon" --admin_password="enter_your_password" --admin_email="email@email.com"

./wp plugin install woocommerce
./wp plugin activate woocommerce

### BACKUP
./wp db export
#backup wp-content/uploads #folder

## RESTORE
wp core update
wp plugin update --all
./wp db import
wp search-replace "http://dev:8080" "http://prod:9090"
```
