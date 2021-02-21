-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Lut 2021, 16:55
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `seansik`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filman_categories`
--

CREATE TABLE `filman_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(40) DEFAULT NULL,
  `category_path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `filman_categories`
--

INSERT INTO `filman_categories` (`id`, `category`, `category_path`) VALUES
(1, 'Akcja', 'https://filman.cc/filmy-online-pl/category:1/'),
(2, 'Animacja', 'https://filman.cc/filmy-online-pl/category:2/'),
(3, 'Baśń', 'https://filman.cc/filmy-online-pl/category:4/'),
(4, 'Biograficzny', 'https://filman.cc/filmy-online-pl/category:6/'),
(5, 'Dla dzieci', 'https://filman.cc/filmy-online-pl/category:8/'),
(6, 'Dokumentalny', 'https://filman.cc/filmy-online-pl/category:11/'),
(7, 'Dramat', 'https://filman.cc/filmy-online-pl/category:12/'),
(8, 'Dramat historyczny', 'https://filman.cc/filmy-online-pl/category:71/'),
(9, 'Dramat obyczajowy', 'https://filman.cc/filmy-online-pl/category:74/'),
(10, 'Erotyczny', 'https://filman.cc/filmy-online-pl/category:72/'),
(11, 'Familijny', 'https://filman.cc/filmy-online-pl/category:22/'),
(12, 'Fantasy', 'https://filman.cc/filmy-online-pl/category:23/'),
(13, 'Gangsterski', 'https://filman.cc/filmy-online-pl/category:26/'),
(14, 'Historyczny', 'https://filman.cc/filmy-online-pl/category:28/'),
(15, 'Horror', 'https://filman.cc/filmy-online-pl/category:29/'),
(16, 'Katastroficzny', 'https://filman.cc/filmy-online-pl/category:31/'),
(17, 'Komedia', 'https://filman.cc/filmy-online-pl/category:32/'),
(18, 'Komedia dokumentalna', 'https://filman.cc/filmy-online-pl/category:66/'),
(19, 'Komedia kryminalna', 'https://filman.cc/filmy-online-pl/category:67/'),
(20, 'Komedia rom.', 'https://filman.cc/filmy-online-pl/category:73/'),
(21, 'Kryminał', 'https://filman.cc/filmy-online-pl/category:39/'),
(22, 'Lektury', 'https://filman.cc/filmy-online-pl/category:78/'),
(23, 'Melodramat', 'https://filman.cc/filmy-online-pl/category:69/'),
(24, 'Musical', 'https://filman.cc/filmy-online-pl/category:41/'),
(25, 'Muzyczny', 'https://filman.cc/filmy-online-pl/category:68/'),
(26, 'Obyczajowy', 'https://filman.cc/filmy-online-pl/category:45/'),
(27, 'Poetycki', 'https://filman.cc/filmy-online-pl/category:70/'),
(28, 'Przygodowy', 'https://filman.cc/filmy-online-pl/category:50/'),
(29, 'Przyrodniczy', 'https://filman.cc/filmy-online-pl/category:51/'),
(30, 'Psychologiczny', 'https://filman.cc/filmy-online-pl/category:52/'),
(31, 'Romans', 'https://filman.cc/filmy-online-pl/category:55/'),
(32, 'Sci-Fi', 'https://filman.cc/filmy-online-pl/category:57/'),
(33, 'Sensacyjny', 'https://filman.cc/filmy-online-pl/category:58/'),
(34, 'Sport', 'https://filman.cc/filmy-online-pl/category:76/'),
(35, 'Szpiegowski', 'https://filman.cc/filmy-online-pl/category:61/'),
(36, 'Sztuki Walki', 'https://filman.cc/filmy-online-pl/category:77/'),
(37, 'Thriller', 'https://filman.cc/filmy-online-pl/category:63/'),
(38, 'Western', 'https://filman.cc/filmy-online-pl/category:64/'),
(39, 'Wojenny', 'https://filman.cc/filmy-online-pl/category:65/'),
(40, 'Zwiastun', 'https://filman.cc/filmy-online-pl/category:75/');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `filman_categories`
--
ALTER TABLE `filman_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `filman_categories`
--
ALTER TABLE `filman_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
