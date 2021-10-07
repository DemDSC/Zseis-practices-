ALTER TABELE ksiazki DROP FOREIGN KEY ksiazki_ibfk_1;
ALTER TABELE ksiazki DROP Id_wypozyczajacego;

CREATE TABLE 'wyporzyczenia' (
    'id' int(11) NOT NULL,
    'Id_ucznia' int(11) NOT NULL,
    'Id_ksiazki' int(11) NOT NULL,
    'data_wyporzyczenia' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    'data_zwrotu' timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=Latin1;

INSERT INTO 'wyporzyczenia' ('id', 'Id_ucznia', 'Id_ksiazki', 'data_wyporzyczenia', 'data_zwrotu') VALUES
(1, 1, 1, '2021-03-08 10:15:44', '0000-00-00 00:00:00' );
ALTER TABLE 'wyporzyczenia'
    ADD PRIMARY KEY ('id'),
    ADD KEY 'Id_ucznia' ('Id_ucznia')
    ADD KEY 'Id_ksiazki' ('Id_ksiazki');