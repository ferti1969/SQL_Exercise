/*Exercise3_WHERE ������
Update : 2018-02-14, Kang Han.

�Ʒ��� SQL�� ��SQL ������ ���̵塻�� ���� �����Դϴ�.*/

/*p.210 ����*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = K02;
/*�� SQL�� ���� ��� ������ �߻���Ų��.*/

/*���� �� �ٽ� �����Ѵ�.*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02';

DESCRIBE PLAYER;

/*�Ʒ� SQL�� TEAM_ID�� 'K02'�� ���� ����� ����Ǵ��� Ȯ���ϰ��� ���� �ۼ��� SQL�̴�.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02';
