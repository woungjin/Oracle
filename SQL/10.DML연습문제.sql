-------DML문 연습문제-------
--문제1
--280개발 null 1800
--290회계부 null 1800
--300재정 301 1800
--310인사 302 1800
--320영업 303 1700
select * from depts;
insert into depts(department_id, department_name, location_id) values(280, '개발', 1800);
insert into depts values(290, '회계부', null, 1800);
insert into depts values(300, '재정', 301, 1800);
insert into depts values(310, '인사', 302, 1800);
insert into depts values(320, '영업', 303, 1800);

--문제2
update depts set department_name = 'IT bank' where department_name = 'IT Support';
update depts set manager_id = 301 where department_id =290;
update depts set department_name = 'IT Help', manager_id =  303, location_id = 1800 where department_name = 'IT Helpdesk';
update depts set manager_id = 301 where manager_id in (301, 302, 303 );

--문제3
select * from depts where department_name = '영업';
select * from depts where department_name = 'NOC';
delete from depts where department_id = 320;
delete from depts where department_id = 220;

--문제4
delete from depts where department_id > 200;
update depts set manager_id = 100 where manager_id is not null;
select * from depts;
---4. Departments테이블은 매번 수정이 일어나는 테이블이라고 가정하고 Depts와 비교하여
--일치하는 경우 Depts의 부서명, 매니저ID, 지역ID를 업데이트 하고
--새로유입된 데이터는 그대로 추가해주는 merge문을 작성하세요
merge into depts a
    using (select * from departments) d
    on (a.department_id = d.department_id)
when matched then
    update set a.department_name = d.department_name,
               a.manager_id = d.manager_id,
               a.location_id = d.location_id
when not matched then
    insert values(d.department_id,
                  d.department_name,
                  d.manager_id,
                  d.location_id);
select * from depts;
--문제5
--IT_DEV 아이티개발팀 6000 20000
--NET_DEV 네트워크개발팀 5000 20000
--SEC_DEV 보안개발팀 6000 19000
--1. jobs_it 사본 테이블을 생성하세요 (조건은 min_salary가 6000보다 큰 데이터만 복사합니다)
--2. jobs_it 테이블에 다음 데이터를 추가하세요
--3. jobs_it은 타겟 테이블 입니다
--4. jobs테이블은 매번 수정이 일어나는 테이블이라고 가정하고 jobs_it과 비교하여
--min_salary컬럼이 0보다 큰 경우 기존의 데이터는 min_salary, max_salary를 업데이트 하고 새로 유입된
--데이터는 그대로 추가해주는 merge문을 작성하세요

select * from jobs_it;
create table jobs_it as (select * from jobs where min_salary > 6000);
insert into jobs_it values('IT_DEV', '아이티개발팀', 6000, 20000 );
insert into jobs_it values('NET_DEV', '네트워크개발팀', 5000, 20000 );
insert into jobs_it values('SEC_DEV', '보안개발팀', 6000, 19000 );

merge into jobs_it a
    using(select * from jobs where min_salary > 0) b
    on(a.job_id = b.job_id)
when matched then
    update set a.min_salary = b.min_salary,
               a.max_salary = b.max_salary
when not matched then
    insert values(b.job_id,
                  b.job_title,
                  b.min_salary,
                  b.max_salary);

select * from jobs_it;

commit;
