
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
-- 外部キー制約の設定
--
ALTER TABLE emp
  ADD
  CONSTRAINT fk_dept_id
  FOREIGN KEY (dept_id) REFERENCES dept (id);


-- 
-- データの登録
-- 

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

-- empテーブル

INSERT INTO emp
(name, age, birthday, dept_id)
VALUES
('菅原文太',   40, 1933, '001'),
('千葉真一',   34, 1939, '002'),
('北大路欣也', 30, 1943, '003'),
('梶芽衣子',   26, 1947, '002');







SELECT * FROM emp;
SELECT * FROM dept;


SELECT
  e.id AS ID,
  e.name AS 名前,
  e.age AS 年齢,
  d.name AS 部署名
 FROM emp e
  INNER JOIN dept d
  ON e.dept_id = d.id
ORDER BY e.id ASC;


--
-- dept_id のないデータ
--
INSERT INTO emp
 (name, age, birthday)
VALUES
('成田三樹夫', 38, 1935);


--
-- 左外部結合
-- fromは全表示
--
/*
SELECT
  e.id AS ID,
  e.name AS 名前,
  e.age AS 年齢,
  d.name AS 部署名
FROM emp e
  LEFT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY e.id ASC;
*/

--
-- 右外部結合
-- fromは全表示しない
--
/*
SELECT
  e.id AS ID,
  e.name AS 名前,
  e.age AS 年齢,
  d.name AS 部署名
FROM emp e
  RIGHT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY e.id ASC;
*/


-- 存在しないdept_id

INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('山城新伍', 35, 1937, '006');

/*
ERROR 1452 (23000): 
 Cannot add or update a child row: 
 a foreign key constraint fails 
 (`sample`.`emp`, 
   CONSTRAINT `emp_ibfk_1` 
   FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`))
*/
