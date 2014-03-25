# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Last tested on Vagrant 1.5.1.
#
# Required plugins:
# - [vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)
# - [librarian-chef](https://github.com/applicationsonline/librarian-chef)
#
# Recommended plugins:
# - A [Local Domain Resolution plugin](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins#local-domain-resolution)
# - [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)
# - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
  end

  config.vm.synced_folder "data", "/srv/drupal8"

  config.vm.hostname = "drupal8.dev"

  config.vm.network "forwarded_port", guest: 80, host: 80, auto_correct: true
  config.vm.network "forwarded_port", guest: 3306, host: 3306, auto_correct: true
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  config.ssh.forward_agent = true

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    # Guest OS and toolchain.
    chef.add_recipe "apt::default"

    # Settings.
    chef.json = {
    }
  end

end
