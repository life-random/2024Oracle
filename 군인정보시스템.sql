--�ް����̺�
create sequence vacation_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--�ٹ����̺�
create sequence duty_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--�ѱ���Ҵ������̺�
create sequence gunlog_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--�ٹ��������̺�
create sequence drecord_seq
    start with 1
    increment by 1
    maxvalue 99999999;



-- ���� ���� ���� ���̺� ����
create table soldier(
    mno varchar2(11) PRIMARY key,
    name varchar2(20) not null,
    squad varchar(10),
    vday number(3),
    rank varchar2(9) not null,
    edate date);

-- �ѱ� ���� ���̺� ����
create table gun(
    gno number(6) primary key,
    type varchar2(20) not null,
    model varchar2(10) not null);

-- �ѱ� ���� ���� ���̺� ����    
create table
    