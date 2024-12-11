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