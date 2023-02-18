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

/* 합계 구하는 SUM 함수 */
-- DISTINCT : 중복제거
-- ALL : 사용하지 않아도 기본적으로 ALL 특성을 가짐
SELECT SAL FROM EMP;
SELECT SUM(DISTINCT SAL) AS 중복제거, SUM(ALL SAL) AS 전부, SUM(SAL) AS 기본
    FROM EMP;

SELECT SUM(SAL), SUM(COMM) FROM EMP;

SELECT COUNT(*) FROM EMP;
SELECT COUNT(COMM) FROM EMP; -- COMM이 NULL이 아닌 사원의 수

SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;

-- 부서번호가 20인 사원 중 입사일이 가장 최근인 사원
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
/* GROUP BY : 하나의 결과를 특정 열을 묶어서 출력하는 것을 그룹화한다고 함 */
-- 이때 출력해야 할 대상열을 지정을 GROUP BY로 수행
SELECT TRUNC((AVG(SAL))), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;

-- 그룹으로 안묶는 경우
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 10;
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 20;
SELECT TRUNC((AVG(SAL))) FROM EMP WHERE DEPTNO = 30;

/* 부서번호 및 직책별 평균 급여로 정렬하기 */
SELECT DEPTNO, JOB, TRUNC(AVG(SAL))
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
/* GROUP BY 절을 사용하여 부서번호별 평균 추가 수당을 출력 */
SELECT DEPTNO, NVL(AVG(COMM),0)
    FROM EMP
    GROUP BY DEPTNO;

/* 부서코드, 급여합계, 부서급여평균, 부서코드 순 정렬 */
SELECT DEPTNO 부서코드,
    SUM(SAL) 급여합계,
    FLOOR(AVG(SAL)) 부서급여평균,
    COUNT(*) 인원수
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
    
/* HAVING 절 */
-- GROUP BY절이 존재할 때만 사용 할 수 있음 
-- 그룹화 된 값의 범위를 제한하는 용도로 사용
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;

-- WHERE 절을 사용하는 경우 에러 발생
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
/* WHERE절과 HAVING절을 모두 사용하는 경우 */
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP -- 첫번째로 수행 : 13개 행이 들어옴
    WHERE SAL <= 2500
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
/* 연습 문제 */
-- 1번
SELECT DEPTNO 부서번호, JOB 직책, AVG(SAL) AS 평균급여
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 500 -- 그룹으로 묶은 행에 대해서 제약 조건을 부여하려면 HAVING 절을 사용해야 함
    ORDER BY DEPTNO, JOB;
    
-- 2번
SELECT DEPTNO, TRUNC(AVG(SAL)) 평균급여, MAX(SAL) 최고급여, MIN(SAL) 최저급여, COUNT(*) AS 사원수
    FROM EMP
    GROUP BY DEPTNO;

-- 3번
SELECT JOB 직책, COUNT(*) AS 사원수
    FROM EMP
    GROUP BY JOB
        HAVING COUNT(JOB) >= 3;

-- 4번
SELECT EXTRACT(YEAR FROM HIREDATE) 입사일, DEPTNO, COUNT(*) AS 사원수
    FROM EMP
    GROUP BY EXTRACT(YEAR FROM HIREDATE), DEPTNO;

-- 5번
SELECT NVL2(COMM, 'O','X') AS 추가수당, COUNT(*) AS 사원수
    FROM EMP
    GROUP BY NVL2(COMM, 'O','X');

-- 6번
SELECT DEPTNO, EXTRACT(YEAR FROM HIREDATE) 입사년도, COUNT(*) 사원수, MAX(SAL) 최고급여, TRUNC(AVG(SAL)) 평균급여, SUM(SAL) 합계
    FROM EMP
    GROUP BY DEPTNO, EXTRACT(YEAR FROM HIREDATE)
    ORDER BY DEPTNO;


/* ROLLUP 함수 적용한 그룹화 */
-- 명시한 열을 소그룹부터 대그룹의 순서로 각 그룹별 결과를 출력하고 마지막에 총 데이터 결과를 출력
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, JOB);
    
