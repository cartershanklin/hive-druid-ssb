select
  sum(discounted_price)
from
  ssb_druid
where
  d_year = '1993' and
  lo_discount >= 1.0 and
  lo_discount <= 3.0 and
  lo_quantity < 25.0 and
  `__time` < cast("1994-01-01" as date) and
  `__time` >= cast("1992-12-31" as date);
