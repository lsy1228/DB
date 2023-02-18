/* 2023�� 2�� 15�� */
-- SUBSTR �Լ��� �ٸ� �Լ� �Բ� ���
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- JOB�� ���̴� 5�̰� 5�� ���� ������ ���ϸ� �ڿ��� ���� �������� Ŀ���鼭 �о 
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
-- REPLACE : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü�� �� ���(�ڹ��� ������ ����), ��ü�� ���ڿ��� ���� ������ ���� ȿ�� */
SELECT '010-5006-4146' AS ��������,
    REPLACE('010-5006-4146', '-', ' ') ����������������,
    REPLACE('010-5006-4146', '-') �����»���
    FROM DUAL;
    
-- LPAD/RPAD : ������ ���� ĭ���� �����ϰ� ��ĭ��ŭ Ư�� ���ڷ� ä��� ���
SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
SELECT 'ORACLE',
    LPAD('ORACLE', 10, '#') AS LPAD_1,
    RPAD('ORACLE', 10, '*') AS RPAD_1,
    LPAD('ORACLE', 10) AS LPAD_2,
    RPAD('ORACLE', 10) AS RPAD_2
    FROM DUAL;
    
-- �������� ���ڸ��� * ǥ�÷� ����ϱ�
SELECT 
    RPAD('971225-', 14, '*') AS RPAD_JUMIN,
    RPAD('010-5006-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
-- �� ���ڿ��� ��ġ�� CONCAT �Լ�
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME)) -- ��ø ���
    FROM EMP
    WHERE ENAME = 'JAMES';

-- TRIM/LTRIM/RTRIM : ���ڿ� ������ Ư�� ���ڿ� ��������� ���
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM, -- ���ڿ��� �յ� ������ ����
    '[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM, -- ���ڿ��� �� ������ ����
    '[' || LTRIM('<_ORACLE_>', '<_') || ']' AS LTRIM_2, -- ������ ���ڸ� ����
    '[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM, -- ���ڿ��� �� ������ ����
    '[' || RTRIM('<_ORACLE_>', '_>') || ']' AS RTRIM_2 -- ������ ���ڸ� ����
    FROM DUAL;
    
SELECT TRIM('        JKS2024        ') AS TRIM FROM DUAL;

/* ��¥ �����͸� �ٷ�� ��¥ �Լ� */
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW,
    SYSDATE - 1 AS YESTERDAY, -- �ü������ �о�� �ð� �������� 1���� ��
    SYSDATE + 1 AS TOMORROW   -- �ü������ �о�� �ð� �������� 1���� ����
    FROM DUAL;

/* �� ���� ������ ��¥�� ���ϴ� ADD_MONTH �Լ� */
-- Ư�� ��¥�� ������ ���� �� ���� ��¥ �����͸� ��ȯ�ϴ� �Լ�
-- ADD_MONTHS[��¥ ������, ���� ���� ��]
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;

/* �ǽ� ����(EMP) : ����� ���� �����ȣ, �̸�, �Ի���, 10�� ����� ��¥ ��� */
SELECT EMPNO �����ȣ, ENAME �̸�, HIREDATE �Ի���, ADD_MONTHS(HIREDATE, 120) AS "10�� �����"
    FROM EMP;

/* �ǽ� ����(DUAL) : ���� �ð��� 8���� ���� �ð� ��� */
SELECT SYSDATE ����ð�, ADD_MONTHS(SYSDATE, 8) AS "8���� ���"
    FROM DUAL;
    
/* �� ��¥���� ���� �� ���̸� ���ϴ� MONTHS_BETWEEN �Լ� */
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
    FROM EMP;

/* ���ƿ��� ����, ���� ������ ��¥�� ���ϴ� NEXT_DAY, LAST_DAY �Լ� */
-- NEXT_DAY(��¥ ������, ���Ϲ���) -> ��¥ �������� ���ƿ��� ������ ��¥�� ���
-- LAST_DAY(��¥ ������) -> ��¥�� ���� ���� ������ ��¥�� ���
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '������'),
    LAST_DAY(SYSDATE)
    FROM DUAL;
    
