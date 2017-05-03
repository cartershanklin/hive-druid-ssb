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
