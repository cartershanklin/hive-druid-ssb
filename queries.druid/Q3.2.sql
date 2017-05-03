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
