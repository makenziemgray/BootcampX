const { Pool } = require('pg');

// PostgreSQL connection setup
const pool = new Pool({
  user: 'YOUR_DB_USER',         // replace with your DB user
  password: 'YOUR_DB_PASSWORD', // replace with your DB password
  host: 'localhost',
  database: 'bootcampx'
});

// Get cohort name and limit from command-line arguments
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

// Safe parameterized SQL query
const queryString = `
  SELECT students.id AS student_id,
         students.name AS name,
         cohorts.name AS cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
`;

const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.name} has an id of ${row.student_id} and was in the ${row.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));