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

/* 테이블을 자료형을 정의하여 새로 생성하는 방법 */
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

/* 기존 테이블의 열 구조와 데이터를 복사하여 새 테이블 생성하는 방법 */
CREATE TABLE DEPT_DDL 
    AS SELECT * FROM DEPT;

SELECT * FROM DEPT_DDL;

/* 기존 테이블의 열 구조만 복사하여 새 테이블 만들기 */
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
* DDL (테이블 정의어)
* CREATE : 테이블 생성
* ALTER : 테이블 변경(ADD, RENAME, MODIFY, DROP)
* RENAME : 테이블 이름 변경
* TRUNCATE : 테이블의 데이터를 삭제
* DROP : 테이블 삭제
*/

/* 테이블을 변경하는 ALTER : 테이블에 새 열을 추가 또는 삭제, 열의 자료형의 길이 변경 등을 수행 */
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- 테이블에 새로운 열을 추가 : ADD, 추가된 열에 대한 행에는 NULL 값으로 입력됨
ALTER TABLE EMP_ALTER 
    ADD HP VARCHAR2(20);

-- 열 이름 변경 : RENAME
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

-- 열의 자료형을 변경 : MODIFY, 자료형 변경시 이미 해당 컬럼에 대한 행이 존재한다면 변경되지 않을 수 있음
-- 기존의 자료형의 크기보다 크게 변경하는 건 문제 안됨, 작게 변경하는 것은 포함된 데이터에 영향을 받음
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);

-- 특정 열을 삭제할 때 : DROP
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL;

/* 테이블 이름을 변경하는 RENAME */
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;   

/* 테이블의 데이터를 삭제하는 TRUNCATE */
-- 테이블의 모든 데이터를 삭제하는 명령어, 테이블 구조에 영향을 주지 않으며, ROLLBACK 불가
TRUNCATE TABLE EMP_RENAME;

/* 테이블을 삭제하는 DROP */
DROP TABLE EMP_RENAME;

/* 연습 문제 */
-- 1번
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

-- 2번
ALTER TABLE EMP_HW
    ADD BIGO VARCHAR2(20);

-- 3번
ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR2(30);

-- 4번
ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

-- 5번
INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO,NULL
    FROM EMP;

-- 6번
DROP TABLE EMP_HW; 