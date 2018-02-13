/*Exercise3_WHERE 조건절
Update : 2018-02-14, Kang Han.

아래의 SQL은 『SQL 전문가 가이드』에 따른 연습입니다.*/

/*p.210 예제*/
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = K02;
/*위 SQL은 실행 결과 오류를 발생시킨다.*/

/*수정 후 다시 실행한다.*/
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02';

DESCRIBE PLAYER;

/*아래 SQL은 TEAM_ID가 'K02'인 행이 제대로 추출되는지 확인하고자 내가 작성한 SQL이다.*/
SELECT PLAYER_NAME 선수이름, TEAM_ID 팀, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02';
