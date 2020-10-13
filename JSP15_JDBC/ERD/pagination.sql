-- SELECT 결과물 중 상위 5개만 출력해 보고 싶다면
-- ex) 게시판 페이징


-- DBMS마다 구현 다름
-- Mysql : LIMIT
-- MS SQL : TOP
-- OLACLE : ROWNUM

SELECT wr_uid, wr_subject, wr_name FROM TEST_WRITE;

SELECT ROWNUM, wr_uid, wr_subject, wr_name FROM TEST_WRITE;

SELECT ROWNUM, wr_uid, wr_subject, wr_name FROM TEST_WRITE ORDER BY wr_uid DESC;

SELECT ROWNUM, wr_uid, wr_subject, wr_name FROM TEST_WRITE 
WHERE ROWNUM <= 5
ORDER BY wr_uid DESC;

SELECT * FROM
(SELECT ROWNUM AS RNUM, T.* FROM 
(SELECT * FROM TEST_WRITE ORDER BY wr_uid DESC) T)
WHERE RNUM >= 1 AND RNUM < 6
;

-- 페이징 관련 세팅값
-- 현재 몇 페이지? 1, 2, 3 ...
-- 한 페이지에 몇개의 글이 리스트업 되나? ex) 5개의 글
-- 총 몇 페이지 분량인가?
-- 한 [페이징]에 몇개의 '페이지'를 표현할 것인가?

SELECT ROWNUM, ROWID, wr_uid FROM test_write WHERE ROWNUM < 5;
SELECT ROWNUM, ROWID, wr_uid FROM test_write WHERE ROWNUM < 5 ORDER BY wr_uid DESC;

DELETE FROM test_write 
WHERE ROWID IN (
	SELECT rwid FROM (
		SELECT ROWNUM AS rnum, rwid FROM
			(SELECT ROWID AS rwid FROM test_write)
        ORDER BY rwid
    )
WHERE rnum > 7);

SELECT * FROM test_write;
