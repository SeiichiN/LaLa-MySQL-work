--
-- データベース名 sample2
--

CREATE DATABASE IF NOT EXISTS sample2;

USE sample2;

DROP TABLE IF EXISTS gender;

-- gender表の定義
CREATE TABLE gender (
  gid   CHAR(1) PRIMARY KEY,
  gname VARCHAR(3) NOT NULL
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  did   CHAR(3) PRIMARY KEY,
  dname VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  id        INT          AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  gender_id CHAR(1)      NOT NULL,
  age       INT          NOT NULL,
  birthyear INT          NOT NULL,
  dept_id   CHAR(3),
  PRIMARY KEY (id)
);

-- 外部キー制約
ALTER TABLE emp
ADD
  CONSTRAINT fk_gender_id
  FOREIGN KEY (gender_id)
  REFERENCES gender (gid);

ALTER TABLE emp
ADD
  CONSTRAINT fk_dept_id
  FOREIGN KEY (dept_id)
  REFERENCES dept (did);


-- hobby表

DROP TABLE IF EXISTS hobby;

CREATE TABLE hobby (
  hid   CHAR(3)     PRIMARY KEY,
  hname VARCHAR(20) NOT NULL
);

-- emp_hobby表

DROP TABLE IF EXISTS emp_hobby;

CREATE TABLE emp_hobby (
  id  INT,
  hid CHAR(3),
  PRIMARY KEY (id, hid)
);

--
-- データの入力
-- まず、gender表、dept表を入力。
-- その後、emp表を入力する。
-- 理由：emp表はgender表、dept表に
-- あるデータを入力するから。
--

-- gender表
INSERT INTO gender
(gid, gname)
VALUES
('0', '不明'),
('1', '男性'),
('2', '女性'),
('3', 'その他');

-- dept表
INSERT INTO dept
(did, dname)
VALUES
('001', '総務部'),
('002', '営業部'),
('003', '経理部'),
('004', '開発部');

-- emp表
INSERT INTO emp
(name, gender_id, age, birthyear, dept_id)
VALUES
('菅原文太',   '1', 40, 1933, '001'),
('千葉真一',   '1', 34, 1939, '002'),
('北大路欣也', '1', 30, 1943, '003'),
('梶芽衣子',   '2', 26, 1947, '002');

-- hobby表
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
('H08', 'ヨガ');


-- emp_hobby表
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
(4, 'H05');


--
-- 表を結合
--
CREATE VIEW emp_v AS
SELECT
  e.id,
  e.name,
  e.age,
  e.birthyear,
  g.gname,
  d.dname,
  h.hname,
  eh.hid
FROM emp e
  INNER JOIN gender g
  ON e.gender_id = g.gid
    INNER JOIN dept d
    ON e.dept_id = d.did
      INNER JOIN emp_hobby eh
      ON e.id = eh.id
        INNER JOIN hobby h
        ON eh.hid = h.hid
ORDER BY e.id
\g


