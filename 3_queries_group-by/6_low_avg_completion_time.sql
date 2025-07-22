SELECT students.name AS student,
       AVG(assignment_submissions.duration) AS student_avg_duration,
       AVG(assignments.duration) AS assignment_avg_duration
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY student_avg_duration;


