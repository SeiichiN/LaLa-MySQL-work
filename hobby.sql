-- hobby.sql
-- ï¡ÌTv

-- [U[ root

-- hobbyf[^x[X
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
-- f[^Ìo^
--

INSERT INTO gender
  (gid, gname)
VALUES
  ('0', 's¾'),
  ('1', 'j«'),
  ('2', '«'),
  ('3', '»Ì¼')\g


INSERT INTO dept
  (did, dname)
VALUES
  ('001', '±'),
  ('002', 'cÆ'),
  ('003', 'o'),
  ('004', 'J­')\g


INSERT INTO emp
  (name, gender_id, age, birthyear, dept_id)
VALUES
  ('´¶¾',   '1', 40, 1933, '001'),
  ('çt^ê',   '1', 34, 1939, '002'),
  ('kåHÓç', '1', 30, 1943, '003'),
  ('èßq',   '2', 26, 1947, '002')\g
  

INSERT INTO hobby
  (hid, hname)
VALUES
  ('H01', 'Þè'),
  ('H02', 'ûG'),
  ('H03', 'óè'),
  ('H04', 'MÑç'),
  ('H05', 'TbJ[Ïí'),
  ('H06', '¹'),
  ('H07', 'oR'),
  ('H08', 'K')\g


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
-- \
--

CREATE VIEW hobby_view AS
SELECT
  e.name AS ¼O,
  g.gname AS «Ê,
  d.dname AS ®,
  h.hname AS ï¡
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
WHERE ï¡ LIKE '%óè%'\g
