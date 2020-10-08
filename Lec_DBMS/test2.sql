-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tbl_student Table Create SQL
CREATE TABLE tbl_student
(
    stu_uid        INT             NOT NULL, 
    stu_name       VARCHAR2(20)    NOT NULL, 
    stu_age        NUMBER          NULL, 
    stu_profno     NUMBER          NULL, 
    stu_hobby      VARCHAR2(20)    NULL, 
    stu_regdate    DATE            NULL, 
    CONSTRAINT TBL_STUDENT_PK PRIMARY KEY (stu_uid)
);
/

CREATE SEQUENCE tbl_student_SEQ
START WITH 1
INCREMENT BY 1;
/

SELECT * FROM tbl_student;

CREATE OR REPLACE TRIGGER tbl_student_AI_TRG
BEFORE INSERT ON tbl_student 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_student_SEQ.NEXTVAL
    INTO :NEW.stu_uid
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_student_AI_TRG;
/

--DROP SEQUENCE tbl_student_SEQ;
/

COMMENT ON TABLE tbl_student IS '학생테이블'
/

COMMENT ON COLUMN tbl_student.stu_uid IS '학생고유번호'
/

COMMENT ON COLUMN tbl_student.stu_name IS '학생이름'
/

COMMENT ON COLUMN tbl_student.stu_age IS '나이'
/

COMMENT ON COLUMN tbl_student.stu_profno IS '담당교수번호'
/

COMMENT ON COLUMN tbl_student.stu_hobby IS '취미'
/

COMMENT ON COLUMN tbl_student.stu_regdate IS '등록일'
/