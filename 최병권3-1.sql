--�̼�
--1.1 ����� �̸��� �޿��� �Ի����ڸ��� ����� �� �ֽ��ϴ�
select ENAME, SAL, HIREDATE
from emp;

--1.2 �μ���ȣ�� dno��, �μ����� dname���� ������ �����Ƿ� ������ ���� SQL ���� �����
--���� �׸��� ���� �÷� �̸����� ���� dno, dname���� ��µ˴ϴ�
--������ �׸��� ���� Į�� �̸��� ��µǵ��� �ϱ� ���� ��Ī�� �����ϴ� SQL���� �ۼ��� ���ÿ�.
select deptno as �μ���ȣ, dname as �μ���
from dept;

--1.3��� ���̺� �����ϴ� ������ ������ ����ϱ� ���ؼ� ������ ���� SQL ���� �����ϸ�
--ȭ�� ���� �׸��� ���� �ߺ��� ������ ��µ˴ϴ�.
--������ �׸��� ���� ������ �ߺ����� �ʰ� �� ���� �����ǵ��� SQL ���� �ۼ��� ���ÿ�.
select distinct job
from emp;

--2.1 �޿��� 300������ ����� �����ȣ, ��� �̸�, �޿��� ����Ͻÿ�.
select empno, ename, sal
from emp
where sal <= 300;

--2.2 �̸��� "����ȣ"�� ����� �����ȣ, �����, �޿��� ����Ͻÿ�.
select empno, ename, sal
from emp
where ename = '����ȣ';

--2.3 �޿��� 250�̰ų�, 300�̰ų�, 500�� ������� �����ȣ�� ������ �޿��� �˻��Ͻÿ�.
--����, �� �����ڿ� OR �� �����ڸ� ����Ͽ� �ۼ��� ����, in �����ڷ� �� �� ��
--�ۼ��غ��ÿ�
select empno, ename, sal
from emp
where sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal
from emp
where sal in(250,300,500);

--2.4 �޿��� 250��, 300��, 500�� �ƴ� ������� �˻��Ͻÿ�.
--����, �� �����ڿ� AND�� �����ڸ� ����Ͽ� �ۼ��غ���, in�����ڷ� �� �� �� �ۼ��Ͻÿ�.
select empno, ename, sal
from emp
where sal <> 250 and sal <> 300 and sal <> 500;

select empno, ename, sal
from emp
where sal not in(250,300,500);

--3.1 ����� �߿��� �̸��� "��"���� �����ϴ� ����� �̸� �ֿ� "��"�� �����ϴ� �����
--�����ȣ�� ����̸��� ����ϴ� �������� �ۼ��� ���ÿ�.
--LIKE�����ڿ� ���ϵ�ī�带 ����մϴ�.
select empno, ename
from emp
where ename like '��%' or ename like '%��%';

--3.2 ����ڰ� ���� ���(������ �ǰ�����!)�� �˻��ϱ� ���� SQL���� �ۼ��� ���ÿ�.
select *
from emp
where mgr is null;

--3.3 ��� ���̺��� �ڷḦ �Ի����� �������� �����Ͽ� �ֱٿ� �Ի��� ������ ���� ����
--����ϴ� �������� �ۼ��Ͻÿ�(�����ȣ, �����, ����, �Ի��� �÷��� ���)
select empno, ename, job, to_char(hiredate)
from emp
order by hiredate desc;

--3.4�μ� ��ȣ�� ���� ������� ����ϵ�, ���� �μ� ���� ����� ����� ��� �Ի��� �� ����
--������ ������� ��µǵ��� �Ͻÿ�.
select deptno, empno, ename, job, to_char(hiredate)
from emp
order by deptno asc, hiredate asc;


--ch03 ����Ŭ �ֿ� �Լ�
--dual ���̺�
--1���� �� ������ ���
select 60*24
from dual;

--���� �Լ�
--���밪�� ���ϴ� abs�Լ�,
-- -10�� ���� ���밪 ���ϱ�
select -10, abs(-10)
from dual;

--�Ҽ��� �Ʒ��� ������ floor�Լ�
select 34.5678, floor(34.5678)
from dual;

--Ư�� �ڸ������� �ݿø��ϴ� round�Լ�
select 34.5678, round(34.5678, 2), round(34.5678, -1)
from dual;

--Ư�� �ڸ������� �߶󳻴� trunc�Լ�
select 34.5678, trunc(34.5678, 2), trunc(34.5678, -1)
from dual;

-- �������� ���ϴ� mod�Լ�
select 27/2, mod(27,2), mod(27,5), mod(27,7)
from dual;


--���� ó�� �Լ�
--��ҹ��� ��ȯ�Լ�
select 'Welcom to oracle',
        upper('Welcom to oracle'),
        lower('Welcom to oracle'),
        initcap('Welcom to oracle')
from dual;

--���� ���̸� ���ϴ� �Լ�
select length('Oracle'), length('����Ŭ'),
        lengthb('Oracle'), lengthb('����Ŭ')
from dual;

--���ڿ� �Ϻθ� �����ϴ� substr
select substr('Welcom to oracle', 4, 3),
        substr('Welcom to oracle', -4, 3)
from dual;

select substr('����������Ŭ', 4, 3),
        substr('����������Ŭ', -4, 3),
        substrb('����������Ŭ', 4, 3),
        substrb('����������Ŭ', -3, 3)
from dual;

--Ư�� ��ȣ�� ä��� LPAD/RPAD �Լ�
select lpad('Oracle', 20, '#')
from dual;

--�� ��ȯ �Լ�
--���������� ��ȯ�ϴ� to_char�Լ�
--��¥���� ���������� ��ȯ
select sysdate, to_char(sysdate, 'yyyy-mm day, AM hh:mi:ss')
from dual;

--�������� ���������� to_char�Լ�
select 1230000, to_char(1230000), to_char(1230000, 'L999,999,999'),
                                    to_char(1230000, 'L000,000,000')
from dual;


--��¥���� ��ȯ�ϴ� to_date�Լ�
--2007�� 4��2�Ͽ� �Ի��� ���� �˻�
select *
from emp
where hiredate = '07/04/02';

select *
from emp
where hiredate = to_date('20070402', 'yyyymmdd');

--���� ��ĥ�� �������� ���
select trunc(sysdate - to_date('2024-01-01', 'yyyy-mm-dd'))
from dual;

--���������� ��ȯ�ϴ� to_number�Լ�
select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

