#!/bin/bash
set -eux
apt update 
apt upgrade -y
apt install default-jdk -y
mkdir -p /usr/share/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update 
apt install jenkins -y
systemctl status jenkins --no-pager -l
sudo systemctl enable --now jenkins

# 3. Instalar Git
sudo apt-get install -y git

# 4. Instalar Terraform
sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install -y terraform

# 5. Instalar Ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Iniciar Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "¡Instalación completa! Jenkins está corriendo en el puerto 8080."
# Imprimir la contraseña inicial para facilitar el primer login
echo "La contraseña inicial de Admin es:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword