#!/bin/bash
set -eux
apt update 
apt upgrade -y

sudo apt update
sudo apt install fontconfig openjdk-21-jre -y
java -version

# 1. Instalar Java (Jenkins requiere Java para funcionar)
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y

systemctl status jenkins --no-pager -l
sudo systemctl enable --now jenkins

# 2. Instalar Git
sudo apt-get install -y git

# 3. Instalar Terraform
sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install -y terraform

# 4. Instalar Ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# 5. Iniciar Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 6. Verificar que Jenkins esté corriendo
echo "¡Instalación completa! Jenkins está corriendo en el puerto 8080."
# 7. Imprimir la contraseña inicial para facilitar el primer login
echo "La contraseña inicial de Admin es:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword