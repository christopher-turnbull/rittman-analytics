with users as (
    
    select 
        id, 
        display_name, 
        about_me, 
        age, 
        creation_date, 
        last_access_date,
        location, 
        reputation, 
        up_votes, 
        down_votes,
        views, 
        profile_image_url, 
        website_url

    from `bigquery-public-data.stackoverflow.users`
    
    )

select * from users