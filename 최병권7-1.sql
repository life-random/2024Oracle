-- �̼� ù ��° �̼�
--01 �ְ�,����, ��, ��հ� ���
select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;


--02 ������ �ְ�, ����, ��, ��� ���
select job, max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp
group by job;

--03 count �Լ� �̿��Ͽ� �����
select job, count(*)
from emp
group by job;

--04 ������ ��
select count(*)
from emp
where job = '����';

--05 �޿� �ְ�� - ������
select max(sal) - min(sal)
from emp;

--06 ���޺� ��� ����, ������ 500 �̸� ����
--�޿��� ���� �������� ����
select job, min(sal)
from emp
group by job
having min(sal) >= 500
order by 2 desc;

--07 �μ��� �μ���ȣ, �����, �μ� ���� ��� ������ ��� �޿� �˻�, ��� �޿��� �Ҽ��� 2
select deptno, count(*), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

--08 �� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿�
select deptno,
        case
            when deptno = 10 then '�渮��'
            when deptno = 20 then '�λ��'
            when deptno = 30 then '������'
            when deptno = 40 then '�����'
        end �μ���,
        case
            when deptno = 10 then '����'
            when deptno = 20 then '��õ'
            when deptno = 30 then '����'
            when deptno = 30 then '����'
        end �μ���
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

select deptno,
        decode(deptno,
            10, '�渮��',
            20, '�λ��',
            30, '������',
            40, '�����'
        ) �μ���,
        decode(deptno,
            10, '����',
            20, '��õ',
            30, '����',
            40, '����'
        ) ������
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by 2 desc;



--4�ܿ� Quiz
--07, 30�� �Ҽӵ� ���, Ŀ�̼� ���� ��� ��
select count(comm)
from emp
where deptno = 30 and comm is not null and comm <> 0;

--08, ���� �ֱ� �Ի��� ����� �Ի��ϰ� �Ի��� �� ���� ������ ����� �Ի����� ����ϱ�
select max(hiredate) �Ի���, min(hiredate) �Ի���
from emp;

select job, sum(sal)
from emp
group by job
having sum(sal) > 300
order by 2 desc;