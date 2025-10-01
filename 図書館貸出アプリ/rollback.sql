
-- 貸出データを入力
INSERT INTO loans
  (member_id, loan_at, return_at)
VALUES
  ('123458', '2025-10-02', '2025-10-17');

-- loan_book表に入力
INSERT INTO loan_book VALUES
(5, 'bk004');


-- 存在しない書籍データを入力した場合
INSERT INTO loans
  (member_id, loan_at, return_at)
VALUES
  ('123457', '2025-10-03', '2025-10-18');

INSERT INTO loan_book VALUES
(5, 'bk010');



-- 修正時刻: Thu 2025/10/02 06:25:52
