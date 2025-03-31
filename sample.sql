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

-- dept�\ -- �Q�Ƃ����\�Ȃ̂ŁA��ɒ�`
CREATE TABLE dept (
  id   CHAR(3)     PRIMARY kEY,
  name VARCHAR(20) NOT NULL
);

-- ������dept�\�̃f�[�^��}�����Ă��悢�B

-- emp�\
CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY KEY (id)
);

--
-- �O���L�[����
--

ALTER TABLE emp
ADD
  CONSTRAINT fk_deptid
  FOREIGN KEY (dept_id) REFERENCES dept (id)
\g



-- �f�[�^�̓o�^

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


-- SELECT * FROM emp;
-- SELECT * FROM dept;

--
-- ��������
--

SELECT
  e.id AS ID,
  e.name AS ���O,
  e.age AS �N��,
  d.name AS ����
FROM emp e
  INNER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC
\g


--
-- �O������
--

INSERT INTO emp
  (name, age, birthday)
VALUES
  ('���c�O���v', 38, 1935)
\g


SELECT
  e.id AS ID,
  e.name AS ���O,
  e.age AS �N��,
  d.name AS ����
FROM emp e
  LEFT OUTER JOIN dept d
  ON e.dept_id = d.id
ORDER BY ID ASC
\g






  