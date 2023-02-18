SELECT ENAME, SUM(SAL)
    FROM EMP;
    
SELECT DEPTNO, SUM(SAL)
    FROM EMP;

SELECT DEPTNO, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB;

SELECT JOB, MAX(SAL)
    FROM EMP
    GROUP BY JOB;

SELECT JOB, MIN(SAL)
    FROM EMP
    GROUP BY JOB;    

/* �հ� ���ϴ� SUM �Լ� */
-- DISTINCT : �ߺ�����
-- ALL : ������� �ʾƵ� �⺻������ ALL Ư���� ����
SELECT SAL FROM EMP;
SELECT SUM(DISTINCT SAL) AS �ߺ�����, SUM(ALL SAL) AS ����, SUM(SAL) AS �⺻
    FROM EMP;

SELECT SUM(SAL), SUM(COMM) FROM EMP;

SELECT COUNT(*) FROM EMP;
SELECT COUNT(COMM) FROM EMP; -- COMM�� NULL�� �ƴ� ����� ��

SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;

-- �μ���ȣ�� 20�� ��� �� �Ի����� ���� �ֱ��� ���
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
/* GROUP BY : �ϳ��� ����� Ư�� ���� ��� ����ϴ� ���� �׷�ȭ�Ѵٰ� �� */
-- �̶� ����ؾ� �� ����� ������ GROUP BY�� ����
SELECT TRUNC((AVG(SAL))), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;

-- �׷����� �ȹ��� ���
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 10;
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 20;
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 30;

/* �μ���ȣ �� ��å�� ��� �޿��� �����ϱ� */
SELECT DEPTNO, JOB, TRUNC(AVG(SAL))
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
/* GROUP BY ���� ����Ͽ� �μ���ȣ�� ��� �߰� ������ ��� */
SELECT DEPTNO, NVL(AVG(COMM),0)
    FROM EMP
    GROUP BY DEPTNO;

/* �μ��ڵ�, �޿��հ�, �μ��޿����, �μ��ڵ� �� ���� */
SELECT DEPTNO �μ��ڵ�,
    SUM(SAL) �޿��հ�,
    FLOOR(AVG(SAL)) �μ��޿����,
    COUNT(*) �ο���
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
    
/* HAVING �� */
-- GROUP BY���� ������ ���� ��� �� �� ���� 
-- �׷�ȭ �� ���� ������ �����ϴ� �뵵�� ���
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;

-- WHERE ���� ����ϴ� ��� ���� �߻�
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
/* WHERE���� HAVING���� ��� ����ϴ� ��� */
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP -- ù��°�� ���� : 13�� ���� ����
    WHERE SAL <= 2500
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
/* ���� ���� */
-- 1��
SELECT DEPTNO �μ���ȣ, JOB ��å, AVG(SAL) AS ��ձ޿�
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 500 -- �׷����� ���� �࿡ ���ؼ� ���� ������ �ο��Ϸ��� HAVING ���� ����ؾ� ��
    ORDER BY DEPTNO, JOB;
    
-- 2��
SELECT DEPTNO, TRUNC(AVG(SAL)) ��ձ޿�, MAX(SAL) �ְ�޿�, MIN(SAL) �����޿�, COUNT(*) AS �����
    FROM EMP
    GROUP BY DEPTNO;

-- 3��
SELECT JOB ��å, COUNT(*) AS �����
    FROM EMP
    GROUP BY JOB
        HAVING COUNT(JOB) >= 3;

-- 4��
SELECT EXTRACT(YEAR FROM HIREDATE) �Ի���, DEPTNO, COUNT(*) AS �����
    FROM EMP
    GROUP BY EXTRACT(YEAR FROM HIREDATE), DEPTNO;

-- 5��
SELECT NVL2(COMM, 'O','X') AS �߰�����, COUNT(*) AS �����
    FROM EMP
    GROUP BY NVL2(COMM, 'O','X');

-- 6��
SELECT DEPTNO, EXTRACT(YEAR FROM HIREDATE) �Ի�⵵, COUNT(*) �����, MAX(SAL) �ְ�޿�, TRUNC(AVG(SAL)) ��ձ޿�, SUM(SAL) �հ�
    FROM EMP
    GROUP BY DEPTNO, EXTRACT(YEAR FROM HIREDATE)
    ORDER BY DEPTNO;


