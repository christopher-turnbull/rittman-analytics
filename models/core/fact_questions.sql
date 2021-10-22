with questions as (
    select
        id,
        view_count,
        score,
        answer_count,
        comment_count,
        tags,
        accepted_answer_id,
        creation_date
    from {{ref('stg_post_questions')}}
    ),

    answers as (
        select 
            id as accepted_answer_id,
            score as answer_score,
            creation_date as answer_creation_datetime
        from {{ref('stg_post_answers')}}
    ),

    both as (
        select
            id,
            view_count,
            score,
            answer_count,
            comment_count,
            split(tags,'|') tags,
            accepted_answer_id,
            answer_score,
            creation_date as question_creation_datetime,
            answer_creation_datetime
        from questions
        left join answers using(accepted_answer_id)
    ),

    final as (
        select
            id,
            view_count,
            score,
            answer_count,
            comment_count,
            tag,
            accepted_answer_id,
            answer_score,
            question_creation_datetime ,
            extract(date from question_creation_datetime) question_creation_date,
            extract(day from question_creation_datetime) question_creation_day,
            extract(week from question_creation_datetime) question_creation_week,
            extract(month from question_creation_datetime) question_creation_month,
            extract(quarter from question_creation_datetime) question_creation_quarter,
            extract(year from question_creation_datetime) question_creation_year,
            answer_creation_datetime
        from both, unnest(tags) tag
    )

select * from final


