Vagrant.configure('2') do |config|
  config.vm.box = 'bento/centos-7.2'

  config.cache.scope = :box

  config.user.defaults = {
    "network" => {
      "base_ip" => "192.168",
      "subnet_number" => "50"
    }
  }
  base_ip = config.user.network.base_ip
  subnet = "#{base_ip}.#{config.user.network.subnet_number}"
  config.vm.network "private_network", ip: "#{subnet}.10"

  config.vm.synced_folder '.', '/zookeeper'

  config.vm.provision 'ansible_local' do |a|
    a.sudo = true
    a.provisioning_path = '/zookeeper'
    a.playbook = 'vagrant.yml'
    a.galaxy_role_file = 'requirements.yml'
    a.verbose = 'vv'
    a.extra_vars = {
      registry_address: "#{subnet}.1:5000"
    }
  end
end
