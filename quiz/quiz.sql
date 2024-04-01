
-- quiz データベースの作成
create database quiz;


-- 使用宣言
use quiz;

-- quiz_tbl テーブルの作成

create table quiz_tbl (
  id       int   primary key  auto_increment,
  question varchar(255),
  answer   varchar(255),
  score    int
);

