--ch03 오라클 주요 함수 Quiz
--1. 사원번호가 홀수인 직원 검색
select *
from emp
where mod(empno, 2) <>0;

--2. 사원들의 입사일에 대해 년도, 월, 일을 개별적으로 출력
select substr(hiredate,1,2) 년도, substr(hiredate,4,2) 월, substr(hiredate,7,2) 일
from emp;

--3. 각 사원들의 현재까지의 근무일수 구하기
select sysdate - hiredate
from emp;

--4. 직속상관이 없는 직원만 출력, null대신 'CEO';
SELECT ename, NVL(TO_CHAR(mgr, '9999'), 'CEO') AS 직속상관 -- nvl의 인자는 서로 같아야 함
FROM emp
WHERE mgr IS NULL;


--5, Oracle에서 자동으로 생성되는 테이브, 계산이나 함수 등을 실행하고자 할 때 유용하게 사용
select 1+1
from dual;


--6, 오늘을 기준으로 100일 후의 날짜 출력
select sysdate +100
from dual;

--7, 오늘이 속한 달의 마지막 날짜을 출력
select last_day(sysdate)
from dual;

--8, nul2(comm,sal+comm, sal)의 의미는?
-- comm의 null아니면 두 번째 인자 출력, null이면 세 번째 인자 출력

--9, decode함수의 기능을 확장한 함수이며, 관계, 논리 연산과 같은 다양한 비교가 가능한 문법
-- case문 - when - then - else

--10, 현재 시점의 날짜 값을 자동적으로 입력하느 함수는?
select sysdate
from dual;


--ch04
--직원의 급여를 출력, 십의 자리에서 반올림
select round(sal,-2)
from emp;

--직원들의 총 급여 구하기(그룹함수)
select sum(sal)
from emp;

--직원들의 급여 총액, 평균액, 최대급여, 최소급여 구하기
select sum(sal) 급여총액, round(avg(sal)) 평균액, max(sal) 최대급여, min(sal) 최소급여
from emp;

--최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일 구하기
select max(hiredate), min(hiredate)
from emp;

--성과금의 총액 구하기(그룹함수와 null값)
select sum(comm)
from emp;

--최대 급여 구하기(그룹함수와 단순컬럼 X)
select max(sal)
from emp;

--전체 직원 수 성과금을 받는 직원의 수 구하기
select count(*) 전체직원수, count(comm) 성과금받는수
from emp;

--직급의 수 구하기(중복제거)
select count(distinct job)
from emp;

--데이터 그룹핑 -group by 절
--부서별 급여 최댓값
select deptno,max(sal)
from emp
group by deptno
order by deptno;

--직급별 급여의 총합, 평균, 최소값, 쵀대값 구하기
select job, sum(sal), round(avg(sal)), min(sal), max(sal)
from emp
group by job
order by avg(sal) desc;

--부서별 사원 수와 성과금을 받는 사원 수 구하기
select deptno, count(*)  부서별직원수, count(comm) 성과금받는수 
from emp
group by deptno
order by deptno;