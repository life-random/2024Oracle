-- 11장 서브 쿼리
-- 단일행 서브쿼리
-- 이문세 직원의 부서명 검색
select deptno
from emp
where ename = '이문세';

select dname
from dept
where deptno = 10;

select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename = '이문세';

select dname
from dept
where deptno = (select deptno
                from emp
                where ename = '이문세');

-- 평균 급여보다 더 많은 급여를 받는 직원 검색하기
select ename, sal
from emp
where sal > (select avg(sal)
            from emp);
            
-- 최소 급여를 받는 직원 검색하기
select ename, sal
from emp
where sal = (select min(sal)
            from emp);

-- 다중행 서브쿼리
-- 급여가 500을 초과하는 직원과  같은 부서에 근무하는 직원 구하기
select ename, sal, deptno
from emp
where deptno in (select deptno
                from emp
                where sal > 500);

-- 30번 부서의 모든 급여보다 더 많은 급여를 받는 직원 검색하기
select sal
from emp
where sal> (select max(sal)
            from emp
            where deptno = 30);

select sal
from emp
where sal> all (select sal
            from emp
            where deptno = 30);

-- 30번 부서의 최소 급여보다 더 많은 급여를 받는 직원 검색하기
select sal
from emp
where sal> (select min(sal)
            from emp
            where deptno = 30);

select sal
from emp
where sal> any (select sal
            from emp
            where deptno = 30);

-- 직원이 있는 부서 검색하기
select *
from dept
where exists (  select *
                from emp
                where emp.deptno = dept.deptno)
order by 1;

-- 서브 쿼리를 이용하여 테이블을 생성하고, 데이터를 조작하기
-- 서브 쿼리로 테이블 생성하기
drop table dept04;

create table emp02
as
select * from emp;

select * from emp20;

create table emp10
as
select *
from emp
where deptno = 10;

create table emp20
as
select empno, ename, sal, deptno
from emp
where deptno = 20;

-- 구조만 가져오기
create table emp03
as
select * from emp where 1=0;

select * from emp03;

-- 서브 쿼리로 데이터를 삽입하기
create table dept02
as
select * from dept where 1=0;

select * from dept02;

insert into dept02
select * from dept;


-- 서브 쿼리를 이용한 데이터 변경
-- 20부서의 지역명을 40부서의 지역명으로 변경
update dept02
set loc = ( select loc
            from dept02
            where deptno = 40)
where deptno = 20;

-- 서브 쿼리를 이용한 데이터 삭제
-- 영업부 부서에 소속된 직원 삭제하기
delete from emp02
where deptno = ( select deptno
                from dept02
                where dname = '영업부');

select * from emp02;

-- 1번
select ename, sal, deptno
from emp
where deptno =(select deptno
                from dept
                where dname = '영업부')
order by 2 desc;



