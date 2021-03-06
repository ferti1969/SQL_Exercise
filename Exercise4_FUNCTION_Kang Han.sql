/*Exercise4_FUNCTION 함수
Update : 2018-02-24, Kang Han.

아래의 SQL은 『SQL 전문가 가이드』에 따른 연습입니다.*/

/*p.230 _ DUAL table*/
DESC DUAL;

SELECT *
FROM DUAL;

/*p.229 _ 단일행 문자형 함수 예제*/
SELECT LOWER('SQL Expert')
FROM DUAL;

SELECT UPPER('SQL Expert')
FROM DUAL;

SELECT ASCII('A')
FROM DUAL;

SELECT CHR(65)
FROM DUAL;

SELECT CONCAT('RDBMS',' SQL')
FROM DUAL;

SELECT 'RDBMS'||' SQL'
FROM DUAL;

SELECT SUBSTR('SQL Expert', 5, 3)
FROM DUAL;

SELECT LENGTH('SQL Expert')
FROM DUAL;

SELECT LTRIM('xxxYYZZxYZ','x')
FROM DUAL;

SELECT RTRIM('XXYYzzYYzz','z')
FROM DUAL;

SELECT TRIM('x' FROM 'xxYYZZxYZxx')
FROM DUAL;

SELECT RTRIM('XXYYZZXYZ       ')
FROM DUAL;


/*p.230 예제*/
SELECT LENGTH('SQL Expert')
FROM DUAL;

/*p.231 예제 _ CONCAT 문자형 함수 이용*/
SELECT CONCAT(PLAYER_NAME, ' 축구선수') 선수명
FROM PLAYER;

SELECT PLAYER_NAME || ' 축구선수' AS 선수명
FROM PLAYER;

SELECT PLAYER_NAME || ' 축구선수' 선수명
FROM PLAYER;

SELECT STADIUM_ID, DDD||TEL AS TEL, LENGTH(DDD||TEL) AS T_LEN
FROM STADIUM;


/*p.233 _ 단일행 숫자형 함수 예제*/
SELECT ABS(-15)
FROM DUAL;

SELECT SIGN(-20)
FROM DUAL;

SELECT SIGN(0)
FROM DUAL;

SELECT SIGN(+20)
FROM DUAL;

SELECT MOD(7,3)
FROM DUAL;

SELECT 7%3
FROM DUAL;
/*위와 같이 '7%3' 형식으로 MOD 함수를 대체하는 것은 SQL Server에서만 가능한가?
오류가 발생한다.*/

SELECT CEIL(38.123)
FROM DUAL;

SELECT CEIL(-38.123)
FROM DUAL;

SELECT FLOOR(38.123)
FROM DUAL;

SELECT FLOOR(-38.123)
FROM DUAL;

SELECT ROUND(38.5235, 3)
FROM DUAL;

SELECT ROUND(38.5235, 1)
FROM DUAL;

SELECT ROUND(38.5235, 0)
FROM DUAL;

SELECT ROUND(38.5235)
FROM DUAL;

SELECT TRUNC(38.5235, 3)
FROM DUAL;

SELECT TRUNC(38.5235, 1)
FROM DUAL;

SELECT TRUNC(38.5235, 0)
FROM DUAL;

SELECT TRUNC(38.5235)
FROM DUAL;

/*p.234 _ 예제 _ 반올림 및 내림*/
DESCRIBE EMP;

SELECT *
FROM EMP;

SELECT ENAME, ROUND(SAL/12,1), TRUNC(SAL/12,1)
FROM EMP;

SELECT ENAME, ROUND(SAL/12), CEIL(SAL/12)
FROM EMP;


/*p.235~ _ 날짜형 함수*/
SELECT SYSDATE
FROM DUAL;

SELECT ENAME, HIREDATE,
       EXTRACT(YEAR FROM HIREDATE) 입사년도,
       EXTRACT(MONTH FROM HIREDATE) 입사월,
       EXTRACT(DAY FROM HIREDATE) 입사일
FROM EMP;

SELECT ENAME, HIREDATE,
       TO_NUMBER(TO_CHAR(HIREDATE,'YYYY')) 입사년도,
       TO_NUMBER(TO_CHAR(HIREDATE,'MM')) 입사월,
       TO_NUMBER(TO_CHAR(HIREDATE,'DD')) 입사일
FROM EMP;


/*p.238~ _ 변환형 함수*/
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') 날짜,
       TO_CHAR(SYSDATE, 'YYYY. MON, DAY') 문자형
FROM DUAL;

SELECT TO_CHAR(123456789/1079,'$999,999,999.99') 환율반영달러,
       TO_CHAR(123456789,'L999,999,999') 원화
