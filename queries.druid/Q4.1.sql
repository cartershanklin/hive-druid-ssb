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
