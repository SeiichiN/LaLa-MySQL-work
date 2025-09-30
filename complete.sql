CREATE DATABASE IF NOT EXISTS sample;

use sample;

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

--
-- emp�e�[�u���̒�`
--
CREATE TABLE emp (
  id       INT         AUTO_INCREMENT,
  name     VARCHAR(20) NOT NULL,
  age      INT         NOT NULL,
  birthday YEAR        NOT NULL,
  dept_id  CHAR(3),
  PRIMARY  KEY (id)
);

-- dept�e�[�u��
CREATE TABLE dept (
  id   CHAR(3)     PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

-- �O���L�[����(�ǉ�)
ALTER TABLE emp
  ADD
  CONSTRAINT fk_dept_id  -- ����
  FOREIGN KEY (dept_id)  -- �O���L�[�̎w��
  REFERENCES dept (id);  -- �Q�Ɛ�̃e�[�u��.�J����


-- dept�e�[�u���Ƀf�[�^��}��

INSERT INTO dept
  (id, name)
VALUES
  ('001', '������'),
  ('002', '�c�ƕ�'),
  ('003', '�o����'),
  ('004', '�J����'),
  ('005', '�l����'),
  ('006', '���V�X�e����');



-- ������������̃f�[�^
INSERT INTO emp
(name, age, birthday, dept_id)
VALUES
('��������',   40, 1933, '001'),
('��t�^��',   34, 1939, '002'),
('�k��H�Ӗ�', 30, 1943, '003'),
('����ߎq',   26, 1947, '006');


SELECT * FROM emp;
SELECT * FROM dept;

