/*Exercise.*/
/*Update : 2018-03-03, Kang Han.*/

/* 아래는 『SQL 전문가 가이드』에 따른 연습이며,
강한이 개인적으로 만든 예제 데이터를 활용했습니다.*/

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

/*제3절 DML(DATA MANIPULATION LANGUAGE)에 해당되는 내용 연습.*/
DESC CAEMP;

SELECT *
FROM CAEMP;

/*p.182*/
SELECT *
FROM PLAYER;

DESC PLAYER;

INSERT INTO PLAYER
    (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO)
    VALUES ('2002007', '박지성', 'K07', 'MF', 178, 73, 7);

DESCRIBE CAEMP;

SELECT *
FROM CAEMP;

/*이하는 내가 만든 연습용 데이터를 활용한 연습이다.*/
INSERT INTO CAEMP
    (EMPNO, NAME, JOB, MGR, PHONE, EMAIL, ADDRESS, HIREDATE, RESIGNDATE, SAL, COMM, DEPTNO)
    VALUES(14, '박내일', 'REPORTER', 3, '010-0101-1010', 'parktomorrow@gmail.com', '경기도 양주시 고암길 306-40, 200동 501호', '18/02/02', NULL, 1500000, 250000, 2);

INSERT INTO CAEMP
    (EMPNO, NAME, JOB, MGR, PHONE, ADDRESS, SAL)
    VALUES (15, '김태인', 'EDITOR', 3, '010-8282-7979', '서울특별시 종로구 계동2길 22', 1500000);
/*위와 같이 SQL 문장을 작성해 실행할 경우, 오류가 발생한다.
이유는 오류 메시지를 잘 살펴보면 알 수 있다.
NOT NULL 속성이 지정된 'HIREDATE'가 입력에서 빠졌기 때문인 것으로 보인다.*/

INSERT INTO CAEMP
    (EMPNO, NAME, JOB, MGR, PHONE, ADDRESS, HIREDATE, SAL)
    VALUES (15, '김태인', 'EDITOR', 3, '010-8282-7979', '서울특별시 종로구 계동2길 22', '18/03/02', 1500000);
/*위와 같이 SQL 문장을 고치면 정상적으로 실행되는 것을 볼 수 있다.*/
    
INSERT INTO CAEMP
    VALUES(15, '김성경', 'EDITOR', 8, '010-1010-0101', 'kimbible@gmail.com', '서울특별시 은평구 불광로 111-01 101호', '18/02/02', NULL, 1500000, 250000, 1);
/*아직은 위의 SQL 문장과 같이 'EMPNO'에 이미 입력돼 있는 15를 중복해 넣어도 오류가 발생하지 않는다.*/

SELECT *
FROM CAEMP;

ROLLBACK;

SELECT *
FROM CAEMP;

/*p.183*/
INSERT INTO PLAYER
    VALUES ('2002010','이청용','K07','','BlueDragon','2002','MF','17',NULL,NULL,'1',180,69);

SELECT *
FROM PLAYER;

/*p.184*/
UPDATE PLAYER
SET BACK_NO = 99;

SELECT *
FROM PLAYER;

UPDATE PLAYER
SET POSITION = 'MF';

SELECT *
FROM PLAYER;

ROLLBACK;

SELECT *
FROM CAEMP;

UPDATE CAEMP
SET EMPNO = 99;

SELECT *
FROM CAEMP;

UPDATE CAEMP
SET JOB = 'REPORTER';

DELETE FROM CAEMP;

SELECT *
FROM CAEMP;

ROLLBACK;

/*p.185*/
DESC PLAYER;

SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO
FROM PLAYER;

SELECT *
FROM CAEMP;

SELECT EMPNO, NAME, JOB, SAL, COMM
FROM CAEMP;

/*p.186*/
SELECT ALL POSITION
FROM PLAYER;

SELECT POSITION
FROM PLAYER;

SELECT ALL JOB
FROM CAEMP;

SELECT JOB
FROM CAEMP;

SELECT DISTINCT POSITION
FROM PLAYER;

SELECT DISTINCT JOB
FROM CAEMP;

/*p.187*/
SELECT *
FROM PLAYER;

SELECT *
FROM CAEMP;

/*p.188*/

SELECT PLAYER_NAME AS 선수명, POSITION AS 위치, HEIGHT AS 키, WEIGHT AS 몸무게
FROM PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 위치, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER;

SELECT NAME AS 직원명, JOB AS 직책, HIREDATE AS 입사일, SAL AS 급여, COMM AS 상여
FROM CAEMP;

SELECT NAME 직원명, JOB 직책, HIREDATE 입사일, SAL 급여, COMM 상여
FROM CAEMP;

/*p.189*/
SELECT PLAYER_NAME "선수 이름", POSITION "그라운드 포지션", HEIGHT "키", WEIGHT "몸무게"
FROM PLAYER;

SELECT NAME "직원 이름", JOB "담당 업무", HIREDATE "입사 일자", SAL "급여", COMM "상여"
FROM CAEMP;

/*p.190*/
SELECT PLAYER_NAME 이름, HEIGHT - WEIGHT "키-몸무게"
FROM PLAYER;

SELECT NAME 직원명, SAL + COMM "실수령액"
FROM CAEMP;

SELECT PLAYER_NAME 이름, ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2) "BMI 비만지수"
FROM PLAYER;

SELECT NAME 직원명, (SAL + COMM)*12 연봉
FROM CAEMP;

SELECT PLAYER_NAME || '선수,' || HEIGHT || 'cm,' || WEIGHT || 'kg' 체격정보
FROM PLAYER;