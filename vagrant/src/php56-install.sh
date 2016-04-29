#!/usr/bin/env bash

# Install php
sudo apt-get -y update
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get -y update
sudo apt-get -y install php5 php5-fpm php5-mhash php5-mcrypt php5-curl php5-cli php5-mysql php5-gd php5-intl php5-xsl

# Config php
sudo cp $BUILD_CONF_DIR/php/www.conf /etc/php5/fpm/pool.d/www.conf
sudo cp $BUILD_CONF_DIR/php/zz-magento2.ini /etc/php5/fpm/conf.d/zz-magento2.ini

# Start php fpm
sudo service php5-fpm restart