/* ROLLUP �Լ� ������ �׷�ȭ */
-- ����� ���� �ұ׷���� ��׷��� ������ �� �׷캰 ����� ����ϰ� �������� �� ������ ����� ���
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, JOB);
    
/* ���� ������ : �� �� �̻��� ���� ����� �ϳ��� �����ϴ� ������ */
-- UNION : ������, �ߺ� ����
-- UNION ALL : ������, �ߺ� ���� ���� ����
-- MINUS : ������
-- INTERSECT : ������
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE ENAME = 'FORD';

-- ������ : �� ���� �������� ��� ���ԵǾ� �ִ� �����͸� ǥ��
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL < 2000;

-- ������ : ���� ������ ������� ���� ������ ����� �� ��
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 2000;
    
/* JOIN */
-- JOIN�� �� �� �̻��� ���̺��� �����͸� �����ͼ� �����ϴµ� ���Ǵ� SQL�� ���
-- ���̺��� �ĺ����� primary key�� ���̺� �� ���밪�� foreign key���� ����Ͽ� ����
-- INER JOIN : �� ���̺��� ��ġ�ϴ� �����͸� ����
-- LEFT JOIN : ���� ���̺��� ��� �����Ϳ� ������ �����Ϳ��� ��ġ�ϴ� �����͸� ����
-- RIGHT JOIN : ������ ���̺��� ��� �����Ϳ� ���� ���̺��� ��ġ�ϴ� ������ ����

-- �� ���� ���̺��� ��� ���� ���յǾ� ������ * �����͸�ŭ�� ����� ǥ�õ� (ī�׽þ� ��)
SELECT *
    FROM EMP, DEPT
    ORDER BY EMPNO;

SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;

/* ���̺��� ��Ī�ֱ� : ���� ���̺� ��ο� �����ϴ� ���� ���ؼ��� ���̺� �̸��� ����ؾ� �� */
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.JOB = 'MANAGER';

/* � ���� */
 -- ���̺��� ������ �Ŀ� ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ���
  -- ANSI ���� ������� ����
 -- ����Ŭ 9i������ ����Ŭ ���θ� ����� �� �־�����, ����Ŭ 10g ���ʹ� ANSI ������ �߰��� ��� ����
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.JOB = 'MANAGER';

-- EMP�� DEPT ���̺��� �����ϰ� �޿��� 3000�̻��� ��� ���� ��� (�����ȣ, �̸�, �޿�, �Ի���, �μ���ȣ, �μ��̸�) */
-- ����Ŭ ���
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- ANSI ���
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL >= 3000;

/* EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� � ������ ���� ��,
   �޿��� 2500 �����̰� ��� ��ȣ�� 9999 ������ ����� ������ ��µǵ��� �ۼ� */
-- ����Ŭ ���
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL <= 2500 AND EMPNO <= 9999;

-- ANSI ���
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL < 2500 AND EMPNO <= 9999;

/* �� ���� : ���� ���� �ƴ� �ٸ� ������ ����Ͽ� ���� �� �� ���Ǹ� ���� ������ ���� */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- �޿��� ���� ����� ǥ���ϱ� ���ؼ��� �޿��� �ݾ��� ��ġ�� �� �����Ƿ� �ּҿ� �ִ� �޿� ���̿� �־�� ��
-- �̷� ��� BETWEEN A AND B �����ڸ� ����ϸ� ó�� ����
SELECT ENAME, SAL, GRADE
    FROM EMP E JOIN SALGRADE S
    ON SAL BETWEEN LOSAL AND HISAL;

/* ��ü ���� : ���� ���̺��� �ι� ����ϴ� �� */
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
       FROM EMP E1 JOIN EMP E2
       ON E1.MGR = E2.EMPNO;

/* �ܺ� ����(OUTER JOIN) : ���� ����(INNER JOIN) �Ǵ� ���������� ��� ������ �÷�(��)�� ���� ���ٸ� ��ȸ���� ����
                         �ݸ�, �ܺ� ������ ���� ���� ���ΰ� �޸� ������� ���� ���� ǥ���� */

-- ANSI ����(RIGHT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E RIGHT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ANSI ����(LEFT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E LEFT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ORACLE ����(RIGHT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO(+) = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ORACLE ����(LEFT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+)
    ORDER BY E.DEPTNO;

