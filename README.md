# vagrant-drupal8 #

A plain Vagrant setup script to get Drupal 8 up and running quickly.

## Requirements ##

* A Linux or Macintosh host machine.
    * On Ubuntu Linux, you'll need to `sudo apt-get install git nfs-kernel-server`.
    * On Macintosh, you'll need to run the [OSX GCC Installer][osx-gcc-installer] or install [Xcode][xcode] itself.
    * I haven't tested this project on a Windows host machine, so Your Mileage May Vary. It's not supported, but I do have [some notes that might be useful][windows-file] if you want to try.
* [VirtualBox v4.2.x][virtualbox].
* [Vagrant v1.3.x][vagrant].
    * The [vagrant-omnibus][vagrant-omnibus] and [vagrant-librarian-chef][vagrant-librarian-chef] plugins. To install these, run

            vagrant plugin install vagrant-omnibus
            vagrant plugin install vagrant-librarian-chef

    * I also recommend installing a Vagrant plugin to automatically update your machine's `hosts` file: it's a real timesaver! [The Vagrant wiki has a list of plugins for local domain resolution][local-domain-resolution]. I personally use `vagrant-hostsupdater` on my Ubuntu 13.10 machine, but AFAIK, any will do.

[osx-gcc-installer]: https://github.com/kennethreitz/osx-gcc-installer
[xcode]: https://developer.apple.com/technologies/mac/#xcode
[windows-file]: https://github.com/mparker17/vagrant-drupal8/blob/master/Windows.md
[virtualbox]: https://www.virtualbox.org/
[vagrant]: http://www.vagrantup.com/
[vagrant-omnibus]: https://github.com/schisamo/vagrant-omnibus
[vagrant-librarian-chef]: https://github.com/jimmycuadra/vagrant-librarian-chef
[local-domain-resolution]: https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins#local-domain-resolution

## Usage ##

1. Clone this project onto your computer somewhere:

        git clone --recursive https://github.com/mparker17/vagrant-drupal8.git

2. Change into the directory you just created.

        cd vagrant-drupal8

3. Clone Drupal 8 into the document root.

        git clone --recursive --branch 8.x http://git.drupal.org/project/drupal.git data/code

    [The first commit to Drupal's repository was in May 2000][drupal-first-commit]. Since [Git downloads every version of every file for the history of the project][git-clone-history], cloning Drupal tends to take a while… long enough that Vagrant typically times out and throws errors. We clone it here so we can avoid trouble later.

4. Start Vagrant.

        vagrant up

    If you *didn't* install a Vagrant plugin to automatically update your machine's `hosts` file, you'll have to do this manually now. Adding the line `127.0.0.1 drupal8.dev` should work in most cases.

5. Install Drupal by going to `http://drupal8.dev:8080/install.php` in a web browser!

[drupal-first-commit]: http://drupalcode.org/project/drupal.git/commit/008612ad4999138662a32abab2115cf3f03bca64
[git-clone-history]: http://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository#Cloning-an-Existing-Repository

## Notes ##

* The virtual machine document root is mapped to `data/code` in the repository. This git repository ignores changes to that folder.
