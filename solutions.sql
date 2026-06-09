-- Listing all students
Select * from students;

-- Listing students with their enrolled courses
Select students.student_id, students.first_name, students.last_name, enrollments.course_id, courses.course_name from students 
JOIN enrollments on students.student_id = enrollments.student_id
JOIN courses on enrollments.course_id = courses.course_id

-- Listing all courses with instructor names
Select courses.course_name, CONCAT(instructors.first_name,' ',instructors.last_name) AS instructor_name 
from courses JOIN instructors on courses.instructor_id = instructors.instructor_id

--Counting students per course
Select courses.course_name, COUNT(*) AS student_quantity from enrollments
JOIN courses on enrollments.course_id = courses.course_id
GROUP BY courses.course_name

-- Finding courses with no students
Select courses.course_id, courses.course_name, enrollments.course_id from courses
LEFT JOIN enrollments on enrollments.course_id = courses.course_id WHERE enrollments.course_id IS NULL

-- Finding students with no enrollments
Select students.student_id, CONCAT(students.first_name,' ',students.last_name) AS student_name from students
LEFT JOIN enrollments on enrollments.student_id = students.student_id WHERE enrollments.student_id IS NULL


