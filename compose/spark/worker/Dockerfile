ARG FROM_IMAGE

FROM ${FROM_IMAGE}

COPY start-worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
# Connect to spark master through Docker host (which will be assigned by Docker to "hostfile" on creation of network bridge).
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

CMD ["/bin/bash", "/start-worker.sh"]
