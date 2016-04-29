#!/usr/bin/env bash

# Only install the CLI
sudo apt-get -y install blackfire-agent
sudo apt-get -y install blackfire-php
sudo blackfire-agent -register
sudo /etc/init.d/blackfire-agent restart
sudo service php5-fpm restart
blackfire config
