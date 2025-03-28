-- MySQL���g��xampp��-v2.3

-- �f�[�^�x�[�X�� sample

CREATE DATABASE IF NOT EXISTS sample;

USE sample;

-- sampleuser�̍쐬
CREATE USER IF NOT EXISTS 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

-- sampleuser�Ɍ�����^����
GRANT ALL ON sample.* TO 'sampleuser'@'localhost';

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- emp�\
CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);

-- dept�\
CREATE TABLE dept (
  id   CHAR(3)     PRIMARY kEY,
  name VARCHAR(20) NOT NULL
);

-- �f�[�^�̓o�^
INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('��������', 40, 1933, '001')
\g


INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('��t�^��',   34, 1939, '002'),
  ('�k��H�Ӗ�', 30, 1943, '003'),
  ('����ߎq',   26, 1947, '002')
\g

INSERT INTO dept
  (id, name)
VALUES
  ('001', '������'),
  ('002', '�c�ƕ�'),
  ('003', '�o����'),
  ('004', '�J����'),
  ('005', '�l����'),
  ('006', '���V�X�e����')
\g

SELECT * FROM emp;
SELECT * FROM dept;