#!/bin/sh

SCALE=${1:-2}
HS2=${2:-localhost:10000}
BEELINE="beeline -u jdbc:hive2://$HS2/default"
DRUID_HOST=${3:-$(hostname)}
DRUID_USERNAME=${4:-druid}
DRUID_PASSWORD=${5:-password}

# Don't do anything if the data is already loaded.
hdfs dfs -ls /apps/hive/warehouse/ssb_${SCALE}_flat_orc.db >/dev/null

if [ $? -ne 0 ];  then
	# Generate and optimize the Hive data.
	echo "Building the data generator"
	pushd ssb-gen
	make clean all

	echo "Generate the data at scale $SCALE"
	hadoop jar target/ssb-gen-1.0-SNAPSHOT.jar -d /tmp/ssb/${SCALE}/ -s ${SCALE}
	hive -e "create database ssb_${SCALE}_raw; create database ssb_${SCALE}_flat_orc;"
	hive --database ssb_${SCALE}_raw -d LOCATION=/tmp/ssb/${SCALE} -f ddl/text.sql
	hive --database ssb_${SCALE}_flat_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/orc_flat.sql
	hive --database ssb_${SCALE}_flat_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/analyze_flat.sql

	# Load the data into Druid.
	popd
	$BEELINE -f queries.druid/index_ssb.sql --hivevar DRUID_HOST=${DRUID_HOST} --hivevar DRUID_USERNAME=${DRUID_USERNAME} --hivevar DRUID_PASSWORD=${DRUID_PASSWORD} --hivevar SCALE=${SCALE}
else
	echo "SSB Data already loaded."
fi
