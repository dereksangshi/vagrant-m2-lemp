$script = <<SCRIPT
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.provision "shell", inline: "/bin/sh /vagrant/build/src/build.sh"
    config.vm.network "private_network", ip: "192.168.99.99"
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
end
