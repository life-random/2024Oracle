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
select *
from emp
where mgr is null;

--3.3 사원 테이블의 자료를 입사일을 기준으로 정렬하여 최근에 입사한 직원을 가장 먼저
--출력하는 쿼리문을 작성하시오(사원번호, 사원명, 직급, 입사일 컬럼만 출력)
select empno, ename, job, to_char(hiredate)
from emp
order by hiredate desc;

--3.4부서 번호가 빠른 사원부터 출력하되, 같은 부서 내의 사원을 출력할 경우 입사한 지 가장
--오래된 사원부터 출력되도록 하시오.
select deptno, empno, ename, job, to_char(hiredate)
from emp
order by deptno asc, hiredate asc;


--ch03 오라클 주요 함수
--dual 테이블
--1일이 몇 분인지 계산
select 60*24
from dual;

--숫자 함수
--절대값을 구하는 abs함수,
-- -10에 대한 절대값 구하기
select -10, abs(-10)
from dual;

--소수점 아래를 버리는 floor함수
select 34.5678, floor(34.5678)
from dual;

--특정 자리수에서 반올림하는 round함수
select 34.5678, round(34.5678, 2), round(34.5678, -1)
from dual;

--특정 자리수에서 잘라내는 trunc함수
select 34.5678, trunc(34.5678, 2), trunc(34.5678, -1)
from dual;

-- 나머지를 수하는 mod함수
select 27/2, mod(27,2), mod(27,5), mod(27,7)
from dual;


--문자 처리 함수
--대소문자 변환함수
select 'Welcom to oracle',
        upper('Welcom to oracle'),
        lower('Welcom to oracle'),
        initcap('Welcom to oracle')
from dual;

--문자 길이를 구하는 함수
select length('Oracle'), length('오라클'),
        lengthb('Oracle'), lengthb('오라클')
from dual;

--문자열 일부만 추출하는 substr
select substr('Welcom to oracle', 4, 3),
        substr('Welcom to oracle', -4, 3)
from dual;

select substr('웰컴투오라클', 4, 3),
        substr('웰컴투오라클', -4, 3),
        substrb('웰컴투오라클', 4, 3),
        substrb('웰컴투오라클', -3, 3)
from dual;

--특정 기호로 채우는 LPAD/RPAD 함수
select lpad('Oracle', 20, '#')
from dual;

--형 변환 함수
--문자형으로 변환하는 to_char함수
--날짜형을 문자형으로 변환
select sysdate, to_char(sysdate, 'yyyy-mm day, AM hh:mi:ss')
from dual;

--숫자형을 문자형으로 to_char함수
select 1230000, to_char(1230000), to_char(1230000, 'L999,999,999'),
                                    to_char(1230000, 'L000,000,000')
from dual;


--날짜형을 변환하는 to_date함수
--2007년 4월2일에 입사한 직원 검색
select *
from emp
where hiredate = '07/04/02';

select *
from emp
where hiredate = to_date('20070402', 'yyyymmdd');

--올해 며칠이 지났는지 계산
select trunc(sysdate - to_date('2024-01-01', 'yyyy-mm-dd'))
from dual;

--숫자형으로 변환하는 to_number함수
select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

