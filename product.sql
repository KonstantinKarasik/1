
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 29 2016 г., 03:16
-- Версия сервера: 10.0.20-MariaDB
-- Версия PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `u957192484_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name_trans` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `small_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `big_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `name_trans`, `price`, `small_text`, `big_text`, `user_id`) VALUES
(1, 'Нокиа N8', 'Nokia N8', 5000, 'Хороший телефон', 'Хороший телефон, но уже устарел', '1b06cdcdb9fe4c5523b5904b0d0cafb9'),
(2, 'Айфон 7', 'Iphone 7', 45000, 'Отличный телефон', 'Отличный телефон, но не по карману', '1b06cdcdb9fe4c5523b5904b0d0cafb9'),
(3, 'Сименс C35', 'Siemens C35', 1500, 'Дешевый телефон', 'Дешевый телефон, но можно только звонить', '1b06cdcdb9fe4c5523b5904b0d0cafb9'),
(4, 'Китайфон', 'Nonamephone', 10000, 'Дешевый телефон', 'дешевый телефон, но неизвестного качества', '1b06cdcdb9fe4c5523b5904b0d0cafb9'),
(1, 'Нокиа N8', 'Nokia N8', 5000, 'Хороший телефон', 'Хороший телефон, но уже устарел', 'c975676bbca3218bfc7da0052eefc77a'),
(2, 'Айфон 7', 'Iphone 7', 50000, 'Отличный телефон', 'Отличный телефон, но не по карману', 'c975676bbca3218bfc7da0052eefc77a'),
(3, 'Сименс C35', 'Siemens C35', 1000, 'Дешевый телефон', 'Дешевый телефон, но можно только звонить', 'c975676bbca3218bfc7da0052eefc77a'),
(4, 'Китайфон', 'Nonamephone', 7000, 'Дешевый телефон', 'дешевый телефон, но неизвестного качества', 'c975676bbca3218bfc7da0052eefc77a');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
