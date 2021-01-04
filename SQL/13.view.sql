/*
view는 제한적인 자료만 보기위해서 사용할 수 있는 가상테이블의 개념입니다.
뷰는 가상테이블이기 때문에 필요한 컬럼만 저장해 두면 데이터 조회가 용이해집니다.
뷰는 실제로 데이터가 물리적으로 저장된 형태는 아닙니다. (원본테이블을 기반으로 사용됩니다)
그래서 뷰에 DML작업을 하게 되면 실제 테이블에 적용이 됩니다 ( 다만, 제약사항이 많이 따릅니다)
*/

select * from user_sys_privs; --현재사용자 권한확인

--단순뷰 - 하나의 테이블을 기반으로한 뷰
create view view_emp
as (select employee_id,
           first_name,
           last_name,
           job_id,
           salary from employees);

select * from view_emp;

--복합뷰 - 여러테이블을 조인하여 필요한 데이터를 저장한 형태
create view view_emp_dept_job
as (select e.employee_id,
           first_name || ' ' || last_name as name,
           d.department_name,
           j.job_title
    from employees e
    left outer join departments d
    on e.department_id = d.department_id
    left outer join jobs j
    on e.job_id = j.job_id
    );

select * from view_emp_dept_job;

--뷰의 수정 create or replace view 동일이름
create or replace view view_emp_dept_job
as (select e.employee_id,
           first_name || ' ' || last_name as name,
           d.department_name,
           j.job_title,
           e.salary,
           l.street_address
    from employees e
    left outer join departments d
    on e.department_id = d.department_id
    left outer join jobs j
    on e.job_id = j.job_id
    left outer join locations l
    on d.location_id = l.location_id);
    
select * from view_emp_dept_job;
-- 복합뷰로 필요한 데이터 생성을 했다면 데이터의 조회가 간편
select job_title, avg(salary), sum(salary), count(salary)
from view_emp_dept_job
group by job_title
order by avg(salary);

-- 뷰 삭제
drop view view_emp;
drop view view_emp_dept_job;

/*
view는 insert, update, delete가 일어나는 경우에 실제테이블에도 반영이 됩니다.
그리고 많은 제약사항이 있습니다. 그냥 원본테이블에 DML명령을 사용.
*/
select * from view_emp_dept_job;
select * from view_emp;
desc employees;
--name은 가상열 이라서 insert가 안됩니다
insert into view_emp_dept_job values(300, 'test', 'test', 'test');
--join테이블의 경우에도 update, insert가 안됩니다.
insert into view_emp_dept_job(employee_id, department_name, job_title) values(300, 'test', 'test');
--원본테이블의 not null조건때문에 insert가 안됩니다.
insert into view_emp(employee_id, first_name, salary) values(300, 'test', 10000);

-- 뷰의 제약사항
-- with check option
create view view_emp_test
as (select employee_id,
           first_name,
           last_name,
           email,
           hire_date,
           job_id,
           department_id
    from employees
    where department_id = 60)
with check option;
-- department_id의 수정 불가
update view_emp_test set department_id = 100; 

-- with read only
create or replace view view_emp_test
as (select employee_id,
           first_name,
           last_name,
           email,
           hire_date,
           job_id,
           department_id
    from employees
    where department_id = 60)
with read only; --읽기 전용 뷰
--모든 CRUD작업 금지
update view_emp_test set department_id = 100;






