-- 10�� ����
-- 11��
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- 12��
select e.ename, e.hiredate
from emp e join dept d
on e.deptno = d.deptno
where d.dname = '�渮��';

-- 13��
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = '����';

-- 14��
select work.ename, work.job
from emp work join emp manager
on work.mgr = manager.empno
where manager.ename = '���켺';

-- 15��
select work.ename, friend.ename
from emp work join emp friend
on work.deptno = friend.deptno
where work.ename = '���켺'
and friend.ename != '���켺';