SELECT cohorts.name as cohort, avg(completed_at - started_at) as assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY assistance_time DESC
LIMIT 1;