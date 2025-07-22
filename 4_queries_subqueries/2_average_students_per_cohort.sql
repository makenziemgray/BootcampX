SELECT AVG(total_students) AS average_students
FROM (
  SELECT COUNT(students.*) AS total_students
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.id
) AS totals_table;