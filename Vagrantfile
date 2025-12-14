Vagrant.configure(2) do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "bento/ubuntu-24.04"
    jenkins.vm.network "private_network", ip: "192.168.11.11"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provision :shell, :path => "jenkins.sh"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.network "forwarded_port", guest: 50000, host: 50000
  end

  config.vm.define "agent" do |agent|
    agent.vm.box = "bento/ubuntu-24.04"
    agent.vm.network "private_network", ip: "192.168.11.13"
    agent.vm.hostname = "agent"
    agent.vm.provision :shell, :path => "ansible.sh"
    agent.vm.provision :shell, :path => "docker.sh"
    agent.vm.provision :shell, :path => "sonarqube.sh"
    agent.vm.provision :shell, :path => "terraform.sh"
    agent.vm.network "forwarded_port", guest: 2376, host: 2376
    agent.vm.network "forwarded_port", guest: 4243, host: 4243
    agent.vm.network "forwarded_port", guest: 9999, host: 9999
    agent.vm.network "forwarded_port", guest: 9000, host: 9000
    agent.vm.network "forwarded_port", guest: 3000, host: 3000
    agent.vm.network "forwarded_port", guest: 50000, host: 50001
    for i in 32770..32900
      agent.vm.network :forwarded_port, guest: i, host: i
    end
  end

end
