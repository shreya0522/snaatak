#!/bin/bash

# Create custom URL for the repo
repo_url="https://github.com/avengers-p6/employee-api.git"

# Clone the repository
git clone "$repo_url"

# Install the dependencies
sudo cp ~/employee-api/employee.service /etc/systemd/system/employee.service
sudo snap install go --classic
cd ~/employee-api
go mod download
go build

# Setup the employee service
sudo systemctl daemon-reload
sudo systemctl start employee.service
sudo systemctl enable employee.service
