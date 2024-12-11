--휴가테이블
create sequence vacation_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--근무테이블
create sequence duty_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--총기수불대장테이블
create sequence gunlog_seq
    start with 1
    increment by 1
    maxvalue 99999999;

--근무관리테이블
create sequence drecord_seq
    start with 1
    increment by 1
    maxvalue 99999999;



-- 군인 인적 정보 테이블 생성
create table soldier(
    mno varchar2(11) PRIMARY key,
    name varchar2(20) not null,
    squad varchar(10),
    vday number(3),
    rank varchar2(9) not null,
    edate date);

-- 총기 관리 테이블 생성
create table gun(
    gno number(6) primary key,
    type varchar2(20) not null,
    model varchar2(10) not null);

-- 총기 수불 대장 테이블 생성    
create table
    