--Ʈ�����-�۾��������(�����ͺ��̽� ������ġ)
--Ʈ������� DML���� ������ �����մϴ�
--Ʈ����� ������
show autocommit; 
set autocommit on;
set autocommit off;

select * from depts;
delete from depts where department_id = 10;
--���̺�����Ʈ ����
savepoint delete_10;

delete from depts where department_id = 20;
savepoint delete_20;

delete from depts; --�� ������ ����

rollback to delete_20; --���� �ѹ�
select * from depts;
rollback to delete_10; --���� �ѹ�
select * from depts;
rollback; --����Ŀ�� ���ı��� �ǵ���
select * from depts;


commit; --Ŀ�� ���Ŀ��� � ������ε� �ǵ��� �� ����














