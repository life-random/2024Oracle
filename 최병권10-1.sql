-- 7장 테이블 구조를 생성, 변경, 제거하는, DDL
-- 데이블 구조를 만든느 create table문
-- 사원 정보를 저장하기 위한 테이블 생성
create table emp01(
    empno number(4),
    ename varchar2(14),
    sal number(7,3)
);

desc emp01;

-- 테이블 구조를 변경하는 alter table문
-- 컬럼 추가
alter table emp01
add (birth date,
    num01 number(4));

-- 컬럼 변경
alter table emp01
modify ename varchar(30);

-- 컬럼 제거
alter table emp01
drop column ename;

-- set unused
alter table emp01
set unused (sal);

alter table emp01
drop unused columns;

-- 테이블명을 변경하는 rename문
rename emp01 to emp02;

-- 테이블 구조를 제거하는 drop table문
-- 모든 테이블를 제거하는 truncate table문
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










