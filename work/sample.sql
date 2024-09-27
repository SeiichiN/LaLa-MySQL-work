
-- database: sample
-- user: sampleuser@localhost
-- pass: sampleuser


CREATE DATABASE IF NOT EXISTS sample;

USE sample;

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);


CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);


INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('菅原文太', 40, 1933, '001'),
  ('千葉真一',   34, 1939, '002'),
  ('北大路欣也', 30, 1943, '003'),
  ('梶芽衣子',   26, 1947, '002');
  
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




--
-- 内部結合
--

SELECT
  e.id    AS ID,
  e.name  AS 名前,
  e.age   AS 年齢,
  d.name AS 部署名
FROM emp e
  INNER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC;


--
-- dept_idのないデータ
--
INSERT INTO emp
  (name, age, birthday)
VALUES
  ('成田三樹夫', 38, 1935);


SELECT * FROM emp;
SELECT * FROM dept;

--
-- 左外部結合
--
SELECT
  e.id   AS ID,
  e.name AS 名前,
  e.age  AS 年齢,
  d.name AS 部署名
FROM emp e
  LEFT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC;


--
-- 右外部結合
--
SELECT
  e.id   AS 'ID',
  e.name AS '名前',
  e.age  AS '年齢',
  d.name AS '部署名'
FROM emp e
  RIGHT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY d.id ASC;

