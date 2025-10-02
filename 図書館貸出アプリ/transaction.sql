-- トランザクション処理

-- 実際の貸出業務

BEGIN;  -- トランザクション処理の開始

-- 正しい処理 (auto_increment)
INSERT INTO loans
  (member_id, loan_at, return_at)
VALUES
  ('123458', '2025-10-02', '2025-10-16');


-- 最新のauto_incrementの値を取得
SET @last_id := last_insert_id();

-- 不正な挿入
INSERT INTO loan_book VALUES
( @last_id, 'bk009');

ROLLBACK;  -- 巻き戻し

-- 正しい処理の場合
COMMIT;    -- 確定
