set hive.druid.metadata.username=${DRUID_USERNAME};
set hive.druid.metadata.password=${DRUID_PASSWORD};
set hive.druid.metadata.uri=jdbc:mysql://${DRUID_HOST}/druid;
set hive.druid.indexer.partition.size.max=1000000;
set hive.druid.indexer.memory.rownum.max=100000;
set hive.druid.broker.address.default=${DRUID_HOST}:8082;
set hive.druid.coordinator.address.default=${DRUID_HOST}:8081;
set hive.druid.storage.storageDirectory=/apps/hive/warehouse;
set hive.tez.container.size=1024;
set hive.druid.passiveWaitTimeMs=180000;

CREATE TABLE ssb_druid
STORED BY 'org.apache.hadoop.hive.druid.DruidStorageHandler'
TBLPROPERTIES (
  "druid.datasource" = "ssb_druid",
  "druid.segment.granularity" = "MONTH",
  "druid.query.granularity" = "DAY")
AS
SELECT
  cast(d_year || '-' || d_monthnuminyear || '-' || d_daynuminmonth as timestamp) as `__time`,
  cast(c_city as string) c_city,
  cast(c_nation as string) c_nation,
  cast(c_region as string) c_region,
  cast(d_weeknuminyear as string) d_weeknuminyear,
  cast(d_year as string) d_year,
  cast(d_yearmonth as string) d_yearmonth,
  cast(d_yearmonthnum as string) d_yearmonthnum,
  cast(lo_discount as string) lo_discount,
  cast(lo_quantity as string) lo_quantity,
  cast(p_brand1 as string) p_brand1,
  cast(p_category as string) p_category,
  cast(p_mfgr as string) p_mfgr,
  cast(s_city as string) s_city,
  cast(s_nation as string) s_nation,
  cast(s_region as string) s_region,
  lo_revenue,
  lo_extendedprice * lo_discount discounted_price,
  lo_revenue - lo_supplycost net_revenue
FROM
  ssb_${SCALE}_flat_orc.customer, ssb_${SCALE}_flat_orc.dates, ssb_${SCALE}_flat_orc.lineorder,
  ssb_${SCALE}_flat_orc.part, ssb_${SCALE}_flat_orc.supplier
where
  lo_orderdate = d_datekey and lo_partkey = p_partkey
  and lo_suppkey = s_suppkey and lo_custkey = c_custkey;
