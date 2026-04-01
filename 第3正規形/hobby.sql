-- hobbyデータベース
-- root

CREATE DATABASE IF NOT EXISTS hobby;
USE hobby;

-- table削除
DROP TABLE IF EXISTS employee_hobbies;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS genders;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS hobbies;


-- genders表
CREATE TABLE genders (
  id CHAR(1) PRIMARY KEY,
  name VARCHAR(3) NOT NULL
);

-- departments表
CREATE TABLE departments (
  id CHAR(3) PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

-- employees表
CREATE TABLE employees (
  id        INT    AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  gender_id CHAR(1)      NOT NULL,
  age       INT          NOT NULL,
  birthyear INT          NOT NULL,
  department_id CHAr(3),
  PRIMARY KEY (id)
);

-- 外部キー制約
ALTER TABLE employees
ADD
  CONSTRAINT fk_gender_id
  FOREIGN KEY (gender_id)
  REFERENCES genders (id);

ALTER TABLE employees
ADD
  CONSTRAINT fk_department_id
  FOREIGN KEY (department_id)
  REFERENCES departments (id);


-- hobbies表
CREATE TABLE hobbies (
  id   CHAR(3) PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

-- employee_hobbies表
CREATE TABLE employee_hobbies (
  employee_id INT     NOT NULL,
  hobby_id    CHAR(3) NOT NULL,
  PRIMARY KEY (employee_id, hobby_id)
);

-- データの登録

INSERT INTO genders
  (id, name)
VALUES
  ('0', '不明'),
  ('1', '男性'),
  ('2', '女性'),
  ('3', 'その他');

INSERT INTO departments
  (id, name)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部');

INSERT INTO employees
  (name, gender_id, age, birthyear, department_id)
VALUES
  ('菅原文太',   '1', 40, 1933, '001'),
  ('千葉真一',   '1', 34, 1939, '002'),
  ('北大路欣也', '1', 30, 1943, '003'),
  ('梶芽衣子',   '2', 26, 1947, '002');

INSERT INTO hobbies
  (id, name)
VALUES
  ('H01', '釣り'),
  ('H02', '油絵'),
  ('H03', '空手'),
  ('H04', '熱帯魚飼育'),
  ('H05', 'サッカー観戦'),
  ('H06', '茶道'),
  ('H07', '登山'),
  ('H08', 'ヨガ');

INSERT INTO employee_hobbies
  (employee_id, hobby_id)
VALUES
  (1, 'H01'),
  (1, 'H02'),
  (1, 'H03'),
  (2, 'H03'),
  (2, 'H04'),
  (2, 'H05'),
  (2, 'H01'),
  (3, 'H06'),
  (3, 'H03'),
  (4, 'H07'),
  (4, 'H08'),
  (4, 'H05');
  
  
  



