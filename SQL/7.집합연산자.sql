-- 집합연산자 사용시에는 컬럼개수를 동일하게 맞춥니다.
-- 집합연산자 union(합집합 중복x), union all(합집합 중복o)
select employee_id, first_name from employees where hire_date like '04%' --04년 입사자
union
select employee_id, first_name from employees where department_id = 20; -- 부서번호 20

select employee_id, first_name from employees where hire_date like '04%'
union all
select employee_id, first_name from employees where department_id = 20;

-- intersect (교집합), minus (차집합)
select employee_id, first_name from employees where hire_date like '04%'
minus --intersect
select employee_id, first_name from employees where department_id = 20;

-- union all을 사용한 더미데이터 
select '홍길동' as name, '20200211' as year from dual union all
select '이순신', '20200321' from dual union all
select '김유신', '20190231' from dual union all
select '이성계', '20180301' from dual;





