#!/bin/bash

echo debconf shared/accepted-oracle-license-v1-1 select true | \
    sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    sudo debconf-set-selections

sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer -y
sudo echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment
