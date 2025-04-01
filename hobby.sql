-- hobby.sql
-- ��̃T���v��

-- ���[�U�[ root

-- hobby�f�[�^�x�[�X
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
-- �f�[�^�̓o�^
--

INSERT INTO gender
  (gid, gname)
VALUES
  ('0', '�s��'),
  ('1', '�j��'),
  ('2', '����'),
  ('3', '���̑�')\g


INSERT INTO dept
  (did, dname)
VALUES
  ('001', '������'),
  ('002', '�c�ƕ�'),
  ('003', '�o����'),
  ('004', '�J����')\g


INSERT INTO emp
  (name, gender_id, age, birthyear, dept_id)
VALUES
  ('��������',   '1', 40, 1933, '001'),
  ('��t�^��',   '1', 34, 1939, '002'),
  ('�k��H�Ӗ�', '1', 30, 1943, '003'),
  ('����ߎq',   '2', 26, 1947, '002')\g
  

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
  ('H08', '���K')\g


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
-- �����\
--

CREATE VIEW hobby_view AS
SELECT
  e.name AS ���O,
  g.gname AS ����,
  d.dname AS ����,
  h.hname AS �
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
WHERE � LIKE '%���%'\g
