Vagrant.configure("2") do |config|
  (1..3).each do |i|

    config.vm.define "vnode1#{i}" do |node|
      node.ssh.insert_key = false
      node.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
      node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

      node.vm.synced_folder "~/bsc_log", "/home/vagrant/bsc_log"
      node.vm.synced_folder "~/bsc_s2", "/home/vagrant/bsc_s2"
      node.vm.synced_folder "~/github", "/home/vagrant/github"
      node.vm.synced_folder "~/go", "/home/vagrant/go"

      node.vm.box = "../boxes/centos-7.5.1804-3.box"
      node.vm.hostname = "vnode1#{i}"

      node.vm.network "private_network", ip: "192.168.33.11#{i}"
      #node.vm.network "public_network", ip: "192.168.1.20#{i}"

      node.vm.provider "virtualbox" do |v|
        v.name = "vnode1#{i}"
        v.memory = "1024"
        v.cpus = "2"
      end
    end
  end
end
