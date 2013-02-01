# vagrant-drupal8 #

A plain Vagrant setup script to get Drupal 8 up and running quickly.

## Requirements ##

* A Linux or Macintosh host machine.
    * On Macintosh, you'll need to run the [OSX GCC Installer][osx-gcc-installer] or install [Xcode][xcode] itself.
* [VirtualBox v4.2.x][virtualbox].
* [Vagrant v1.0.6][vagrant].

[osx-gcc-installer]: https://github.com/kennethreitz/osx-gcc-installer
[xcode]: https://developer.apple.com/technologies/mac/#xcode
[virtualbox]: https://www.virtualbox.org/
[vagrant]: http://www.vagrantup.com/

## Usage ##

1. Clone this Vagrant setup file onto your computer somewhere:

        git clone --recursive git@github.com:mparker17/vagrant-drupal.git

2. Change into the directory you just created.

        cd vagrant-drupal

3. Start Vagrant.

        vagrant up