/* 집합 연산자 : 두 개 이상의 쿼리 결과를 하나로 결합하는 연산자 */
-- UNION : 합집합, 중복 제거
-- UNION ALL : 합집합, 중복 제거 하지 않음
-- MINUS : 차집합
-- INTERSECT : 교집합
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

-- 교집합 : 두 개의 쿼리문에 모두 포함되어 있는 데이터를 표시
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL < 2000;

-- 차집합 : 앞의 쿼리문 결과에서 뒤의 쿼리문 결과를 뺀 것
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 2000;
    
/* JOIN */
-- JOIN은 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL의 기능
-- 테이블의 식별값이 primary key와 테이블 간 공통값이 foreign key값을 사용하여 조인
-- INER JOIN : 두 테이블에서 일치하는 데이터만 선택
-- LEFT JOIN : 왼쪽 테이블의 모든 데이터와 오른쪽 데이터에서 일치하는 데이터를 선택
-- RIGHT JOIN : 오른쪽 테이블의 모든 데이터와 왼쪽 테이블에서 일치하는 데이터 선택

-- 두 개의 테이블의 모든 열의 결합되어 데이터 * 데이터만큼의 결과가 표시됨 (카테시안 곱)
SELECT *
    FROM EMP, DEPT
    ORDER BY EMPNO;

SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;

/* 테이블의 별칭주기 : 양쪽 테이블 모두에 존재하는 열에 대해서는 테이블 이름을 명시해야 함 */
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.JOB = 'MANAGER';

/* 등가 조인 */
 -- 테이블을 연결한 후에 출력 행을 각 테이블의 특정 열에 위치한 데이터를 기준으로 선정하는 방식
  -- ANSI 조인 방식으로 연결
 -- 오라클 9i까지는 오라클 조인만 사용할 수 있었으나, 오라클 10g 부터는 ANSI 조인을 추가로 사용 가능
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.JOB = 'MANAGER';

-- EMP와 DEPT 테이블을 조인하고 급여가 3000이상인 사원 정보 출력 (사원번호, 이름, 급여, 입사일, 부서번호, 부서이름) */
-- 오라클 방식
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- ANSI 방식
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL >= 3000;

/* EMP 테이블 별칭을 E로, DEPT 테이블 별칭을 D로 하여 다음과 같이 등가 조인을 했을 때,
   급여가 2500 이하이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성 */
-- 오라클 방식
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL <= 2500 AND EMPNO <= 9999;

-- ANSI 방식
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL < 2500 AND EMPNO <= 9999;

/* 비등가 조인 : 동일 열이 아닌 다른 조건을 사용하여 조인 할 때 사용되며 자주 사용되지 않음 */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- 급여에 대한 등급을 표시하기 위해서는 급여의 금액이 일치할 수 없으므로 최소와 최대 급여 사이에 있어야 함
-- 이런 경우 BETWEEN A AND B 연산자를 사용하면 처리 가능
SELECT ENAME, SAL, GRADE
    FROM EMP E JOIN SALGRADE S
    ON SAL BETWEEN LOSAL AND HISAL;

/* 자체 조인 : 같은 테이블을 두번 사용하는 것 */
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
       FROM EMP E1 JOIN EMP E2
       ON E1.MGR = E2.EMPNO;

/* 외부 조인(OUTER JOIN) : 내부 조인(INNER JOIN) 또는 동등조인의 경우 한쪽의 컬럼(열)에 값이 없다면 조회되지 않음
                         반면, 외부 조인의 경우는 내부 조인과 달리 공통되지 않은 열도 표시함 */

-- ANSI 문법(RIGHT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E RIGHT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ANSI 문법(LEFT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E LEFT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ORACLE 문법(RIGHT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO(+) = D.DEPTNO
    ORDER BY E.DEPTNO;

-- ORACLE 문법(LEFT OUTER JOIN)
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+)
    ORDER BY E.DEPTNO;

