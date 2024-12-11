--날짜 함수
--현재 날짜를 반환하는 sysdate
--어제 날짜, 오늘 날짜, 내일 날짜 출력
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일
from dual;

--입사일을 달을 기준으로 버리기
select hiredate 입사일, trunc(hiredate, 'MONTH') 입상월
from emp;

--두 날짜 사이의 간격을 구하는 months_between함수
--근무 개월 수 구하기
select ename, sysdate 오늘, hiredate 입사일, trunc(months_between(sysdate, hiredate)) 근무달수
from emp;

--개월 수를 더하는 add_months함수
select ename, hiredate 입사일, add_months(hiredate, 6) "입사 6개월 후"
from emp;

--해당 요일의 가장 가까운 날짜를 반환하는 next_day함수
--오늘을 기준으로 최초로 도래하는 수요일은 언제인지 구하기
select sysdate, next_day(sysdate, '수요일')
from dual;

--해당 달의 마지막 날짜를 반환하는 last_day함수
--입사한 달의 마지막 날 구하기
select ename, hiredate 입사일, last_day(hiredate) 마지막날짜
from emp;

--NULL을 다른 값으로 변환하는 함수, evl(), evl2()
--직원 연봉구하기
select ename, sal, comm, sal+12+nvl(comm, 0)
from emp;

select ename, sal, comm, nvl2(comm, sal*12+comm, sal*12)
from emp;

--선택을 위한 decode함수 - switch case
--사원테이블에서 부서명 구하기
--10:경리부, 20:인사과, 30:영업부, 40:전산부
select ename, deptno, decode(deptno, 10, '경리부',
                                    20, '인사과',
                                    30, '영업부',
                                    40, '전산부')
from emp;

--조건에 따라 서로 다른 처리가 가능한 case문 - if else ~ if else
select ename, deptno, case when deptno = 10 then '경리부'
                            when deptno = 20 then '인사과'
                            when deptno = 30 then '영업부'
                            when deptno = 40 then '전산부'
                        end 부서명
from emp;


--3장 미션
--1-1 9월에 입사한 사원을 출력해 보시오
--SUBSTR함수를 사용한다
select *
from emp
where substr(hiredate,4,2) = '09' ;

--1-2 2003년도에 입사한 사원을 알아내기 위한 쿼리문은 다음과 같이 작성할 수 있습니다
--이러한 방법 말고 지금 막 학습한 SUBSTR함수를 이용하여, 2004년도에 입사한 사원을 
--검색해 보도록 하세요
select *
from emp
where substr(hiredate,1,2) = '03';


--1-3 다음은 이름이 "기"로 끝난는 사원을 검색해 보도록 합시다. 이 역시 앞장에서 배웠던 
--LIKE 연산자를 이용하여 다음과 같이 표현할 수 있습니다.
--이러한 방법 말고 지금 막 학습한 SUBSTR 함수를 이용하여, ename 칼럼의 마지막 문자 한 개만
--추출해서 이름이 E로 끝나는 사원을 검색해 보도록 하세요.
--시작 위치를 -1로 주고, 추출할 문자 개수르 1로 주면 됩니다.
select *
from emp
where substr(ename, -1, 1) = '기';

--1-4 이번에는 이름의 두 번째 글자에 "동"이 있는 사원을 검색해 봅시다.
--INSTR함수 사용
select *
from emp
where instr(ename, '동', 1 ,1) = 2;  -- instr 위치값 반환

--2-1 직급에 따라 급여 인상, 부장 5%, 과장 10%, 대리 15%, 사원 20%
select empno, ename, job, sal, decode(job, '부장', sal *1.05,
                                                    '과장', sal *1.10,
                                                    '대리', sal *1.15,
                                                    '사원', sal *1.20,
                                                    'sal')
from emp;

select empno, ename, job, sal, case when job = '부장' then sal *1.05 
                                    when job = '과장' then sal *1.10
                                    when job = '대리' then sal *1.15
                                    when job = '사원' then sal *1.20
                                    else sal
                                end upsal
from emp;

--3-1 입사일 연도는 2자리, 월은 숫자(MON)표시, 용일 약어(DY)로 지정 출력
select hiredate, to_char(hiredate, 'YY/MON/DY')
from emp;