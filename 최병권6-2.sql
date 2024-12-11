-- �׷� ��� ���� having��
-- �μ��� �޿� ����� 500�̻��� �μ���ȣ �޿� ��� ���ϱ�
select deptno, round(avg(sal))
from emp
group by deptno
having avg(sal) >= 500;

-- �ִ� �޿��� 500�� �ʰ��ϴ� �μ��� ���ؼ� �ִ� �޿��� �ּ� �޿� ���ϱ�
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal) > 500
order by 1;

-- ����� �����ϰ� �޿� �Ѿ��� 1000�̻��� ���޺� �Ѿ� ���ϱ�
select job, sum(sal)
from emp
where not job like '%���%'
group by job
having sum(sal) >= 1000
order by 2 desc;

-- �μ��� �޿� ��� �� �ִ� �޿� ��� ���ϱ�
select max(round(avg(sal)))
from emp
group by deptno;


-- �̼� ù ��° �̼�
--01 �ְ�,����, ��, ��հ� ���
select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;


--02 ������ �ְ�, ����, ��, ��� ���
select job, max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp
group by job;

--03 count �Լ� �̿��Ͽ� �����
select job, count(job)
from emp
group by job;

--04 ������ ��
select count(job)
from emp
where job = '����';

--05 �޿� �ְ�� - ������
select max(sal) - min(sal)
from emp;

--06 ���޺� ��� ����, ������ 500 �̸� ����
select job, min(sal)
from emp
group by job
having min(sal) >= 500;

--07 �μ��� �μ���ȣ, �����, �μ� ���� ��� ������ ��� �޿� �˻�, ��� �޿��� �Ҽ��� 2
select deptno, count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

--08 �� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿�
select case
            when deptno = 10 then '�渮��'
            when deptno = 20 then '�λ��'
            when deptno = 30 then '������'
            when deptno = 40 then '�����'
        end,
        case
            when deptno = 10 then '����'
            when deptno = 20 then '��õ'
            when deptno = 30 then '����'
            when deptno = 30 then '����'
        end
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

select decode(deptno,
            10, '�渮��',
            20, '�λ��',
            30, '������',
            40, '�����'
        ),
        decode(deptno,
            10, '����',
            20, '��õ',
            30, '����',
            40, '����'
        )
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

