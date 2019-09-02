# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "chavo1/bionic64-ember"
  config.vm.define "ruby" do |ruby|
    ruby.vm.hostname = "ruby"
    ruby.vm.network "private_network", ip: "192.168.56.56"
    ruby.vm.provision "shell",inline: "cd /vagrant ; bash scripts/install_redis.sh"
    ruby.vm.provision "shell",inline: "cd /vagrant ; bash scripts/provision.sh"

  end
end
