-----테이블 생성-----
create table dept2(
    dept_no number(2, 0), -- 2자리 저장, 실수는 저장하지 않는다.
    dept_name varchar2(14), --byte기반 가변 문자열
    loca varchar2(13),
    dept_date date,
    deot_bonus number(10)
);

select * from dept2;
insert into dept2 values(99, '영업', '서울', sysdate, 2000000000 ); --자리수 확인

----테이블 수정 alter table---
alter table dept2
add dept_count number(3); --추가
desc dept2;

alter table dept2
modify dept_count number(10); --수정
desc dept2;

alter table dept2
rename column dept_count to emp_count; --컬럼명 변경
desc dept2;

alter table dept2
drop column emp_count; --삭제
desc dept2;

--테이블 삭제
drop table dept2;
--drop table dept2 cascade constraints 제약조건명; --해당테이블에 FK제약조건이 들어있더라도 삭제.

--테이블데이터 전부삭제
--truncate table dept2;

--테이블 생성과 제약조건
/*
열레벨 제약조건 (PK, FK, not null, check, unique)
1. PK - 테이블 고유 식별 컬럼 (not null포함 unique포함)
2. UNIQUE - 유일한 값을 갖게하는 컬럼(중복데이터의 방지)
3. not null - null을 허용하지 않음
4. FK - 참조하는 테이블의 PK를 저장하는 컬럼
5. CHECK - 정의된 형식만 들어오도록 허용
*/

desc locations;

create table dept2(
    dept_no number(2) PRIMARY KEY,
    dept_name varchar2(14) not null unique,
    loca number(4) REFERENCES locations(location_id),
    dept_date date default sysdate, --아무것도 지정하지 않으면 기본으로 지금시간
    dept_bonus number(10),
    dept_gender char(1) check(dept_gender in ('F', 'M') )
);
desc dept2;
drop table dept2;
--테이블 레벨 제약조건(모든 열을 선언한 후에 아래쪽에 제약조건 추가)
create table dept2(
    dept_no number(2),
    dept_name varchar2(14) not null,
    loca number(4),
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1),
    constraints dept_no_pk primary key (dept_no ), --제약조건 제약조건이름 제약조건종류 적용컬럼
    constraints dept_name_uk unique (dept_name),
    constraints dept_gender_ck check (dept_gender in ('F', 'M')),
    constraints dept_loca_fk foreign key (loca) references locations(location_id)    
);

--제약 조건은 추가, 삭제가 가능합니다.
drop table dept2;
create table dept2(
    dept_no number(2),
    dept_name varchar2(14),
    loca number(4),
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1)
);
--pk추가
alter table dept2 add constraints dept_no_pk primary key (dept_no);
--fk추가
alter table dept2 add constraints dept_loca_fk foreign key (loca) references locations(location_id);
--check추가
alter table dept2 add constraints dept_gender_check check(dept_gender in ('Y', 'N'));
--unique추가
alter table dept2 add constraints dept_name_uk unique (dept_name);
--not null은 열 수정형태로 변경합니다.
alter table dept2 modify dept_name varchar(14) not null;

--제약조건 삭제 (제약조건 이름으로)
alter table dept2 drop constraints dept_no_pk;

--FK는 부모테이블에 값이 없다면 삽입이 불가능
select * from locations;
insert into dept2 values(10, 'test', 100, sysdate, 5000, 'Y'); --locations에 location_id 100이 없기 때문


----연습문제----
create table members(   
    m_name varchar2(20) not null ,
    m_num number(10), --constraints mem_memnum_pk primary key,
    reg_date date not null, --constraints mem_regdate_uk unique,
    gender varchar2(1),
    loca number(4),
    constraints mem_memnum_pk primary key (m_num),
    constraints mem_regdate_uk unique (reg_date),
    constraints mem_loca_loc_locid_fk foreign key (loca) references locations(location_id)
);

insert into members values('AAA', 1, to_date('2020-07-21', 'YY/MM/DD'), 'M', 1800); 
insert into members values('BBB', 2, '2020-07-02', 'F', 1900); 
insert into members values('CCC', 3, '2020-07-03', 'M', 2000); 
insert into members values('DDD', 4, sysdate, 'M', 2000);
commit;

select * from members;
--문제2
select *
from members s
join locations l
on s.loca = l.location_id
order by m_num;











