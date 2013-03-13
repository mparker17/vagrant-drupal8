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

        git clone --recursive git@github.com:mparker17/vagrant-drupal8.git

2. Change into the directory you just created.

        cd vagrant-drupal8

3. Start Vagrant.

        vagrant up

4. On Linux and Windows, map `drupal8.dev` to the virtual machine in the host machine's `hosts` file.

    Most of the time, the following line will work:

        127.0.0.1 drupal8.dev

5. Access the virtual machine by going to `http://drupal8.dev:8080/` in a web browser.

## Notes ##

* The virtual machine document root is mapped to `data/html` in the repository. This git repository ignores changes to that folder.
