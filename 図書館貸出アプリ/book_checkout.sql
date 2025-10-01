-- �f�[�^�x�[�X��: book_checkout

CREATE DATABASE 
IF NOT EXISTS book_checkout;

USE book_checkout;

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS loan_book;

-- books�\
CREATE TABLE books (
  id     CHAR(5) PRIMARY kEY,
  title  VARCHAR(255),
  author VARCHAR(255)
);

INSERT INTO books VALUES
('bk001', '���₢�₦��',     '���엛�}�q'),
('bk002', '�킽���Ƃ������', '�}���[�E�z�[���E�G�b�c'),
('bk003', '�G���}�[�̖`��',   '���[�X�E�X�^�C���E���l�b�g'),
('bk004', '�Q�h��L',         '���E�O�E�B��'),
('bk005', '����͂ւ������', '�J��r���Y');


-- members�\
CREATE TABLE members (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO members VALUES
('123456', '�Y�����Y'),
('123457', '�����Y'),
('123458', '������P');


-- loans�\
CREATE TABLE loans (
  id        INT     AUTO_INCREMENT PRIMARY KEY,
  member_id CHAR(6),
  loan_at   DATE,
  return_at DATE
);

ALTER TABLE loans
ADD
  CONSTRAINT fk_member_id
  FOREIGN KEY (member_id)
  REFERENCES members (id);

INSERT INTO loans
  (member_id, loan_at, return_at)
VALUES
  ('123456', '2025-09-30', '2025-10-15'),
  ('123456', '2025-09-18', '2025-10-02'),
  ('123457', '2025-09-30', '2025-10-15'),
  ('123458', '2025-09-03', '2025-09-17');
  