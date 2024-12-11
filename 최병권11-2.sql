--13장 시퀀스
create table emp06(
    empno number(4) primary key,
    ename varchar(10),
    hiredate date
);

create sequence emp06_seq
    start with 1
    increment by 1
    maxvalue 99999999;
    
insert into emp06
values(emp06_seq.nextval, '홍길동', sysdate);

insert into emp06
values(emp06_seq.nextval, '이순신', sysdate);

select *
from emp06;