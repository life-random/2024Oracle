--ch03 ����Ŭ �ֿ� �Լ� Quiz
--1. �����ȣ�� Ȧ���� ���� �˻�
select *
from emp
where mod(empno, 2) <>0;

--2. ������� �Ի��Ͽ� ���� �⵵, ��, ���� ���������� ���
select substr(hiredate,1,2) �⵵, substr(hiredate,4,2) ��, substr(hiredate,7,2) ��
from emp;

--3. �� ������� ��������� �ٹ��ϼ� ���ϱ�
select sysdate - hiredate
from emp;

--4. ���ӻ���� ���� ������ ���, null��� 'CEO';
SELECT ename, NVL(TO_CHAR(mgr, '9999'), 'CEO') AS ���ӻ�� -- nvl�� ���ڴ� ���� ���ƾ� ��
FROM emp
WHERE mgr IS NULL;


--5, Oracle���� �ڵ����� �����Ǵ� ���̺�, ����̳� �Լ� ���� �����ϰ��� �� �� �����ϰ� ���
select 1+1
from dual;


--6, ������ �������� 100�� ���� ��¥ ���
select sysdate +100
from dual;

--7, ������ ���� ���� ������ ��¥�� ���
select last_day(sysdate)
from dual;

--8, nul2(comm,sal+comm, sal)�� �ǹ̴�?
-- comm�� null�ƴϸ� �� ��° ���� ���, null�̸� �� ��° ���� ���

--9, decode�Լ��� ����� Ȯ���� �Լ��̸�, ����, �� ����� ���� �پ��� �񱳰� ������ ����
-- case�� - when - then - else

--10, ���� ������ ��¥ ���� �ڵ������� �Է��ϴ� �Լ���?
select sysdate
from dual;


--ch04
--������ �޿��� ���, ���� �ڸ����� �ݿø�
select round(sal,-2)
from emp;

--�������� �� �޿� ���ϱ�(�׷��Լ�)
select sum(sal)
from emp;

--�������� �޿� �Ѿ�, ��վ�, �ִ�޿�, �ּұ޿� ���ϱ�
select sum(sal) �޿��Ѿ�, round(avg(sal)) ��վ�, max(sal) �ִ�޿�, min(sal) �ּұ޿�
from emp;

--�ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� ���ϱ�
select max(hiredate), min(hiredate)
from emp;

--�������� �Ѿ� ���ϱ�(�׷��Լ��� null��)
select sum(comm)
from emp;

--�ִ� �޿� ���ϱ�(�׷��Լ��� �ܼ��÷� X)
select max(sal)
from emp;

--��ü ���� �� �������� �޴� ������ �� ���ϱ�
select count(*) ��ü������, count(comm) �����ݹ޴¼�
from emp;

--������ �� ���ϱ�(�ߺ�����)
select count(distinct job)
from emp;

--������ �׷��� -group by ��
--�μ��� �޿� �ִ�
select deptno,max(sal)
from emp
group by deptno
order by deptno;

--���޺� �޿��� ����, ���, �ּҰ�, ���밪 ���ϱ�
select job, sum(sal), round(avg(sal)), min(sal), max(sal)
from emp
group by job
order by avg(sal) desc;

--�μ��� ��� ���� �������� �޴� ��� �� ���ϱ�
select deptno, count(*)  �μ���������, count(comm) �����ݹ޴¼� 
from emp
group by deptno
order by deptno;