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
  birthyear INT          NOT NULL,
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
