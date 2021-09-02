-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 30. lis 2019, 15:50
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
  `nazev` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `spisovatel_spisovatelID` int(30) NOT NULL,
  `pocet` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `infokniha`
--

INSERT INTO `infokniha` (`knihaID`, `nazev`, `spisovatel_spisovatelID`, `pocet`) VALUES
(1, 'Havran', 1, 1),
(2, 'Troska', 1, 1);

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
(1, 'Petr', 'Har');

-- --------------------------------------------------------

--
-- Struktura tabulky `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `jmeno` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `prijmeni` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `trida` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `student`
--

INSERT INTO `student` (`studentID`, `jmeno`, `prijmeni`, `trida`, `email`) VALUES
(1, 'Přemek', 'Šašek', '4.F', 'sasekp@seznam.cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `vypujcky`
--

CREATE TABLE `vypujcky` (
  `vypujckaID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `knihaID` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `datum_pujcky` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `vypujcky`
--

INSERT INTO `vypujcky` (`vypujckaID`, `studentID`, `knihaID`, `datum_pujcky`) VALUES
(1, 1, '1', '2019-11-04'),
(2, 1, '2', '2019-11-04');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `infokniha`
--
ALTER TABLE `infokniha`
  ADD PRIMARY KEY (`knihaID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
