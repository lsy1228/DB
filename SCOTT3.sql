/* 2023년 2월 15일 */
-- SUBSTR 함수와 다른 함수 함께 사용
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- JOB의 길이는 5이고 5에 대한 음수를 취하면 뒤에서 부터 음수값이 커지면서 읽어냄 
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체할 때 사용(자바의 문법과 유사), 대체할 문자열을 넣지 않으면 삭제 효과 */
SELECT '010-5006-4146' AS 변경이전,
    REPLACE('010-5006-4146', '-', ' ') 하이픈을공백으로,
    REPLACE('010-5006-4146', '-') 하이픈삭제
    FROM DUAL;
    
-- LPAD/RPAD : 공간에 대한 칸수를 지정하고 빈칸만큼 특정 문자로 채우는 기능
SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
SELECT 'ORACLE',
    LPAD('ORACLE', 10, '#') AS LPAD_1,
    RPAD('ORACLE', 10, '*') AS RPAD_1,
    LPAD('ORACLE', 10) AS LPAD_2,
    RPAD('ORACLE', 10) AS RPAD_2
    FROM DUAL;
    
-- 개인정보 뒷자리를 * 표시로 출력하기
SELECT 
    RPAD('971225-', 14, '*') AS RPAD_JUMIN,
    RPAD('010-5006-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME)) -- 중첩 사용
    FROM EMP
    WHERE ENAME = 'JAMES';

-- TRIM/LTRIM/RTRIM : 문자열 내에서 특정 문자열 지우기위해 사용
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM, -- 문자열의 앞뒤 공백을 지움
    '[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM, -- 문자열의 앞 공백을 지움
    '[' || LTRIM('<_ORACLE_>', '<_') || ']' AS LTRIM_2, -- 지정한 문자를 지움
    '[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM, -- 문자열의 뒤 공백을 지움
    '[' || RTRIM('<_ORACLE_>', '_>') || ']' AS RTRIM_2 -- 지정한 문자를 지움
    FROM DUAL;
    
SELECT TRIM('        JKS2024        ') AS TRIM FROM DUAL;

/* 날짜 데이터를 다루는 날짜 함수 */
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW,
    SYSDATE - 1 AS YESTERDAY, -- 운영체제에서 읽어온 시간 정보에서 1일을 뺌
    SYSDATE + 1 AS TOMORROW   -- 운영체제에서 읽어온 시간 정보에서 1일을 더함
    FROM DUAL;

/* 몇 개월 이후의 날짜를 구하는 ADD_MONTH 함수 */
-- 특정 날짜에 지정한 개월 수 이후 날짜 데이터를 반환하는 함수
-- ADD_MONTHS[날짜 데이터, 더할 개월 수]
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;

/* 실습 문제(EMP) : 사원에 대해 사원번호, 이름, 입사일, 10년 경과된 날짜 출력 */
SELECT EMPNO 사원번호, ENAME 이름, HIREDATE 입사일, ADD_MONTHS(HIREDATE, 120) AS "10년 경과일"
    FROM EMP;

/* 실습 문제(DUAL) : 현재 시간과 8개월 이후 시간 출력 */
SELECT SYSDATE 현재시간, ADD_MONTHS(SYSDATE, 8) AS "8개월 경과"
    FROM DUAL;
    
/* 두 날짜간의 개월 수 차이를 구하는 MONTHS_BETWEEN 함수 */
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
    FROM EMP;

/* 돌아오는 요일, 달의 마지막 날짜를 구하는 NEXT_DAY, LAST_DAY 함수 */
-- NEXT_DAY(날짜 데이터, 요일문자) -> 날짜 기준으로 돌아오는 요일의 날짜를 출력
-- LAST_DAY(날짜 데이터) -> 날짜가 속한 달의 마지막 날짜를 출력
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '월요일'),
    LAST_DAY(SYSDATE)
    FROM DUAL;
    
-- 날짜를 반올림, 버림을 하는 ROUND, TRUNC 함수
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
    FROM EMP;

-- 날짜 정보를 추출 함수
SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
    FROM DUAL;

SELECT * 
    FROM EMP
    WHERE EXTRACT(MONTH FROM HIREDATE) = 12;

SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -- 현재 몇월인지 출력

/* 자료형을 변환하는 형 변환 함수 */
-- 오라클도 자바와 마찬가지로 명시적 형변환과 묵시적 형변환이 있음
-- 자동(묵시적) 형변환 : 숫자와 문자 자료형의 연산은 자동으로 숫자로 변환(자바와 다른점)
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP;

SELECT EMPNO, ENAME, EMPNO + 'ABCD'  -- 에러가 발생함
    FROM EMP;
    
/* 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수 */
-- TO_CHAR 함수는 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수, 주로 날짜 데이터를 문자 데이터로 변환시 자주 사용
-- TO_CHAR(날짜 데이터, 출력되기를 원하는 문자 형태)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재 날짜와 시간"  -- 대소문자 구분 안함
    FROM DUAL;

-- 다양한 형식으로 출력하기
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS "몇주차"
    FROM DUAL;
    
-- 특정 언어에 맞춰서 날짜 출력 NLS : NATIONAL LANGUAGE SUPPORT
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

