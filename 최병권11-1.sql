--9장 테이터 무결성을 위한 제약조건
create table dept04 (
    deptno number(2) primary key,
    dname varchar2(13) not null,
    loc varchar2(14)
);

desc dept04;

insert into dept04
values(10, '기획부', '서울');

insert into dept04
values(20, '생산부', '인천');

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
values(1000, '김사랑', '사원', sysdate, 10);

insert into emp04
values(1001, '한예슬', '사원', sysdate, 20); --참조한 칼럼의 없는 값은 만들 수 없다

select * from emp04;

create table dept05 (
    deptno number(2) constraint dept05_deptno_pk primary key,
    dname varchar2(13) constraint dept05_dname_nn not null,
    loc varchar2(14)
);

insert into dept05
values(10, '기획부', '서울');

insert into dept05
values(20, '생산부', '인천');

create table emp05(
    empno number(4) constraint emp05_empno_pk primary key,
    ename varchar2(20) constraint emp05_eanme_nn not null,
    job varchar2(20),
    hiredate date,
    deptno number(2) constraint emp05_deptno_fk references dept04(deptno)
);






