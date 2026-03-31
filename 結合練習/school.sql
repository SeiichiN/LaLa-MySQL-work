-- school(rootで実行)

CREATE DATABASE IF NOT EXISTS school;
USE school;

-- あらかじめテーブルを削除
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- coursesテーブル
CREATE TABLE courses (
  id   char(3)  PRIMARY KEY,
  name varchar(100)
);

INSERT INTO courses
  (id, name)
VALUES
  ('001', 'HTMLCSS'),
  ('002', 'JavaScript'),
  ('003', 'PHP'),
  ('004', 'Java'),
  ('005', 'Python');

SELECT * FROM courses;

-- studentsテーブル

CREATE TABLE students (
  id        INT AUTO_INCREMENT,
  name      VARCHAR(100),
  gender    CHAR(2),
  course_id CHAR(3),
  PRIMARY KEY (id)
);

INSERT INTO students
  (name, gender, course_id)
VALUES
  ('染谷将太',   '男性', '001'),
  ('二階堂ふみ', '女性', '002'),
  ('窪塚洋介',   '男性', '003'),
  ('吉高百合子', '女性', '002');

SELECT * FROM students;

-- 結合

SELECT
  s.id     AS ID,
  s.name   AS 名前,
  s.gender AS 性別,
  c.name   AS コース
FROM students s
  INNER JOIN courses c
  ON s.course_id = c.id
\g
