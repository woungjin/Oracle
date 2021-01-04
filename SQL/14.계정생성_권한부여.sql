/*
오라클의 최고 관리자 계정으로 실행을 시킵니다.
*/
--계정 생성명령
create user user01 IDENTIFIED by user01;
--생성 된 계정에 권한 부여
grant create session, create table, create sequence, create view to user01;
--기존에 있는 테이블 스페이스 (데이터가 물리적으로 저장되는 공간)
--alter user user01 default TABLESPACE users quota UNLIMITED on users;
--새롭게 생성한 테이블 스페이스를 사용하는 경우
alter user user01 default tablespace MY_DATA quota unlimited on MY_DATA;

/*
롤을 이용한 계정 생성과 권한 부여
*/
create user user02 IDENTIFIED by user02;
grant connect, resource to user02;
alter user user02 default tablespace MY_DATA quota unlimited on MY_DATA;










