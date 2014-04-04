# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Last tested on Vagrant 1.5.1.
#
# Required plugins:
# - [vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)
# - [librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef)
#
# Recommended plugins:
# - A [Local Domain Resolution plugin](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins#local-domain-resolution)
# - [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)
# - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The latest LTS of Ubuntu only supports PHP 5.3, and D8 needs at least 5.4.
  # If we can't use an LTS, we may as well use the latest Ubuntu.
  config.vm.box = "chef/ubuntu-13.10"

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

    # Drupal.
    chef.add_recipe "php"

    # Settings.
    chef.json = {
      "php" => {
        # We need some additional packages. Assumes a Ubuntu guest. Probably not
        # the best way to go about this right now, but it's a start.
        "packages" => %w{ php5-cgi php5 php5-dev php5-cli php-pear php5-curl php5-xdebug },
        "directives" => {
          # Sadly, the php cookbook tries to output everything we pass in here
          # as a string for some reason, so there's no way we can use the nice,
          # friendly E_ALL & ~E_NOTICE constants. The best we can do is output
          # a string that contains a plain old integer.
          # According to http://php.net/manual/errorfunc.constants.php,
          # E_ALL = 32767, E_NOTICE = 8, so E_ALL & ~E_NOTICE = E_ALL - E_NOTICE
          # = 32767 - 8 = 32759.
          "error_reporting" => 32759,
          "safe_mode" => "off",
          # This might be a bit big, but D8's memory usage has varied a bit over
          # it's development cycle, so better safe than sorry I guess.
          "memory_limit" => "128M"
        }
      }
    }
  end

end
