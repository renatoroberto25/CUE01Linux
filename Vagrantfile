Vagrant.configure("2") do |config|
  def provision_common(vm)
    vm.vm.provision "shell", inline: <<-SHELL
      echo "[V] Iniciando provisionamento comum..."

      if command -v apt-get >/dev/null 2>&1; then
        export DEBIAN_FRONTEND=noninteractive
        apt-get update -y
        apt-get upgrade -y
        apt-get install -y sudo openssh-server mtools acl logrotate
      else
        echo "[X] Gerenciador de pacotes não suportado."
        exit 1
      fi

      timedatectl set-timezone America/Sao_Paulo || true
      echo "[✔] Provisionamento comum concluído."
    SHELL
  end

  config.vm.define "Jammy-Jellyfish" do |vm|
    vm.vm.box = "bento/ubuntu-22.04"
    vm.vm.hostname = "Jammy-Jellyfish"
    vm.vm.network "private_network", ip: "192.168.56.41"

    # Recursos: 2 CPUs, 4096 MB RAM
    vm.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end

    provision_common(vm)
    vm.vm.provision "shell", path: "./provisionamento-ubuntu.sh"
  end
end
