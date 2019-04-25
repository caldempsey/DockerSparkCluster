FROM java:8-jdk-alpine
# From https://gist.github.com/gyndav/c8d65b59793566ee73ed2aa25aa10497

ENV DAEMON_RUN=true
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala
# Add bash
RUN apk update && apk upgrade && apk add bash && apk add tar
COPY install-spark.sh /tmp
RUN chmod +x /tmp/install-spark.sh
RUN /tmp/install-scala.sh
RUN rm -rf /tmp/install-spark.sh