/*Exercise3_WHERE ������
Update : 2018-02-18, Kang Han.

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

/*3��° �䱸 ���� : �������� �̵��ʴ�(MF)*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE POSITION = 'MF';

/*4��° �䱸 ���� : 'Ű�� 170��Ƽ���� �̻�'*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE HEIGHT >= 170;


/*p.213~ SQL ������*/
/*IN (list) ������*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07');

DESCRIBE PLAYER;

/*���� SQL ������ ���� ��� ���� ���ϴ� TEAM_ID�� ���� ���� ����� ��µǴ���
Ȯ���ϱ� ���� ���� ���ļ� ������ ���̴�.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07');

/*����*/
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE (JOB, DEPTNO) IN (('MANAGER',20),('CLERK',30));

/*����*/
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB IN ('MANAGER','CLERK')
AND DEPTNO IN (20,30);


/*LIKE ������*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE POSITION LIKE 'MF';

/*wildcard ���*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE PLAYER_NAME LIKE '��%';


/*BETWEEN a AND b ������*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE HEIGHT BETWEEN 170 AND 180;


/*IS NULL ������*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE POSITION = NULL;
/*�� SQL ���� ���� ���, ���� ������ ������ �ʾ�����
WHERE ���� ������ FALSE�� �Ǿ�, ��������� �ǹ� ���� SQL�� �ƴ�.*/

SELECT PLAYER_NAME �����̸�, POSITION ������, TEAM_ID
FROM PLAYER
WHERE POSITION IS NULL;


/*�� ������*/
SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND HEIGHT >= 170;

DESCRIBE PLAYER;
/*���� SQL ������ ���ϴ� TEAM_ID�� ����� ����� ��µǴ��� Ȯ���ϱ� ����
���� ���� SQL ������ ������ ���̴�.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND HEIGHT >= 170;

SELECT PLAYER_NAME �����̸�, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07')
AND POSITION = 'MF';

/*���� SQL ������ ���ϴ� TEAM_ID�� ����� ����� ��µǴ��� Ȯ���ϱ� ����
���� ���� SQL ������ ������ ���̴�.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07')
AND POSITION = 'MF';


/*pp.220~221 ����*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02' OR TEAM_ID = 'K07'
AND POSITION = 'MF'
AND HEIGHT >= 170
AND HEIGHT <= 180;

/*��ȣ ����� ����.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07')
AND POSITION = 'MF'
AND HEIGHT >= 170
AND HEIGHT <= 180;

/*���� ��� ����� �������� IN (list)�� BETWEEN a AND b �����ڸ� Ȱ��*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07')
AND POSITION = 'MF'
AND HEIGHT BETWEEN 170 AND 180;


/*���� ������*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND NOT POSITION = 'MF'
AND NOT HEIGHT BETWEEN 175 AND 185;

/*Oracle. ���� SQL�� �Ʒ� SQL�� ���� ������ ��Ÿ���� SQL�̴�.*/
SELECT PLAYER_NAME �����̸�, TEAM_ID ��, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND POSITION <> 'MF'
AND HEIGHT NOT BETWEEN 175 AND 185;

/*���� Į���� NULL�� �ƴ� ������ ����.*/
SELECT PLAYER_NAME �����̸�, NATION ����
FROM PLAYER
WHERE NATION IS NOT NULL;


/*ROWNUM*/
SELECT PLAYER_NAME
FROM PLAYER
WHERE ROWNUM = 1;

SELECT PLAYER_NAME
FROM PLAYER
WHERE ROWNUM <= 1;

SELECT PLAYER_NAME
FROM PLAYER
WHERE ROWNUM < 2;

/*ROWNUM _ ������ 3���� ����Ϸ��� �Ѵٸ� ������ ���� SQL ������ ��� �Ѵ�.*/
SELECT PLAYER_NAME
FROM PLAYER
WHERE ROWNUM <= 3;

SELECT PLAYER_NAME
FROM PLAYER
WHERE ROWNUM < 4;

/*������ Ű �Ǵ� �ε����� ����� ���� ����.*/
/*PLAYER ���̺��� �ӽ÷� �����ϱ�.*/
/*�̴� CTAS(Create Table ~ As Select ~) ���(SQLD ���� pp.167~168)�� �̿��� ���̴�.*/
CREATE TABLE PLAYER_TEMP
AS SELECT * FROM PLAYER;

/*ROWNUM�� �Էµ� COLUMN �߰�.*/
ALTER TABLE PLAYER_TEMP
ADD (TEST NUMBER(3));

DESCRIBE PLAYER_TEMP;

UPDATE PLAYER_TEMP
SET TEST = ROWNUM;

SELECT PLAYER_NAME ������, TEST
FROM PLAYER_TEMP;

/*������ ���� ���� 'PLAYER_TEMP' table ����.*/
DROP TABLE PLAYER_TEMP;