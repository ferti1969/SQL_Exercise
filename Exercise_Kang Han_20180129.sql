/*Exercise.*/
/*Update : 2018-01-29, Kang Han.*/

/*『SQL 전문가 가이드』에 따른 연습이다.*/

/*p.166 테이블 구조 확인*/
DESCRIBE CAEMP;

DESC CAEMP;

/*p.168 SELECT 문장을 통한 테이블 생성 사례*/
CREATE TABLE CAEMP_TEMP
AS SELECT * FROM CAEMP;

DESC CAEMP_TEMP;

/*p.169 ALTER TABLE*/
/*ADD COLUMN*/
ALTER TABLE CAEMP
ADD (MARRIAGE VARCHAR2(20));

DESC CAEMP;

/*DROP COLUMN*/
ALTER TABLE CAEMP
DROP COLUMN MARRIAGE;

DESC CAEMP;

/*p.176 ADD CONSTRAINT*/
ALTER TABLE CAEMP
ADD CONSTRAINT CAEMP_PK PRIMARY KEY (NAME);

DESC CAEMP;

/*p.186 DISTINCT 옵션*/
SELECT ALL JOB
FROM CAEMP;

SELECT JOB
FROM CAEMP;

SELECT DISTINCT JOB
FROM CAEMP;

SELECT CONCAT(NAME,' 씨') 직원명
FROM CAEMP;

SELECT NAME||' 씨' AS 선수명
FROM CAEMP;