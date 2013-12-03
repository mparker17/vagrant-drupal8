# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# @file
# Specify settings for a Drupal webserver.
#
# Vagrant v1.3.5
# Plugins:
# - vagrant-omnibus
# - vagrant-librarian-chef
#
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "drupal8.dev"

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  # To use NFS folders, we have to use a private (host-only) network with a
  # static IP.
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "./data", "/srv/drupal8", nfs: true

  # Enable SSH agent forwarding so we don't have to copy our private key to
  # the VM.
  config.ssh.forward_agent = true

  # Ensure we're using a recent version of Chef.
  # Apparently librarian-chef uses 11.6.2 so let's go with that.
  config.omnibus.chef_version = "11.6.2"

  # Tell Chef where to find cookbooks downloaded with Librarian.
  config.librarian_chef.cheffile_dir = "contrib-recipes"

  # Provision.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["contrib-recipes/cookbooks", "my-recipes/cookbooks"]
    chef.roles_path = "./my-recipes/roles"
    chef.data_bags_path = "./my-recipes/data_bags"

    # On ubuntu hosts, run recipe "apt::default" first so that apt-get
    # update is run ASAP.
    chef.add_recipe "apt::default"

    # Applications we will need.
    chef.add_recipe "git"
    chef.add_recipe "apache2"
    chef.add_recipe "database::mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "php"
    chef.add_recipe "drush"

    # Settings.
    chef.json = {
      "mysql" => {
        "server_root_password" => "root",
        "server_repl_password" => "root",
        "server_debian_password" => "root"
      }
    }
  end
end
