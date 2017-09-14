#!/bin/sh

SCALE=${1:-2}
TARGET=${2:-localhost:10000}
BEELINE="beeline -u jdbc:hive2://${TARGET}/default"

$BEELINE -f queries.druid/allqueries.sql
