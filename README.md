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
