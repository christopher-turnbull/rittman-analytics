with users as (
    select * from {{ref('users')}}
)

select 
    location, 
    count(*) as total_users
from users
where date(last_access_date) > date('2021-01-01')
group by 1