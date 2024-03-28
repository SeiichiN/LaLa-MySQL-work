
CREATE DATABASE ronin;

USE ronin;

create table cast (
  id       int    primary key,
  name     varchar(100),
  sex      char(1),
  birghday date,
  `from`   varchar(10),
  office   varchar(100)
);

insert into cast
 values
(1, '原田芳雄',   'm', '1940-02-29', '東京都', 'ギルドB'),
(2, '勝新太郎',   'm', '1931-11-29', '千葉県', '勝プロ'),
(3, '樋口可南子', 'f', '1958-12-13', '新潟県', 'ユマニテ'),
(4, '石橋蓮司',   'm', '1941-08-09', '東京都', '劇団第七病棟'),
(5, '田中邦衛',   'm', '1932-11-23', '岐阜県', '俳優座'),
(6, '杉田かおる', 'f', '1964-11-27', '東京都', 'オフィスPSC');


SELECT * FROM cast;

