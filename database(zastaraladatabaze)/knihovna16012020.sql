-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 16. led 2020, 16:21
-- Verze serveru: 5.7.17
-- Verze PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `knihovna`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `infokniha`
--

CREATE TABLE `infokniha` (
  `knihaID` int(11) NOT NULL,
  `ISBNID` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `nazev` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `pocet` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `poznamka` tinytext COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `infokniha`
--

INSERT INTO `infokniha` (`knihaID`, `ISBNID`, `nazev`, `pocet`, `poznamka`) VALUES
(1, '928-80-7390-220-9', 'Maly princ', 990, 'Politá vodou, poškozená'),
(2, '978-80-7390-220-3', 'Troska', 0, ''),
(3, '978-80-7390-220-2', 'Test1', 0, ''),
(4, '978-80-7390-220-1', 'XYZ', 0, '');

-- --------------------------------------------------------

--
-- Struktura tabulky `infokniha_spisovatel`
--

CREATE TABLE `infokniha_spisovatel` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `infokniha_spisovatel`
--

INSERT INTO `infokniha_spisovatel` (`book_id`, `author_id`, `ID`) VALUES
(1, 3, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `spisovatel`
--

CREATE TABLE `spisovatel` (
  `spisovatelID` int(11) NOT NULL,
  `jmeno` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `prijmeni` varchar(30) COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci COMMENT='informace o spisovateli';

--
-- Vypisuji data pro tabulku `spisovatel`
--

INSERT INTO `spisovatel` (`spisovatelID`, `jmeno`, `prijmeni`) VALUES
(1, 'Petr', 'Har'),
(2, 'MMM', 'NNN'),
(3, 'Isaac', 'Newton');

-- --------------------------------------------------------

--
-- Struktura tabulky `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `jmeno` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `prijmeni` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `trida` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `heslo` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `student`
--

INSERT INTO `student` (`studentID`, `jmeno`, `prijmeni`, `trida`, `email`, `heslo`, `username`) VALUES
(1, 'Přemek', 'Šašek', '4.F', 'sasekp@seznam.cz', '$2y$10$Z2eS5L/gf8.ulnWMaoSvC.LhSedamk9kcaG7V8MTLe159UpWI3gcC', 'sasekp');

-- --------------------------------------------------------

--
-- Struktura tabulky `vypujcky`
--

CREATE TABLE `vypujcky` (
  `vypujckaID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `knihaID` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `datum_pujcky` datetime NOT NULL,
  `datum_vraceni` datetime DEFAULT NULL,
  `knihaVracena` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pocetVypujcenych` int(10) UNSIGNED DEFAULT NULL,
  `poznamkaVypujc` tinytext COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `vypujcky`
--

INSERT INTO `vypujcky` (`vypujckaID`, `studentID`, `knihaID`, `datum_pujcky`, `datum_vraceni`, `knihaVracena`, `pocetVypujcenych`, `poznamkaVypujc`) VALUES
(52, 1, '1', '2020-01-16 15:35:22', NULL, 0, 6, 'sdfdsfs'),
(51, 1, '1', '2020-01-16 15:22:17', NULL, 0, 1, ''),
(50, 1, '1', '2020-01-16 15:19:32', NULL, 0, 1, 'dsadadsasadsa'),
(49, 1, '1', '2020-01-16 15:19:16', NULL, 0, 1, ''),
(48, 1, '1', '2020-01-16 15:19:02', NULL, 0, 1, ''),
(47, 1, '1', '2020-01-16 14:58:53', NULL, 0, 1, ''),
(46, 1, '1', '2020-01-16 14:58:45', NULL, 0, 1, ''),
(45, 1, '1', '2020-01-16 14:58:36', NULL, 0, 1, ''),
(44, 1, '1', '2020-01-15 19:48:26', NULL, 0, 1, 'dasdasd'),
(43, 1, '1', '2020-01-15 19:48:19', NULL, 0, 1, ''),
(42, 1, '1', '2020-01-15 19:47:16', NULL, 0, 1, ''),
(41, 1, '1', '2020-01-15 19:47:05', NULL, 0, 1, ''),
(40, 1, '1', '2020-01-15 19:26:13', NULL, 0, 4, 'testst222'),
(39, 1, '1', '2020-01-15 19:26:07', NULL, 0, 1, 'tes tetstetet');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `infokniha`
--
ALTER TABLE `infokniha`
  ADD PRIMARY KEY (`knihaID`);

--
-- Klíče pro tabulku `infokniha_spisovatel`
--
ALTER TABLE `infokniha_spisovatel`
  ADD PRIMARY KEY (`ID`);

--
-- Klíče pro tabulku `spisovatel`
--
ALTER TABLE `spisovatel`
  ADD PRIMARY KEY (`spisovatelID`);

--
-- Klíče pro tabulku `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Klíče pro tabulku `vypujcky`
--
ALTER TABLE `vypujcky`
  ADD PRIMARY KEY (`vypujckaID`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `infokniha`
--
ALTER TABLE `infokniha`
  MODIFY `knihaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pro tabulku `infokniha_spisovatel`
--
ALTER TABLE `infokniha_spisovatel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `spisovatel`
--
ALTER TABLE `spisovatel`
  MODIFY `spisovatelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pro tabulku `vypujcky`
--
ALTER TABLE `vypujcky`
  MODIFY `vypujckaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
