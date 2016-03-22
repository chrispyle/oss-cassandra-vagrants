#!/bin/bash

echo "deb http://www.apache.org/dist/cassandra/debian 21x main" > /etc/apt/sources.list.d/cassandra.sources.list
echo "deb-src http://www.apache.org/dist/cassandra/debian 21x main" >> /etc/apt/sources.list.d/cassandra.sources.list

gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | sudo apt-key add -

gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | sudo apt-key add -

gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
gpg --export --armor 0353B12C | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y cassandra

sudo sed -i -e "s/start_rpc: false/start_rpc: true/g" /etc/cassandra/cassandra.yaml
sudo sed -i -e "s/rpc_address: localhost/rpc_address: 0.0.0.0/g" /etc/cassandra/cassandra.yaml
sudo sed -i -e "s/# broadcast_rpc_address: 1.2.3.4/broadcast_rpc_address: 127.0.0.1/g" /etc/cassandra/cassandra.yaml
sudo service cassandra restart
