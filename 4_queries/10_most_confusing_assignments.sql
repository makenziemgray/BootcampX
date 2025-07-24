SELECT assignments.id,
       assignments.name,
       assignments.day,
       assignments.chapter,
       COUNT(*) AS total_requests
FROM assistance_requests
JOIN assignments ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id, assignments.name, assignments.day, assignments.chapter
ORDER BY total_requests DESC;