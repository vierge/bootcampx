const { Pool } = require('pg');
const args = process.argv.slice(2);



const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`
const cohortName =  args[0];
const limit = args[1] || 5;
const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort!`);
  });
})
.catch(err => console.error('query error', err.stack));