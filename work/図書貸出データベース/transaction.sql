--
-- 金太郎さんが「わたしとあそんで」を借りた
-- book_rentalデータベース
--

USE book_rental;

BEGIN;

-- 貸出表テーブル rent
insert into rent values
('C05', '123457', '2024/10/2', '2024/10/16');


-- 貸出書籍テーブル rent_book
insert into rent_book values
('C05', 'bk002');


-- エラーの場合
-- ROLLBACK;

-- 成功の場合
COMMIT;
