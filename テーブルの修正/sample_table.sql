--
-- root

-- sample_table�f�[�^�x�[�X
CREATE DATABASE sample_table;
USE sample_table;

CREATE TABLE members (
  id INT PRIMARY KEY AUTO_INCREMENT,
  namae VARCHAR(100),
  age INT
);

INSERT INTO members
  (namae, age)
VALUES
  ('���X�؏����Y', 25),
  ('�{�{����', 27);

-- �J�������̕ύX(�e�[�u����`�̕ύX)

ALTER TABLE members
CHANGE COLUMN namae
  name VARCHAR(100);
              
-- ���O�̂��Ƃɐ��ʃJ����(gender)��ǉ�

ALTER TABLE members
ADD
  GENDER CHAR(1) AFTER name;

-- �S�f�[�^�� ���ʁu�j�v���w��B

UPDATE members
SET
  gender = '�j';

