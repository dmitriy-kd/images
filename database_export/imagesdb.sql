-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 09 2020 г., 10:03
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `imagesdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` text,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'ТЕст kot ', 1005, 22, 1594125247, 1594125247),
(2, 'TEST 3', 1005, 22, 1594125270, 1594125270),
(3, 'New Comment', 1005, 20, 1594126207, 1594126207),
(4, 'TEST 6', 1005, 20, 1594201413, 1594201413),
(7, 'TEST 6', 1011, 26, 1594225312, 1594225312),
(8, 'Новый коммент', 1005, 26, 1594225817, 1594225817);

-- --------------------------------------------------------

--
-- Структура таблицы `feed`
--

CREATE TABLE `feed` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_nickname` int(70) DEFAULT NULL,
  `author_picture` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_filename` varchar(255) NOT NULL,
  `post_description` text,
  `post_created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `feed`
--

INSERT INTO `feed` (`id`, `user_id`, `author_id`, `author_name`, `author_nickname`, `author_picture`, `post_id`, `post_filename`, `post_description`, `post_created_at`) VALUES
(2, 1008, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(3, 1009, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(4, 1010, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(5, 1012, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(6, 1006, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(7, 1007, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 16, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(8, 1008, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(9, 1009, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(10, 1010, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(11, 1012, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(12, 1006, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(13, 1007, 1005, 'Dima', 1005, '/uploads/55/03/8ec6e6c5c78ca0c829f63548ee8fef77483b.jpg', 17, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(14, 1005, 1006, 'Stas', 1006, '/uploads/cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg', 18, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(15, 1009, 1006, 'Stas', 1006, '/uploads/cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg', 18, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(16, 1010, 1006, 'Stas', 1006, '/uploads/cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg', 18, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(17, 1012, 1006, 'Stas', 1006, '/uploads/cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg', 18, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(18, 1007, 1006, 'Stas', 1006, '/uploads/cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg', 18, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(19, 1008, 1007, 'Tolya', 1007, '/uploads/dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg', 19, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(20, 1009, 1007, 'Tolya', 1007, '/uploads/dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg', 19, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(21, 1011, 1007, 'Tolya', 1007, '/uploads/dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg', 19, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(22, 1012, 1007, 'Tolya', 1007, '/uploads/dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg', 19, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(23, 1006, 1007, 'Tolya', 1007, '/uploads/dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg', 19, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(24, 1005, 1008, 'Jok', 1008, '/uploads/27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg', 20, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(25, 1009, 1008, 'Jok', 1008, '/uploads/27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg', 20, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(26, 1011, 1008, 'Jok', 1008, '/uploads/27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg', 20, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(27, 1010, 1008, 'Jok', 1008, '/uploads/27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg', 20, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(28, 1012, 1008, 'Jok', 1008, '/uploads/27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg', 20, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(29, 1005, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(30, 1008, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(31, 1011, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(32, 1010, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(33, 1012, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(34, 1006, 1009, 'Kot', 1009, '/uploads/88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg', 21, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(35, 1005, 1010, 'Mot', 1010, '/uploads/a9/d4/d987fd59899b3bd035bc251d021bb16fd254.jpg', 22, '94/03/f915696c05eccbae0383466bb766f4c351ff.jpg', 'Seven\'th Post', 1594055932),
(36, 1009, 1010, 'Mot', 1010, '/uploads/a9/d4/d987fd59899b3bd035bc251d021bb16fd254.jpg', 22, '94/03/f915696c05eccbae0383466bb766f4c351ff.jpg', 'Seven\'th Post', 1594055932),
(37, 1012, 1010, 'Mot', 1010, '/uploads/a9/d4/d987fd59899b3bd035bc251d021bb16fd254.jpg', 22, '94/03/f915696c05eccbae0383466bb766f4c351ff.jpg', 'Seven\'th Post', 1594055932),
(38, 1007, 1010, 'Mot', 1010, '/uploads/a9/d4/d987fd59899b3bd035bc251d021bb16fd254.jpg', 22, '94/03/f915696c05eccbae0383466bb766f4c351ff.jpg', 'Seven\'th Post', 1594055932),
(39, 1008, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(40, 1009, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(41, 1010, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(42, 1012, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(43, 1006, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(44, 1007, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 23, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(45, 1008, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(46, 1009, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(47, 1010, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(48, 1012, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(49, 1006, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(50, 1007, 1011, 'Lord', 1011, '/uploads/a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg', 24, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(51, 1009, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 25, '78/fd/8ff44775276f83a389015828704faac74d09.jpg', 'Post 10', 1594056036),
(52, 1011, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 25, '78/fd/8ff44775276f83a389015828704faac74d09.jpg', 'Post 10', 1594056036),
(53, 1006, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 25, '78/fd/8ff44775276f83a389015828704faac74d09.jpg', 'Post 10', 1594056036),
(54, 1007, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 25, '78/fd/8ff44775276f83a389015828704faac74d09.jpg', 'Post 10', 1594056036),
(55, 1009, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 26, 'bf/3c/643f205a7ac0caf73904a682b19850e0fb9f.jpg', 'Post 12', 1594056081),
(56, 1011, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 26, 'bf/3c/643f205a7ac0caf73904a682b19850e0fb9f.jpg', 'Post 12', 1594056081),
(57, 1006, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 26, 'bf/3c/643f205a7ac0caf73904a682b19850e0fb9f.jpg', 'Post 12', 1594056081),
(58, 1007, 1012, 'Stark', 1012, '/uploads/89/34/38fd997169777246cce1d32af5d047757a85.jpg', 26, 'bf/3c/643f205a7ac0caf73904a682b19850e0fb9f.jpg', 'Post 12', 1594056081),
(59, 1008, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(60, 1009, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(61, 1010, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(62, 1012, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(63, 1006, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(64, 1007, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 28, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(65, 1008, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473),
(66, 1009, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473),
(67, 1010, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473),
(68, 1012, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473),
(69, 1006, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473),
(70, 1007, 1005, 'Dima', 1005, '/uploads/0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg', 29, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1592506360),
('m130524_201442_init', 1592506366),
('m190124_110200_add_verification_token_column_to_user_table', 1592506367),
('m200621_145157_create_auth_table', 1592751260),
('m200624_102438_alter_user_table', 1592994628),
('m200701_133852_create_post_table', 1593610911),
('m200704_144542_create_comments_table', 1593874264),
('m200706_130320_create_feed_table', 1594040916);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` text,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `user_id`, `filename`, `description`, `created_at`) VALUES
(16, 1005, 'c3/8e/9c7d06750dd604155cd4c14a6f3f8c868918.jpg', 'Первый пост', 1594055629),
(17, 1005, '10/8a/fc63d8b4f40c438dee2d16f22a954d3174c3.jpg', 'Пост 2', 1594055694),
(18, 1006, '33/48/bf7c46d6c0c8930869cca52168aca18eef86.jpg', 'Третий пост', 1594055731),
(19, 1007, '4e/fd/91e0edfb6e48296979eb936eab2a67aede86.jpg', 'Пост четвертый', 1594055794),
(20, 1008, 'ff/63/ed8d0ee425a2264203b97334b0dcc5c6c15d.jpg', 'Пятый пост', 1594055823),
(21, 1009, 'fb/37/3562a0e65f3f9ee2f7b7aec3b142aa7531cc.jpg', 'Шестой пост', 1594055894),
(22, 1010, '94/03/f915696c05eccbae0383466bb766f4c351ff.jpg', 'Seven\'th Post', 1594055932),
(23, 1011, 'bc/f9/a1ddfc8917330af472078d759332caee263f.jpg', 'Eight\'s post', 1594055976),
(24, 1011, 'b4/0c/e6cef4964d471ee1f80ad5a8143d87199dc1.jpg', 'Nine\'s Post', 1594056002),
(25, 1012, '78/fd/8ff44775276f83a389015828704faac74d09.jpg', 'Post 10', 1594056036),
(26, 1012, 'bf/3c/643f205a7ac0caf73904a682b19850e0fb9f.jpg', 'Post 12', 1594056081),
(27, 1013, 'c6/6b/de490109254e33fa4c33bcbbc5836d1b389a.jpg', 'Post 13', 1594056128),
(28, 1005, '47/90/26cb447e904ee60c6cc282cd2cdd4f51ae1d.jpg', 'Новый компьютер', 1594209365),
(29, 1005, 'a5/38/27acc48b7c68e19e0bfd9f17a1a77ee6e8f9.jpg', 'Рабочий процесс', 1594209473);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `type` int(3) DEFAULT NULL,
  `nickname` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `about`, `type`, `nickname`, `picture`) VALUES
