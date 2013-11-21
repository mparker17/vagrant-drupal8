# Using this project on Windows #

I haven't tested this project on a Windows host machine, so Your Mileage May Vary. This is not supported.

I am aware of the following issues:

1. Hosting NFS drives from Windows is difficult, and [vagrant doesn't support it][windows-vagrant-nfs]. To tell Vagrant to use the built-in Virtualbox folder sharing instead, change the line in the `Vagrantfile` that says:

        config.vm.synced_folder "./data", "/srv/drupal8", nfs: true

    … to …

        config.vm.synced_folder "./data", "/srv/drupal8", nfs: false

    Please don't submit this change as a pull-request: the [built-in Virtualbox folder-sharing is painfully slow][windows-virtualbox-share-slow].

2. If you fork this project to set up your own Drupal site and you try to clone a private repository, you'll  get an error because Windows doesn't have a built-in [SSH Key Agent][windows-ssh-key-agent-defn]; and, until net-ssh/net-ssh#66 is merged (and Vagrant starts using the new version of net-ssh), you can't even use PuTTY's Pageant either.

    1. The first step in working around this is to change the line in the `Vagrantfile` that says:

            config.ssh.forward_agent = true

        … to …

            config.ssh.forward_agent = false

    2. Next, you'll have to figure out how to clone your repository.

        If your private repository is hosted on Github, read their article on [managing deploy keys][github-deploy-keys]… you may be able to use those.

        Alternately, you could just run `vagrant up`, wait until it errors out, clone the repo(s) on the host machine and put them into the shared folder (`./data`) with the correct names, then run `vagrant provision` again to finish up.

        As a last resort, and **if you are the *only* person who can access the guest machine** you could consider generating a new key pair on the guest machine and adding them to your account's authorized keys, or copying your SSH keys to the virtual machine. However, those keys will be erased if you `vagrant destroy`; and, more importantly, pose a potential security risk, so be very careful. This is definately not recommended nor supported: try at your own risk.

[windows-vagrant-nfs]: http://docs.vagrantup.com/v2/synced-folders/nfs.html
[windows-virtualbox-share-slow]: http://docs-v1.vagrantup.com/v1/docs/nfs.html
[windows-ssh-key-agent-defn]: https://en.wikipedia.org/wiki/Ssh-agent
[github-deploy-keys]: https://help.github.com/articles/managing-deploy-keys
