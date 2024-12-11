-- 7번
create table emp06
as
select * from emp;


-- 8번
select ename, sal, job
from emp06
where sal >(select min(sal)
            from emp06
            where job = '과장')
and job != '과장';

-- 9번
update emp06
set sal = sal + 100
where deptno = (select deptno
                from dept
                where loc = '인천');


-- 10번
delete from emp06
where deptno = (select deptno
                from dept
                where dname = '경리부');

-- 11번
select ename, deptno
from emp
where deptno = (select deptno
                from emp
                where ename = '이문세')
and ename != '이문세';

-- 12번
select ename, job
from emp
where job = (select job
                from emp
                where ename = '이문세')
and ename != '이문세';

-- 13번
select ename, sal
from emp
where sal >= (select sal
                from emp
                where ename = '이문세')
and ename != '이문세';

-- 14번
select ename, deptno
from emp
where deptno = (select deptno
                from dept
                where loc = '인천');
                
-- 15번
select ename, sal, mgr
from emp
where mgr = (select empno
            from emp
            where ename = '감우성');
            
-- 16번
select empno, ename, sal, deptno
from emp e
where sal = (select max(sal)
            from emp 
            where e.deptno = deptno)
order by deptno;
            
select empno, ename, sal, deptno
from emp e
where sal in (select max(sal)
            from emp 
            group by deptno)
order by deptno;

-- 17번
select deptno, dname, loc
from dept
where deptno in (select deptno
                from emp 
                where job = '과장');

-- 18번
select ename, sal, job
from emp
where sal > all (select sal
            from emp
            where job = '과장');
            
select ename, sal, job
from emp
where sal > (select max(sal)
            from emp
            where job = '과장');













