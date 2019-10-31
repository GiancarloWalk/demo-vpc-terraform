#!/bin/bash
apt-get update
apt-get install -y nginx
echo "I'm the frontend server" > /var/www/html/index.html
service nginx start