FROM DUAL;
/*1079는 2018년 2월 18일 오후 8시 16분에 KEB하나은행 홈페이지에서 조회한
미국 USD 매매기준율이다.*/

SELECT TEAM_ID, TO_NUMBER(ZIP_CODE1,'999') + TO_NUMBER(ZIP_CODE2,'999') 우편번호합
FROM TEAM;

SELECT TEAM_ID, CAST(ZIP_CODE1 AS INT) + CAST(ZIP_CODE2 AS INT) 우편번호합
FROM TEAM;


/*p.241~ _ CASE 표현*/
IF SAL > 2000
   THEN REVISED_SALARY = SAL
   ELSE REVISED_SALARY = 2000
END-IF.
/*이 SQL 문장은 교재 내용 그대로지만 오류를 일으킨다.
‘FROM ~’ 부분도 없고 이상한 SQL 문장 아닌가?*/

SELECT ENAME,
       CASE WHEN SAL > 2000
            THEN SAL
            ELSE 2000
       END REVISED_SALARY
FROM EMP;

SELECT LOC,
    CASE LOC
    WHEN 'NEW YORK' THEN 'EAST'
    WHEN 'BOSTON' THEN 'EAST'
    WHEN 'CHICAGO' THEN 'CENTER'
    WHEN 'DALLAS' THEN 'CENTER'
    ELSE 'ETC'
    END AS AREA
FROM DEPT;

SELECT ENAME,
    CASE WHEN SAL >= 3000 THEN 'HIGH'
         WHEN SAL >= 1000 THEN 'MID'
         ELSE 'LOW'
    END AS SALARY_GRADE
FROM EMP;

SELECT ENAME, SAL,
    CASE WHEN SAL >= 2000 THEN 1000
        ELSE (CASE WHEN SAL >= 1000 THEN 500
                ELSE 0
              END)
    END AS BONUS
FROM EMP;


/*p.245~ _ NULL 관련 함수*/
SELECT NVL(NULL, 'NVL-OK') NVL_TEST
FROM DUAL;

SELECT NVL('Not-Null', 'NVL-OK') NVL_TEST
FROM DUAL;

SELECT PLAYER_NAME 선수명, POSITION, NVL(POSITION,'없음') 포지션
FROM PLAYER
WHERE TEAM_ID = 'K08';

SELECT PLAYER_NAME 선수명, POSITION,
       CASE WHEN POSITION IS NULL
            THEN '없음'
            ELSE POSITION
       END AS 포지션
FROM PLAYER
WHERE TEAM_ID = 'K08';

SELECT ENAME 사원명, SAL 월급, COMM 커미션,
       (SAL * 12) + COMM 연봉A, (SAL * 12) + NVL(COMM,0) 연봉B
FROM EMP;

SELECT MGR
FROM EMP
WHERE ENAME='SCOTT';

DESCRIBE EMP;

SELECT ENAME
FROM EMP
WHERE EMPNO=7566;
/*SCOTT의 관리자(MGR=Manager)는 7566 사번을 가진 JONES다.*/

SELECT MGR
FROM EMP
WHERE ENAME='KING';

SELECT NVL(MGR,9999) MGR
FROM EMP
WHERE ENAME='KING';


/*p.250~ 예제*/
SELECT *
FROM DUAL;

SELECT 1
FROM DUAL
WHERE 1 = 2;
/*위의 SQL 문장은 왜 공집합을 발생시키는 것인지,
'SELECT 1'이 의미하는 바는 무엇인지 생각해 보기.*/

SELECT MGR
FROM EMP
WHERE ENAME='JSC';

SELECT NVL(MGR, 9999) MGR
FROM EMP
WHERE ENAME='JSC';

SELECT MAX(MGR) MGR
FROM EMP
WHERE ENAME='JSC';

SELECT NVL(MAX(MGR), 9999) MGR
FROM EMP
WHERE ENAME='JSC';


/*p.252~ NULLIF*/
SELECT ENAME, EMPNO, MGR, NULLIF(MGR,7698) NUIF
FROM EMP;

SELECT ENAME, EMPNO, MGR,
       CASE WHEN MGR = 7698
            THEN NULL
            ELSE MGR
       END NUIF
FROM EMP;


/*p.253~ COALESCE*/
SELECT ENAME, COMM, SAL, COALESCE(COMM, SAL) COAL
FROM EMP;

SELECT ENAME, COMM, SAL,
       CASE WHEN COMM IS NOT NULL
            THEN COMM
            ELSE (CASE WHEN SAL IS NOT NULL
                       THEN SAL
                       ELSE NULL
                  END)
       END  COAL
FROM EMP;