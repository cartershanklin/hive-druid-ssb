set -e
SCALE=1000
make 
hadoop  jar target/ssb-gen-1.0-SNAPSHOT.jar -d /tmp/ssb/${SCALE}/ -s ${SCALE}
hive -e "create database ssb_${SCALE}_raw; create database ssb_${SCALE}_orc; create database ssb_${SCALE}_flat_orc;"

hive --database ssb_${SCALE}_raw -d LOCATION=/tmp/ssb/${SCALE} -f ddl/text.sql

hive --database ssb_${SCALE}_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/orc.sql
hive --database ssb_${SCALE}_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/analyze.sql 

hive --database ssb_${SCALE}_flat_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/orc_flat.sql
hive --database ssb_${SCALE}_flat_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/analyze_flat.sql;
