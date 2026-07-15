## SQL JOIN Assignment

## Overview
This assignment demonstrates different SQL JOIN operations using a Student Management System database.

## Tables Used
- Students
- Courses
- Enrollments
- Instructors

## Concepts Covered
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- Finding unmatched records
- Combining data from multiple tables

## Queries Included
1. Students and enrolled courses  
2. Courses with no students  
3. Instructors and assigned courses  
4. Courses without instructors  
5. RIGHT JOIN example  
6. Students not enrolled in any course  
7. FULL OUTER JOIN between students and enrollments  
8. Courses never enrolled  
9. FULL OUTER JOIN between instructors and courses  
10. Student, course, and instructor report  

## Note
MySQL does not support `FULL OUTER JOIN` directly.  
So it is implemented using:

```sql
LEFT JOIN + UNION + RIGHT JOIN
```

## Technologies Used
- MySQL
- SQL
