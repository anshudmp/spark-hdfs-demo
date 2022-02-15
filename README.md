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
Edit the masters and slaves/workers template accordingly.
```
6. Broadcast the template changes done above to /etc/hadoop/ (HADOOP_CONF_DIR) of all nodes.
7. Format the namenode.
```
hdfs namenode -format
```
8. Start hadoop system from within hadoop home directory
```
./sbin/start-all.sh
```
9. Generate large file (4.8 GB default)
```
sh genLarFile.sh
```
10. Create distributed input directory
```
hdfs dfs -mkdir -p /dfs/input
```
11. Put the generated large file on DFS
```
hdfs dfs -put test.txt /dfs/input/
```
12. Copy workers from within hadoop_templates directory (on all nodes):
```
cp workers ../spark-3.2.1-bin-hadoop2.7/conf/
```
13. Go to spark-3.2.1-bin-hadoop2.7/conf and execute below (Only for master):
```
cp spark-env.sh.template spark-env.sh
Add SPARK_MASTER_HOST='10.182.0.4' (modify master IP accordingly)
```
14. From master node execute the below command for spark home directory:
```
./sbin/start-all.sh
```
15. Create a tunnel like below to access Spark UI on local PC (first one is internal IP and second is public IP). Once executed go to localhost:8080 on local PC.
```
ssh -L 8080:10.182.0.4:8080 -i google_compute_engine anshudmp@34.125.147.249
```
16. From the spark home directory, execute the following code for Java Word Count problem (change the path/IP accordingly):
```
./bin/spark-submit \
    --deploy-mode client \
    --master spark://10.182.0.4:7077 \
    --class org.apache.spark.examples.JavaWordCount \
    /home/anshudmp/spark-hdfs-demo/spark-3.2.1-bin-hadoop2.7/examples/jars/spark-examples_2.12-3.2.1.jar hdfs://10.182.0.4:9000/dfs/input/test.txt
```
