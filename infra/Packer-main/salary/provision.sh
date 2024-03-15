#!/bin/bash

sudo apt update -y

## install java
sudo apt install openjdk-17-jre-headless -y

# copy service file from tmp
sudo cp /tmp/salary.service /etc/systemd/system/salary.service

# daemon reload and start service file
sudo systemctl daemon-reload
sudo systemctl start salary.service
sudo systemctl enable salary.service