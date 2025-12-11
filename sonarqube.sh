#!/bin/bash
set -eux
apt-get update
apt-get -y install default-jre default-jdk
#wget https://downloads.sourceforge.net/project/sonar-pkg/deb/binary/sonar_6.7.4_all.deb
wget https://sourceforge.net/projects/sonar-pkg/files/deb/binary/sonar_7.1_all.deb
dpkg -i sonar_7.1_all.deb
/etc/init.d/sonar start
