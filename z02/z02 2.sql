-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Mar 2021, 10:28
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `z02`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Id_wypozyczajacego` int(11) NOT NULL,
  `Autor` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Wydawnictwo` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Rok_wydania` year(4) NOT NULL,
  `Liczba_stron` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Id_wypozyczajacego`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`) VALUES
(1, 1, 'Maciek Wielki', 'Filipa', 2021, 323),
(2, 2, 'Karol Marciniak', 'Papieskie', 1969, 420),
(3, 3, 'Marcin Pawelec', 'Sport.co', 1999, 3232);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Imie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Klasa` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `Klasa`, `Telefon`) VALUES
(1, 'Tkocz', 'Sebastian', 'Td', 666555444),
(2, 'Grysak', 'Martyna', '1Tf\r\n', 111222333),
(3, 'Szymski', 'Wektor', '1Tc', 222333444);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyporzyczenia`
--

CREATE TABLE `wyporzyczenia` (
  `id` int(11) NOT NULL,
  `Id_ucznia` int(11) NOT NULL,
  `Id_ksiazki` int(11) NOT NULL,
  `data_wyporzyczenia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_zwrotu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `wyporzyczenia`
--

INSERT INTO `wyporzyczenia` (`id`, `Id_ucznia`, `Id_ksiazki`, `data_wyporzyczenia`, `data_zwrotu`) VALUES
(1, 1, 1, '2021-03-08 09:28:21', '2021-03-08 09:28:21'),
(2, 2, 2, '2021-03-08 09:28:21', '2021-03-08 09:28:21'),
(3, 3, 3, '2021-03-08 09:28:21', '2021-03-08 09:28:21');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`),
  ADD KEY `Id_wypozyczajacego` (`Id_wypozyczajacego`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`Id_wypozyczajacego`) REFERENCES `ksiazki` (`Id_ksiazki`);


--
-- Metadane
--
USE `phpmyadmin`;

--
-- Metadane dla tabeli ksiazki
--

--
-- Metadane dla tabeli uczniowie
--

--
-- Metadane dla tabeli wyporzyczenia
--

--
-- Metadane dla Bazy danych z02
--

--
-- Zrzut danych tabeli `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('z02', 'wyporzyczenia', 'Id_ksiazki', 'z02', 'ksiazki', 'Id_ksiazki'),
('z02', 'wyporzyczenia', 'Id_ucznia', 'z02', 'uczniowie', 'Id_ucznia');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
