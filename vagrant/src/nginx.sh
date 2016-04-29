#!/usr/bin/env bash

function run_as_root() {
    sudo su root -c "$1"
}

# Install Nginx
# curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
# run_as_root "echo -e \"deb http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx\" > /etc/apt/sources.list.d/nginx.list"
# sudo apt-get -y update
sudo apt-get -y install nginx

# Config Nginx
sudo mkdir -p /etc/nginx/site.d
sudo cp $BUILD_CONF_DIR/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp -R $BUILD_CONF_DIR/nginx/site.d/* /etc/nginx/site.d
sudo cp -R $BUILD_CONF_DIR/nginx/conf.d/* /etc/nginx/conf.d
sudo rm -f /etc/nginx/conf.d/default.conf
[ ! -z "${NGX_VIRTUAL_HOST}" ] && sudo sed -i "s/NGX_VIRTUAL_HOST/${NGX_VIRTUAL_HOST}/" /etc/nginx/site.d/default.conf
[ ! -z "${PHP_HOST}" ] && sudo sed -i "s/PHP_HOST/${PHP_HOST}/" /etc/nginx/site.d/default.conf
[ ! -z "${PHP_PORT}" ] && sudo sed -i "s/PHP_PORT/${PHP_PORT}/" /etc/nginx/site.d/default.conf
[ ! -z "${APP_MAGE_MODE}" ] && sudo sed -i "s/APP_MAGE_MODE/${APP_MAGE_MODE}/" /etc/nginx/site.d/default.conf
[ ! -z "${APP_MAGE_ROOT}" ] && sudo sed -i "s@APP_MAGE_ROOT@${APP_MAGE_ROOT}@" /etc/nginx/site.d/default.conf

# Start Nginx
sudo service nginx restart