--
-- ”N—î‚ğ©“®ŒvZ‚·‚é
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
  ('›Œ´•¶‘¾',   '1933/08/16', '‘–±•”'),
  ('ç—t^ˆê',   '1939/01/22', '‰c‹Æ•”'),
  ('–k‘å˜H‹Ó–ç', '1943/02/23', 'Œo—•”'),
  ('Š‰èˆßq',   '1947/03/24', '‰c‹Æ•”');


SELECT
  id,
  name,
  timestampdiff(year, birthday, curdate()) AS age,
  birthday,
  dept
FROM emp;

