-- GET the toal amount of time a studdent has spent on assigmments

SELECT sum(duration) as total_duration 
FROM assignment_submissions 
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';
