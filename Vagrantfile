# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  box_to_use = 'raring-server-cloudimg-amd64-vagrant-disk1'
  # box_to_use = 'precise-server-cloudimg-amd64-vagrant-disk1'

  salt_git_checkout = 'v0.17.0'
  # salt_git_checkout = 'yamlfilterfix'

  config.vm.box = box_to_use
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/#{box_to_use}.box"

  config.vm.synced_folder "salt", "/srv/salt/"

  config.vm.provision :shell do |shell|
    shell.inline = '[[ "$(salt-call --version)" == *17* ]] ||
           curl -L https://raw.github.com/jmagnusson/salt-bootstrap/develop/bootstrap-salt.sh | sudo sh -s -- git ' + salt_git_checkout
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "vagrant-minion.conf"
    salt.run_highstate = true
    salt.verbose = true
  end
end
