-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Lut 2021, 17:17
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
-- Baza danych: `test`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filman_films`
--

CREATE TABLE `filman_films` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `film_link` varchar(100) DEFAULT NULL,
  `lector` char(30) DEFAULT NULL,
  `quality` char(30) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `rating` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `filman_films`
--

INSERT INTO `filman_films` (`id`, `category_id`, `title`, `film_link`, `lector`, `quality`, `year`, `rating`) VALUES
(1, 1, 'Avengers: Wojna bez granic / Avengers: Infinity War', 'https://filman.cc/film/avengers-wojna-bez-granic-avengers-infinity-war-2018', 'Dubbing', 'Wysoka', 2018, '4.33/6'),
(2, 1, 'Deadpool 2', 'https://filman.cc/film/deadpool-2-2018', 'Lektor', 'Wysoka', 2018, '4.07/6'),
(3, 1, 'Czarna Pantera / Black Panther', 'https://filman.cc/film/czarna-pantera-black-panther-2018', 'Dubbing', 'Wysoka', 2018, '4.12/6'),
(4, 1, 'To dopiero początek / Just Getting Started', 'https://filman.cc/film/to-dopiero-poczatek-just-getting-started-2017', 'Lektor', 'Wysoka', 2017, '3.85/6'),
(5, 1, 'Więzień labiryntu: Lek na śmierć / Maze Runner: The Death Cure', 'https://filman.cc/film/wiezien-labiryntu-lek-na-smierc-maze-runner-the-death-cure-2018', 'Lektor', 'Wysoka', 2018, '4.24/6'),
(6, 1, 'Player One / Ready Player One', 'https://filman.cc/film/player-one-ready-player-one-2018', 'Lektor', 'Wysoka', 2018, '4.14/6'),
(7, 1, '30 minut lub mniej / 30 Minutes or Less', 'https://filman.cc/film/30-minut-lub-mniej-30-minutes-or-less-2011', 'Lektor', 'Wysoka', 2011, '3.89/6'),
(8, 1, 'Tomb Raider', 'https://filman.cc/film/tomb-raider-2018', 'Dubbing', 'Wysoka', 2018, '4.05/6'),
(9, 1, 'Szybcy i wściekli 5 / Fast Five', 'https://filman.cc/film/szybcy-i-wsciekli-5-fast-five-2011', 'Lektor', 'Wysoka', 2011, '4.09/6'),
(10, 1, 'Igrzyska śmierci / The Hunger Games', 'https://filman.cc/film/igrzyska-smierci-the-hunger-games-2012', 'Lektor', 'Wysoka', 2012, '4.06/6'),
(11, 1, 'Avengers / The Avengers', 'https://filman.cc/film/avengers-the-avengers-2012', 'Lektor', 'Wysoka', 2012, '4.25/6'),
(12, 1, 'Szybcy i wściekli 6 / Furious 6', 'https://filman.cc/film/szybcy-i-wsciekli-6-furious-6-2013', 'Lektor', 'Wysoka', 2013, '4.08/6'),
(13, 1, 'Transformers 3 / Transformers: Dark of the Moon', 'https://filman.cc/film/transformers-3-transformers-dark-of-the-moon-2011', 'Lektor', 'Wysoka', 2011, '4.14/6'),
(14, 1, 'Szybcy i wściekli: Tokio Drift / The Fast and the Furious: Tokyo Drift', 'https://filman.cc/film/szybcy-i-wsciekli-tokio-drift-the-fast-and-the-furious-tokyo-drift-2006', 'Lektor', 'Wysoka', 2006, '4.20/6'),
(15, 1, 'Szybko i wściekle / Fast & Furious', 'https://filman.cc/film/szybko-i-wsciekle-fast-furious-2009', 'Lektor', 'Wysoka', 2009, '4.03/6'),
(16, 1, 'Szybcy i wściekli / The Fast and the Furious', 'https://filman.cc/film/szybcy-i-wsciekli-the-fast-and-the-furious-2001', 'Lektor', 'Wysoka', 2001, '4.08/6'),
(17, 1, 'Transformers: Zemsta upadłych / Transformers: Revenge of the Fallen', 'https://filman.cc/film/transformers-zemsta-upadlych-transformers-revenge-of-the-fallen-2009', 'Lektor', 'Wysoka', 2009, '4.24/6'),
(18, 1, 'Niezniszczalni / The Expendables', 'https://filman.cc/film/niezniszczalni-the-expendables-2010', 'Lektor', 'Wysoka', 2010, '3.94/6'),
(19, 1, 'Iron Man 2', 'https://filman.cc/film/iron-man-2-2010', 'Lektor', 'Wysoka', 2010, '4.26/6'),
(20, 1, 'World War Z', 'https://filman.cc/film/world-war-z-2013', 'Lektor', 'Wysoka', 2013, '4.25/6');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `filman_films`
--
ALTER TABLE `filman_films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `filman_films`
--
ALTER TABLE `filman_films`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27971;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `filman_films`
--
ALTER TABLE `filman_films`
  ADD CONSTRAINT `filman_films_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `filman_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
