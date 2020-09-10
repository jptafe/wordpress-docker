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
*  

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
