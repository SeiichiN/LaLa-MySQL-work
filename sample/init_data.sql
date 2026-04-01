-- root もしくは sampleuser が実行
-- user: sampleuser
-- pass: sampleuser

-- データベースの作成
CREATE DATABASE IF NOT EXISTS sample;

-- 使用宣言
USE sample;

-- あらかじめテーブルを削除
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

--
-- departments表
--
CREATE TABLE departments (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

--
-- employees表
--
CREATE TABLE employees (
  id   INT         AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  age  INT         NOT NULL,
  birthday      YEAR    NOT NULL,
  department_id CHAR(3),
  PRIMARY KEY (id)
);

-- 外部キー制約を追加
ALTER TABLE employees
ADD
  CONSTRAINT fk_department_id
  FOREIGN KEY (department_id)
  REFERENCES departments (id);
  

-- データの登録

-- departmentsテーブル
INSERT INTO departments
  (id, name)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部'),
  ('005', '人事部'),
  ('006', '情報システム部');

-- employeesテーブル
INSERT INTO employees
  (name, age, birthday, department_id)
VALUES
  ('菅原文太', 40, 1933, '001'),
  ('千葉真一',   34, 1939, '002'),
  ('北大路欣也', 30, 1943, '003'),
  ('梶芽衣子',   26, 1967, '002');

SELECT * FROM employees;
SELECT * FROM departments;

--
-- 結合する
--
SELECT
  e.id   AS ID,
  e.name AS 名前,
  e.age  AS 年齢,
  d.name AS 部署名
FROM employees e
  INNER JOIN departments d
  ON e.department_id = d.id
ORDER BY ID
\g

--
-- 外部結合
--

/*
INSERT INTO employees
  (name, age, birthday)
VALUES
  ('成田三樹夫', 38, 1935);
*/

-- 左外部結合
/*
SELECT
  e.id   AS ID,
  e.name AS 名前,
  e.age  AS 年齢,
  d.name AS 部署名
FROM employees e
  LEFT OUTER JOIN departments d
  ON e.department_id = d.id
ORDER BY ID
\g
*/

-- 右外部結合
/*
SELECT
  e.id   AS ID,
  e.name AS 名前,
  e.age  AS 年齢,
  d.name AS 部署名
FROM employees e
  RIGHT OUTER JOIN departments d
  ON e.department_id = d.id
ORDER BY ID
\g
*/

--
-- 制約
--

-- departments表にないデータを入力(エラー)
/*
INSERT INTO employees
  (name, age, birthday, department_id)
VALUES
  ('山城新伍', 41, 1932, '005');
*/

-- 営業部が 002 から 007 に変更
/*
UPDATE departments
SET id = '007'
  WHERE id = '002';
*/

-- 003 経理部を削除
/*
DELETE FROM departments
  WHERE id = '003';
*/

