# Docker Compose Spark Cluster

# General

Admittedly borrowed a lot of the Spark deployment scripts from https://github.com/big-data-europe/docker-spark, but I did the networking myself, I've developed this for learning and development purposes (I want to play with Spark but also get more hands on with networks as I come from a family of network engineers and we lack this in _insert-your-cloud-provider-here_-land). I miss the days of working with hardware switches, bridges .etc. You're basically going to be stuck with a cluster of three workers, but hey it's still a cluster.

Anyway, presenting a standalone spark cluster for development and testing purposes which will create the following containers...

| container      | Ip address |
| -------------- | ---------- |
| spark-master   | 10.5.0.2   |
| spark-worker-1 | 10.5.0.3   |
| spark-worker-2 | 10.5.0.4   |
| spark-worker-3 | 10.5.0.5   |


## Clone and launch

To get started _right now_ $`git clone https://github.com/mmacheerpuppy/DockerSparkCluster && ./DockerComposeSparkCluster/build`

## To build a spark cluster

Run `build.sh`. To validate the cluster is running visit 10.5.0.2:8080, which becomes accessible due to the `docker0` bridge adapter. 

## To tear down a spark cluster

Run `destroy.sh`

# Resource Allocation

This cluster is shipped with three workers and one spark master, each of these has a particular set of RAM and CPU resource allocations extrapolated out to `env/spark-worker.sh`.

# Creating a Scala spark app

To validate the distributed nature of the cluster we can start an application as follows...

## Binded Volumes

It's important to note the docker-compose.yml binds the following volumes shared across _all_ the containers spawned (so master and the three workers).

| Host Mount      | Container Mount | Purposse                                                       |
| --------------- | --------------- | -------------------------------------------------------------- |
| /mnt/spark-apps | /opt/spark-apps | Used to make available your app's jars on all workers & master |
| /mnt/spark-data | /opt/spark-data | Used to make available your app's data on all workers & master |

## Ship it

To **spark-submit** copy your application bundle into all workers by inserting your application and config to the docker volumes shared across all hosts. Your application should be inserted to `/mnt/spark-apps`, and your input files into `/mnt/spark-files`. There is no Pyspark support as of yet. There is a template spark-submit `/spark-submit/template-app.sh` containing an example shell script which you can use to direct the master-node to your JAR and main class by a docker-run call to the network.
