--
-- データベース名: book_rental
--

CREATE DATABASE IF NOT EXISTS book_rental;

USE book_rental;

DROP TABLE IF EXISTS rent;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS member;



--
-- 書籍表
--
CREATE TABLE book (
  id     CHAR(5) PRIMARY KEY,
  name   VARCHAR(100),
  author VARCHAR(100)
);

INSERT INTO book VALUES
('bk001', 'いやいやえん',     '中川李枝子'),
('bk002', 'わたしとあそんで', 'エッツ'),
('bk003', 'エルマーの冒険',   'ガネット'),
('bk004', 'ゲド戦記',         'ル・グウィン'),
('bk005', 'けんはへっちゃら', '谷川俊太郎');

SELECT * FROM book;

--
-- 会員表
--
CREATE TABLE member (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO member VALUES
('123456', '浦島太郎'),
('123457', '金太郎'),
('123458', 'かぐや姫');

SELECT * FROM member;


--
-- 貸出表
--
CREATE TABLE rent (
  id         CHAR(3) PRIMARY KEY,
  member_id  CHAR(6),
  rent_day   DATE,
  return_day DATE,
  FOREIGN KEY (member_id)
  REFERENCES member (id)
);

INSERT INTO rent VALUES
('C01', '123456', '2024/9/30', '2024/10/15'),
('C02', '123456', '2024/9/18', '2024/10/2'),
('C03', '123457', '2024/9/30', '2024/10/15'),
('C04', '123458', '2024/9/3', '2024/9/17');

SELECT * FROM rent;


--
-- 貸出書籍表
--
CREATE TABLE rent_book (
  rent_id CHAR(3),
  book_id CHAR(5),
  PRIMARY KEY (rent_id, book_id)
);

INSERT INTO rent_book VALUES
('C01', 'bk001'),
('C01', 'bk002'),
('C02', 'bk003'),
('C03', 'bk004'),
('C03', 'bk005'),
('C04', 'bk001');

SELECT * FROM rent_book;


SELECT 
  *
FROM rent_book rb
  INNER JOIN rent r
  ON rb.rent_id = r.id
    INNER JOIN member m
    on r.member_id = m.id
      INNER JOIN book b
      on rb.book_id = b.id
ORDER BY r.id;

