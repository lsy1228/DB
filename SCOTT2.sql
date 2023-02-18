SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER' 
        OR JOB = 'SALESMAN'
        OR JOB = 'CLERK';

/* IN ������ : Ư�� ���� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ�� */
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
    
/* IN �����ڸ� ����Ͽ� �μ���ȣ�� 10�� 20�� ����� �����ȣ, �̸�, �Ի���, �޿� ��� */
SELECT EMPNO �����ȣ, ENAME �̸�, HIREDATE �Ի���, SAL �޿�
    FROM EMP
    WHERE DEPTNO IN (10, 20);

/* � �񱳿����ڿ� AND ������ */
SELECT *
    FROM EMP
    WHERE JOB != 'MANAGER'
        AND JOB <> 'SALESMAN'
        AND JOB ^= 'CLERK';

/* ���� ������ �����ϴ� BETWEEN ������ */
-- �޿��� 2000���� 3000 ���̿� �ִ� ��� ǥ��
SELECT *
    FROM EMP
    WHERE SAL >= 2000 
        AND SAL <= 3000;

/* BETWEEN 2000 AND 3000 => 2000�� ���ų� ũ�� 3000�� �۰ų� ���� */
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
/* BETWEEN ���� ����ؼ� �޿��� 1000���� 2500 �����̰� �μ��� 10, 30�� ����� ��� */
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 1000 AND 2500
         AND DEPTNO IN (10, 30);
         
/* BETWEEN ���� ����ؼ� �޿��� 1000���� 2500 �����̰� �μ��� 10, 20 �ƴ� ��� ��� */
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 1000 AND 2500
    AND DEPTNO NOT IN (10, 20);
    
/* BETWEEN ���� ����ؼ� �����ȣ 7000���� 7999 �����̰�, �Ի����� 81/5/1 ������ ��� ��� */
SELECT *
    FROM EMP
    WHERE EMPNO BETWEEN 7000 AND 7999
        AND HIREDATE > '81/05/01';

/* 1980���� �ƴ� �ؿ� �Ի��� ����� ��ȸ�ؼ� ��� */
SELECT *
    FROM EMP
    WHERE NOT HIREDATE BETWEEN '80/01/01' AND '80/12/31';

/* EXTRACT ���� ����ϴ� ��� */
SELECT *
    FROM EMP
    WHERE EXTRACT (YEAR FROM HIREDATE) != 1980;

/* LIKE ���� �Ϻ� ���ڿ��� ���ԵǾ� �ִ��� ���θ� Ȯ�� �� �� ��� */
-- % : ���̿� ������� ��� ���ڵ����͸� �ǹ�
-- _ : ���� 1�ڸ� �ǹ�

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S____';
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    
/* �̸��� AM�� ���ԵǾ� �ִ� ��� ��� */
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';

/* �̸��� AM�� ���Ե��� ���� ��� ��� */
SELECT *
    FROM EMP
    WHERE NOT ENAME LIKE '%AM%'; 

/* ���ϵ�ī�� ���ڰ� ������ �Ϻ��� ��� */
INSERT INTO EMP VALUES(9999, 'TEST%PP', 'SALESMAN', 7698, TO_DATE('22-02-14','DD-MM-YYYY'), 2000, 1000, 30);

SELECT *
    FROM EMP;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%\%%' ESCAPE '\';
/* ���̺��� �ش��ϴ� �̸��� ������ ���� */    
DELETE FROM EMP 
    WHERE ENAME = 'TEST%PP';
    
/* IS NULL */
-- NULL�̶�? : 0�� �ƴϰ� �� ������ �ƴ��� �ǹ�, �� ��Ȯ���� ���̶�� �ǹ�
--�׷��Ƿ� ���� �� ��, �Ҵ��� �Ұ���
SELECT *
    FROM EMP
    WHERE COMM = NULL; --NULL�� ���� ���� �� ����
SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE COMM IS NOT NULL;
    
/* MGR�� �ִ� ����� ��� */
SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;
/* ORDER BY :Ư�� �÷��� �����͸� �������� ���������̳� ������������ �����ϴ� ��� */
-- �ݵ�� ���� �������� ����Ǿ�� �ϸ�, �����ϸ� ���� ����
-- ���� ������ ������� ������ �⺻������ ASC(��������) ����
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
/* �����ȣ �������� �������� ���� */
SELECT *
    FROM EMP
    ORDER BY EMPNO;
