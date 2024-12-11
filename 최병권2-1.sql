-- 데이터를 조회하기 위한 select 문
select ename, job as 직급, comm as 성과금, sal*12+nvl(comm, 0) as "연 봉"
from emp;

-- 문자열을 연결 (||)
-- ex) 김사랑의 직급은 사원입니다.
select ename || '의 직급은 ' || job || '입니다.'
from emp;

-- 중복을 제거하는 distinct
select distinct job, ename
from emp;

-- 특정 조건의 데이터만 조회하는 where 절
-- 급여가 500 이상인 사원
select ename, job, sal
from emp
where sal >= 500;

-- 10번 부서에 소속된 직원 검색
select *
from emp
where deptno = 10;

-- 이문세 직원 검색
select *
from emp
where ename = '이문세';

-- 입사일이 2005년 1월 1일 이전인 직원 검색
select *
from emp
where '2005/01/01' > hiredate;

-- 부서번호가 10이고, 직급이 과장인 직원
select *
from emp
where deptno = 10 and job = '과장';

-- 10번 부서에 소속된 사원만 제외하고 검색
select *
from emp
where not deptno=10; -- deptno<>10도 가능

-- 급여를 400에서 500 사이를 받는 직원 검색
select *
from emp
where 400 <= sal and sal<= 500;

-- between and 연산자
select *
from emp
where sal between 400 and 500;

-- 커미션이 80이거나 100이거나 200인 직원 검색
select*
from emp
where comm = 80 or comm = 100 or comm = 200;

-- in 연산자
select *
from emp
where comm in(80, 100, 200);

-- 커미션이 80, 100, 200이 모두 아닌 직원 검색
select*
from emp
where comm <> 80 and comm <> 100 and comm <> 200; -- 검색 시 null은 제외된다

-- in 연산자
select *
from emp
where comm not in(80, 100, 200);

-- LIKE 연산자와 와일드카드(&,_)
-- 성이 이씬인 직원 검색
select *
from emp
where ename like '이%';

-- 이름에 '성'이 포함되어 있는 직원 검색
select *
from emp
where ename like '%성%';

-- 이름의 두 번째 글자가 '성'인 직원 검색
select *
from emp
where ename like '_성_';

-- 이름에 '성'이 포함되지 않은 직원 검색
select *
from emp
where ename not like '%성%'