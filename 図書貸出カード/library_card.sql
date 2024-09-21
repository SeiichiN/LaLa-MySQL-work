
-- データベースの作成

CREATE DATABASE library_card;

USE library_card;

-- member表

CREATE TABLE member (
  id CHAR(4) PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO member (id, name) VALUES
('m001', '菅原文太'),
('m002', '千葉真一'),
('m003', '北大路欣也');

SELECT * FROM member;

-- lending表

CREATE TABLE lending (
  id CHAR(4) PRIMARY KEY,
  member_id CHAR(4),
  lending_date DATE,
  return_date DATE
);

ALTER TABLE lending
ADD
  CONSTRAINT fk_member
  FOREIGN KEY (member_id)
  REFERENCES member (id);


INSERT INTO lending
 (id, member_id, lending_date, return_date)
VALUES
 ('L001', 'm001', '2024/04/02', '2024/04/18'),
 ('L002', 'm002', '2024/04/02', '2024/04/18');

SELECT * FROM lending;

 
-- books表

CREATE TABLE books (
  id CHAR(5) PRIMARY KEY,
  name VARCHAR(255),
  author VARCHAR(255)
);

INSERT INTO books
  (id, name, author)
VALUES
('B0011', 'カレーの作り方', '山下達郎'),
('B0012', 'HTMLCSSの本', 'Mana'),
('B0013', 'JavaScript超入門', '加納治五郎'),
('C0013', '空手入門', '大山倍達');

SELECT * FROM books;


-- lend_book表

CREATE TABLE lend_book (
 lending_id CHAR(4),
 books_id   CHAR(5),
 PRIMARY KEY (lending_id, books_id)
);

ALTER TABLE lend_book
ADD
  CONSTRAINT bk_lend
  FOREIGN KEY (lending_id)
  REFERENCES lending (id);
  
ALTER TABLE lend_book
ADD
  CONSTRAINT bk_books
  FOREIGN KEY (books_id)
  REFERENCES books (id);
  

INSERT INTO lend_book
  (lending_id, books_id)
VALUES
('L001', 'B0011'),
('L001', 'B0012'),
('L001', 'B0013'),
('L002', 'C0013');

SELECT * FROM lend_book;


-- 外部キーの削除
/*
ALTER TABLE lend_book 
DROP FOREIGN KEY bk_books;
*/


--
-- 結合
--

SELECT
  len.id AS 貸出番号,
  m.id AS 会員番号,
  m.name AS 会員名,
  len.lending_date AS 貸出日,
  len.return_date AS 返却予定日,
  b.id AS 書籍番号,
  b.name AS 書籍名,
  b.author AS 著者
FROM lend_book lb
  INNER JOIN lending len
  ON lb.lending_id = len.id
    INNER JOIN member m
    ON len.member_id = m.id
      INNER JOIN books b
      ON lb.books_id = b.id
ORDER BY lb.lending_id ASC
;


--
-- このデータベース専用のユーザーを作成
--

CREATE USER 'carduser'@'localhost'
 IDENTIFIED BY 'carduser';

GRANT ALL ON library_card.*
 TO 'carduser'@'localhost';

