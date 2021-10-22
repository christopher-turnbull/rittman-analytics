with post_answers as (
    select
        id,
        body,
        comment_count, 
        community_owned_date, 
        creation_date, 
        last_activity_date,
        last_edit_date,
        last_editor_display_name,
        last_editor_user_id,
        owner_display_name,
        owner_user_id, 
        parent_id,
        post_type_id ,
        score,

    from `bigquery-public-data.stackoverflow.posts_answers`
)

select * from post_answers