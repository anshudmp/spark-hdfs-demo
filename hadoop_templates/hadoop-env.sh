export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
export export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR}
