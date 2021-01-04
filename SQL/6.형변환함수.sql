--형변환 함수 TO_CHAR, TO_NUMBER, TO_DATE

--날짜를 문자로 ★TO_CHAR(날짜, 형식)
select to_char(sysdate, 'YYYY-MM-DD') from dual; --날짜fmt 형식은 대문자로 표기
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD HH24:MI') from dual;
select to_char(sysdate, 'YYYY"년"MM"월"DD"일"') from dual; --날짜fmt형식이 아니면 사용이 불가능한 경우 " "묶어서 표현
select first_name, to_char(hire_date, 'YYYY-MM-DD') from employees;

--숫자를 문자로 TO_CHAR(숫자, 형식)
select to_char(20000, '99999999') from dual; -- 9는 자리수의 표현
select to_char(20000, '999') from dual; -- 자리수 부족한 경우 #으로 표현됨
select to_char(20000.21 , '99999' ) from dual; 
select to_char(20000.21 , '99999.99') from dual;
select to_char(salary, '$99,999' ) from employees; -- $ . ,도 숫자에서 사용가능한 fmt형식입니다

-- 문자를 숫자로 TO_NUMBER(문자, 형식)
select '2000' + 2000 from dual; --자동형변환 
select to_number('2000') + 2000 from dual; --명시적형변환
select '$2000' + 2000 from dual; -- 문자형이 $ , 같은 특정 문자를 지니고 있을 때는 자동형변환이 불가합니다 
select to_number('$2000', '$9999') + 2000 from dual; --숫자fmt이 지원하는 형식을 가진경우, 명시적형변환이 가능합니다.

-- 문자를 날자로 ★TO_DATE(문자, 형식) 
select to_date('2020-03-31') from dual; --이런 경우는 바로 사용이 가능합니다.
select to_date('2020/12/12', 'YY/MM/DD') from dual; -- 날짜 fmt를 이용해서 변경도 가능
select to_date('2020-03-21 12:23:03', 'YYYY-MM-DD HH:MI:SS') from dual; --날짜fmt이 지원하는 형식을 가진경우, 형변환이 가능

-- ★NVL(데이터, null일경우 처리할값) -null제거
select nvl(null, 0) from dual;
select  first_name, 
        salary , 
        salary + salary * nvl(commission_pct, 0) --null연산이 들어가는 경우 null값이 나오게 되는데,null인경우 0으로변경해서 사용
from employees;

-- ★NVL2(데이터, null이 아닌경우 처리, null인 경우처리) -null제거
select nvl2(null, '널아님', '널' ) from dual;
select first_name, 
       nvl2(commission_pct, 'true', 'false') 
from employees;

select first_name,
       nvl2(commission_pct, salary + salary * commission_pct, salary) as 최종급여
from employees;

-- DECODE(데이터, 비교값, 결과, 비교값, 결과) ★
select decode('E', 'A', 'A입니다',
                   'B', 'B입니다',
                   'C', 'C입니다',
                        'A, B, C가 아닙니다') 
from dual;

select job_id,
       salary,
       decode(job_id, 'IT_PROG', salary * 100,
                      'AD_VP', salary * 200,
                      'FI_MGR', salary * 300,
                                salary)
from employees;

-- case when then end
select job_id,
       salary,
       (case job_id when 'IT_PFOG' then salary * 100
                    when 'AD_VP' then salary * 200
                    when 'FI_MGR' then salary * 300
                    else salary
       end) 
from employees;

-----------연습문제------------
select  employee_id as num,
        concat(first_name, last_name) as name,
        hire_date,
        trunc((sysdate - hire_date) / 365) as 근속년수
from employees
where trunc((sysdate - hire_date) / 365) >= 10
order by 근속년수;

-- 100, 120, 121, 122
select first_name,
       manager_id,
       decode(manager_id, 100, '사원',
                          120, '주임',
                          121, '대리',
                          122, '과장',
                               '임원') as 직급
from employees
where department_id = 50;








