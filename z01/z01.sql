-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Sty 2021, 09:03
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
-- Baza danych: `z01`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Autor` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Wydawnictwo` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Rok_wydania` year(4) NOT NULL,
  `Liczba_stron` int(11) NOT NULL,
  `Id_wypozyczajacego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`, `Id_wypozyczajacego`) VALUES
(1, 'Maciek Wielki', 'Filipa', 2021, 323, 1),
(2, 'Karol Marciniak', 'Papieskie', 1969, 420, 2),
(3, 'Marcin Pawelec', 'Sport.co', 1999, 3232, 3);

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
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`Id_wypozyczajacego`) REFERENCES `ksiazki` (`Id_ksiazki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
