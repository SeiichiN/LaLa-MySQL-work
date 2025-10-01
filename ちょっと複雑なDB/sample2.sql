--
-- �f�[�^�x�[�X�� sample2
--

CREATE DATABASE IF NOT EXISTS sample2;

USE sample2;

DROP TABLE IF EXISTS gender;

-- gender�\�̒�`
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

-- �O���L�[����
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


-- hobby�\

DROP TABLE IF EXISTS hobby;

CREATE TABLE hobby (
  hid   CHAR(3)     PRIMARY KEY,
  hname VARCHAR(20) NOT NULL
);

-- emp_hobby�\

DROP TABLE IF EXISTS emp_hobby;

CREATE TABLE emp_hobby (
  id  INT,
  hid CHAR(3),
  PRIMARY KEY (id, hid)
);

--
-- �f�[�^�̓���
-- �܂��Agender�\�Adept�\����́B
-- ���̌�Aemp�\����͂���B
-- ���R�Femp�\��gender�\�Adept�\��
-- ����f�[�^����͂��邩��B
--

-- gender�\
INSERT INTO gender
(gid, gname)
VALUES
('0', '�s��'),
('1', '�j��'),
('2', '����'),
('3', '���̑�');

-- dept�\
INSERT INTO dept
(did, dname)
VALUES
('001', '������'),
('002', '�c�ƕ�'),
('003', '�o����'),
('004', '�J����');

-- emp�\
INSERT INTO emp
(name, gender_id, age, birthyear, dept_id)
VALUES
('��������',   '1', 40, 1933, '001'),
('��t�^��',   '1', 34, 1939, '002'),
('�k��H�Ӗ�', '1', 30, 1943, '003'),
('����ߎq',   '2', 26, 1947, '002');

-- hobby�\
INSERT INTO hobby
(hid, hname)
VALUES
('H01', '�ނ�'),
('H02', '���G'),
('H03', '���'),
('H04', '�M�ы�����'),
('H05', '�T�b�J�[�ϐ�'),
('H06', '����'),
('H07', '�o�R'),
('H08', '���K');


-- emp_hobby�\
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
-- �\������
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


