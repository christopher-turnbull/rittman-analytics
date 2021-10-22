with tags as (
    select 
        id,
        tag_name, 
        count, 
        excerpt_post_id, 
        wiki_post_id
    from `bigquery-public-data.stackoverflow.tags` 
)

select * from tags