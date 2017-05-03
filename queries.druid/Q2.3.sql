select 
    sum(lo_revenue) as lo_revenue, d_year, p_brand1
from
    ssb_druid
where 
    p_brand1 = 'MFGR#2239'
    and s_region = 'EUROPE'
group by 
    d_year, p_brand1;
