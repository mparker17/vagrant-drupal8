# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# @file
# Specify settings for a Brady's Meat & Deli server.
#
# Vagrant v1.0.6
#
Vagrant::Config.run do |config|
  # Repackaging settings.
  config.package.name = "drupal8.box"

  # Shared folder settings. To use NFS folders, we have to use host-only
  # networking.
  config.vm.network :hostonly, "192.168.33.10"
  config.vm.share_folder "html", "/mnt/www", "data/html", {:nfs => TRUE, :create => TRUE}

  # Guest machine settings.
  # For more information about key-value pairs in config.vm.customize, see
  # `modifyvm` in http://www.virtualbox.org/manual/ch08.html
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.forward_port 80, 8080
  config.vm.host_name = "drupal8.dev"
  config.vm.customize [
  ]

  # Allow developers to check out repositories.
	config.ssh.forward_agent = true

  # Refresh package list before attempting to install software.
  config.vm.provision :shell, :inline => "apt-get update"

  # Guest machine software specification.
  # Note that, when running `vagrant up`, the cookbooks specified in the
  # `add_recipe()` calls below **must already be present** in the directory
  # specified by `chef.cookbooks_path`. (i.e.: you git-clone--recurive'd).
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"

    # Config.
    chef.json = {
        "mysql" => {
            "server_root_password" => "root",
            "server_repl_password" => "root",
            "server_debian_password" => "root"
        }
    }

    # Webserver basics.
    chef.add_recipe("apache2")
    chef.add_recipe("php")
    chef.add_recipe("mysql::server")
    chef.add_recipe("database")

    # Development basics.
    chef.add_recipe("build-essential")
    chef.add_recipe("git")
    chef.add_recipe("vim")

    # Finally, install the project.
    chef.add_recipe("drupal8")
  end
end
