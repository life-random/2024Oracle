--null�� ���� ������
--Ŀ�̼��� null�� ���� �˻�
select *
from emp
--where comm = null;
where comm is null;--null�� ���� �̻�

--Ŀ�̼��� ��ϵǾ� �ִ� ���� �˻�
select *
from emp
where comm is not null;--null�� �ƴ� ���� �˻�

--������ ���� order by  wjf
--�޿��� ���� �޴� �������� ���� �޴� ���� ������ �˻�
select *
from emp
order by sal asc; -- ��������

--�޿� ������������ �˻�
select *
from emp
order by sal desc;

--���� �ֱٿ� �Ի��� ������� �˻�
select *
from emp
order by hiredate desc;

--�޿��� ���� �޴� ������ �˻��ϵ�, �޿��� ������ �̸��� ���� ������ �˻�
select *
from emp
order by sal desc, ename asc;

select ename, job as ����, comm as ������, sal*12+nvl(comm, 0) as ����
from emp
--order by sal*12+nvl(comm, 0)desc;
order by ���� desc;

--
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;
--
CREATE TABLE GROUP_STAR(
	NAME		VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
	NAME		VARCHAR2(50)
);
INSERT INTO GROUP_STAR VALUES('�¿�');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ȿ��');
INSERT INTO GROUP_STAR VALUES('Ƽ�Ĵ�');
INSERT INTO GROUP_STAR VALUES('����ī');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('���');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ž');
INSERT INTO GROUP_STAR VALUES('���巡��');
INSERT INTO GROUP_STAR VALUES('�뼺');
INSERT INTO GROUP_STAR VALUES('�¸�');
INSERT INTO GROUP_STAR VALUES('�¾�');

INSERT INTO SINGLE_STAR VALUES('�¿�');
INSERT INTO SINGLE_STAR VALUES('���巡��');
INSERT INTO SINGLE_STAR VALUES('�뼺');
INSERT INTO SINGLE_STAR VALUES('�¾�');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
COMMIT;

--������ - union
--�׷�Ȱ��, �̱�Ȱ�� �ϴ� ��� ���� �˻�
select *
from group_star
union 
select *
from single_star;

select *
from group_star
union all --�ߺ� ���
select *
from single_star;

--������ - intersect

select *
from group_star
intersect
select *
from single_star;

--������ - minus
select *
from group_star
minus
select *
from single_star;

select *
from single_star
minus
select *
from group_star;

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