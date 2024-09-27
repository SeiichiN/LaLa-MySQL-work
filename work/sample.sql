
-- database: sample
-- user: sampleuser@localhost
-- pass: sampleuser


CREATE DATABASE IF NOT EXISTS sample;

USE sample;

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);


CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);


INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('��������', 40, 1933, '001'),
  ('��t�^��',   34, 1939, '002'),
  ('�k��H�Ӗ�', 30, 1943, '003'),
  ('����ߎq',   26, 1947, '002');
  
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




--
-- ��������
--

SELECT
  e.id    AS ID,
  e.name  AS ���O,
  e.age   AS �N��,
  d.name AS ������
FROM emp e
  INNER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC;


--
-- dept_id�̂Ȃ��f�[�^
--
INSERT INTO emp
  (name, age, birthday)
VALUES
  ('���c�O���v', 38, 1935);


SELECT * FROM emp;
SELECT * FROM dept;

--
-- ���O������
--
SELECT
  e.id   AS ID,
  e.name AS ���O,
  e.age  AS �N��,
  d.name AS ������
FROM emp e
  LEFT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC;


--
-- �E�O������
--
SELECT
  e.id   AS 'ID',
  e.name AS '���O',
  e.age  AS '�N��',
  d.name AS '������'
FROM emp e
  RIGHT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY d.id ASC;

