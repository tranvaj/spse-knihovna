-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 05. úno 2020, 11:19
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
(3, '', 'Pýcha a předsudek', 5, ''),
(2, '', 'Já, robot', 13, ''),
(1, '', 'Svatý Xaverius a Newtonův mozek', 15, ''),
(4, '', 'Květy zla ', 15, ''),
(5, '', '451°Fahrenheita', 1, ''),
(6, '', 'Šifra mistra Leonarda', 5, ''),
(7, '', 'Šifra mistra Leonarda ilustrovaná', 5, ''),
(8, '', 'Dekameron', 7, ''),
(9, '', 'Alchymista', 5, ''),
(10, '', 'Bílá nemoc', 8, ''),
(11, '', 'Dramata', 5, ''),
(12, '', 'Krakatit, Továrna', 5, ''),
(13, '', 'Matka', 2, ''),
(14, '', 'Povídky z jedné a druhé kapsy', 7, ''),
(15, '', 'R.U.R', 14, ''),
(16, '', 'Válka s mloky', 6, ''),
(17, '', 'Věc Makropulos', 1, ''),
(18, '', 'Don Quijote de la Mancha', 1, ''),
(19, '', 'Božská komedie', 2, ''),
(20, '', 'David Copperfield', 2, ''),
(21, '', 'Hry a semináře', 5, ''),
(22, '', 'Zločin a trest', 1, ''),
(23, '', 'Hrdý Budžes', 5, ''),
(24, '', 'Pes baskervillský', 2, ''),
(25, '', 'Robin Hood, král zbrojníků', 1, ''),
(26, '', 'Hrabě Monte Cristo', 2, ''),
(27, '', 'Tři mušketýři', 2, ''),
(28, '', 'Krysař', 14, ''),
(29, '', 'Jméno růže', 5, ''),
(30, '', 'Kytice', 10, ''),
(31, '', 'Kytice, Máj', 5, ''),
(32, '', 'Bajky', 18, ''),
(33, '', 'Malý princ', 12, ''),
(34, '', 'Síla rozumu', 1, ''),
(35, '', 'Sběratel', 5, ''),
(36, '', 'Spalovač mrtvol', 4, ''),
(37, '', 'Chladné ostří', 5, ''),
(38, '', 'Muž, který sázel stromy', 5, ''),
(39, '', 'Faust', 4, ''),
(40, '', 'Pán much', 5, ''),
(41, '', 'Revizor', 15, ''),
(42, '', 'Slovenské hrady', 1, ''),
(43, '', 'Osudy dobrého vojáka Švejka za sv. v.', 2, ''),
(44, '', 'Petrolejové lampy', 2, ''),
(45, '', 'Dívka ve vlakku', 2, ''),
(46, '', 'Hlava XXII', 5, ''),
(47, '', 'Sbohem, armádo', 5, ''),
(48, '', 'Stařec a moře', 5, ''),
(49, '', 'Bílá Masajka', 5, ''),
(50, '', 'Conan: Hodina draka', 1, ''),
(51, '', 'Conan: Meč s Fénixem a jiné povídky', 1, ''),
(52, '', 'Bídníci', 6, ''),
(53, '', 'Chrám Matky Boží', 2, ''),
(54, '', 'Ostře sledované vlaky', 15, ''),
(55, '', 'Blues', 2, ''),
(56, '', 'Konec civilizace', 2, ''),
(57, '', 'Paměť mojí babičce', 2, ''),
(58, '', 'Svět podle Garpa', 2, ''),
(59, '', 'Staré pověsti české', 5, ''),
(60, '', 'Stoletý stařík, který vylezl z okna a zmizel', 2, ''),
(61, '', 'Proces', 5, ''),
(62, '', 'Proměna a jiné povídky', 5, ''),
(63, '', 'Vita Calori', 5, ''),
(64, '', 'Spolčení hlupců', 5, ''),
(65, '', 'Na cestě', 5, ''),
(66, '', 'Zelená míle', 2, ''),
(67, '', 'Loď jménem Naděje', 5, ''),
(68, '', 'Kronika Čechů', 4, ''),
(69, '', 'Josef Mánes', 1, ''),
(70, '', 'Směšné lásky', 14, ''),
(71, '', 'Muži, kteří nenávidí ženy', 2, ''),
(72, '', 'Jako zabít ptáčka', 5, ''),
(73, '', 'Posedlá a jiné hry', 5, ''),
(74, '', 'Démanty noci', 15, ''),
(75, '', 'Modlitba pro Kateřinu Horovitzovou', 2, ''),
(76, '', 'Máj', 10, ''),
(77, '', 'Rok 2140 Deklarace smrti', 15, ''),
(78, '', 'Kulička', 6, ''),
(79, '', 'Láska z časů cholery', 2, ''),
(80, '', 'Bílá velryba', 1, ''),
(81, '', 'Případ Máří Magdaleny', 5, ''),
(82, '', 'Alchymistické povídky', 4, ''),
(83, '', 'Technický slovník', 1, ''),
(84, '', 'Atlas mraků', 2, ''),
(85, '', 'Lakomec', 15, ''),
(86, '', 'Maryša', 1, ''),
(87, '', 'Norské dřevo', 2, ''),
(88, '', 'Babička', 2, ''),
(89, '', 'Divá Bára', 5, ''),
(90, '', 'Povídky malostranské, arabesky', 5, ''),
(91, '', 'Manon Lescaut', 2, ''),
(92, '', 'Nový zákon', 15, ''),
(93, '', '1984', 4, ''),
(94, '', 'Farma zvířat', 15, ''),
(95, '', 'Romeo, Julie tma', 15, ''),
(96, '', 'Z dějin nár. č.', 1, ''),
(97, '', 'Smrt krásných srnců + Jak jsem potkal ryby', 15, ''),
(98, '', 'A bude hůř', 5, ''),
(99, '', 'Generace P', 2, ''),
(100, '', 'Staré řecké báje a pověsti', 9, ''),
(101, '', 'Jáma a kyvadlo a jiné povídky', 15, ''),
(102, '', 'Havran a jiné básně', 15, ''),
(103, '', 'Bylo nás pět', 5, ''),
(104, '', 'Barva kouzel, Zeměplocha', 4, ''),
(105, '', 'Kočár do Vídně', 15, ''),
(106, '', 'Na západní frontě klid', 5, ''),
(107, '', 'Petr a Lucie', 15, ''),
(108, '', 'Někdo se dívá', 5, ''),
(109, '', 'Kdo chytá v žitě', 5, ''),
(110, '', 'Zaklínač: Poslední přání', 5, ''),
(111, '', 'Quo vadis', 1, ''),
(112, '', 'Othello', 5, ''),
(113, '', 'Romeo a Julie', 8, ''),
(114, '', 'Zkrocení zlé ženy', 5, ''),
(115, '', 'Jindřich V.', 5, ''),
(116, '', 'Jeden den Ivana Denisoviče', 18, ''),
(117, '', 'Dracula', 5, ''),
(118, '', 'Sophiina volba', 2, ''),
(119, '', 'Po strništi bos', 5, ''),
(120, '', 'Gulliverovy cesty', 1, ''),
(121, '', 'Zbabělci', 2, ''),
(122, '', 'Společenstvo prstenu', 3, ''),
(123, '', 'Anna Karenina', 1, ''),
(124, '', 'Pražské židovské pověsti', 5, ''),
(125, '', 'Žítkovské bohyně', 3, ''),
(126, '', 'Strakonický dudák', 5, ''),
(127, '', 'Princ a chuďas', 1, ''),
(128, '', 'Obrazy z dějin nár. č.', 1, ''),
(129, '', 'Rozmarné léto', 12, ''),
(130, '', 'Dva roky prázdnin', 1, ''),
(131, '', 'Půl roka života', 30, ''),
(132, '', 'Letopisy královské komory I.', 15, ''),
(133, '', 'Obraz Doriana Graye', 5, ''),
(134, '', 'Lidská besite', 1, ''),
(135, '', 'Nana', 1, ''),
(136, '', 'Zabiják', 5, ''),
(137, '', 'Zlodějka knih', 5, '');

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
(4, 4, 4),
(3, 3, 3),
(2, 2, 2),
(1, 1, 1),
(5, 5, 5),
(6, 6, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10),
(11, 9, 11),
(12, 9, 12),
(13, 9, 13),
(14, 9, 14),
(15, 9, 15),
(16, 9, 16),
(17, 9, 17),
(18, 10, 18),
(19, 11, 19),
(20, 12, 20),
(21, 13, 21),
(22, 14, 22),
(23, 15, 23),
(24, 16, 24),
(25, 17, 25),
(26, 17, 26),
(27, 17, 27),
(28, 18, 28),
(29, 19, 29),
(30, 20, 30),
(31, 20, 31),
(32, 21, 32),
(33, 22, 33),
(34, 23, 34),
(35, 24, 35),
(36, 25, 36),
(37, 26, 37),
(38, 27, 38),
(39, 28, 39),
(40, 29, 40),
(41, 30, 41),
(42, 31, 42),
(43, 32, 43),
(44, 33, 44),
(45, 34, 45),
(46, 35, 46),
(47, 36, 47),
(48, 36, 48),
(49, 37, 49),
(50, 38, 50),
(51, 38, 51),
(52, 39, 52),
(53, 39, 53),
(54, 40, 54),
(55, 41, 55),
(56, 42, 56),
(57, 43, 57),
(58, 44, 58),
(59, 45, 59),
(60, 46, 60),
(61, 47, 61),
(62, 47, 62),
(63, 48, 63),
(64, 49, 64),
(65, 50, 65),
(66, 51, 66),
(67, 52, 67),
(68, 53, 68),
(69, 54, 69),
(70, 55, 70),
(71, 56, 71),
(72, 57, 72),
(73, 58, 73),
(74, 59, 74),
(75, 59, 75),
(76, 60, 76),
(77, 61, 77),
(78, 62, 78),
(79, 63, 79),
(80, 64, 80),
(81, 65, 81),
(82, 66, 82),
(83, 67, 83),
(84, 68, 84),
(85, 69, 85),
(86, 70, 86),
(87, 71, 87),
(88, 72, 88),
(89, 73, 89),
(90, 74, 90),
(91, 74, 91),
(92, 75, 92),
(93, 76, 93),
(94, 76, 94),
(95, 77, 95),
(96, 78, 96),
(97, 79, 97),
(98, 80, 98),
(99, 81, 99),
(100, 82, 100),
(101, 83, 101),
(102, 83, 102),
(103, 84, 103),
(104, 85, 104),
(105, 86, 105),
(106, 87, 106),
(107, 88, 107),
(108, 89, 108),
(109, 90, 109),
(110, 91, 110),
(111, 92, 111),
(112, 93, 112),
(113, 93, 113),
(114, 93, 114),
(115, 93, 115),
(116, 94, 116),
(117, 95, 117),
(118, 96, 118),
(119, 97, 119),
(120, 98, 120),
(121, 99, 121),
(122, 100, 122),
(123, 101, 123),
(124, 102, 124),
(125, 103, 125),
(126, 104, 126),
(127, 105, 127),
(128, 106, 128),
(129, 106, 129),
(130, 107, 130),
(131, 108, 131),
(132, 109, 132),
(133, 110, 133),
(134, 111, 134),
(135, 111, 135),
(136, 111, 136),
(137, 112, 137);

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
(2, 'Issac', 'Asimov'),
(1, 'Jakub', 'Arbes'),
(3, 'Jane', 'Austenová'),
(4, 'Charles', 'Baudelaire'),
(5, 'Ray', 'Bradbury'),
(6, 'Dan', 'Brown'),
(7, 'Giovanni', 'Boccaccio'),
(8, 'Paulo', 'Coelho'),
(9, 'Karel', 'Čapek'),
(10, 'Miquel', 'de Cervantes'),
(11, 'Dante', 'Alighieri'),
(12, 'Charles', 'Dickens'),
(13, 'Divadlo', 'Járy Cimrmana'),
(14, 'Fjodor Michajlovič', 'Dostojevskij'),
(15, 'Irena', 'Dousková'),
(16, 'Arthur Conan', 'Doyle'),
(17, 'Alexandre', 'Dumas'),
(18, 'Viktor', 'Dyk'),
(19, 'Umberto', 'Eco'),
(20, 'Karel Jaromír', 'Erben'),
(21, 'Ezop', ''),
(22, 'Antoine', 'de Saint-Exupéry'),
(23, 'Oriana', 'Fallaci'),
(24, 'John', 'Fowles'),
(25, 'Ladislav', 'Fuks'),
(26, 'Peter', 'Gehm'),
(27, 'Jean', 'Giono'),
(28, 'Johann', 'Wolfgang von Goethe'),
(29, 'William', 'Golding'),
(30, 'Nikolaj Vasiljevič', 'Gogol'),
(31, 'Ján', 'Hejduk'),
(32, 'Jaroslav', 'Hašek'),
(33, 'Jaroslav', 'Havlíček'),
(34, 'Paula', 'Hawkins'),
(35, 'Joseph', 'Heller'),
(36, 'Ernest', 'Hemingway'),
(37, 'Corinne', 'Hofmanová'),
(38, 'Robert Ervin', 'Howard'),
(39, 'Viktor', 'Hugo'),
(40, 'Bohumil', 'Hrabal'),
(41, 'Václav', 'Hrabě'),
(42, 'Aldous', 'Huxley'),
(43, 'Petra', 'Hůlová'),
(44, 'John', 'Irving'),
(45, 'Alois', 'Jirásek'),
(46, 'Jonas', 'Jonasson'),
(47, 'Franz', 'Kafka'),
(48, 'Karel IV.', ''),
(49, 'John', 'Kennedy'),
(50, 'Jack', 'Kerouac'),
(51, 'Stephen', 'King'),
(52, 'Ladislav', 'Klíma'),
(53, 'Kosmas', ''),
(54, 'František', 'Kožík'),
(55, 'Milan', 'Kundera'),
(56, 'Stieg', 'Larsson'),
(57, 'Harper', 'Lee'),
(58, 'Květa', 'Legátová'),
(59, 'Arnošt', 'Lustig'),
(60, 'Karel Hynek', 'Mácha'),
(61, 'Gemma', 'Malley'),
(62, 'Guy', 'de Maupassant'),
(63, 'Gabriel', 'Márquez'),
(64, 'Herman', 'Melville'),
(66, 'Gustav', 'Meyrink'),
(67, 'Vladimír', 'Michálek'),
(68, 'David', 'Mitchell'),
(69, 'Moliére', ''),
(70, 'Bratři', 'Mrštíkové'),
(71, 'Haruki', 'Murakami'),
(72, 'Božena', 'Němcová'),
(73, 'Jan', 'Neruda'),
(74, 'Vítězslav', 'Nezval'),
(75, 'Kolektiv', ''),
(76, 'George', 'Orwell'),
(77, 'Jan', 'Otčenášek'),
(65, 'Gerald', 'Messadié'),
(78, 'František', 'Palacký'),
(79, 'Ota', 'Pavel'),
(80, 'Jan', 'Pelc'),
(81, 'Viktor', 'Pelevin'),
(82, 'Eduard', 'Petiška'),
(83, 'Edgar Allan', 'Poe'),
(84, 'Karel', 'Poláček'),
(85, 'Terry', 'Pratchett'),
(86, 'Jan', 'Procházka'),
(87, 'Erich Maria', 'Remarque'),
(88, 'Romain', 'Rolland'),
(89, 'Ulrike', 'Rylance'),
(90, 'Jerome David', 'Salinger'),
(91, 'Andrzej', 'Sapkowski'),
(92, 'Henryk', 'Sienkiewicz'),
(93, 'William', 'Shakespeare'),
(94, 'Alexandr', 'Solženicyn'),
(95, 'Bram', 'Stoker'),
(96, 'William', 'Styron'),
(97, 'Zdeněk', 'Svěrák'),
(98, 'Jonathan', 'Swift'),
(99, 'Josef', 'Škvorecký'),
(100, 'John Ronald Reuel', 'Tolkien'),
(101, 'Lev Nikolajevič', 'Tolstoj'),
(102, 'Václav', 'Tomek'),
(103, 'Kateřina', 'Tučková'),
(104, 'Josef Kajetán', 'Tyl'),
(105, 'Mark', 'Twain'),
(106, 'Vladislav', 'Vančura'),
(107, 'Jules', 'Verne'),
(108, 'Jaroslav', 'Volgeltanz'),
(109, 'Vlastimil', 'Vondruška'),
(110, 'Oscar', 'Wilde'),
(111, 'Emile', 'Zole'),
(112, 'Markus', 'Zuzak');

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
  MODIFY `knihaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT pro tabulku `infokniha_spisovatel`
--
ALTER TABLE `infokniha_spisovatel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT pro tabulku `spisovatel`
--
ALTER TABLE `spisovatel`
  MODIFY `spisovatelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT pro tabulku `vypujcky`
--
ALTER TABLE `vypujcky`
  MODIFY `vypujckaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
