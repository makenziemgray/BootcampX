SELECT cohorts.name AS cohort,
       SUM(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE completed_at IS NOT NULL AND started_at IS NOT NULL
GROUP BY cohorts.name
ORDER BY total_duration;