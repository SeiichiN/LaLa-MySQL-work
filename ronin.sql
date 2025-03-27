create database ronin;

use ronin;


create table cast (
  id         int          primary key,
  name       varchar(20),
  gender     char(1),
  birthday   date,
  birthplace varchar(10),
  office     varchar(100)
);

insert into cast
values
(1, '原田芳雄', 'm', '1940-03-39', '東京都', 'ギルドB'),
(2, '勝新太郎', 'm', '1931-11-29', '千葉県', '勝プロ');

insert into cast
values
(1, '樋口可南子', 'm', '1940-03-39', '', 'ギルドB'),
(2, '石橋蓮司', 'm', '1931-11-29', '千葉県', '勝プロ');

