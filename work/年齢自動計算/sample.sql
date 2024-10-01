
-- database: sample
-- user: sampleuser@localhost
-- pass: sampleuser


CREATE DATABASE IF NOT EXISTS sample;

USE sample;

DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  birthday DATE        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);


CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);


-- dept �e�[�u��

INSERT INTO dept
  (id, name)
VALUES
  ('001', '������'),
  ('002', '�c�ƕ�'),
  ('003', '�o����'),
  ('004', '�J����'),
  ('005', '�l����'),
  ('006', '���V�X�e����');


INSERT INTO emp
  (name, birthday, dept_id)
VALUES
  ('��������',   '1933/08/16', '001'),
  ('��t�^��',   '1939/01/22', '002'),
  ('�k��H�Ӗ�', '1943/02/23', '003'),
  ('����ߎq',   '1947/03/24', '002');
  



SELECT * FROM emp;
SELECT * FROM dept;

