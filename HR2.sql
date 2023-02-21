/* 2023.02.21 */

/* HR ���� ���� ���� ���� ���� */
-- 1. EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �ٸ� ��� �μ��� ���
SELECT DEPARTMENT_ID, MIN(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
        HAVING MIN(SALARY) > (SELECT MIN(SALARY)
                                FROM EMPLOYEES
                                WHERE DEPARTMENT_ID = 100)
    ORDER BY DEPARTMENT_ID;

-- 2. EMPLOYEES�� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ ����, ����, �μ���, �ٹ����� �ⷫ
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS ����, E.JOB_ID, D.DEPARTMENT_ID, D.LOCATION_ID
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE JOB_ID = 'SA_MAN';


-- 3. EMPLOYEES ���̺��� (���� ���� ���)�� ���� MANAGER�� �����ȣ�� ���
SELECT MANAGER_ID, COUNT(*)
    FROM EMPLOYEES
    GROUP BY MANAGER_ID
        HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                                FROM EMPLOYEES
                                GROUP BY MANAGER_ID);
                                
-- 4. EMPLOYEES ���̺��� (���� ���� ����� �����ִ� �μ� ��ȣ)�� ������� ���
SELECT DEPARTMENT_ID, COUNT(*) AS �����
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
        HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                                FROM EMPLOYEES
                                GROUP BY DEPARTMENT_ID);


-- 5. ����(JOB) ���� �ּұ޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �μ����� ��� (�������� ��������)
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS ����, JOB_ID, DEPARTMENT_NAME, SALARY
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE (JOB_ID, SALARY) IN (SELECT JOB_ID, MIN(SALARY)
                                        FROM EMPLOYEES
                                        GROUP BY JOB_ID)
    ORDER BY JOB_ID DESC;

-- 6. EMPLOYEES ���̺��� (50�� �μ��� �ְ� �޿�)�� �޴� ������� ���� �޿��� �޴� ����� �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ�� ��� (��, 50���� ����)
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS ����, JOB_ID, HIRE_DATE, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE SALARY > (SELECT MAX(SALARY)
                                FROM EMPLOYEES
                                WHERE DEPARTMENT_ID = 50)
    AND DEPARTMENT_ID != 50;




