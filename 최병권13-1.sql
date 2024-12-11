-- 10장 조인
select *
from emp
where ename = '이문세';

select *
from dept;

-- Cross Join - 1:1대응 칼럼 * 칼럼 만큼 출력
select * 
from emp, dept;

-- Equi Join
select *
from emp, dept
where emp.deptno = dept.deptno;

-- Equi Join ver.별칭
select e.ename, d.dname, d.deptno
from emp e, dept d
where e.deptno = d.deptno
and e.ename = '이문세';


-- Non-Equi Join
select * from emp;

-- 직원들의 급여 등급 구하기
select e.ename, e.sal, s.grade 급여등급
from emp e, salgrade s
where e.sal between losal and hisal
order by 3;

select e.ename, e.sal, s.grade 급여등급
from emp e, salgrade s
where e.sal >= s.losal and e.sal >= hisal
order by 3;

-- 직원 이름, 급여, 급여등급, 부서명 검색하기
select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where e.sal between losal and hisal
and e.deptno = d.deptno
and e.ename = '이문세'
order by 4,3;


-- Self Join
select e.empno, e.ename 직원, f.ename 직속상관
from emp e, emp f
where e.mgr = f.empno
order by e.empno;

-- ANSI(미국표준연구소) Join
-- ANSI Cross Join
select *
from emp cross join dept;

--ANSI Inner Join
select e.ename, d.dname, d.deptno
from emp e join dept d
on e.deptno = d.deptno
where e.ename = '이문세';


-- ANSI 3개 join하기
select e.ename, e.sal, s.grade, d.dname
from emp e join salgrade s
on e.sal between losal and hisal
join dept d
on e.deptno = d.deptno
where e.ename = '이문세';

--ANSI Outer Join (null 값도 포함)
select e.empno, e.ename 직원, f.ename 직속상관
from emp e left outer join emp f
on e.mgr = f.empno
order by e.empno;

--미션
--1 경리부에서 근무하는 사원의 이름과 입사일을 출력해 봅시다.
select e.ename 이름, e.hiredate 입사일, d.dname 부서
from emp e join dept d
on e.deptno = d.deptno
where d.dname = '경리부';

--2 ANSI JOIN을 사용하여 인천에서 근무하는 사원의 이름과 급여를 출력해봅시다.
select e.ename 이름, e.sal 급여, d.loc 거주구역
from emp e join dept d
on e.deptno = d.deptno
where d.loc = '인천';