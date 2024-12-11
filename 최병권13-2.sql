-- 10장 퀴즈
-- 11번
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- 12번
select e.ename, e.hiredate
from emp e join dept d
on e.deptno = d.deptno
where d.dname = '경리부';

-- 13번
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = '과장';

-- 14번
select work.ename, work.job
from emp work join emp manager
on work.mgr = manager.empno
where manager.ename = '감우성';

-- 15번
select work.ename, friend.ename
from emp work join emp friend
on work.deptno = friend.deptno
where work.ename = '감우성'
and friend.ename != '감우성';