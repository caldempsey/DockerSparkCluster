FROM java:8-jdk-alpine
# From https://gist.github.com/gyndav/c8d65b59793566ee73ed2aa25aa10497

ARG SPARK_VERSION

ENV DAEMON_RUN=true
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
      apk add --no-cache bash curl jq && \
      cd "/tmp" && \
      wget --no-verbose "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
      tar xzf "scala-${SCALA_VERSION}.tgz" && \
      mkdir "${SCALA_HOME}" && \
      rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
      mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
      ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
      apk del .build-dependencies && \
      rm -rf "/tmp/"*

RUN export PATH="/usr/local/sbt/bin:$PATH" &&  apk update && apk add ca-certificates wget tar && mkdir -p "/usr/local/sbt" && wget -qO - --no-check-certificate "https://cocl.us/sbt-0.13.16.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && sbt sbtVersion

