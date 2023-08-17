Vagrant.configure("2") do |config|
	config.vm.define "windows-node" do |node|
	  node.vm.box = "opentable/win-2019-standard-amd64-nocm"
	  node.vm.communicator = "winrm"
  
	  node.vm.network "private_network", ip: "192.168.50.101"
  
	  node.vm.provider "virtualbox" do |vb|
		vb.name = "windows-node"
		vb.memory = "2048"
		vb.cpus = "2"
	  end
  
	  node.vm.provision "shell", inline: <<-SHELL
		# Comandos de provisionamento, se necessário
	  SHELL
	end
  end
  