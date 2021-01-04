--연습문제
select * from employees;
--1. 모든 사원의 사원번호, 이름, 입사일, 급여를 출력하세요.
select employee_id, first_name, hire_date, salary from employees;
--2. 모든 사원의 이름과 성을 붙여 출력하세요. 열 별칭은 name으로 하세요.
select first_name || ' ' || last_name as name from employees;
--3. 50번 부서 사원의 모든 정보를 출력하세요.
select * from employees where department_id = 50;
--4. 50번 부서 사원의 이름, 부서번호, 직무아이디를 출력하세요.
select first_name, department_id, job_id from employees where department_id = 50;
--5. 모든 사원의 이름, 급여 그리고 300달러 인상된 급여를 출력하세요.
select first_name, salary, salary + 300 from employees;
--6. 급여가 10000보다 큰 사원의 이름과 급여를 출력하세요.
select first_name, salary from employees where salary >= 10000;
--7. 보너스를 받는 사원의 이름과 직무, 보너스율을 출력하세요.
select first_name, job_id, commission_pct from employees where commission_pct is not null;
--8. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(BETWEEN 연산자 사용)
select first_name, hire_date, salary from employees where hire_date between '03/01/01' and '03/12/31'; --6명
--9. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(LIKE 연산자 사용)
select first_name, hire_date, salary from employees where hire_date like '03%';
--10. 모든 사원의 이름과 급여를 급여가 많은 사원부터 적은 사원순서로 출력하세요.
select first_name, salary from employees order by salary desc;
--11. 위 질의를 60번 부서의 사원에 대해서만 질의하세요. (컬럼: department_id)
select first_name, salary from employees where department_id = 60 order by salary desc;
--12. 직무아이디가 IT_PROG 이거나, SA_MAN인 사원의 이름과 직무아이디를 출력하세요.
select first_name, job_id from employees where job_id in ('IT_PROG', 'SA_MAN');
--13. Steven King 사원의 정보를 “Steven King 사원의 급여는 24000달러 입니다” 형식으로 출력하세요.
select first_name || ' ' || last_name || '급여는' || salary || '달러 입니다'  from employees where last_name = 'King' and first_name = 'Steven';
--14. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 출력하세요. (컬럼:job_id)
select first_name || ' ' || last_name, job_id from employees where job_id like '%MAN%'; 
--15. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 직무아이디 순서대로 출력하세요.
select first_name || ' ' || last_name, job_id from employees where job_id like '%MAN%' order by job_id asc;
