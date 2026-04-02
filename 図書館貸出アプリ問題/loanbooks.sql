-- 図書貸出データベース
-- loanbooks
-- rootで作業

CREATE DATABASE IF NOT EXISTS loanbooks;
USE loanbooks;

-- あらかじめテーブルは削除
DROP TABLE IF EXISTS loan_books;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;


-- books(書籍表)
CREATE TABLE books (
  id     CHAR(5)      PRIMARY KEY,
  title  VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL
);

INSERT INTO books
  (id, title, author)
VALUES
  ('bk001', 'いやいやえん',     '中川李枝子'),
  ('bk002', 'わたしとあそんで', 'マリー・ホール・エッツ'),
  ('bk003', 'エルマーの冒険',   'ルース・スタイル・ガネット'),
  ('bk004', 'ゲド戦記',         'ル・グウィン'),
  ('bk005', 'けんはへっちゃら', '谷川俊太郎');

SELECT * FROM books;


-- members(会員表)
CREATE TABLE members (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

INSERT INTO members
  (id, name)
VALUES
  ('123456', '浦島太郎'),
  ('123457', '金太郎'),
  ('123458', 'かぐや姫');

SELECT * FROM members;

-- loans (貸出表)
CREATE TABLE loans (
  id   INT    PRIMARY KEY  AUTO_INCREMENT,
  member_id   CHAR(6) NOT NULL,
  loan_date   DATE    NOT NULL,
  return_date DATE    NOT NULL,
  CONSTRAINT fk_member_id
  FOREIGN KEY (member_id)
  REFERENCES members (id)
);

INSERT INTO loans
  (member_id, loan_date, return_date)
VALUES
  ('123456', '2024/09/30', '2024/10/15'),
  ('123456', '2024/09/18', '2024/10/02'),
  ('123457', '2024/09/30', '2024/10/15'),
  ('123458', '2024/09/03', '2024/09/17');

SELECT * FROM loans;


-- loan_books(貸出書籍対応表)
CREATE TABLE loan_books (
  loan_id INT     NOT NULL,
  book_id CHAR(5) NOT NULL,
  PRIMARY KEY (loan_id, book_id)
);

ALTER TABLE loan_books
ADD
  CONSTRAINT fk_loan_id
  FOREIGN KEY (loan_id)
  REFERENCES loans (id);

ALTER TABLE loan_books
ADD
  CONSTRAINT fk_book_id
  FOREIGN KEY (book_id)
  REFERENCES books (id);

INSERT INTO loan_books
  (loan_id, book_id)
VALUES
  (1, 'bk001'),
  (1, 'bk002'),
  (2, 'bk003'),
  (3, 'bk004'),
  (3, 'bk005'),
  (4, 'bk001');

SELECT * FROM loan_books;

--
-- 結合表
--
SELECT
  l.id          AS 貸出番号,
  m.id          AS 会員番号,
  m.name        AS 会員名,
  l.loan_date   AS 貸出日,
  l.return_date AS 返却予定日,
  lb.book_id    AS 書籍番号,
  b.title       AS タイトル,
  b.author      AS 著者
FROM loans l
  INNER JOIN members m
  ON l.member_id = m.id
    INNER JOIN loan_books lb
    ON l.id = lb.loan_id
      INNER JOIN books b
      ON lb.book_id = b.id
ORDER BY l.id ASC
\g
