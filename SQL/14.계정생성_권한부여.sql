/*
����Ŭ�� �ְ� ������ �������� ������ ��ŵ�ϴ�.
*/
--���� �������
create user user01 IDENTIFIED by user01;
--���� �� ������ ���� �ο�
grant create session, create table, create sequence, create view to user01;
--������ �ִ� ���̺� �����̽� (�����Ͱ� ���������� ����Ǵ� ����)
--alter user user01 default TABLESPACE users quota UNLIMITED on users;
--���Ӱ� ������ ���̺� �����̽��� ����ϴ� ���
alter user user01 default tablespace MY_DATA quota unlimited on MY_DATA;

/*
���� �̿��� ���� ������ ���� �ο�
*/
create user user02 IDENTIFIED by user02;
grant connect, resource to user02;
alter user user02 default tablespace MY_DATA quota unlimited on MY_DATA;










