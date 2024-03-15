#!/bin/bash

sudo apt update -y

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

#install packages
sudo apt-get install -y nodejs
sudo apt-get install -y nginx
sudo apt-get install -y unzip

#unzip the binary
cd ~/ && unzip frontend.zip

#install dependency
cd /home/ubuntu/Frontend_API && npm i
cd /home/ubuntu/Frontend_API && npm run build

#replace the static content
sudo rm -rf /var/www/html/*
sudo cp -r /home/ubuntu/build/* /var/www/html/