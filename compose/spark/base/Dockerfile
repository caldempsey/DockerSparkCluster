FROM java:8-jdk-alpine
# From https://gist.github.com/gyndav/c8d65b59793566ee73ed2aa25aa10497
ARG SPARK_VERSION
ENV SPARK_VERSION=$SPARK_VERSION
ENV DAEMON_RUN=true
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala
# Add bash
RUN apk update && apk upgrade && apk add bash && apk add tar
# Install Scala
COPY install-scala.sh /tmp
RUN chmod +x /tmp/install-scala.sh && /tmp/install-scala.sh && rm -rf /tmp/install-scala.sh
# Install Spark
COPY install-spark.sh /tmp
RUN chmod +x /tmp/install-spark.sh && /tmp/install-spark.sh && rm -rf /tmp/install-spark.sh
# Post install PythonHashSeedFix, this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
