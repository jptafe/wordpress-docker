#!/bin/bash

#wait for other microservices to boot;
sleep 30s;


#copy customisations made from previous runs


#run the web server
/usr/sbin/apachectl start;

#never exit
sleep infinity;
