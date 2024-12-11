-- 미션 첫 번째 미션
--01 최고,최저, 합, 평균값 출력
select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;


--02 직업별 최고, 최저, 합, 평균 출력
select job, max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp
group by job;

--03 count 함수 이용하여 사원수
select job, count(*)
from emp
group by job;

--04 과장의 수
select count(*)
from emp
where job = '과장';

--05 급여 최고액 - 최저액
select max(sal) - min(sal)
from emp;

--06 직급별 사원 최저, 최저액 500 미만 제외
--급여에 대한 내림차순 정렬
select job, min(sal)
from emp
group by job
having min(sal) >= 500
order by 2 desc;

--07 부서별 부서번호, 사원수, 부서 내의 모든 직원의 평균 급여 검색, 평균 급여는 소수점 2
select deptno, count(*), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

--08 각 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여
select deptno,
        case
            when deptno = 10 then '경리부'
            when deptno = 20 then '인사부'
            when deptno = 30 then '영업부'
            when deptno = 40 then '전산부'
        end 부서명,
        case
            when deptno = 10 then '서울'
            when deptno = 20 then '인천'
            when deptno = 30 then '용인'
            when deptno = 30 then '수원'
        end 부서명
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

select deptno,
        decode(deptno,
            10, '경리부',
            20, '인사부',
            30, '영업부',
            40, '전산부'
        ) 부서명,
        decode(deptno,
            10, '서울',
            20, '인천',
            30, '용인',
            40, '수원'
        ) 지역명
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by 2 desc;



--4단원 Quiz
--07, 30번 소속된 사원, 커미션 받은 사원 수
select count(comm)
from emp
where deptno = 30 and comm is not null and comm <> 0;

--08, 가장 최근 입사한 사원의 입사일과 입사한 지 가장 오래된 사원의 입사일의 출력하기
select max(hiredate) 입사일, min(hiredate) 입사일
from emp;

select job, sum(sal)
from emp
group by job
having sum(sal) > 300
order by 2 desc;