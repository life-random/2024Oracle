-- 10�� ����
select *
from emp
where ename = '�̹���';

select *
from dept;

-- Cross Join - 1:1���� Į�� * Į�� ��ŭ ���
select * 
from emp, dept;

-- Equi Join
select *
from emp, dept
where emp.deptno = dept.deptno;

-- Equi Join ver.��Ī
select e.ename, d.dname, d.deptno
from emp e, dept d
where e.deptno = d.deptno
and e.ename = '�̹���';


-- Non-Equi Join
select * from emp;

-- �������� �޿� ��� ���ϱ�
select e.ename, e.sal, s.grade �޿����
from emp e, salgrade s
where e.sal between losal and hisal
order by 3;

select e.ename, e.sal, s.grade �޿����
from emp e, salgrade s
where e.sal >= s.losal and e.sal >= hisal
order by 3;

-- ���� �̸�, �޿�, �޿����, �μ��� �˻��ϱ�
select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where e.sal between losal and hisal
and e.deptno = d.deptno
and e.ename = '�̹���'
order by 4,3;


-- Self Join
select e.empno, e.ename ����, f.ename ���ӻ��
from emp e, emp f
where e.mgr = f.empno
order by e.empno;

-- ANSI(�̱�ǥ�ؿ�����) Join
-- ANSI Cross Join
select *
from emp cross join dept;

--ANSI Inner Join
select e.ename, d.dname, d.deptno
from emp e join dept d
on e.deptno = d.deptno
where e.ename = '�̹���';


-- ANSI 3�� join�ϱ�
select e.ename, e.sal, s.grade, d.dname
from emp e join salgrade s
on e.sal between losal and hisal
join dept d
on e.deptno = d.deptno
where e.ename = '�̹���';

--ANSI Outer Join (null ���� ����)
select e.empno, e.ename ����, f.ename ���ӻ��
from emp e left outer join emp f
on e.mgr = f.empno
order by e.empno;

--�̼�
--1 �渮�ο��� �ٹ��ϴ� ����� �̸��� �Ի����� ����� ���ô�.
select e.ename �̸�, e.hiredate �Ի���, d.dname �μ�
from emp e join dept d
on e.deptno = d.deptno
where d.dname = '�渮��';

--2 ANSI JOIN�� ����Ͽ� ��õ���� �ٹ��ϴ� ����� �̸��� �޿��� ����غ��ô�.
select e.ename �̸�, e.sal �޿�, d.loc ���ֱ���
from emp e join dept d
on e.deptno = d.deptno
where d.loc = '��õ';