--��¥ �Լ�
--���� ��¥�� ��ȯ�ϴ� sysdate
--���� ��¥, ���� ��¥, ���� ��¥ ���
select sysdate-1 ����, sysdate ����, sysdate+1 ����
from dual;

--�Ի����� ���� �������� ������
select hiredate �Ի���, trunc(hiredate, 'MONTH') �Ի��
from emp;

--�� ��¥ ������ ������ ���ϴ� months_between�Լ�
--�ٹ� ���� �� ���ϱ�
select ename, sysdate ����, hiredate �Ի���, trunc(months_between(sysdate, hiredate)) �ٹ��޼�
from emp;

--���� ���� ���ϴ� add_months�Լ�
select ename, hiredate �Ի���, add_months(hiredate, 6) "�Ի� 6���� ��"
from emp;

--�ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� next_day�Լ�
--������ �������� ���ʷ� �����ϴ� �������� �������� ���ϱ�
select sysdate, next_day(sysdate, '������')
from dual;

--�ش� ���� ������ ��¥�� ��ȯ�ϴ� last_day�Լ�
--�Ի��� ���� ������ �� ���ϱ�
select ename, hiredate �Ի���, last_day(hiredate) ��������¥
from emp;

--NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�, evl(), evl2()
--���� �������ϱ�
select ename, sal, comm, sal+12+nvl(comm, 0)
from emp;

select ename, sal, comm, nvl2(comm, sal*12+comm, sal*12)
from emp;

--������ ���� decode�Լ� - switch case
--������̺��� �μ��� ���ϱ�
--10:�渮��, 20:�λ��, 30:������, 40:�����
select ename, deptno, decode(deptno, 10, '�渮��',
                                    20, '�λ��',
                                    30, '������',
                                    40, '�����')
from emp;

--���ǿ� ���� ���� �ٸ� ó���� ������ case�� - if else ~ if else
select ename, deptno, case when deptno = 10 then '�渮��'
                            when deptno = 20 then '�λ��'
                            when deptno = 30 then '������'
                            when deptno = 40 then '�����'
                        end �μ���
from emp;


--3�� �̼�
--1-1 9���� �Ի��� ����� ����� ���ÿ�
--SUBSTR�Լ��� ����Ѵ�
select *
from emp
where substr(hiredate,4,2) = '09' ;

--1-2 2003�⵵�� �Ի��� ����� �˾Ƴ��� ���� �������� ������ ���� �ۼ��� �� �ֽ��ϴ�
--�̷��� ��� ���� ���� �� �н��� SUBSTR�Լ��� �̿��Ͽ�, 2004�⵵�� �Ի��� ����� 
--�˻��� ������ �ϼ���
select *
from emp
where substr(hiredate,1,2) = '03';


--1-3 ������ �̸��� "��"�� ������ ����� �˻��� ������ �սô�. �� ���� ���忡�� ����� 
--LIKE �����ڸ� �̿��Ͽ� ������ ���� ǥ���� �� �ֽ��ϴ�.
--�̷��� ��� ���� ���� �� �н��� SUBSTR �Լ��� �̿��Ͽ�, ename Į���� ������ ���� �� ����
--�����ؼ� �̸��� E�� ������ ����� �˻��� ������ �ϼ���.
--���� ��ġ�� -1�� �ְ�, ������ ���� ������ 1�� �ָ� �˴ϴ�.
select *
from emp
where substr(ename, -1, 1) = '��';

--1-4 �̹����� �̸��� �� ��° ���ڿ� "��"�� �ִ� ����� �˻��� ���ô�.
--INSTR�Լ� ���
select *
from emp
where instr(ename, '��', 1 ,1) = 2;  -- instr ��ġ�� ��ȯ

--2-1 ���޿� ���� �޿� �λ�, ���� 5%, ���� 10%, �븮 15%, ��� 20%
select empno, ename, job, sal, decode(job, '����', sal *1.05,
                                                    '����', sal *1.10,
                                                    '�븮', sal *1.15,
                                                    '���', sal *1.20,
                                                    'sal')
from emp;

select empno, ename, job, sal, case when job = '����' then sal *1.05 
                                    when job = '����' then sal *1.10
                                    when job = '�븮' then sal *1.15
                                    when job = '���' then sal *1.20
                                    else sal
                                end upsal
from emp;

--3-1 �Ի��� ������ 2�ڸ�, ���� ����(MON)ǥ��, ���� ���(DY)�� ���� ���
select hiredate, to_char(hiredate, 'YY/MON/DY')
from emp;