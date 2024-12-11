-- 7�� ���̺� ������ ����, ����, �����ϴ�, DDL
-- ���̺� ������ ����� create table��
-- ��� ������ �����ϱ� ���� ���̺� ����
create table emp01(
    empno number(4),
    ename varchar2(14),
    sal number(7,3)
);

desc emp01;

-- ���̺� ������ �����ϴ� alter table��
-- �÷� �߰�
alter table emp01
add (birth date,
    num01 number(4));

-- �÷� ����
alter table emp01
modify ename varchar(30);

-- �÷� ����
alter table emp01
drop column ename;

-- set unused
alter table emp01
set unused (sal);

alter table emp01
drop unused columns;

-- ���̺���� �����ϴ� rename��
rename emp01 to emp02;

-- ���̺� ������ �����ϴ� drop table��
-- ��� ���̺� �����ϴ� truncate table��
truncate table emp02;
drop table emp02;

desc emp02;

--01
create table dept_mission(
    dno number(2),
    dname varchar2(14),
    loc varchar2(13)
);
desc dept_mission;

--02
create table emp_mission(
  eno number(4),
  ename varchar2(10),
  dno number(2)
);
desc emp_mission;

--03
alter table emp_mission
modify ename varchar2(25);
desc emp_mission;

--04
drop table emp_mission;
desc emp_mission;

--05
alter table dept_mission
drop column dname;
desc dept_mission;

--06
alter table dept_mission
set unused(loc);
desc dept_mission;

--07
alter table dept_mission
drop unused columns;
desc dept_mission;

--08
rename dept_mission to department;
desc department;

drop table department;










