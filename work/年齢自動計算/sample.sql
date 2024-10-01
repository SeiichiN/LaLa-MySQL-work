
-- database: sample
-- user: sampleuser@localhost
-- pass: sampleuser


CREATE DATABASE IF NOT EXISTS sample;

USE sample;

DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  birthday DATE        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);


CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);


-- dept テーブル

INSERT INTO dept
  (id, name)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部'),
  ('005', '人事部'),
  ('006', '情報システム部');


INSERT INTO emp
  (name, birthday, dept_id)
VALUES
  ('菅原文太',   '1933/08/16', '001'),
  ('千葉真一',   '1939/01/22', '002'),
  ('北大路欣也', '1943/02/23', '003'),
  ('梶芽衣子',   '1947/03/24', '002');
  



SELECT * FROM emp;
SELECT * FROM dept;

