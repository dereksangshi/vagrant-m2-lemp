#!/usr/bin/env bash

run_as_root() {
    sudo su root -c "$1"
}

run_as_root "echo \"export BUILD_SCRIPT_DIR=/vagrant/vagrant/src\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export BUILD_CONF_DIR=/vagrant/vagrant/conf\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export NGX_VIRTUAL_HOST=magento2-ce.local\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export PHP_HOST=127.0.0.1\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export PHP_PORT=9000\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export APP_MAGE_MODE=default\" >> /etc/profile.d/vagrant.sh"
run_as_root "echo \"export APP_MAGE_ROOT=/vagrant/magento2\" >> /etc/profile.d/vagrant.sh"