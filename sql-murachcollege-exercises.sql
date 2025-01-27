--Murach College
USE MurachCollege

--Chapter 4

--Exercise 8

/*
Write a SELECT statement that returns these columns:
InstructorDept The DepartmentName column from the Departments 
table for an instructor
LastName The LastName column from the Instructors table
FirstName The FirstName column from the Instructors table
CourseDescription The CourseDescription column from the Courses 
table
CourseDept The DepartmentName column from the Departments 
table for a courseReturn one row for each course that’s in a different department than the department 
of the instructor assigned to teach that course. (Hint: You will need to join the 
Departments table to both the Instructors table and the Courses table, which will 
require you to use table aliases to distinguish the two tables.)
Departments 8 Instructors 16 Courses 25*/

SELECT *
	FROM Courses C
	JOIN Departments D
	ON C.DepartmentID = D.DepartmentID
	JOIN Instructors I
	ON D.DepartmentID = I.DepartmentID
	ORDER BY I.InstructorID;

SELECT CourseDescription, D1.DepartmentName AS CourseDept, 
	LastName + ', ' + FirstName AS InstructorName,
	D2.DepartmentName AS InstructorDept
	FROM Courses C
	JOIN Departments D1
	ON C.DepartmentID = D1.DepartmentID
	JOIN Instructors I
	ON C.InstructorID = I.InstructorID
	JOIN Departments D2
	ON I.DepartmentID = D2.DepartmentID
	WHERE D1.DepartmentID <> D2.DepartmentID

--Any Instructors who aren't assigned a course?

SELECT LastName + ', ' + FirstName AS InstructorName, CourseDescription
	FROM Instructors I
	LEFT JOIN Courses C
	ON I.InstructorID = C.InstructorID
	WHERE CourseDescription IS NULL