-- ��¥�� �ݿø�, ������ �ϴ� ROUND, TRUNC �Լ�
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
    FROM EMP;

-- ��¥ ������ ���� �Լ�
SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
    FROM DUAL;

SELECT * 
    FROM EMP
    WHERE EXTRACT(MONTH FROM HIREDATE) = 12;

SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -- ���� ������� ���

/* �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ� */
-- ����Ŭ�� �ڹٿ� ���������� ����� ����ȯ�� ������ ����ȯ�� ����
-- �ڵ�(������) ����ȯ : ���ڿ� ���� �ڷ����� ������ �ڵ����� ���ڷ� ��ȯ(�ڹٿ� �ٸ���)
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP;

SELECT EMPNO, ENAME, EMPNO + 'ABCD'  -- ������ �߻���
    FROM EMP;
    
/* ��¥, ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ� */
-- TO_CHAR �Լ��� ��¥, ���� �����͸� ���� �����ͷ� ��ȯ���ִ� �Լ�, �ַ� ��¥ �����͸� ���� �����ͷ� ��ȯ�� ���� ���
-- TO_CHAR(��¥ ������, ��µǱ⸦ ���ϴ� ���� ����)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "���� ��¥�� �ð�"  -- ��ҹ��� ���� ����
    FROM DUAL;

-- �پ��� �������� ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS ����,
    TO_CHAR(SYSDATE, 'YY') AS ����,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS ����,
    TO_CHAR(SYSDATE, 'DD') AS ��,
    TO_CHAR(SYSDATE, 'DDD') AS �����,
    TO_CHAR(SYSDATE, 'HH') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH12') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH24') AS "24�ð���",
    TO_CHAR(SYSDATE, 'W') AS "������"
    FROM DUAL;
    
-- Ư�� �� ���缭 ��¥ ��� NLS : NATIONAL LANGUAGE SUPPORT
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,    
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'DD') AS DD,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

-- ���� ������ ������ �����Ͽ� ����ϱ�
-- 9 : ������ �� �ڸ��� �ǹ��ϰ� �� �ڸ��� ä���� ����
-- 0 : �� �ڸ��� 0���� ä��
-- $ : �޷� ǥ�ø� ����
-- L : ���� ȭ�� ������ ǥ��
-- . : �Ҽ��� ǥ��
-- , : õ ���� ǥ��
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,   -- �޷� ǥ�ø� �ϰ� �� �ڸ��� ä���� ����
    TO_CHAR(SAL, 'L999,999') AS SAL_L,   -- ���� ȭ�� ǥ���ϰ�, õ������ , �߰�
    TO_CHAR(SAL, '999,999.00') AS SAL_1, -- �Ҽ��� ���� 2�ڸ� ǥ��
    TO_CHAR(SAL, '$000,999,999.00') AS SAL_2, -- �� �ڸ��� 0���� ä��
    TO_CHAR(SAL, '999999.99') AS SAL_3
    FROM EMP;
    
/* TO_NUMBER : ���� Ÿ���� ���ڿ��� ���� ������ Ÿ������ ��ȯ���ִ� �Լ��ε� �ڵ� ����ȯ���� ����� ��찡 ���� */
SELECT TO_NUMBER('1300') - TO_NUMBER('1500'),
    '1300' - '1500',    -- �ڵ� ����ȯ �Ͼ
    '1300' + 1500
    FROM DUAL;

/* TO_DATE : ���ڿ��� ��õ� ��¥�� ��¥ Ÿ������ ��ȯ�ϴ� �Լ� */
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
    FROM DUAL;
    
DESC EMP;
    
SELECT * 
    FROM EMP
    WHERE HIREDATE < TO_DATE('1981/01/01', 'YYYY/MM/DD');
    
/* 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ��� */
SELECT *
    FROM EMP
    WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

/* NVL �Լ��� ���� */
-- NVL(�����Ϳ�, ���� �����Ͱ� NULL�� ��� ��ȯ�� ������)
SELECT EMPNO, ENAME, SAL, COMM, 
    NVL(COMM, 0),
    SAL*12+NVL(COMM,0)
    FROM EMP;

