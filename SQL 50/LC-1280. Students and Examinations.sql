-- SELECT s.student_id, s.student_name, subject_name, COUNT(subject_name) AS attended_exams
-- FROM Students s
-- FULL OUTER JOIN
-- (SELECT sub.subject_name AS subject_name, e.student_id AS student_id
-- from Subjects sub
-- LEFT JOIN Examinations e
-- ON sub.subject_name = e.subject_name) temp
-- ON s.student_id = temp.student_id
-- GROUP BY s.student_id, s.student_name, subject_name;

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON sub.subject_name = e.subject_name AND s.student_id = e.student_id
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
