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
