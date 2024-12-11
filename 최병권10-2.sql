--8장 테이블의 내용을 추가, 수정, 삭제하는 DML과 트랜잭션
--테이블에 내용을 추가하는 insert문
create table dept02(
    deptno number(2),
    dname varchar2(14),
    loc varchar(13)
);

-- 경리부 입력
insert into dept02
values(10, '경리부', '서울');

-- 인사부 입력
insert into dept02(deptno, loc, dname)
values(20, '인천', '인사부');

-- 영업부 입력 (명시적으로 null입력)
insert into dept02
values(30, '영업부', '');

-- 전산부 입력 (명시적으로 null입력)
insert into dept02
values(40, '전산부', null);

-- 기획부      (암시적으로 null입력)
insert into dept02(deptno, dname)
values(50, '기획부');

select * from dept02;

-- 사원 테이블 생성하기
create table emp02(
    empno number(4),
    ename varchar2(10),
    job varchar(9),
    hiredate date,
    deptno number(2)
);

-- 날짜 데이터 입력하기
insert into emp02
values(1001, '김사랑', '사원', '2015/03/01', 20);

insert into emp02
values(1002, '한예슬', '대리', to_date('2014,05,01', 'YYYY, MM, DD'), 20);

insert into emp02
values(1003, '오지호', '과장', sysdate, 30);

-- 테이블의 내용을 수정하는 update문
update dept02
set dname = '생산부'
where deptno = 10;

update dept02
set dname='생산부2', loc='부산'
where deptno=20;

-- 테이블의 내용을 삭제하는 delete문
delete dept02
where deptno = 10;

--트랜잭션 관리
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
values(1000, '한용운', '승려', 100);

insert into employee03
values(1010, '허준', '의관', 150);

insert into employee03
values(1020, '주시경', '국어학자', 250);

insert into employee03
values(1030, '계백', '', 250);

insert into employee03
values(1000, '선덕여왕', null, 200);

select * from employee03;

--03
update employee03
set sal = sal + 50
where sal < 200;

--2-1
delete employee03
where job is null;

drop table employee03;










