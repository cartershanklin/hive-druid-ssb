#!/bin/sh

SCALE=${1:-2}
HS2=${2:-localhost:10000}
DRUID_HOST=${3:-$(hostname)}
DRUID_USERNAME=${4:-druid}
DRUID_PASSWORD=${5:-password}
BEELINE_RAW="beeline -u jdbc:hive2://$HS2/ssb_${SCALE}_raw"
BEELINE_ORC="beeline -u jdbc:hive2://$HS2/ssb_${SCALE}_flat_orc"

$BEELINE_ORC -f queries.druid/index_ssb.sql --hivevar DRUID_HOST=${DRUID_HOST} --hivevar DRUID_USERNAME=${DRUID_USERNAME} --hivevar DRUID_PASSWORD=${DRUID_PASSWORD} --hivevar SCALE=${SCALE} -n ${USER}
