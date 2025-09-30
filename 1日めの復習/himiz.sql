-- himiz�f�[�^�x�[�X

create database if not exists himiz;

use himiz;

drop table if exists persons;
drop table if exists gender;

create table persons (
  id          int         auto_increment primary key,
  name        varchar(20),
  gender_id   int,
  birthday    date,
  pref_id     char(2)
);

insert into persons
(name, gender_id, birthday, pref_id)
values
('���J����',   1, '1992-09-03', '13'),
('��K���ӂ�', 2, '1994-09-21', '47'),
('�n�ӓN',     1, '1950-03-11', '23'),
('�E�˗m��',   1, '1975-05-07', '14'),
('�g���R���q', 2, '1988-07-22', '13');


-- ���ʕ\
CREATE TABLE gender (
  id INT PRIMARY KEY,
  name VARCHAR(10)
);

INSERT INTO gender VALUES
(1, '�j��'),
(2, '����');


-- �����\(persons, gender)
SELECT
  p.id AS ID,
  p.name AS ���O,
  g.name AS ����,
  p.birthday AS �a����,
  p.pref_id AS �o�g
FROM persons p
  INNER JOIN gender g
  ON p.gender_id = g.id
ORDER BY p.id
\g


-- prefs.sql �̓ǂݍ���

source prefs.sql;

select * from prefs;

-- �����\(persons, gender, prefs)
SELECT
  p.id       AS ID,
  p.name     AS ���O,
  g.name     AS ����,
  p.birthday AS �a����,
  pr.name    AS �o�g
FROM persons p
  INNER JOIN gender g
  ON p.gender_id = g.id
    INNER JOIN prefs pr
    ON p.pref_id = pr.id
ORDER BY p.id ASC
\g
