
-- 
-- sampleデータベース
-- 
CREATE DATABASE IF NOT EXISTS sample;

-- 
-- sampleユーザーの作成
-- 
CREATE USER IF NOT EXISTS 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

GRANT ALL ON sample.* TO 'sampleuser'@'localhost';

-- 使用宣言
USE sample;


-- 
-- emp表の定義
-- 
DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);

-- 
-- dept表の定義
-- 
DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

-- 
-- データの登録
-- 
INSERT INTO emp
(name, age, birthday, dept_id)
VALUES
('菅原文太',   40, 1933, '001'),
('千葉真一',   34, 1939, '002'),
('北大路欣也', 30, 1943, '003'),
('梶芽衣子',   26, 1947, '002');


-- deptテーブル

INSERT INTO dept
  (id, name)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部'),
  ('005', '人事部'),
  ('006', '情報システム部');


SELECT * FROM emp;
SELECT * FROM dept;
