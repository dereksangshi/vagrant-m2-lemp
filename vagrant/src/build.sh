#!/usr/bin/env bash

# Set up environment variables.
/bin/sh $BUILD_SCRIPT_DIR/env.sh
source /etc/profile.d/vagrant.sh

# Get the os ready
/bin/sh $BUILD_SCRIPT_DIR/os.sh

# Install PHP
/bin/sh $BUILD_SCRIPT_DIR/php56-install.sh

# Install composer
/bin/sh $BUILD_SCRIPT_DIR/composer-install.sh
