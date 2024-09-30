--
-- �f�[�^�x�[�X��: book_rental
--

CREATE DATABASE IF NOT EXISTS book_rental;

USE book_rental;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS member;


--
-- ���Е\
--
CREATE TABLE book (
  id     CHAR(5) PRIMARY KEY,
  name   VARCHAR(100),
  author VARCHAR(100)
);

INSERT INTO book VALUES
('bk001', '���₢�₦��',     '���엛�}�q'),
('bk002', '�킽���Ƃ������', '�G�b�c'),
('bk003', '�G���}�[�̖`��',   '�K�l�b�g'),
('bk004', '�Q�h��L',         '���E�O�E�B��'),
('bk005', '����͂ւ������', '�J��r���Y');

SELECT * FROM book;

--
-- ����\
--
CREATE TABLE member (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO member VALUES
('123456', '�Y�����Y'),
('123457', '�����Y'),
('123458', '������P');

SELECT * FROM member;

