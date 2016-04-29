#!/usr/bin/env bash

run_as_root() {
    sudo su root -c "$1"
}

sudo useradd www-data

# Add Nginx repo
curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
run_as_root "echo -e \"deb http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx\" > /etc/apt/sources.list.d/nginx.list"

# Add Blackfire repo
wget -O - https://packagecloud.io/gpg.key | sudo apt-key add -
run_as_root "echo \"deb http://packages.blackfire.io/debian any main\" | sudo tee /etc/apt/sources.list.d/blackfire.list"

run_as_root "echo \"127.0.0.1 ${NGX_VIRTUAL_HOST}\" >> /etc/hosts"

# Update apt-get
sudo apt-get -y update
