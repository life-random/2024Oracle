-- 7��
create table emp06
as
select * from emp;


-- 8��
select ename, sal, job
from emp06
where sal >(select min(sal)
            from emp06
            where job = '����')
and job != '����';

-- 9��
update emp06
set sal = sal + 100
where deptno = (select deptno
                from dept
                where loc = '��õ');


-- 10��
delete from emp06
where deptno = (select deptno
                from dept
                where dname = '�渮��');

-- 11��
select ename, deptno
from emp
where deptno = (select deptno
                from emp
                where ename = '�̹���')
and ename != '�̹���';

-- 12��
select ename, job
from emp
where job = (select job
                from emp
                where ename = '�̹���')
and ename != '�̹���';

-- 13��
select ename, sal
from emp
where sal >= (select sal
                from emp
                where ename = '�̹���')
and ename != '�̹���';

-- 14��
select ename, deptno
from emp
where deptno = (select deptno
                from dept
                where loc = '��õ');
                
-- 15��
select ename, sal, mgr
from emp
where mgr = (select empno
            from emp
            where ename = '���켺');
            
-- 16��
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

-- 17��
select deptno, dname, loc
from dept
where deptno in (select deptno
                from emp 
                where job = '����');

-- 18��
select ename, sal, job
from emp
where sal > all (select sal
            from emp
            where job = '����');
            
select ename, sal, job
from emp
where sal > (select max(sal)
            from emp
            where job = '����');













