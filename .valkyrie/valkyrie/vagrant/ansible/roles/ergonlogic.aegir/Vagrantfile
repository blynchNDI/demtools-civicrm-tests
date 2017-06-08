# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = 'aegir.local'
  config.vm.network 'private_network', ip: '10.55.55.55'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
  end

  config.vm.provision "shell" do |s|
    s.inline = <<-SHELL
      cd /vagrant
      make deps-ansible
      make ansible
      . d
      #make ansible-playbook-test
      make ansible-playbook-test-idempotence
    SHELL
    s.env = {
      #'ANSIBLE_REQUIREMENTS' => 'tests/roles/git_requirements.yml',
      'ANSIBLE_REQUIREMENTS' => 'tests/roles/deb_requirements.yml',
      'ANSIBLE_ROLES_PATH'   => 'tests/roles',
      #'ANSIBLE_PLAYBOOK'     => 'tests/playbooks/git.yml',
      'ANSIBLE_PLAYBOOK'     => 'tests/playbooks/deb.yml',
      'PYTHONUNBUFFERED'     => '1',
      'ANSIBLE_FORCE_COLOR'  => 'true',
      # *N.B.* While this functionality has been implemented in Drumkit, it is
      # currently largely broken in Ansible, due to the shift to dynamic
      # includes in 2.0+.
      #'START_AT_TASK' => 'Install Aegir via Debian packages.',
    }
    s.keep_color = true
  end

end
