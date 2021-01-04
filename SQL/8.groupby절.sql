-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT
select avg(salary), sum(salary), min(salary), max(salary), count(*) from employees;
select count(*) from employees; -- 행데이터 개수
select count(first_name) from employees; -- first_name이 null이 아닌개수
select count(commission_pct) from employees; --commission_pct이 null이 아닌 개수

-- 그룹 함수는 일반컬럼과 동시에 사용이 불가능 합니다.
-- select department_id, sum(salary) from employees;
-- 그룹 절에 묶인 컬럼만 조회가 가능합니다.
--select department_id, job_id from employees group by department_id;

-- group by절을 이용한 그룹핑 (group by절은 where절 다음에 들어갑니다.)
select department_id from employees group by department_id;
select department_id, sum(salary), avg(salary), count(*) from employees group by department_id;

-- 2개 이상의 그룹화
select * from employees;
select department_id, job_id from employees group by department_id, job_id; --부서별 job_id명
select job_id, department_id from employees group by job_id, department_id; --job_id별 부서명

-- 아래 두 구문은 결과가 다릅니다.
select department_id, sum(salary) from employees group by department_id;
select department_id, sum(salary) from employees where salary >= 5000 group by department_id;

-- group by절의 조건 having
select department_id, sum(salary) from employees group by department_id having sum(salary) >= 100000;

-- 20명 이상인 job id
select job_id, count(*)
from employees
group by job_id
having count(*) >= 20;

--부서 아이디가 50이상인 컬럼을 그룹화 시키고, 그룹 급여 평균중  5000이상만조회.
select department_id, count(*), trunc(avg(salary) )
from employees
where department_id >= 50
group by department_id
having trunc(avg(salary) ) >= 5000;

--------연습 문제---------
select job_id, count(*) as total
from employees
group by job_id;

select job_id, avg(salary) as 급여평균
from employees
group by job_id
order by 급여평균 desc;
--2번
select to_char(hire_date, 'YY'), count(*)
from employees
group by to_char(hire_date, 'YY');

--3번
select department_id, trunc(avg(salary) )
from employees
where salary >= 1000
group by department_id
having avg(salary) >= 2000;

--4번

select department_id, trunc(avg(salary + salary * commission_pct ), 2), sum(salary), count(*)
from employees
where commission_pct is not null
group by department_id;







