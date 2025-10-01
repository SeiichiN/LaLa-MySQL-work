-- データベース名: book_checkout

CREATE DATABASE 
IF NOT EXISTS book_checkout;

USE book_checkout;

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS loan_book;

-- books表
CREATE TABLE books (
  id     CHAR(5) PRIMARY kEY,
  title  VARCHAR(255),
  author VARCHAR(255)
);

INSERT INTO books VALUES
('bk001', 'いやいやえん',     '中川李枝子'),
('bk002', 'わたしとあそんで', 'マリー・ホール・エッツ'),
('bk003', 'エルマーの冒険',   'ルース・スタイル・がネット'),
('bk004', 'ゲド戦記',         'ル・グウィン'),
('bk005', 'けんはへっちゃら', '谷川俊太郎');


-- members表
CREATE TABLE members (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO members VALUES
('123456', '浦島太郎'),
('123457', '金太郎'),
('123458', 'かぐや姫');


-- loans表
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
  