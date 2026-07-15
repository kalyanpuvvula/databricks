select s.student_name, c.course_name
from students s
left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id;
select c.course_name
from courses c
left join enrollments e
on c.course_id = e.course_id
where e.student_id is NULL;
select i.instructor_name, c.course_name
from instructors i
left join courses c
on i.instructor_id = c.instructor_id;
select course_name
from courses
where instructor_id is NULL;
select s.student_name, e.course_id, e.enrollment_date
from students s
right join enrollments e
on s.student_id = e.student_id;
select s.student_name
from students s
left join enrollments e
on s.student_id = e.student_id
where e.course_id is NULL;
select s.student_name, e.course_id, e.enrollment_date
from students s
left join enrollments e
on s.student_id = e.student_id
union
select s.student_name, e.course_id, e.enrollment_date
from students s
right join enrollments e
on s.student_id = e.student_id;
select c.course_name
from courses c
left join enrollments e
on c.course_id = e.course_id
where e.course_id is NULL;
select i.instructor_name, c.course_name
from instructors i
left join courses c
on i.instructor_id = c.instructor_id
union
select i.instructor_name, c.course_name
from instructors i
right join courses c
on i.instructor_id = c.instructor_id;
select s.student_name,
       c.course_name,
       i.instructor_name
from students s
left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id
left join instructors i
on c.instructor_id = i.instructor_id;