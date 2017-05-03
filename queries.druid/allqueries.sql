select
    sum(discounted_price)
from
    ssb_druid
where
    d_year = '1993'
    and lo_discount >= '1.0'
    and lo_discount <= '3.0'
    and lo_quantity < '25.0';

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

select
    sum(discounted_price) as revenue
from
    ssb_druid
where 
    d_weeknuminyear = '6'
    and d_year = '1994'
    and lo_discount >= '5.0'
    and lo_discount <= '7.0'
    and lo_quantity >= '26.0'
    and lo_quantity <= '35.0';

select 
    sum(lo_revenue) as lo_revenue, d_year, p_brand1
from 
    ssb_druid
where 
    p_category = 'MFGR#12'
    and s_region = 'AMERICA'
group by d_year, p_brand1;

select 
    sum(lo_revenue) as lo_revenue, d_year, p_brand1
from 
    ssb_druid
where 
    p_brand1 >= 'MFGR#2221'
    and p_brand1 <= 'MFGR#2228'
    and s_region = 'ASIA'
group by 
    d_year, p_brand1;

select 
    sum(lo_revenue) as lo_revenue, d_year, p_brand1
from
    ssb_druid
where 
    p_brand1 = 'MFGR#2239'
    and s_region = 'EUROPE'
group by 
    d_year, p_brand1;

select 
    c_nation, s_nation, d_year,
    sum(lo_revenue) as lo_revenue
from
    ssb_druid
where 
    c_region = 'ASIA'
    and s_region = 'ASIA'
    and d_year >= '1992' and d_year <= '1997'
group by 
    c_nation, s_nation, d_year;

select 
    c_city, s_city, d_year, sum(lo_revenue) as lo_revenue
from
    ssb_druid
where 
    c_nation = 'UNITED STATES'
    and s_nation = 'UNITED STATES'
    and d_year >= '1992' and d_year <= '1997'
group by 
    c_city, s_city, d_year;

select 
    c_city, s_city, d_year, sum(lo_revenue) as lo_revenue
from
    ssb_druid
where 
    ( c_city='UNITED KI1' or c_city='UNITED KI5' )
    and ( s_city='UNITED KI1' or s_city='UNITED KI5' )
    and d_year >= '1992' and d_year <= '1997'
group by 
    c_city, s_city, d_year;

select 
    c_city, s_city, d_year, sum(lo_revenue) as lo_revenue
from
    ssb_druid
where 
    (c_city='UNITED KI1' or c_city='UNITED KI5')
    and (s_city='UNITED KI1' or s_city='UNITED KI5')
    and d_yearmonth = 'Dec1997'
group by 
    c_city, s_city, d_year;

select 
    d_year, c_nation,
    sum(net_revenue) as profit
from
    ssb_druid
where 
    c_region = 'AMERICA'
    and s_region = 'AMERICA'
    and (p_mfgr = 'MFGR#1' or p_mfgr = 'MFGR#2')
group by 
    d_year, c_nation;

select 
    d_year, s_nation, p_category,
    sum(net_revenue) as profit
from
    ssb_druid
where 
    c_region = 'AMERICA'
    and s_region = 'AMERICA'
    and (d_year = '1997' or d_year = '1998')
    and (p_mfgr = 'MFGR#1' or p_mfgr = 'MFGR#2')
group by 
    d_year, s_nation, p_category;

select 
    d_year, s_city, p_brand1,
    sum(net_revenue) as profit
from
    ssb_druid
where 
    c_region = 'AMERICA'
    and s_nation = 'UNITED STATES'
    and (d_year = '1997' or d_year = '1998')
    and p_category = 'MFGR#14'
group by 
    d_year, s_city, p_brand1;

