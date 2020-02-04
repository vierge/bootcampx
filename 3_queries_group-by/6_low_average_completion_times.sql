SELECT students.name as student_name, avg(assignment_submissions.duration) as avg_completion_time, avg(assignments.duration) as avg_expected_duration
FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL 
GROUP BY student_name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg_completion_time ASC;