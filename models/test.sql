#standardSQL
SELECT a.id, title, c files, answer_count answers, favorite_count favs,
view_count views, score
FROM `bigquery-public-data.stackoverflow.posts_questions` a
JOIN (
  SELECT CAST(REGEXP_EXTRACT(content,
r'stackoverflow.com/questions/([0-9]+)/') AS INT64) id, COUNT(*) c,
MIN(sample_path) sample_path
  FROM `fh-bigquery.github_extracts.contents_js`
  WHERE content LIKE '%stackoverflow.com/questions/%'
  GROUP BY 1
  HAVING id>0
  ORDER BY 2 DESC
  LIMIT 10
) b
ON a.id=b.id
ORDER BY c DESC