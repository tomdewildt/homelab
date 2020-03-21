Vagrant.configure("2") do |config|
  NAMES = ["master","worker-1","worker-2"]
  ADDRESSES = ["10.20.0.2","10.20.0.3","10.20.0.4"]

  (0..NAMES.count-1).each do |i|
    config.vm.define "#{NAMES[i]}" do |host|
      host.vm.box = "centos/7"
      host.vm.hostname = "#{NAMES[i]}.local"
      host.vm.network :private_network, ip: "#{ADDRESSES[i]}"

      config.vm.provider "virtualbox" do |vb|
        vb.cpus = 2
        vb.memory = 2048
      end

      host.vm.provision "shell", inline: <<-SHELL
        # Update virtual machine
        yum update -y
        yum upgrade -y
      
        # Install epel-release
        yum install epel-release -y

        # Enable firewall
        systemctl enable firewalld
        systemctl start firewalld
      SHELL
    end
  end
end
