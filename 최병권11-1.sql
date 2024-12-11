--9�� ������ ���Ἲ�� ���� ��������
create table dept04 (
    deptno number(2) primary key,
    dname varchar2(13) not null,
    loc varchar2(14)
);

desc dept04;

insert into dept04
values(10, '��ȹ��', '����');

insert into dept04
values(20, '�����', '��õ');

select * from dept04;


create table emp04(
    empno number(4) primary key,
    ename varchar2(20) not null,
    job varchar2(20),
    hiredate date,
    deptno number(2) references dept04(deptno)
);
desc emp04;

insert into emp04
values(1000, '����', '���', sysdate, 10);

insert into emp04
values(1001, '�ѿ���', '���', sysdate, 20); --������ Į���� ���� ���� ���� �� ����

select * from emp04;

create table dept05 (
    deptno number(2) constraint dept05_deptno_pk primary key,
    dname varchar2(13) constraint dept05_dname_nn not null,
    loc varchar2(14)
);

insert into dept05
values(10, '��ȹ��', '����');

insert into dept05
values(20, '�����', '��õ');

create table emp05(
    empno number(4) constraint emp05_empno_pk primary key,
    ename varchar2(20) constraint emp05_eanme_nn not null,
    job varchar2(20),
    hiredate date,
    deptno number(2) constraint emp05_deptno_fk references dept04(deptno)
);






