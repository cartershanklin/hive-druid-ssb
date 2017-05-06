select
  sum(discounted_price) as revenue
from
  ssb_druid
where
  d_weeknuminyear = '6' and
  d_year = '1994' and
  lo_discount >= 5.0 and
  lo_discount <= 7.0 and
  lo_quantity >= 26.0 and
  lo_quantity <= 35.0 and
  `__time` < cast("1995-01-01" as date) and
  `__time` >= cast("1993-12-31" as date);
