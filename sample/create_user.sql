--
-- ユーザーの作成(rootで実行)
--
CREATE USER IF NOT EXISTS 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

-- sampleデータベースへの権限
GRANT ALL ON sample.* TO 'sampleuser'@'localhost';

