
/* Drop Tables */

DROP TABLE TBL_Student CASCADE CONSTRAINTS;
DROP TABLE TBL_Department CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE TBL_Department
(
	dept_uid number NOT NULL,
	dept_name varchar2(20) NOT NULL,
	dept_office varchar2(20) NOT NULL,
	PRIMARY KEY (dept_uid)
);


CREATE TABLE TBL_Student
(
	stu_uid number NOT NULL,
	stu_name varchar2(20) NOT NULL,
	stu_grade number default 1,
	dept_uid number NOT NULL,
	stu_regdate date default sysdate,
	PRIMARY KEY (stu_uid)
);



/* Create Foreign Keys */

ALTER TABLE TBL_Student
	ADD FOREIGN KEY (dept_uid)
	REFERENCES TBL_Department (dept_uid)
;

SELECT * FROM TBL_STUDENT;
SELECT * FROM TBL_DEPARTMENT;

