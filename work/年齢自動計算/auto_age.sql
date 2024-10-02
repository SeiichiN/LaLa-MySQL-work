--
-- �N��������v�Z����
-- database: rensyu2
--

create database if not exists rensyu2;

use rensyu2;

drop table if exists emp;

create table emp (
  id        int auto_increment,
  name      varchar(20),
  birthday  date,
  dept      varchar(20),
  primary key (id)
);

insert into emp
  (name, birthday, dept)
 values
  ('��������',   '1933/08/16', '������'),
  ('��t�^��',   '1939/01/22', '�c�ƕ�'),
  ('�k��H�Ӗ�', '1943/02/23', '�o����'),
  ('����ߎq',   '1947/03/24', '�c�ƕ�');


SELECT
  id,
  name,
  timestampdiff(year, birthday, curdate()) AS age,
  birthday,
  dept
FROM emp;

