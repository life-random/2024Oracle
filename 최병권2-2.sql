--null을 위한 연산자
--커미션이 null인 직원 검색
select *
from emp
--where comm = null;
where comm is null;--null인 값을 겁색

--커미션이 등록되어 있는 직원 검색
select *
from emp
where comm is not null;--null이 아닌 값을 검색

--정렬을 위한 order by  wjf
--급여를 적게 받는 직원부터 많이 받는 직원 순으로 검색
select *
from emp
order by sal asc; -- 오름차순

--급여 내림차순으로 검색
select *
from emp
order by sal desc;

--가장 최근에 입사한 사람부터 검색
select *
from emp
order by hiredate desc;

--급여를 많이 받는 순으로 검색하되, 급여가 같으면 이름이 빠른 순으로 검색
select *
from emp
order by sal desc, ename asc;

select ename, job as 직급, comm as 성과금, sal*12+nvl(comm, 0) as 연봉
from emp
--order by sal*12+nvl(comm, 0)desc;
order by 연봉 desc;

--
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;
--
CREATE TABLE GROUP_STAR(
	NAME		VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
	NAME		VARCHAR2(50)
);
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');

INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');
COMMIT;

--합집합 - union
--그룹활동, 싱글활동 하는 모든 가수 검색
select *
from group_star
union 
select *
from single_star;

select *
from group_star
union all --중복 허용
select *
from single_star;

--교집합 - intersect

select *
from group_star
intersect
select *
from single_star;

--차집합 - minus
select *
from group_star
minus
select *
from single_star;

select *
from single_star
minus
select *
from group_star;

--미션
--1.1 사원의 이름과 급여와 입사일자만을 출력할 수 있습니다
select ENAME, SAL, HIREDATE
from emp;

--1.2 부서번호는 dno로, 부서명은 dname으로 정해져 있으므로 다음과 같은 SQL 문의 결과는
--왼쪽 그림과 같이 컬럼 이름에도 역시 dno, dname으로 출력됩니다
--오른쪽 그림과 같이 칼럼 이름이 출력되도록 하기 위해 별칭을 지정하는 SQL문을 작성해 보시오.
select deptno as 부서번호, dname as 부서명
from dept;

--1.3사원 테이블에 존재하는 직급의 종류를 출력하기 위해서 다음과 같은 SQL 문을 수행하면
--화면 왼쪽 그림과 같이 중복된 내용이 출력됩니다.
--오른쪽 그림과 같이 직급이 중복되지 않고 한 번씩 나열되도록 SQL 문을 작성해 보시오.
select distinct job
from emp;

--2.1 급여가 300이하인 사원의 사원번호, 사원 이름, 급여를 출력하시오.
select empno, ename, sal
from emp
where sal <= 300;

--2.2 이름이 "오지호"인 사원의 사원번호, 사원명, 급여를 출력하시오.
select empno, ename, sal
from emp
where ename = '오지호';

--2.3 급여가 250이거나, 300이거나, 500인 사원들의 사원번호와 사원명과 급여를 검색하시오.
--조건, 비교 연산자와 OR 논리 연사자를 사용하여 작성해 보고, in 연산자로 한 번 더
--작성해보시오
select empno, ename, sal
from emp
where sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal
from emp
where sal in(250,300,500);

--2.4 급여가 250도, 300도, 500도 아닌 사원들을 검색하시오.
--조건, 비교 연산자와 AND논리 연산자를 사용하여 작성해보고, in연산자로 한 번 더 작성하시오.
select empno, ename, sal
from emp
where sal <> 250 and sal <> 300 and sal <> 500;

select empno, ename, sal
from emp
where sal not in(250,300,500);

--3.1 사원들 중에서 이름이 "김"으로 시작하는 사람과 이름 주에 "기"를 포함하는 사원의
--사원번호와 사원이름을 출력하는 쿼리문을 작성해 보시오.
--LIKE연산자와 와일드카드를 사용합니다.
select empno, ename
from emp
where ename like '김%' or ename like '%기%';

--3.2 상급자가 없는 사원(사장이 되겠지요!)을 검색하기 위한 SQL문을 작성해 보시오.