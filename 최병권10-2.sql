--8�� ���̺��� ������ �߰�, ����, �����ϴ� DML�� Ʈ�����
--���̺� ������ �߰��ϴ� insert��
create table dept02(
    deptno number(2),
    dname varchar2(14),
    loc varchar(13)
);

-- �渮�� �Է�
insert into dept02
values(10, '�渮��', '����');

-- �λ�� �Է�
insert into dept02(deptno, loc, dname)
values(20, '��õ', '�λ��');

-- ������ �Է� (��������� null�Է�)
insert into dept02
values(30, '������', '');

-- ����� �Է� (��������� null�Է�)
insert into dept02
values(40, '�����', null);

-- ��ȹ��      (�Ͻ������� null�Է�)
insert into dept02(deptno, dname)
values(50, '��ȹ��');

select * from dept02;

-- ��� ���̺� �����ϱ�
create table emp02(
    empno number(4),
    ename varchar2(10),
    job varchar(9),
    hiredate date,
    deptno number(2)
);

-- ��¥ ������ �Է��ϱ�
insert into emp02
values(1001, '����', '���', '2015/03/01', 20);

insert into emp02
values(1002, '�ѿ���', '�븮', to_date('2014,05,01', 'YYYY, MM, DD'), 20);

insert into emp02
values(1003, '����ȣ', '����', sysdate, 30);

-- ���̺��� ������ �����ϴ� update��
update dept02
set dname = '�����'
where deptno = 10;

update dept02
set dname='�����2', loc='�λ�'
where deptno=20;

-- ���̺��� ������ �����ϴ� delete��
delete dept02
where deptno = 10;

--Ʈ����� ����
commit;
rollback;

select * from emp02;
select * from dept02;

--01
create table employee03(
    empno number(4) not null,
    ename varchar2(20),
    job varchar2(20),
    sal number(7, 3)
);

--02
insert into employee03
values(1000, '�ѿ��', '�·�', 100);

insert into employee03
values(1010, '����', '�ǰ�', 150);

insert into employee03
values(1020, '�ֽð�', '��������', 250);

insert into employee03
values(1030, '���', '', 250);

insert into employee03
values(1000, '��������', null, 200);

select * from employee03;

--03
update employee03
set sal = sal + 50
where sal < 200;

--2-1
delete employee03
where job is null;

drop table employee03;










