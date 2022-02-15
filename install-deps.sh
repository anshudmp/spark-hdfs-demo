#!/bin/bash
echo "deb http://deb.debian.org/debian/ sid main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
sudo apt install -y wget
wget -c https://archive.apache.org/dist/spark/spark-3.2.1/spark-3.2.1-bin-hadoop2.7.tgz -O - | tar -xz
wget -c https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz -O - | tar -xz
curr_dir=$PWD
echo "export SPARK_HOME=${curr_dir}/spark-3.2.1-bin-hadoop2.7" >> ~/.bashrc
echo "export HADOOP_HOME=${curr_dir}/hadoop-3.3.1" >> ~/.bashrc
echo "export HADOOP_CONF_DIR=${curr_dir}/hadoop/conf" >> ~/.bashrc
#source ~/.bashrc
