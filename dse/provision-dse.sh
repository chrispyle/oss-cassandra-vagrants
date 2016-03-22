#!/bin/bash

sudo apt-get update
sudo apt-get install dse-full=4.0.3-1 dse=4.0.3-1 dse-hive=4.0.3-1 dse-pig=4.0.3-1 dse-demos=4.0.3-1 dse-libsolr=4.0.3-1 dse-libtomcat=4.0.3-1 dse-libsqoop=4.0.3-1 dse-liblog4j=4.0.3-1 dse-libmahout=4.0.3-1 dse-libhadoop-native=4.0.3-1 dse-libcassandra=4.0.3-1 dse-libhive=4.0.3-1 dse-libpig=4.0.3-1 dse-libhadoop=4.0.3-1

sudo sed -i -e "s/start_rpc: false/start_rpc: true/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/rpc_address: localhost/rpc_address: 0.0.0.0/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/# broadcast_rpc_address: 1.2.3.4/broadcast_rpc_address: 127.0.0.1/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/SOLR_ENABLED=0/SOLR_ENABLED=1/g" /etc/default/dse
sudo service dse restart
