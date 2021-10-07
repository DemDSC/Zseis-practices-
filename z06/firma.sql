CREATE DATABASE firma;

CREATE TABLE `dostawcy` (
  `id_dostawcy` int(11) NOT NULL,
  `adres` varchar(11) NOT NULL,
  `telefon` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `magazyn` (
  `id_towaru` int(11) NOT NULL,
  `liczba_sztuk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `towary` (
  `id_towaru` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `nazwa` varchar(64) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;
