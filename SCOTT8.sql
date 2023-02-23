CREATE TABLE DEPT_TCL 
    AS SELECT * 
        FROM DEPT; 
        
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');

UPDATE DEPT_TCL SET LOC = 'BUSAN'
    WHERE DEPTNO = 40;
    
DELETE FROM DEPT_TCL
    WHERE DNAME = 'RESEARCH';
    
COMMIT;

/* ���̺��� �ڷ����� �����Ͽ� ���� �����ϴ� ��� */
CREATE TABLE EMP_DDL (
    EMPNO       NUMBER(4),
    ENAME       VARCHAR(10),
    JOB         VARCHAR(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2)
);

SELECT * FROM EMP_DDL;

/* ���� ���̺��� �� ������ �����͸� �����Ͽ� �� ���̺� �����ϴ� ��� */
CREATE TABLE DEPT_DDL 
    AS SELECT * FROM DEPT;

SELECT * FROM DEPT_DDL;

/* ���� ���̺��� �� ������ �����Ͽ� �� ���̺� ����� */
CREATE TABLE DEPT_DDL_TEMP 
    AS SELECT * FROM DEPT
    WHERE 1 != 1;

SELECT * FROM DEPT_DDL_TEMP;

CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
    E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE 1 != 1;

SELECT * FROM EMPDEPT_DDL;

/*
* DDL (���̺� ���Ǿ�)
* CREATE : ���̺� ����
* ALTER : ���̺� ����(ADD, RENAME, MODIFY, DROP)
* RENAME : ���̺� �̸� ����
* TRUNCATE : ���̺��� �����͸� ����
* DROP : ���̺� ����
*/

/* ���̺��� �����ϴ� ALTER : ���̺� �� ���� �߰� �Ǵ� ����, ���� �ڷ����� ���� ���� ���� ���� */
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- ���̺� ���ο� ���� �߰� : ADD, �߰��� ���� ���� �࿡�� NULL ������ �Էµ�
ALTER TABLE EMP_ALTER 
    ADD HP VARCHAR2(20);

-- �� �̸� ���� : RENAME
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

-- ���� �ڷ����� ���� : MODIFY, �ڷ��� ����� �̹� �ش� �÷��� ���� ���� �����Ѵٸ� ������� ���� �� ����
-- ������ �ڷ����� ũ�⺸�� ũ�� �����ϴ� �� ���� �ȵ�, �۰� �����ϴ� ���� ���Ե� �����Ϳ� ������ ����
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);

-- Ư�� ���� ������ �� : DROP
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL;

/* ���̺� �̸��� �����ϴ� RENAME */
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;   

/* ���̺��� �����͸� �����ϴ� TRUNCATE */
-- ���̺��� ��� �����͸� �����ϴ� ��ɾ�, ���̺� ������ ������ ���� ������, ROLLBACK �Ұ�
TRUNCATE TABLE EMP_RENAME;

/* ���̺��� �����ϴ� DROP */
DROP TABLE EMP_RENAME;

/* ���� ���� */
-- 1��
CREATE TABLE EMP_HW (
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10),
    JOB         VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2)
);

-- 2��
ALTER TABLE EMP_HW
    ADD BIGO VARCHAR2(20);

-- 3��
ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR2(30);

-- 4��
ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

-- 5��
INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO,NULL
    FROM EMP;

-- 6��
DROP TABLE EMP_HW; 