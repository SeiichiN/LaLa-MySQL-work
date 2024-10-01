

CREATE DATABASE IF NOT EXISTS web_school;

USE web_school;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS course;

source state.sql;


--
-- cource�\
--
CREATE TABLE course (
  id CHAR(3) PRIMARY KEY,
  name VARCHAR(100)
);

INSERT INTO course VALUES
('C01', 'JavaScript'),
('C02', 'PHP'),
('C03', 'Java'),
('C04', 'HTML/CSS');

SELECT * FROM course;

--
-- students�\
--
CREATE TABLE students (
  id   INT  PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  gender CHAR(1),
  birthday DATE,
  state_id CHAR(2),
  course_id CHAR(3)
);

ALTER TABLE students
ADD
  FOREIGN KEY (state_id) REFERENCES state (id);

ALTER TABLE students
ADD
  FOREIGN KEY (course_id) REFERENCES course (id);


INSERT INTO students 
  (name, gender, birthday, state_id, course_id)
VALUES
('���J����',   '�j', '1992/09/03', '13', 'C01'),
('��K���ӂ�', '��', '1994/09/21', '47', 'C02'),
('�n�ӓN',     '�j', '1950/03/11', '23', 'C03'),
('�E�˗m��',   '�j', '1979/05/07', '14', 'C04'),
('�g���R���q', '��', '1988/07/22', '13', 'C03');


SELECT * FROM students;


--
-- �����\
--
SELECT
  s.id       AS id,
  s.name     AS name,
  s.gender   AS gender,
  s.birthday AS birthday,
  st.name    AS st_name,
  c.name     AS c_name
FROM students s
  INNER JOIN state st
  ON s.state_id = st.id
    INNER JOIN course c
    ON s.course_id = c.id
;

