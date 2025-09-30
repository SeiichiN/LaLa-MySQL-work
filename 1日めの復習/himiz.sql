-- himizデータベース

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
('染谷将太',   1, '1992-09-03', '13'),
('二階堂ふみ', 2, '1994-09-21', '47'),
('渡辺哲',     1, '1950-03-11', '23'),
('窪塚洋介',   1, '1975-05-07', '14'),
('吉高由里子', 2, '1988-07-22', '13');


-- 性別表
CREATE TABLE gender (
  id INT PRIMARY KEY,
  name VARCHAR(10)
);

INSERT INTO gender VALUES
(1, '男性'),
(2, '女性');


-- 結合表(persons, gender)
SELECT
  p.id AS ID,
  p.name AS 名前,
  g.name AS 性別,
  p.birthday AS 誕生日,
  p.pref_id AS 出身
FROM persons p
  INNER JOIN gender g
  ON p.gender_id = g.id
ORDER BY p.id
\g


-- prefs.sql の読み込み

source prefs.sql;

select * from prefs;

-- 結合表(persons, gender, prefs)
SELECT
  p.id       AS ID,
  p.name     AS 名前,
  g.name     AS 性別,
  p.birthday AS 誕生日,
  pr.name    AS 出身
FROM persons p
  INNER JOIN gender g
  ON p.gender_id = g.id
    INNER JOIN prefs pr
    ON p.pref_id = pr.id
ORDER BY p.id ASC
\g
