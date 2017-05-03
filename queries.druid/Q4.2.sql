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
