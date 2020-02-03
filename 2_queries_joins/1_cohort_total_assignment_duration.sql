-- GET total time spent on assignments from a signle cohort

SELECT sum(duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';