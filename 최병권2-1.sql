-- �����͸� ��ȸ�ϱ� ���� select ��
select ename, job as ����, comm as ������, sal*12+nvl(comm, 0) as "�� ��"
from emp;

-- ���ڿ��� ���� (||)
-- ex) ������ ������ ����Դϴ�.
select ename || '�� ������ ' || job || '�Դϴ�.'
from emp;

-- �ߺ��� �����ϴ� distinct
select distinct job, ename
from emp;

-- Ư�� ������ �����͸� ��ȸ�ϴ� where ��
-- �޿��� 500 �̻��� ���
select ename, job, sal
from emp
where sal >= 500;

-- 10�� �μ��� �Ҽӵ� ���� �˻�
select *
from emp
where deptno = 10;

-- �̹��� ���� �˻�
select *
from emp
where ename = '�̹���';

-- �Ի����� 2005�� 1�� 1�� ������ ���� �˻�
select *
from emp
where '2005/01/01' > hiredate;

-- �μ���ȣ�� 10�̰�, ������ ������ ����
select *
from emp
where deptno = 10 and job = '����';

-- 10�� �μ��� �Ҽӵ� ����� �����ϰ� �˻�
select *
from emp
where not deptno=10; -- deptno<>10�� ����

-- �޿��� 400���� 500 ���̸� �޴� ���� �˻�
select *
from emp
where 400 <= sal and sal<= 500;

-- between and ������
select *
from emp
where sal between 400 and 500;

-- Ŀ�̼��� 80�̰ų� 100�̰ų� 200�� ���� �˻�
select*
from emp
where comm = 80 or comm = 100 or comm = 200;

-- in ������
select *
from emp
where comm in(80, 100, 200);

-- Ŀ�̼��� 80, 100, 200�� ��� �ƴ� ���� �˻�
select*
from emp
where comm <> 80 and comm <> 100 and comm <> 200; -- �˻� �� null�� ���ܵȴ�

-- in ������
select *
from emp
where comm not in(80, 100, 200);

-- LIKE �����ڿ� ���ϵ�ī��(&,_)
-- ���� �̾��� ���� �˻�
select *
from emp
where ename like '��%';

-- �̸��� '��'�� ���ԵǾ� �ִ� ���� �˻�
select *
from emp
where ename like '%��%';

-- �̸��� �� ��° ���ڰ� '��'�� ���� �˻�
select *
from emp
where ename like '_��_';

-- �̸��� '��'�� ���Ե��� ���� ���� �˻�
select *
from emp
where ename not like '%��%'