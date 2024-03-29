-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-03-29 14:49:43
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `sample`
--
CREATE DATABASE IF NOT EXISTS `sample` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sample`;

-- --------------------------------------------------------

--
-- テーブルの構造 `dept`
--

CREATE TABLE `dept` (
  `id` char(3) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `dept`
--

INSERT INTO `dept` (`id`, `name`) VALUES
('001', '総務部'),
('002', '営業部'),
('003', '経理部'),
('004', '開発部'),
('005', '人事部'),
('006', '情報システム部');

-- --------------------------------------------------------

--
-- テーブルの構造 `emp`
--

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` year(4) NOT NULL,
  `dept_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `emp`
--

INSERT INTO `emp` (`id`, `name`, `age`, `birthday`, `dept_id`) VALUES
(1, '菅原文太', 40, '1933', '001'),
(2, '千葉真一', 34, '1939', '002'),
(3, '北大路欣也', 30, '1943', '003'),
(4, '梶芽衣子', 26, '1947', '002');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
