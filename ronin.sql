-- roninというデータベースの作成
create database ronin;

-- 使用宣言
use ronin;

-- castというテーブル定義の作成
create table cast (
  id         int          primary key,
  name       varchar(20),
  gender     char(1),
  birthday   date,
  birthplace varchar(10),
  office     varchar(100)
);

insert into cast values
(1, '原田芳雄', 'm', '1940-03-39', '東京都', 'ギルドB'),
(2, '勝新太郎', 'm', '1931-11-29', '千葉県', '勝プロ');

insert into cast
values
(3, '樋口可南子', 'f', '1958-12-13', '新潟県', 'ユマニテ'),
(4, '石橋蓮司',   'm', '1941-08-09', '東京都', '劇団第7病棟');

insert into cast
values
(5, '田中邦衛',   'm', '1932-11-23', '岐阜県', '俳優座'),
(6, '杉田かおる', 'f', '1964-11-27', '東京都', 'オフィスPSC');


-- 出身が東京の人
select * from cast
where
  birthplace like '%東京%';
  
-- 田中邦衛さんの所属事務所「なし」に変更
update cast
  set office = 'なし'
  where id = 5;
  
-- 以下のデータを追加
insert into cast values
(7, '中尾彬', 'm', '1942-08-11', '千葉県', '古舘プロジェクト');


-- 石橋蓮司さんを削除
delete from cast 
where id = 4;
