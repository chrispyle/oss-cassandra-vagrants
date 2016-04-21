#!/bin/bash

DSE_VERSION=4.8.5-1
sudo apt-get update
sudo apt-get install dse-full=$DSE_VERSION dse=$DSE_VERSION dse-hive=$DSE_VERSION dse-pig=$DSE_VERSION dse-demos=$DSE_VERSION dse-libsolr=$DSE_VERSION dse-libtomcat=$DSE_VERSION dse-libsqoop=$DSE_VERSION dse-liblog4j=$DSE_VERSION dse-libmahout=$DSE_VERSION dse-libhadoop-native=$DSE_VERSION dse-libcassandra=$DSE_VERSION dse-libhive=$DSE_VERSION dse-libpig=$DSE_VERSION dse-libhadoop=$DSE_VERSION

sudo sed -i -e "s/start_rpc: false/start_rpc: true/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/rpc_address: localhost/rpc_address: 0.0.0.0/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/# broadcast_rpc_address: 1.2.3.4/broadcast_rpc_address: 127.0.0.1/g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s/SOLR_ENABLED=0/SOLR_ENABLED=1/g" /etc/default/dse
sudo service dse restart
