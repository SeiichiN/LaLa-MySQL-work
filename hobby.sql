-- hobby.sql
-- 趣味のサンプル

-- ユーザー root

-- hobbyデータベース
CREATE DATABASE hobby \g
USE hobby \g

-- gender
CREATE TABLE gender (
  gid   CHAR(1)    PRIMARY KEY,
  gname VARCHAR(3) NOT NULL
)
\g

-- dept
CREATE TABLE dept (
  did   CHAR(3)     PRIMARY KEY,
  dname VARCHAR(20) NOT NULL
)
\g

-- emp
CREATE TABLE emp (
  id        INT          AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  gender_id CHAR(1)      NOT NULL,
  age       INT          NOT NULL,
  birthyear YEAR         NOT NULL,
  dept_id   CHAR(3),
  PRIMARY KEY (id)
)
\g

-- foreign key
ALTER TABLE emp
ADD
  CONSTRAINT fk_gender_id
    FOREIGN kEY (gender_id)
    REFERENCES gender (gid)
\g

ALTER TABLE emp
ADD
  CONSTRAINT fk_dept_id
    FOREIGN KEY (dept_id)
    REFERENCES dept (did)
\g

-- hobby
CREATE TABLE hobby (
  hid   CHAR(3)     PRIMARY KEY,
  hname VARCHAR(20) NOT NULL
)
\g

-- emp_hobby
CREATE TABLE emp_hobby (
  id  INT     NOT NULL,
  hid CHAR(3) NOT NULL,
  PRIMARY KEY (id, hid)
)
\g

ALTER TABLE emp_hobby
ADD
  CONSTRAINT fk_empid
  FOREIGN KEY (id) REFERENCES emp (id)
\g

ALTER TABLE emp_hobby
ADD
  CONSTRAINT fk_hobbyid
  FOREIGN KEY (hid) REFERENCES hobby (hid)
\g

--
-- データの登録
--

INSERT INTO gender
  (gid, gname)
VALUES
  ('0', '不明'),
  ('1', '男性'),
  ('2', '女性'),
  ('3', 'その他')\g


INSERT INTO dept
  (did, dname)
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部')\g


INSERT INTO emp
  (name, gender_id, age, birthyear, dept_id)
VALUES
  ('菅原文太',   '1', 40, 1933, '001'),
  ('千葉真一',   '1', 34, 1939, '002'),
  ('北大路欣也', '1', 30, 1943, '003'),
  ('梶芽衣子',   '2', 26, 1947, '002')\g
  

INSERT INTO hobby
  (hid, hname)
VALUES
  ('H01', '釣り'),
  ('H02', '油絵'),
  ('H03', '空手'),
  ('H04', '熱帯魚飼育'),
  ('H05', 'サッカー観戦'),
  ('H06', '茶道'),
  ('H07', '登山'),
  ('H08', 'ヨガ')\g


INSERT INTO emp_hobby
  (id, hid)
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
  (4, 'H05')\g


--
-- 結合表
--

CREATE VIEW hobby_view AS
SELECT
  e.name AS 名前,
  g.gname AS 性別,
  d.dname AS 所属,
  h.hname AS 趣味
FROM emp e
  INNER JOIN emp_hobby eh
  ON e.id = eh.id
    INNER JOIN gender g
    ON e.gender_id = g.gid
      INNER JOIN dept d
      ON e.dept_id = d.did
        INNER JOIN hobby h
        ON eh.hid = h.hid
ORDER BY e.id
\g


SELECT * FROM hobby_view
WHERE 趣味 LIKE '%空手%'\g