/* �޿� �������� �������� �����ϰ� �޿��� ���� ��� �̸� ���� ���� */
SELECT *
    FROM EMP
    ORDER BY SAL, ENAME;
    
/* �޿� �������� �������� �����ϰ� �޿��� ���� ��� �̸� ���� �������� ���� */
SELECT *
    FROM EMP
    ORDER BY SAL, ENAME DESC;
    
/* ��Ī ���� ORDER BY */
SELECT EMPNO �����ȣ, ENAME �����, SAL ����, HIREDATE �Ի���
    FROM EMP
    ORDER BY ���� DESC, ����� ASC;
    
/* ���� ������ : SELECT ��ȸ�� �÷� ���̿� Ư���� ���ڸ� �ְ� ���� �� ����ϴ� ������ */
SELECT ENAME || 'S JOB IS' || JOB AS EMPLOYEE
    FROM EMP;
/* �ǽ� ���� */
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788, TO_DATE('23-05-1987', 'DD-MM-YYYY'), 1100, NULL, 20);
-- 1�� ���� : �̸��� S�� ������ ���
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';
-- 2�� ���� : 30�� �μ�, ��å�� SALESMAN
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
    
-- 3�� ���� : 20, 30�� �μ��� �ٹ��ϰ� �޿��� 2000 �ʰ�   
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN(20, 30) AND SAL > 2000;
-- 4�� ���� : �޿��� 2000 �̻� 3000 ���� ����         
SELECT *
    FROM EMP
    WHERE SAL < 2000 OR SAL > 3000; 
-- 5�� ���� : �̸��� E�� ����, 30�� �μ�, �޿��� 1000�� 2000 ���̰� �ƴ� ���
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%E%' AND
        DEPTNO = 30 AND
        NOT SAL BETWEEN 1000 AND 2000;
-- 6�� ���� : �߰����� ����, ����� ����, ��å�� 'MANAGER'/'CLERK', �̸� 2��° ���ڰ� L�� ��� 
SELECT *
    FROM EMP
    WHERE (COMM IS NULL OR COMM = 0) AND 
        MGR IS NOT NULL AND
        JOB IN ('MANAGER', 'CLERK') AND
        NOT ENAME LIKE '_L%';
-- COMM�� ���� NULL�� �ƴ� ���� ��ȸ
SELECT *
    FROM EMP
    WHERE COMM IS NOT NULL;
-- Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT *
    FROM EMP
    WHERE (COMM IS NULL OR COMM = 0);
-- �����ڰ� ���� ���� ���� ��ȸ
SELECT *
    FROM EMP
    WHERE MGR IS NULL;
-- �޿��� ���� �޴� ���� ������ ��ȸ
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
-- �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT *
    FROM EMP
    ORDER BY SAL DESC, COMM DESC;
-- �����ȣ, �����, ����, �Ի��� ��ȸ (��, �Ի����� �������� ���� ó��)
SELECT EMPNO �����ȣ, ENAME �����, JOB ����, HIREDATE �Ի���
    FROM EMP
    ORDER BY 4; --�÷��� ������ �Է��ص� ��
    
-- �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)
SELECT EMPNO �����ȣ, ENAME �����
    FROM EMP
    ORDER BY EMPNO DESC;
-- �����ȣ, �μ���ȣ, �Ի���, �����, �޿� ��ȸ (�μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��� ������ ó��)
SELECT EMPNO �����ȣ, DEPTNO �μ���ȣ, HIREDATE �Ի���, ENAME �����, SAL �޿�
    FROM EMP
    ORDER BY DEPTNO, HIREDATE DESC;
/* �Լ���? : ����Ŭ������ ���� �Լ��� ����ڰ� �ʿ信 ���ؼ� ���� ������ ����� ���� �Լ��� ������ ���� */
-- ������ �Լ��� ������ �Լ�(���� �Լ�)
-- DUAL ���̺� : SYS �������� �����ϴ� ���̺�� �Լ��� ������ ���̺� ���� ���� �����غ��� ���� DUMMY ���̺�
/* ���� �Լ� */
-- ABS : ���밪 ���ϴ� �Լ�
SELECT -10, ABS (-10) FROM DUAL;
-- ROUND : �ݿø��� ����� ��ȯ�ϴ� �Լ�
SELECT ROUND(1234.5678) AS ROUND FROM DUAL; --�ݿø� �ڸ��� �������� ������ 0���� ��ȯ�ϴ� �Ͱ� ����(�Ҽ��� ���� ù��° �ڸ�)
SELECT ROUND(1234.5678, 0) ROUND_0,
    ROUND(1234.5678, 1) ROUND_1,
    ROUND(1234.5678, 2) ROUND_2,
    ROUND(1234.5678, 3) ROUND_3,
    ROUND(1234.5678, -1) ROUND_MINUS1,
    ROUND(1234.5678, -2) ROUND_MINUS2 FROM DUAL;
-- TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ�
SELECT TRUNC(1234.5678, 0) TRUNC_0,
    TRUNC(1234.5678, 1) TRUNC_1,
    TRUNC(1234.5678, 2) TRUNC_2,
    TRUNC(1234.5678, 3) TRUNC_3,
    TRUNC(1234.5678, -1) TRUNC_MINUS1,
    TRUNC(1234.5678, -2) TRUNC_MINUS2 FROM DUAL;
    
-- MOD : �������� �� �� �������� ����ϴ� �Լ�
SELECT MOD(21, 5) FROM DUAL;
-- CEIL : �Ҽ��� ���ϰ� ������ ������ �ø�
SELECT CEIL(12.001) FROM DUAL;
-- FLOOR : �Ҽ��� ���ϰ� ������ ������ ����
SELECT FLOOR(12.999) FROM DUAL;
-- POWER : ���� A�� ���� B��ŭ �����ϴ� �Լ�
SELECT POWER(3, 4) FROM DUAL;
/* ���� �Լ� : ���� �����͸� �����ϰų� ���� �����ͷκ��� Ư�� ����� ����� �� �� ����ϴ� �Լ� */
-- UPPER : �빮�� ����
-- LOWER : �ҹ��� ����
-- INITCAP : ù���ڴ� �빮�� �����ϰ� �������� �ҹ��ڷ� ����
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
-- WHERE ���������� ����ϱ�
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('james');
-- UPPER �Լ��� LIKE �Բ� ����ϱ�
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%ja%');
    
SELECT INITCAP('yoo young yoo') AS �̸� FROM DUAL;
/* ����̸��� �빮��, ��å�� ù�ڴ� �빮�� �������� �ҹ��� �����ϰ� �޿��� ���� ������ ��� */
SELECT UPPER(ENAME) AS �̸�, INITCAP(JOB) AS ��å, SAL AS �޿�
    FROM EMP
    ORDER BY SAL DESC;
/* ���ڿ� ���̸� ���ϴ� �Լ� (LENGTH) */
SELECT ENAME, LENGTH(ENAME) AS "�̸��� ����" FROM EMP;
/* �̸��� ���̰� 5�� ���ų� ū ����� �̸�, ��� ��ȣ, ��å�� ���� ������ ��� ��, ���ʽ� ���� */
SELECT ENAME �̸�, EMPNO �����ȣ, JOB ��å, SAL * 12 AS ���� 
    FROM EMP
    WHERE LENGTH(ENAME) >= 5
    ORDER BY SAL * 12 DESC;
-- LENGTH : ���ڿ��� ���̸� ��ȯ
-- LENGTHB : ���ڿ��� ����Ʈ�� ��ȯ
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;
/* ��å �̸��� 6�� �̻��̰� COMM�� �ִ� ��� ��� */
SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6 
        AND COMM != 0 
        AND COMM IS NOT NULL;
/* SUBSTR/SUBSTRB : ��� ���ڿ��̳� �÷��� �ڷῡ�� ���� ��ġ���� ������ŭ�� ���ڸ� ��ȯ�ϴ� �Լ�, �ε��� ���� �ƴ� */
-- SUBSTR(���ڿ� ������, ������ġ, ����)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB,3, 2), SUBSTR(JOB, 5)
    FROM EMP;
-- SUBSTR �Լ��� �ٸ� �Լ� �Բ� ���
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB), 2) FROM EMP;
/* INSTR : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ��� �˰��� �� �� ��� */
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1 FROM DUAL;
SELECT INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2 FROM DUAL; -- ã�� ���ڿ��� ���� ��ġ�� ������ �� ����
SELECT INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 FROM DUAL; -- ���� ��ġ���� ã�� ���ڰ� ���°���� ����