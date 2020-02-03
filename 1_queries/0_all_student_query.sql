SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name ASC;

SELECT count(id)
FROM students
WHERE cohort_id <= 3;

SELECT name, id, cohort_id
FROM students
WHERE phone IS NULL 
OR email IS NULL
ORDER BY name;

SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%@gmail.com'
AND phone IS NULL;

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

SELECT name, email, phone
FROM students
WHERE end_date IS NOT NULL
AND github IS NULL;