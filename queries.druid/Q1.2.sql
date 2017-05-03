select
    sum(discounted_price) as revenue
from
    ssb_druid
where 
    d_yearmonthnum = '199401'
    and lo_discount >= '4.0'
    and lo_discount <= '6.0'
    and lo_quantity >= '26.0'
    and lo_quantity <= '35.0';
