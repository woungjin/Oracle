--오라클 주석입니다
--실행은 ctrl + enter

select * from employees;

select employee_id, first_name, last_name from employees;
select email, phone_number, hire_date from employees;

--컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다.
select first_name, last_name, salary, salary + salary * 0.1  from employees;

--null값 확인
select department_id, commission_pct from employees;

--엘리어스(컬럼명의 별칭을 붙여서 조회합니다)
select first_name as 이름, last_name as 성, salary as 급여, salary + salary * 0.1 as 급여110프로  from employees;

-- ||연결자
-- 오라클 홑따옴표가 문자를 표현하기 때문에, 문자열안에 ' 를 표현하고 싶다면 escape해야 하는데 '' 두번쓰면됩니다.
select first_name || ' ' || last_name || '''s salary is $' || salary from employees;

-- distinct (중복 행 제거) 키워드
select department_id from employees;
select distinct department_id from employees;

--ROWID, ROWNUM (로우넘은 쿼리의 결과에 대한 행번호입니다)
select rowid, rownum, employee_id from employees;


