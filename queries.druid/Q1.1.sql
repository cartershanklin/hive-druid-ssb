select
    sum(discounted_price)
from
    ssb_druid
where
    d_year = '1993'
    and lo_discount >= '1.0'
    and lo_discount <= '3.0'
    and lo_quantity < '25.0';
