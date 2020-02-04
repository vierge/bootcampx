-- GET list of cohorts bigger than 17 students

SELECT cohorts.name as name, count(students.id) as total_students
FROM cohorts
JOIN students ON cohort_id = students.cohort_id
WHERE cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(students.id) >= 18
ORDER BY total_students ASC;