-- 숫자 데이터 형식을 지정하여 출력하기
-- 9 : 숫자의 한 자리를 의미하고 빈 자리를 채우지 않음
-- 0 : 빈 자리를 0으로 채움
-- $ : 달러 표시를 붙임
-- L : 지역 화폐 단위를 표시
-- . : 소수점 표시
-- , : 천 단위 표시
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,   -- 달러 표시를 하고 빈 자리를 채우지 않음
    TO_CHAR(SAL, 'L999,999') AS SAL_L,   -- 지역 화폐를 표시하고, 천단위에 , 추가
    TO_CHAR(SAL, '999,999.00') AS SAL_1, -- 소수점 이하 2자리 표시
    TO_CHAR(SAL, '$000,999,999.00') AS SAL_2, -- 빈 자리를 0으로 채움
    TO_CHAR(SAL, '999999.99') AS SAL_3
    FROM EMP;
    
/* TO_NUMBER : 숫자 타입의 문자열을 숫자 데이터 타입으로 변환해주는 함수인데 자동 형변환으로 사용할 경우가 없음 */
SELECT TO_NUMBER('1300') - TO_NUMBER('1500'),
    '1300' - '1500',    -- 자동 형변환 일어남
    '1300' + 1500
    FROM DUAL;

/* TO_DATE : 문자열로 명시된 날짜를 날짜 타입으로 변환하는 함수 */
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
    FROM DUAL;
    
DESC EMP;
    
SELECT * 
    FROM EMP
    WHERE HIREDATE < TO_DATE('1981/01/01', 'YYYY/MM/DD');
    
/* 1981년 6월 1일 이후에 입사한 사원 정보 출력 */
SELECT *
    FROM EMP
    WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

/* NVL 함수의 사용법 */
-- NVL(데이터열, 앞의 데이터가 NULL일 경우 반환할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, 
    NVL(COMM, 0),
    SAL*12+NVL(COMM,0)
    FROM EMP;

-- NVL2(검사할 데이터열, NULL이 아닌 경우에 대한 계산식, NULL인 경우에 대한 계산식)
SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X') AS "NULL 여부 표시",
    NVL2(COMM, SAL*12+COMM, SAL*12) AS "연봉 계산"
    FROM EMP;

-- NULLIF : 두 값을 비교해서 동일한지 아닌지에 대한 결과 반환 : 같으면 NULL 반환, 동일하지 않으면 첫번째 값을 반환
SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM DUAL;

/* DECODE : 주어진 데이터 값이 조건값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값 출력 */
-- 조건문 또는 SWITCH문과 유사
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'MANAGER', SAL*1.1, 
                'SALESMAN', SAL*1.05,
                'ANALYST', SAL,
                SAL*1.03) AS 급여인상
    FROM EMP;

/* CASE 문 : 주어진 데이터 값이 조건값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값 출력 */
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB 
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS 급여인상
    FROM EMP;
    
-- 열 값에 따라서 출력 값이 달라지는 CASE 문, IF문과 유사
SELECT EMPNO, ENAME, COMM, 
    CASE 
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당 없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS 수당표시
    FROM EMP;

/* 오늘의 실습 문제 */
-- 1번 문제,
SELECT EMPNO,
    SUBSTR(EMPNO, 1, 2) || '**' AS MASKING_EMPNO,  ENAME,
    SUBSTR(ENAME, 1, 1) || '****' AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

-- 2번 문제
SELECT EMPNO, ENAME, SAL,
    TRUNC((SAL /  21.5), 2)AS DAY_PAY,
    ROUND(((SAL /  21.5) / 8), 1) AS TIME_PAY
    FROM EMP;

-- 3번 문제
SELECT EMPNO, ENAME, HIREDATE,
    REPLACE(NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'월'),'/','-') AS R_JOB,
    CASE 
    WHEN COMM IS NULL THEN 'N/A'
    ELSE TO_CHAR(COMM)
    END AS COMM
    FROM EMP;


-- 4번 문제
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

-- SCOTT 계정 문제
1. 오늘 날짜에 대한 정보 조회
SELECT SYSDATE AS "오늘 날짜" FROM DUAL;

2. EMP 테이블에서 사번, 사원명, 급여 조회 (단, 급여는 100단위까지의 값만 출력처리하고 급여 기준 내림차순 정렬)
SELECT EMPNO, ENAME, TRUNC(SAL, -2)
    FROM EMP
    ORDER BY SAL DESC;

3. 사원번호가 홀수인 사원들 조회
SELECT *
    FROM EMP
    WHERE MOD(EMPNO, 2) != 0;

4. 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
SELECT ENAME, 
    TO_CHAR(HIREDATE, 'YY') AS 년도,
    TO_CHAR(HIREDATE, 'MM') AS 월
    FROM EMP;

5. 9월에 입사한 직원의 정보 조회
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '09';

6. 81년도에 입사한 직원 조회
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') = '81';

7. 이름이 'E'로 끝나는 직원 조회
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%E';

8. 이름의 세번째 글자가 'R'인 직원의 정보 조회
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__R%';

9. 사본, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE, 
        ADD_MONTHS(HIREDATE, 480) AS "40년 후"
    FROM EMP;


10. 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT *
    FROM EMP
    WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 456;

11. 오늘 날짜에서 년도만 추출
SELECT TO_CHAR(SYSDATE, 'YYYY') AS 년도 FROM DUAL;