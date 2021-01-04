-----���̺� ����-----
create table dept2(
    dept_no number(2, 0), -- 2�ڸ� ����, �Ǽ��� �������� �ʴ´�.
    dept_name varchar2(14), --byte��� ���� ���ڿ�
    loca varchar2(13),
    dept_date date,
    deot_bonus number(10)
);

select * from dept2;
insert into dept2 values(99, '����', '����', sysdate, 2000000000 ); --�ڸ��� Ȯ��

----���̺� ���� alter table---
alter table dept2
add dept_count number(3); --�߰�
desc dept2;

alter table dept2
modify dept_count number(10); --����
desc dept2;

alter table dept2
rename column dept_count to emp_count; --�÷��� ����
desc dept2;

alter table dept2
drop column emp_count; --����
desc dept2;

--���̺� ����
drop table dept2;
--drop table dept2 cascade constraints �������Ǹ�; --�ش����̺� FK���������� ����ִ��� ����.

--���̺����� ���λ���
--truncate table dept2;

--���̺� ������ ��������
/*
������ �������� (PK, FK, not null, check, unique)
1. PK - ���̺� ���� �ĺ� �÷� (not null���� unique����)
2. UNIQUE - ������ ���� �����ϴ� �÷�(�ߺ��������� ����)
3. not null - null�� ������� ����
4. FK - �����ϴ� ���̺��� PK�� �����ϴ� �÷�
5. CHECK - ���ǵ� ���ĸ� �������� ���
*/

desc locations;

create table dept2(
    dept_no number(2) PRIMARY KEY,
    dept_name varchar2(14) not null unique,
    loca number(4) REFERENCES locations(location_id),
    dept_date date default sysdate, --�ƹ��͵� �������� ������ �⺻���� ���ݽð�
    dept_bonus number(10),
    dept_gender char(1) check(dept_gender in ('F', 'M') )
);
desc dept2;
drop table dept2;
--���̺� ���� ��������(��� ���� ������ �Ŀ� �Ʒ��ʿ� �������� �߰�)
create table dept2(
    dept_no number(2),
    dept_name varchar2(14) not null,
    loca number(4),
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1),
    constraints dept_no_pk primary key (dept_no ), --�������� ���������̸� ������������ �����÷�
    constraints dept_name_uk unique (dept_name),
    constraints dept_gender_ck check (dept_gender in ('F', 'M')),
    constraints dept_loca_fk foreign key (loca) references locations(location_id)    
);

--���� ������ �߰�, ������ �����մϴ�.
drop table dept2;
create table dept2(
    dept_no number(2),
    dept_name varchar2(14),
    loca number(4),
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1)
);
--pk�߰�
alter table dept2 add constraints dept_no_pk primary key (dept_no);
--fk�߰�
alter table dept2 add constraints dept_loca_fk foreign key (loca) references locations(location_id);
--check�߰�
alter table dept2 add constraints dept_gender_check check(dept_gender in ('Y', 'N'));
--unique�߰�
alter table dept2 add constraints dept_name_uk unique (dept_name);
--not null�� �� �������·� �����մϴ�.
alter table dept2 modify dept_name varchar(14) not null;

--�������� ���� (�������� �̸�����)
alter table dept2 drop constraints dept_no_pk;

--FK�� �θ����̺� ���� ���ٸ� ������ �Ұ���
select * from locations;
insert into dept2 values(10, 'test', 100, sysdate, 5000, 'Y'); --locations�� location_id 100�� ���� ����


----��������----
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
--����2
select *
from members s
join locations l
on s.loca = l.location_id
order by m_num;











