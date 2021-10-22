with t1 as (
    select
        id,
        view_count,
        score,
        answer_count,
        comment_count,
        tag,
        case when accepted_answer_id is null then 0 else 1 end as answered,
        answer_score,
        question_creation_datetime,
        question_creation_date,
        question_creation_day,
        question_creation_week,
        question_creation_month,
        question_creation_quarter,
        question_creation_year,
        answer_creation_datetime
    from {{ref('fact_questions')}}
    ),

    thing as (
        select 
            question_creation_date,
            tag,
            count(id) as question_count,
            sum(answered) as answer_count,
            round(sum(answered)/count(id),3) as total_answered_rate
        from t1
        group by 1,2
    )

select * from thing
order by 1 desc,3 desc