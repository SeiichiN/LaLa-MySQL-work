-- �f�[�^�x�[�X��: book_checkout

CREATE DATABASE 
IF NOT EXISTS book_checkout;

USE book_checkout;

DROP TABLE IF EXISTS loan_book;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;

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


-- loan_book�\: �ݏo�ԍ�_���Дԍ��̑Ή��\

CREATE TABLE loan_book (
  loan_id INT,
  book_id CHAR(5),
  PRIMARY KEY (loan_id, book_id)
);

ALTER TABLE loan_book
ADD
  CONSTRAINT fk_loan_id
  FOREIGN KEY (loan_id)
  REFERENCES loans (id);
  
ALTER TABLE loan_book
ADD
  CONSTRAINT fk_book_id
  FOREIGN KEY (book_id)
  REFERENCES books (id);

INSERT INTO loan_book VALUES
(1, 'bk001'),
(1, 'bk002'),
(2, 'bk003'),
(3, 'bk004'),
(3, 'bk005'),
(4, 'bk001');


-- �����\

SELECT
  *
FROM loan_book lb
  INNER JOIN loans l
  ON lb.loan_id = l.id
    INNER JOIN members m
    ON l.member_id = m.id
      INNER JOIN books b
      ON lb.book_id = b.id
\g

CREATE VIEW lb_v AS
SELECT
  l.id AS id,
  m.id AS member_id,
  m.name,
  l.loan_at,
  l.return_at,
  b.title
FROM loan_book lb
  INNER JOIN loans l
  ON lb.loan_id = l.id
    INNER JOIN members m
    ON l.member_id = m.id
      INNER JOIN books b
      ON lb.book_id = b.id
\g

  