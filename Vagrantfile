# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  # config.vm.boot_timeout = 800
  config.ssh.private_key_path = [ Dir.getwd + "/../keys/.ssh/vscodespace_rsa", "~/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source:  Dir.getwd + "/../keys/.ssh/vscodespace_rsa.pub", destination: "~/.ssh/authorized_keys"

  config.vm.define "vscodespaceBase" do |vscodespaceBase|
    vscodespaceBase.vm.box = "hashicorp/bionic64"
    vscodespaceBase.vm.provider "virtualbox" do |vb|
      vb.name = "vscodespace-base"
      vb.memory = "512"
      vb.cpus = "4"
    end

    vscodespaceBase.vm.provision "file", source: Dir.getwd + "/../config/sources.list", destination: "$HOME/sources.list"

    vscodespaceBase.vm.provision "shell", inline: <<-SHELL
      mv sources.list /etc/apt/sources.list

      apt-get update -y
      apt-get install -y \
        build-essential \
        software-properties-common \
        python3-dev \
        python3-pip

      curl -fsSL https://get.docker.com -o get-docker.sh
      sh get-docker.sh

      echo "Installing Docker Compose (v1.25.5) (please be patient)..."
      curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &> /dev/null
      chmod +x /usr/local/bin/docker-compose

      usermod -aG docker vagrant

      systemctl enable docker
    SHELL

    vscodespaceBase.vm.provision "shell", privileged: false, inline: <<-SHELL
      # Install NVM
      git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
      source ~/.nvm/nvm.sh
      echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

      # Install Node
      echo "Installing Node.js (v12.16.3) (please be patient)..."
      nvm install v12.16.3 &> /dev/null
      nvm alias default v12.16.3

      # Install NPM Global Packages
      npm i -g yarn
    SHELL

    # vscodespaceBase.vm.provision "shell", inline: "echo 'Rebooting...'", reboot: true
  end

  config.vm.define "vscodespace" do |vscodespace|
    vscodespace.vm.box = "vscodespace-base"

    vscodespace.vm.provider "virtualbox" do |vb|
      vb.name = "vscodespace"
      vb.memory = "1024"
      vb.cpus = "4"
    end

    vscodespace.vm.provision "file", 
      source: Dir.getwd + "/../workspace/vscodespace.code-workspace", 
      destination: "$HOME/vscodespace.code-workspace"

    vscodespace.vm.provision "shell", privileged: false, inline: <<-SHELL
      mkdir ~/workspace
      mv ~/vscodespace.code-workspace ~/workspace
    SHELL
  end
end
