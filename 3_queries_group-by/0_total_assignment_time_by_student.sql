-- GET the total submitted assignments by currently enrolled students

SELECT students.name as student, count(assignment_submissions.id) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.id) < 100;