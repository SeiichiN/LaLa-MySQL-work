
-- データベース名   hukusyu		
-- テーブル名       student		
					
-- 名前       性別  誕生日      出身      コース
-- --------------------------------------------------
-- 染谷将太   男    1992/09/03  東京都    JavaScript
-- 二階堂ふみ 女    1994/09/21  沖縄県    PHP
-- 渡辺哲     男    1950/03/11  愛知県    Java
-- 窪塚洋介   男    1979/05/07  神奈川県  HTML/CSS
-- 吉高由里子 女    1988/07/22  東京都    Java

create database hukusyu;

use hukusyu;

create table student (
  id       int primary key,
  name     varchar(100),
  sex      char(1),
  birthday date,
  state    varchar(10),
  course   varchar(100)
);

insert into student
values
(1, '染谷将太', '男', '1992/09/03', '東京都', 'JavaScript'),
(2, '二階堂ふみ', '女', '1994/09/21', '沖縄県', 'PHP'),
(3, '渡辺哲',     '男',    '1950/03/11',  '愛知県',    'Java'),
(4, '窪塚洋介',   '男',    '1979/05/07',  '神奈川県',  'HTML/CSS'),
(5, '吉高由里子', '女',    '1988/07/22',  '東京都',    'Java');

