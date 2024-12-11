-- 그룹 결과 제한 having절
-- 부서별 급여 평균이 500이상인 부서번호 급여 평균 구하기
select deptno, round(avg(sal))
from emp
group by deptno
having avg(sal) >= 500;

-- 최대 급여가 500을 초과하는 부서에 대해서 최대 급여와 최소 급여 구하기
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal) > 500
order by 1;

-- 사원을 제외하고 급여 총액이 1000이상인 직급별 총액 구하기
select job, sum(sal)
from emp
where not job like '%사원%'
group by job
having sum(sal) >= 1000
order by 2 desc;

-- 부서별 급여 평균 중 최대 급여 평균 구하기
select max(round(avg(sal)))
from emp
group by deptno;


-- 미션 첫 번째 미션
--01 최고,최저, 합, 평균값 출력
select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;


--02 직업별 최고, 최저, 합, 평균 출력
select job, max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp
group by job;

--03 count 함수 이용하여 사원수
select job, count(job)
from emp
group by job;

--04 과장의 수
select count(job)
from emp
where job = '과장';

--05 급여 최고액 - 최저액
select max(sal) - min(sal)
from emp;

--06 직급별 사원 최저, 최저액 500 미만 제외
select job, min(sal)
from emp
group by job
having min(sal) >= 500;

--07 부서별 부서번호, 사원수, 부서 내의 모든 직원의 평균 급여 검색, 평균 급여는 소수점 2
select deptno, count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

--08 각 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여
select case
            when deptno = 10 then '경리부'
            when deptno = 20 then '인사부'
            when deptno = 30 then '영업부'
            when deptno = 40 then '전산부'
        end,
        case
            when deptno = 10 then '서울'
            when deptno = 20 then '인천'
            when deptno = 30 then '용인'
            when deptno = 30 then '수원'
        end
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

select decode(deptno,
            10, '경리부',
            20, '인사부',
            30, '영업부',
            40, '전산부'
        ),
        decode(deptno,
            10, '서울',
            20, '인천',
            30, '용인',
            40, '수원'
        )
            , count(deptno), round(avg(sal),2)
from emp
group by deptno
order by deptno asc;

