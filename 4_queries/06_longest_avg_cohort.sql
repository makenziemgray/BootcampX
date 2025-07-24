SELECT cohorts.name,
       AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE completed_at IS NOT NULL AND started_at IS NOT NULL
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;