# Magento2 Vagrant dev box

### Build Vagrant box

    /**
     * Do the following things under project root directory step by step.
     */

    // Start Vagrant
    vagrant up
        
    // Ssh into Vagrant
    vagrant ssh
    
    // Set up environment variables
    source /etc/profile.d/vagrant.sh
    
    // Install MySQL
    /bin/sh $BUILD_SCRIPT_DIR/mysql56.sh
    
    // Install Nginx
    /bin/sh $BUILD_SCRIPT_DIR/nginx.sh
    
    // Install Blackfire
    /bin/sh $BUILD_SCRIPT_DIR/blackfire.sh
    
    // Install Magento
    composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
    
    // Start (restart) all the services
    service nginx restart
    service php5-fpm restart
    service mysql restart
    
    // Set up magento
    http://magento2-ce.local/setup
    
### Bind the domain
    
    /* 
     * Bind your local domain with Vagrant box IP address (set in Vagrantfile) like this in /etc/host
     * Make sure to give your Vagrant box different local IPs if you want to have several Vagrant boxes avaiable at the same time.
     * Name the domain as you want in 
     */
    192.168.99.99 magento2-ce.local
    
### Magento endpoint

    http://magento2-ce.local
        
### Complete the setup
        
    // Update .gitignore
    mv gitignore.dist .gitignore
    
### Blackfire homepage
    
    blackfire curl http://magento2-ce.local
           