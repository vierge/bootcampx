SELECT students.name as student, sum(duration) / count(duration) as average_completion_time
FROM assignment_submissions
JOIN students ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_completion_time DESC;