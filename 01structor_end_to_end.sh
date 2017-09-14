#!/bin/sh

sudo systemctl restart hive2-server2
/vagrant/modules/maven/files/install_maven_manually.sh
source /vagrant/modules/maven/files/maven.sh
sh 00datagen.sh 2 druid.example.com:10000
sh 00load.sh 2 druid.example.com:10000 druid.example.com druid vagrant
sh 00run.sh druid.example.com:10000
