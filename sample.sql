-- MySQLを使うxampp版-v2.3

-- データベース名 sample

CREATE DATABASE IF NOT EXISTS sample;

USE sample;

-- sampleuserの作成
CREATE USER IF NOT EXISTS 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

-- sampleuserに権限を与える
GRANT ALL ON sample.* TO 'sampleuser'@'localhost';

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- dept表 -- 参照される表なので、先に定義
CREATE TABLE dept (
  id   CHAR(3)     PRIMARY kEY,
  name VARCHAR(20) NOT NULL
);

-- ここでdept表のデータを挿入してもよい。

-- emp表
CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);

--
-- 外部キー制約
--

ALTER TABLE emp
ADD
  CONSTRAINT fk_deptid
  FOREIGN KEY (dept_id) REFERENCES dept (id)
\g



-- データの登録

INSERT INTO dept
  (id, name)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部'),
  ('005', '人事部'),
  ('006', '情報システム部')
\g


INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('菅原文太', 40, 1933, '001')
\g


INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('千葉真一',   34, 1939, '002'),
  ('北大路欣也', 30, 1943, '003'),
  ('梶芽衣子',   26, 1947, '002')
\g


-- SELECT * FROM emp;
-- SELECT * FROM dept;

--
-- 内部結合
--

SELECT
  e.id AS ID,
  e.name AS 名前,
  e.age AS 年齢,
  d.name AS 部署
FROM emp e
  INNER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC
\g


--
-- 外部結合
--

INSERT INTO emp
  (name, age, birthday)
VALUES
  ('成田三樹夫', 38, 1935)
\g


SELECT
  e.id AS ID,
  e.name AS 名前,
  e.age AS 年齢,
  d.name AS 部署
FROM emp e
  LEFT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC
\g






  