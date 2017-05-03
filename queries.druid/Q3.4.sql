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
