# spark-hdfs-demo
A project for execution of Word Count problem on Spark by referring data stored on hdfs.

# Steps
1. Install Git
```
sudo apt update
sudo apt install -y git
```
2. Clone this repository
```
git clone https://github.com/anshudmp/spark-hdfs-demo.git
```
3. Run install-deps
```
cd spark-hdfs-demo
sh install-deps.sh
source ~/.bashrc
```
4. Create SSH keys and copy the public key over master and slave for hdfs operations. After this step, ssh to VM instances using internal IP (without password) should work fine.
```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
```
5. Modify the template files according to Internal IP of master and slave nodes.
```
In core-site.html, fs.default.name should point to correct master.
In hdfs-site.xml, make sure the name and data directories exist, else create them.
Modify dfs.replication in hdfs-site.xml based on need.
In mapred-site.xml, correct the master IP for mapred.job.tracker property.
Edit the masters and slaves template accordingly.
```
6. Broadcast the template changes done above to /etc/hadoop/ (HADOOP_CONF_DIR) of all nodes.
7. Format the namenode.
```
hdfs namenode -format
```
