-- 図書貸出データベース

-- ユーザー root

-- データベース名 rentbook

CREATE DATABASE rentbook \g
USE rentbook \g

-- 会員表 member

CREATE TABLE member (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(100)
)\g

INSERT INTO member
  (id, name)
VALUES
  ('123456', '浦島太郎'),
  ('123457', '金太郎'),
  ('123458', 'かぐや姫') \g

SELECT * FROM member \g

-- 書籍表 book

CREATE TABLE book (
  id     CHAR(5)      PRIMARY KEY,
  title  VARCHAR(100),
  author VARCHAR(100)
)\g

INSERT INTO book
  (id, title, author)
VALUES
  ('bk001', 'いやいやえん',     '中川李枝子'),
  ('bk002', 'わたしとあそんで', 'マリー・ホール・エッツ'),
  ('bk003', 'エルマーの冒険',   'ルース・スタイル・ガネット'),
  ('bk004', 'ゲド戦記',         'ル・グウィン'),
  ('bk005', 'けんはへっちゃら', '谷川俊太郎')\g

SELECT * FROM book\g

-- 貸出表 rent

CREATE TABLE rent (
  id         CHAR(3) PRIMARY KEY,
  member_id  CHAR(6),
  rent_day   DATE,
  return_day DATE
)\g

-- 会員表にある会員番号しか入力できない
-- ようにする（外部キー制約）

ALTER TABLE rent
ADD
  CONSTRAINT fk_member_id
  FOREIGN KEY (member_id)
  REFERENCES member (id)\g

INSERT INTO rent
  (id, member_id, rent_day, return_day)
VALUES
  ('C01', '123456', '2024/09/30', '2024/10/18'),
  ('C02', '123456', '2024/09/18', '2024/10/02'),
  ('C03', '123457', '2024/09/30', '2024/10/15'),
  ('C04', '123458', '2024/09/03', '2024/09/17')\g

SELECT * FROM rent\g

-- 貸出書籍表 rent_book

CREATE TABLE rent_book (
  id INT PRIMARY KEY AUTO_INCREMENT,
  rent_id CHAR(3),
  book_id CHAR(5),
  CONSTRAINT fk_rent_id
  FOREIGN KEY (rent_id) REFERENCES rent (id),
  CONSTRAINT fk_book_id
  FOREIGN KEY (book_id) REFERENCES book (id)
)\g

INSERT INTO rent_book
  (rent_id, book_id)
VALUES
  ('C01', 'bk001'),
  ('C01', 'bk002'),
  ('C02', 'bk003'),
  ('C03', 'bk004'),
  ('C03', 'bk005'),
  ('C04', 'bk001')\g

SELECT * FROM rent_book;


--
-- 結合表
--

SELECT
  r.id AS 貸出NO,
  r.member_id AS 会員ID,
  m.name AS 会員名,
  r.rent_day AS 貸出日,
  r.return_day AS 返却日,
  b.title AS 書名,
  b.author AS 著者名
FROM rent r
  INNER JOIN member m
  ON r.member_id = m.id
    INNER JOIN rent_book rb
    ON r.id = rb.rent_id
      INNER JOIN book b
      ON b.id = rb.book_id
\g


  