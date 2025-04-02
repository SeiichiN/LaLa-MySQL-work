--
-- root

-- sample_tableデータベース
CREATE DATABASE sample_table;
USE sample_table;

CREATE TABLE members (
  id INT PRIMARY KEY AUTO_INCREMENT,
  namae VARCHAR(100),
  age INT
);

INSERT INTO members
  (namae, age)
VALUES
  ('佐々木小次郎', 25),
  ('宮本武蔵', 27);

-- カラム名の変更(テーブル定義の変更)

ALTER TABLE members
CHANGE COLUMN namae
  name VARCHAR(100);
              
-- 名前のあとに性別カラム(gender)を追加

ALTER TABLE members
ADD
  GENDER CHAR(1) AFTER name;

-- 全データに 性別「男」を指定。

UPDATE members
SET
  gender = '男';

