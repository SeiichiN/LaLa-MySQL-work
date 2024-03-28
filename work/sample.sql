
-- 
-- sampleデータベース
-- 
CREATE DATABASE sample;

-- 
-- sampleユーザーの作成
-- 
CREATE USER 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

GRANT ALL ON sample.* TO 'sampleuser'@'localhost';
