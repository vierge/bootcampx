const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teacher ASC;
`
const cohortName = args[0];

const values = [`${cohortName}`];


pool.query(queryString, values)
.then(res => {
  res.rows.forEach(teachers => {
    console.log(`${teachers.cohort}: ${teachers.teacher}`);
  })
})
.catch(err => {
  console.error('query error', err.stack);
});