-- NVL2(�˻��� �����Ϳ�, NULL�� �ƴ� ��쿡 ���� ����, NULL�� ��쿡 ���� ����)
SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X') AS "NULL ���� ǥ��",
    NVL2(COMM, SAL*12+COMM, SAL*12) AS "���� ���"
    FROM EMP;

-- NULLIF : �� ���� ���ؼ� �������� �ƴ����� ���� ��� ��ȯ : ������ NULL ��ȯ, �������� ������ ù��° ���� ��ȯ
SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM DUAL;

/* DECODE : �־��� ������ ���� ���ǰ��� ��ġ�ϴ� ���� ����ϰ� ��ġ�ϴ� ���� ������ �⺻�� ��� */
-- ���ǹ� �Ǵ� SWITCH���� ����
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'MANAGER', SAL*1.1, 
                'SALESMAN', SAL*1.05,
                'ANALYST', SAL,
                SAL*1.03) AS �޿��λ�
    FROM EMP;

/* CASE �� : �־��� ������ ���� ���ǰ��� ��ġ�ϴ� ���� ����ϰ� ��ġ�ϴ� ���� ������ �⺻�� ��� */
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB 
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS �޿��λ�
    FROM EMP;
    
-- �� ���� ���� ��� ���� �޶����� CASE ��, IF���� ����
SELECT EMPNO, ENAME, COMM, 
    CASE 
        WHEN COMM IS NULL THEN '�ش���� ����'
        WHEN COMM = 0 THEN '���� ����'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS ����ǥ��
    FROM EMP;

/* ������ �ǽ� ���� */
-- 1�� ����,
SELECT EMPNO,
    SUBSTR(EMPNO, 1, 2) || '**' AS MASKING_EMPNO,  ENAME,
    SUBSTR(ENAME, 1, 1) || '****' AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

-- 2�� ����
SELECT EMPNO, ENAME, SAL,
    TRUNC((SAL /  21.5), 2)AS DAY_PAY,
    ROUND(((SAL /  21.5) / 8), 1) AS TIME_PAY
    FROM EMP;

-- 3�� ����
SELECT EMPNO, ENAME, HIREDATE,
    REPLACE(NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'��'),'/','-') AS R_JOB,
    CASE 
    WHEN COMM IS NULL THEN 'N/A'
    ELSE TO_CHAR(COMM)
    END AS COMM
    FROM EMP;


-- 4�� ����
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN SUBSTR(MGR,1,2) = '76' THEN '6666'
        WHEN SUBSTR(MGR,1,2) = '77' THEN '7777'
        WHEN SUBSTR(MGR,1,2) = '78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR
    FROM EMP;

-- SCOTT ���� ����
1. ���� ��¥�� ���� ���� ��ȸ
SELECT SYSDATE AS "���� ��¥" FROM DUAL;

2. EMP ���̺��� ���, �����, �޿� ��ȸ (��, �޿��� 100���������� ���� ���ó���ϰ� �޿� ���� �������� ����)
SELECT EMPNO, ENAME, TRUNC(SAL, -2)
    FROM EMP
    ORDER BY SAL DESC;

3. �����ȣ�� Ȧ���� ����� ��ȸ
SELECT *
    FROM EMP
    WHERE MOD(EMPNO, 2) != 0;

4. �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)
SELECT ENAME, 
    TO_CHAR(HIREDATE, 'YY') AS �⵵,
    TO_CHAR(HIREDATE, 'MM') AS ��
    FROM EMP;

5. 9���� �Ի��� ������ ���� ��ȸ
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '09';

6. 81�⵵�� �Ի��� ���� ��ȸ
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') = '81';

7. �̸��� 'E'�� ������ ���� ��ȸ
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%E';

8. �̸��� ����° ���ڰ� 'R'�� ������ ���� ��ȸ
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__R%';

9. �纻, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ
SELECT EMPNO, ENAME, HIREDATE, 
        ADD_MONTHS(HIREDATE, 480) AS "40�� ��"
    FROM EMP;


10. �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ
SELECT *
    FROM EMP
    WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 456;

11. ���� ��¥���� �⵵�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY') AS �⵵ FROM DUAL;