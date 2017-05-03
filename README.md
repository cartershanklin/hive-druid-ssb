# Star Schema Benchmark using the Hive / Druid Integration

Pre-requisites to running this:
* Functional Druid cluster.
* A version of Hive that supports the Druid Storage Handler. This includes Apache Hive version 2.2 or later, or Hortonworks Data Platform (HDP) 2.6 or later.
* Apache Maven and gcc, for the data generator.

Before continuing, identify these things:
* Your desired data scale, in gigabytes. For example, a scale of 1000 equals about a TB of data
* Your HiveServer2 host:port
* The Druid overlord host
* The username and password for your Druid metadata database

Process:
* Build the data generator (native code)
* Package the data generator in a JAR file capable of being run as a MapReduce job to generate data within a Hadoop cluster
* Run a MapReduce job to generate "CSV" data within HDFS
* Run a Hive job to convert this "CSV" data into Hive tables
* Run a Hive job to push pre-aggregated data into Druid. This step may require you to create additional HDFS directories and set permissions if you're not using HDP.

If all goes well, you only run 2 commands:
1) sh 00prepare.sh [scale] [hiveserver2:port] [overlord] [username] [password]
2) sh 00run.sh [hiveserver2:port]

Example to run at scale 100:

    sh 00prepare.sh 100 localhost:10500 localhost druid password
    sh 00run.sh localhost:10500

Example at scale 500:

    sh 00prepare.sh 500 hive.example.com:10500 druid.example.com druid password
    sh 00run.sh hive.example.com:10500
