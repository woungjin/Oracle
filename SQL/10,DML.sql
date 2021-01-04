--insert
desc departments;
--1. insert첫번째 방법(모든 컬럼 데이터를 한번에 지정)
insert into departments values(280, 'developer', null, 1700);
select * from departments;
rollback; -- 실행지점을 뒤로 되돌림

--2. insert두번째 방법(직접 컬럼을 지정하고 저장)
insert into departments(department_id, department_name, location_id ) values(280, '개발자', 1700);
select * from departments;

insert into departments values(300, 'DBA', 200, 1800);
insert into departments(department_id, department_name ) values (290, '서버관리자');
select * from departments;

rollback;
--3. 서브쿼리 구문으로 insert
--사본테이블
create table managers as( select employee_id, first_name, job_id, salary, hire_date from employees where 1 = 2);
select * from managers;

insert into managers(employee_id, first_name, job_id, salary, hire_date) 
(select employee_id, first_name, job_id , salary, hire_date from employees where department_id = 60);

--update구문
--사본테이블
create table emps as (select * from employees);
select * from emps;
update emps set salary = 100000;
rollback;
update emps set salary = 100000 where employee_id = 100; --100번만 수정(pk를 이용)
update emps set salary = salary * 0.1 + salary where employee_id = 100;
update emps set manager_id = 100 where employee_id = 100;
update emps set phone_number = '031.123.1234' , manager_id = 102 where employee_id = 100;

--update서브쿼리
update emps set salary = (select 1000 from dual) where employee_id = 100;
update emps set 
    (salary, phone_number) = (select salary, phone_number from emps where employee_id = 101) 
where employee_id = 100;

rollback;

--delete구문(삭제시에 반드시 조건절, 다른테이블에서 데이터를 참조하고 있으면 삭제 불가능합니다)
alter table emps add CONSTRAINT emps_emp_id_pk PRIMARY key (employee_id); --employee_id PK지정
alter table emps add CONSTRAINT emps_manager_fk foreign key (manager_id) REFERENCES emps (employee_id); --manager_id FK지정

delete from emps where employee_id = 100;
select * from emps;

--사본테이블
create table depts as (select * from departments);
select * from depts;

delete from depts where department_id = 10;

--delete(서브쿼리)
select  department_id from emps where employee_id = 100;
delete from depts where department_id = (select department_id from emps where employee_id = 100); -- 90번
delete from depts where department_id = (select department_id from emps where employee_id = 101); 

select * from depts;
rollback;


--MERGE(테이블 수정 추가가 빈번한 경우에, 따로 저장할 테이블을 만들어 놓고, 비교해서 추가, 수정구문을 실행시켜주는 방식)
create table emps_it as (select * from employees where 1 = 2);

insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id)
values (105, '데이비드', '김', 'davidkim', '06/06/06', 'IT_PROG');

select * from emps_it;

merge into emps_it a -- 타겟테이블
    using (select * from employees where job_id = 'IT_PROG') b --조인구문
    on (a.employee_id = b.employee_id) --a테이블과 b테이블의 조인조건
when matched then --조건에 일치할 경우(데이터가 있는 경우 타겟테이블에 실행)
    update set a.phone_number = b.phone_number,
               a.salary = b.salary,
               a.commission_pct = b.commission_pct,
               a.manager_id = b.manager_id,
               a.department_id = b.department_id
when not matched then --조건에 일치하지 않을 경우(타겟 테이블에 실행)
    insert values(b.employee_id,
                  b.first_name,
                  b.last_name,
                  b.email,
                  b.phone_number,
                  b.hire_date,
                  b.job_id,
                  b.salary,
                  b.commission_pct,
                  b.manager_id,
                  b.department_id);
select * from emps_it;   

----실습----
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '렉스', '킴', 'lex', '01/04/06','AD_VP');
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '니나', '커', 'nian', '20/04/06','AD_VP');

--employees 테이블을 매번 수정되는 테이블이라고 가정하고,
--기존데이터는 email, phone, salary, manager_id, department_id는 업데이트 되도록 처리
--새로 유입된 데이터는 그냥 그대로 전부 추가
select * from emps_it;


merge into emps_it a
    using (select * from employees) b
    on (a.employee_id = b.employee_id)
when matched then
    update set a.email = b.email,
               a.phone_number = b.phone_number,
               a.salary = b.salary,
               a.manager_id = b.manager_id,
               a.department_id = b.department_id
    --delete where b.employee_id = 105            
when not matched then
        insert values(b.employee_id,
                  b.first_name,
                  b.last_name,
                  b.email,
                  b.phone_number,
                  b.hire_date,
                  b.job_id,
                  b.salary,
                  b.commission_pct,
                  b.manager_id,
                  b.department_id);















