--������ (���������� �����ϴ� ��)
select * from user_sequences; --������ Ȯ�θ��
select * from user_views; -- viewȮ�θ��
select * from user_constraints; --�������� Ȯ�θ��

--������ ����
create sequence dept3_seq; --�ڵ�����
create sequence dept3_seq increment by 1 start with 1 maxvalue 10 nocycle nocache; --�ɼ�����
    
--������ ����
drop sequence dept3_seq;

--���̺� ����
create table dept3(
    dept_no number(3) primary key,
    dept_name varchar2(20),
    dept_date date default sysdate
);
desc dept3;
--������ ����ϱ� currval, nextval
--������ maxvalue�� 10�̱� ������ 10���� �����Ǹ� ������ �߻���ŵ�ϴ�.
insert into dept3(dept_no, dept_name ) values(dept3_seq.nextval, 'test');

--����������� Ȯ��
select dept3_seq.currval from dual;

--������ ����
alter sequence dept3_seq maxvalue 9999; -- �ƽ��� 9999�� ����
alter sequence dept3_seq increment by 10; -- ������ 10���� ����
alter sequence dept3_seq minvalue 1; --�ּҰ� 1
--������ ��ȸ
select dept3_seq.currval from dual;
select dept3_seq.nextval from dual; --next����� �������� ���� ����.

--�������� ���� �ٽ� ó������ ������ ���
--��������� Ȯ�� -> ������ ����(-���������)  -> nextval -> ������ 1�� ���� -> ����
select dept3_seq.currval from dual;
alter sequence dept3_seq increment by -19; --�������� ���� 
select dept3_seq.nextval from dual; --���������� �� ���
alter sequence dept3_seq increment by 1; --������ ����
select dept3_seq.currval from dual;


drop sequence dept3_seq;
drop table dept3;
/*
������ Ȱ�� pk���� 20201016-��������
1. dept3_seq����
2. pk�� varchar2�� ����
3. insert�ÿ� to_char(��¥) || - || ��������
*/
create table dept3(
    dept_no varchar2(30) primary key,
    dept_name varchar2(30)
);
create sequence dept3_seq increment by 1 start with 1 nocache;
insert into dept3 values( to_char(sysdate, 'YYYYMMDD') || '-' || dept3_seq.nextval  , 'test' );

select * from dept3;

--index
--index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�, ��ȸ�� ������ ���ִ� hint������ �մϴ�.
--index�� ��ȸ�� ������ ������, �������ϰ� ���� �ε��� �����ؼ� ����ϸ� ������, ���� ���ϸ� ����ų �� �ֽ��ϴ�.
--�׷��� ������ �������� index�� ����ϴ� ���� �ùٸ� �����
select * from user_indexes;
select * from emps where first_name = 'Lex';
--�ε����� �������� �߰�
create index emps_first_name_ix on emps(first_name);
--�ε��� ����
drop index emps_first_name_ix;













