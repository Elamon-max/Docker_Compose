Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Resurslarni tejash (Sizning holatingiz uchun juda muhim)
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048" # Har bir VMga 2GB RAM bering
    vb.cpus = 2        # 2 ta yadro ishni tezlashtiradi
  end

  nodes = {
    "manager01" => "192.168.56.10",
    "worker01"  => "192.168.56.11",
    "worker02"  => "192.168.56.12"
  }

  nodes.each do |name, ip|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: ip
      
      # Skriptlarni ketma-ket ishga tushirish
      node.vm.provision "shell", path: "install_docker.sh"
      node.vm.provision "shell", path: "setup_swarm.sh"
    end
  end
end