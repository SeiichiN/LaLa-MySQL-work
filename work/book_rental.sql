--
-- データベース名: book_rental
--

CREATE DATABASE IF NOT EXISTS book_rental;

USE book_rental;

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

