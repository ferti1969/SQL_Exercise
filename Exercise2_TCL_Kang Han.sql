/*Exercise2_TCL(Transaction Control Language)
Update : 2018-02-12, Kang Han.

아래의 SQL은 『SQL 전문가 가이드』에 따른 연습입니다.*/

/*p.194
2. COMMIT*/

DESC PLAYER;

INSERT INTO PLAYER
(PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
VALUES ('1997035', 'K02', '이운재', 'GK', 182, 82, 1);

COMMIT;

SELECT *
FROM PLAYER;

UPDATE PLAYER
SET HEIGHT = 100;

COMMIT;

SELECT PLAYER_ID, PLAYER_NAME, HEIGHT
FROM PLAYER;

DELETE FROM PLAYER;

COMMIT;

SELECT *
FROM PLAYER;

/*이하 SQL은 1.축구_k리그_oracle용_2010년.sql을 실행한 후, 진행한 실습이다.*/

/*p.197~ ROLLBACK*/

/*예제 1*/
INSERT INTO PLAYER
(PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
VALUES ('1999035', 'K02', '이운재', 'GK', 182, 82, 1);

SELECT *
FROM PLAYER;

ROLLBACK;

SELECT *
FROM PLAYER;


/*예제 2*/
UPDATE PLAYER
SET HEIGHT = 100;

SELECT *
FROM PLAYER;

ROLLBACK;

SELECT *
FROM PLAYER;


/*예제 3*/
DELETE FROM PLAYER;

SELECT *
FROM PLAYER;

ROLLBACK;

SELECT *
FROM PLAYER;


/*p.199~ SAVEPOINT*/
SAVEPOINT SVPT1;

DELETE FROM PLAYER;

SELECT *
FROM PLAYER;

ROLLBACK TO SVPT1;

SELECT *
FROM PLAYER;


SAVEPOINT SVPT1;

INSERT INTO PLAYER
(PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
VALUES ('1999035', 'K02', '이운재', 'GK', 182, 82, 1);

SELECT *
FROM PLAYER;

ROLLBACK TO SVPT1;

SELECT *
FROM PLAYER;


SAVEPOINT SVPT2;

UPDATE PLAYER
SET WEIGHT = 100;

SELECT *
FROM PLAYER;

ROLLBACK TO SVPT2;

SELECT *
FROM PLAYER;


SAVEPOINT SVPT3;

DELETE FROM PLAYER;

SELECT *
FROM PLAYER;

ROLLBACK TO SVPT3;

SELECT *
FROM PLAYER;


SELECT COUNT(*)
FROM PLAYER;

SELECT COUNT(*)
FROM PLAYER
WHERE WEIGHT = 100;


/*p.203 첫 예제*/
/*새로운 트랜잭션 시작*/
INSERT INTO PLAYER
(PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
VALUES ('1999035', 'K02', '이운재', 'GK', 182, 82, 1);

SELECT *
FROM PLAYER;

SAVEPOINT SVPT_A;

UPDATE PLAYER
SET WEIGHT = 100;

SELECT *
FROM PLAYER;

SAVEPOINT SVPT_B;

DELETE FROM PLAYER;

SELECT *
FROM PLAYER;


/*p.203 두 번째 예제 _ CASE 1*/
SELECT COUNT(*)
FROM PLAYER;

ROLLBACK TO SVPT_B;

SELECT COUNT(*)
FROM PLAYER;

/*이하는 예제에 없지만, 내가 개인적으로 실행해 확인한 부분이다.*/
SELECT *
FROM PLAYER;


/*p.204 예제 _ CASE 2*/
SELECT COUNT(*)
FROM PLAYER
WHERE WEIGHT = 100;

ROLLBACK TO SVPT_A;

SELECT COUNT(*)
FROM PLAYER
WHERE WEIGHT = 100;

/*이하는 예제에 없지만, 내가 개인적으로 실행해 확인한 부분이다.*/
SELECT *
FROM PLAYER;


/*p.205 예제 _ CASE 3*/
SELECT COUNT(*)
FROM PLAYER;

ROLLBACK;

SELECT COUNT(*)
FROM PLAYER;

/*이하는 예제에 없지만, 내가 개인적으로 실행해 확인한 부분이다.*/
SELECT *
FROM PLAYER;