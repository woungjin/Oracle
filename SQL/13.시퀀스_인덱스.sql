--시퀀스 (순차적으로 증가하는 값)
select * from user_sequences; --시퀀스 확인명령
select * from user_views; -- view확인명령
select * from user_constraints; --제약조건 확인명령

--시퀀스 생성
create sequence dept3_seq; --자동생성
create sequence dept3_seq increment by 1 start with 1 maxvalue 10 nocycle nocache; --옵션지정
    
--시퀀스 삭제
drop sequence dept3_seq;

--테이블 생성
create table dept3(
    dept_no number(3) primary key,
    dept_name varchar2(20),
    dept_date date default sysdate
);
desc dept3;
--시퀀스 사용하기 currval, nextval
--시퀀스 maxvalue가 10이기 때문에 10까지 증가되면 오류를 발생시킵니다.
insert into dept3(dept_no, dept_name ) values(dept3_seq.nextval, 'test');

--현재시퀀스의 확인
select dept3_seq.currval from dual;

--시퀀스 수정
alter sequence dept3_seq maxvalue 9999; -- 맥스값 9999로 변경
alter sequence dept3_seq increment by 10; -- 증가값 10으로 변경
alter sequence dept3_seq minvalue 1; --최소값 1
--시퀀스 조회
select dept3_seq.currval from dual;
select dept3_seq.nextval from dual; --next명령이 들어갈때마다 값의 증가.

--시퀀스의 값을 다시 처음으로 돌리는 방법
--현재시퀀스 확인 -> 증가값 수정(-가장높은값)  -> nextval -> 증가값 1로 변경 -> 실행
select dept3_seq.currval from dual;
alter sequence dept3_seq increment by -19; --증가값을 변경 
select dept3_seq.nextval from dual; --다음시퀀스 값 명령
alter sequence dept3_seq increment by 1; --증가값 변경
select dept3_seq.currval from dual;


drop sequence dept3_seq;
drop table dept3;
/*
시퀀스 활용 pk값을 20201016-시퀀스값
1. dept3_seq생성
2. pk를 varchar2로 생성
3. insert시에 to_char(날짜) || - || 시퀀스값
*/
create table dept3(
    dept_no varchar2(30) primary key,
    dept_name varchar2(30)
);
create sequence dept3_seq increment by 1 start with 1 nocache;
insert into dept3 values( to_char(sysdate, 'YYYYMMDD') || '-' || dept3_seq.nextval  , 'test' );

select * from dept3;

--index
--index는 primary key, unique 제약 조건에서 자동으로 생성되고, 조회를 빠르게 해주는 hint역할을 합니다.
--index는 조회를 빠르게 하지만, 무작위하게 많은 인덱스 생성해서 사용하면 오히려, 성능 부하를 일으킬 수 있습니다.
--그래서 최후의 수단으로 index를 사용하는 것이 올바른 사용방법
select * from user_indexes;
select * from emps where first_name = 'Lex';
--인덱스를 수동으로 추가
create index emps_first_name_ix on emps(first_name);
--인덱스 삭제
drop index emps_first_name_ix;