(1005, 'Dima', 'wyrzVHcy_LNgO4AvwRFgHwmKFWcd8aME', '$2y$13$bE6Pj3Hxbnryx.96W.3/j.E8c5l6s1729T1UFNBrSOVBX0wrlnJ46', NULL, 'dima@dima.ru', 10, 1594052970, 1594052970, 'W3v0rPtdNzmf7nkeugTd3-bzYisSJt8x_1594052970', 'New programmer', NULL, NULL, '0a/a6/156cd2d5eee7a01b382c01950eb37ee3951f.jpg'),
(1006, 'Stas', 'YsaoPuU1znoDKgI8KVC2RskKm1Z6LDJF', '$2y$13$elkWq0AId4zJi8mBwCaU0u9iTWGf6qEaXEK0k.ChMkci2qJWUzqgu', NULL, 'stas@stas.ru', 10, 1594053117, 1594053117, 'tBKLC9hdYhovDuX4AG9o-_geb5NpU-IT_1594053117', 'Обо мне', NULL, NULL, 'cc/de/2f8512b2d4d4bacae90cfce070189e43b598.jpg'),
(1007, 'Tolya', 'FKy1o9Y87Ftvwe_1zQ4QMTRglepyFgpR', '$2y$13$gq.Slf1vMIstKWW9Q/d56uuh9A7JGfVPOgADRuAGfp1CX4ehCKVYy', NULL, 'tolya@tolya.ru', 10, 1594053138, 1594053138, 'CvcVMMZkmUm3kgLVZ8jPPrx9foGtELqQ_1594053138', 'Обо мне', NULL, NULL, 'dc/dd/a53ecad08959da307af96fe270d2ddea2834.jpg'),
(1008, 'Jok', 'JwO4paEt8-vWPrPqohNb9AF751aIUswQ', '$2y$13$xGZisT9Uhv7o83wCD7i4h.eecCDpnfNy8iwHC6SzIcMtepMytkrmu', NULL, 'jok@jok.ru', 10, 1594053158, 1594053158, 'OPseEhQ0bWeXqGoZte4eHVH5ocieHFg9_1594053158', 'Обо мне', NULL, NULL, '27/79/fe133136e2391e3b92a33ba27593a1e2abcf.jpg'),
(1009, 'Kot', 'oW3ZR1age61xLmdyRy9ag5hsn7__Mb65', '$2y$13$W1lfvX8ncR0rTiB3grXOeOS.MGYSPSi9OFeb7/cJc8Jz1I79VYNoa', NULL, 'kot@kot.ru', 10, 1594053181, 1594053181, 'OrYaAUJbBeVNpu31ivuhtHpqiTUPQkDW_1594053181', 'Обо мне', NULL, NULL, '88/e9/10f2a0eb1a5b68835d5da4049818c2e71f53.jpg'),
(1010, 'Mot', '4K3LF9eBXwiaVDRLhC9ydMqoocHYWecS', '$2y$13$XSFj9hm635bSZ5QWDr2s0ORXbnF4kVoqx9O88Oj3BF8GHWRwkNSOi', NULL, 'Mot@mot.ru', 10, 1594053200, 1594053200, 'IWEMTPSoWfAEpS_H_1JFxlY57dj9oOgT_1594053200', 'Обо мне', NULL, NULL, 'a9/d4/d987fd59899b3bd035bc251d021bb16fd254.jpg'),
(1011, 'Lord', 'O8hNZkrn47gV8QemdA60hIXYkr4zAgW1', '$2y$13$fFSK67YktNovpt.snEwFS.O96vECzXglIp9IN/CuWnSstYGVhNykS', NULL, 'lord@lord.ru', 10, 1594053221, 1594053221, 'iAaCow9VPtHALc6tTxWhyI-ZWgz9uQY7_1594053221', 'Обо мне', NULL, NULL, 'a3/03/7851f3e6349a1b61d90dcef8ee6659442832.jpg'),
(1012, 'Stark', 'REbADK02XXtC_Aw6NYWPmxJ4wtEHX8oU', '$2y$13$UUCg7Ey4LAO8xGUU0CLaK.XAGllpUC2/IXCEX2fkZBQInHhlOLmD6', NULL, 'stark@stark.ru', 10, 1594053844, 1594053844, 'DtZGuvgmdhiiJqQpigc8oGNJzgjA__Dq_1594053844', 'Обо мне', NULL, NULL, '89/34/38fd997169777246cce1d32af5d047757a85.jpg'),
(1013, 'Test', 'g1O3N2_AbmLs3FUAEs_wbi1g-T79jote', '$2y$13$cmRpEH3nAGZsaxvrw37KceyQtmoCcrIV61lNP3SIg756D7ToeWnIa', NULL, 'test.php.up123@gmail.com', 10, 1594053877, 1594053903, '0LiJFQ50Cg7ZUIUAWmCfRc9FwUzsNnAv_1594053877', 'Обо мне', NULL, NULL, '07/90/e7b88f3be87642adbaf3793ceb8371f7e733.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-auth-user_id-user-id` (`user_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `fk-auth-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
