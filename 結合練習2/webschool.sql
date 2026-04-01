-- データベース: webschool
-- ユーザー: root
-- パスワード: なし

CREATE DATABASE IF NOT EXISTS webschool;
USE webschool;

-- 都道府県表(prefectures.sql)読み込み
SOURCE prefectures.sql;

-- courses表
CREATE TABLE courses (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(100)
);

INSERT INTO courses
  (name)
VALUES
  ('HTMLCSS'),
  ('JavaScript'),
  ('PHP'),
  ('Java'),
  ('Python');

-- SELECT * FROM prefectures;
-- SELECT * FROM courses;

-- students表
CREATE TABLE students (
  id              INT AUTO_INCREMENT,
  name            VARCHAR(100),
  gender          CHAR(1),
  birthday        DATE,
  prefecture_code CHAR(2),
  course_id       INT,
  PRIMARY KEY (id)
);

INSERT INTO students
  (name, gender, birthday, prefecture_code, course_id)
VALUES
  ('染谷将太',   '男', '1992/09/03', '13', 2),
  ('二階堂ふみ', '女', '1994/09/21', '47', 3),
  ('渡辺哲',     '男', '1950/03/11', '23', 4),
  ('窪塚洋介',   '男', '1979/05/07', '14', 1),
  ('吉高由里子', '女', '1988/07/22', '13', 4);
  
-- SELECT * FROM students;

--
-- 結合表
--
SELECT
  s.id       AS ID,
  s.name     AS name,
  s.gender   AS gender,
  s.birthday AS birthday,
  p.name     AS pref,
  c.name     AS course
FROM students s
  INNER JOIN prefectures p
  ON s.prefecture_code = p.code
    INNER JOIN courses c
    ON s.course_id = c.id
ORDER BY s.id
\g
