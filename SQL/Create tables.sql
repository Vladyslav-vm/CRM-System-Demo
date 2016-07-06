USE CRMBase
GO


-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 04 2016 г., 17:37
-- Версия сервера: 5.5.46-0ubuntu0.14.04.2
-- Версия PHP: 5.5.9-1ubuntu4.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
use CRMBase
--
-- База данных: `crm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

USE CRMBase
GO

CREATE TABLE _contract (
  id INTEGER PRIMARY KEY IDENTITY,
  date_conclusion date NOT NULL,
  total_price decimal(10,2) NOT NULL,
  contract_balance decimal(10,2) NOT NULL,
  date_end date NOT NULL,
  id_customer int NOT NULL,
  contract_type varchar(255) NOT NULL,
  id_product int NOT NULL,
)

--
-- Дамп данных таблицы `contract`
--

INSERT INTO _contract (date_conclusion, total_price, contract_balance, date_end, id_customer, contract_type, id_product) VALUES
('2016-07-03', '125000.00', '25000.00', '2016-07-31', 1, 'buy', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE _customer (
  id INTEGER PRIMARY KEY IDENTITY,
  company varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  phonenumber int NOT NULL,
  edrpou int NOT NULL,
  inn int NOT NULL,
) 

--
-- Дамп данных таблицы `customer`
--

INSERT INTO _customer ( company, address, phonenumber, edrpou, inn) VALUES
(1, 'oss corp', 'sumskaya street, 125', 505334455, 40010012, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `operations_product`
--

CREATE TABLE _operations_product (
  id INTEGER PRIMARY KEY IDENTITY,
  operation_date date NOT NULL,
  operation_type varchar(255) NOT NULL,
  operation_price decimal(10,2) NOT NULL,
  id_user int NOT NULL,
  id_customer int NOT NULL,
  id_contract int NOT NULL,
)

--
-- Дамп данных таблицы `operations_product`
--

INSERT INTO _operations_product (operation_date, operation_type, operation_price, id_user, id_customer, id_contract) VALUES
(1, '2016-07-03', 'buy', '125000.00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE _product (
  id INTEGER PRIMARY KEY IDENTITY,
  name varchar(255) NOT NULL,
  price_buy decimal(10,2) NOT NULL,
  price_sell decimal(10,2) NOT NULL,
  date_add date NOT NULL,
  id_user int NOT NULL,
)

--
-- Дамп данных таблицы `product`
--

INSERT INTO _product (name, price_buy, price_sell, date_add, id_user) VALUES
(1, 'kolbasa', '100000.00', '125000.00', '2016-07-03', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS user (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name_and_surname varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO user (name_and_surname, login, password) VALUES
('stan smith', 'stan', '12345'),
('raf simons', 'raf', '54321');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;















--

INSERT INTO _customer ( company, address, phonenumber, edrpou, inn) VALUES
('oss corp', 'sumskaya street, 125', 505334455, 40010012, 0);

-- --------------------------------------------------------


--
-- Дамп данных таблицы `product`
--

INSERT INTO _product (name, price_buy, price_sell, date_add, id_user) VALUES
('kolbasa', '100000.00', '125000.00', '2016-07-03', 1);



-- Структура таблицы `operations_product`
--

CREATE TABLE _operations_product (
  id INTEGER PRIMARY KEY IDENTITY,
  operation_date date NOT NULL,
  operation_type varchar(255) NOT NULL,
  operation_price decimal(10,2) NOT NULL,
  id_user int NOT NULL,
  id_customer int NOT NULL,
  id_contract int NOT NULL,
)

--
-- Дамп данных таблицы `operations_product`
--

INSERT INTO _operations_product (operation_date, operation_type, operation_price, id_user, id_customer, id_contract) VALUES
('2016-07-03', 'buy', '125000.00', 1, 1, 1);

-- --------------------------------------------------------