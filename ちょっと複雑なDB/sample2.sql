--
-- データベース名 sample2
--

CREATE DATABASE IF NOT EXISTS sample2;

USE sample2;

DROP TABLE IF EXISTS gender;

-- gender表の定義
CREATE TABLE gender (
  gid CHAR(1) PRIMARY KEY,
  gname VARCHAR(3) NOT NULL
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  did CHAR(3) PRIMARY KEY,
  dname VARCHAR(20) NOT NULL
);
