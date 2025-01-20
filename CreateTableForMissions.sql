-- Tworzenie tabel
CREATE TABLE Bohaterowie (
    id_bohatera INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    klasa VARCHAR(50),
    zdolnosci TEXT,
    zloto INT DEFAULT 0
);

CREATE TABLE Misje (
    id_misji INT PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    opis TEXT,
    nagroda VARCHAR(100)
);

CREATE TABLE OdbyteMisje (
    id_odbytej_misji INT PRIMARY KEY,
    id_bohatera INT,
    id_misji INT,
    data_odbycia DATE,
    wynik VARCHAR(50),
    FOREIGN KEY (id_bohatera) REFERENCES Bohaterowie(id_bohatera),
    FOREIGN KEY (id_misji) REFERENCES Misje(id_misji)
);

CREATE TABLE Ekwipunek (
    id_ekwipunku INT PRIMARY KEY,
    id_bohatera INT,
    przedmiot VARCHAR(100) NOT NULL,
    ilosc INT DEFAULT 1,
    FOREIGN KEY (id_bohatera) REFERENCES Bohaterowie(id_bohatera)
);

-- Wstawianie danych do tabeli Bohaterowie
INSERT INTO Bohaterowie (id_bohatera, imie, klasa, zdolnosci, zloto) VALUES
(1, 'Aragorn', 'Wojownik', 'Walka mieczem, Przywództwo', 100),
(2, 'Legolas', 'Łucznik', 'Strzelanie z łuku, Zwinność', 150),
(3, 'Gandalf', 'Mag', 'Magia, Poradnictwo', 200),
(4, 'Boromir', 'Wojownik', 'Walka mieczem, Odwaga', 50),
(5, 'Frodo', 'Zwiadowca', 'Skradanie się, Odporność na pokusy', 30),
(6, 'BeataBNP', 'Mag', 'Skradanie się, Odporność na pokusy', 30);

-- Wstawianie danych do tabeli Misje
INSERT INTO Misje (id_misji, nazwa, opis, nagroda) VALUES
(1, 'Obrona wioski', 'Odeprzyj atak goblinów na wioskę.', '50 sztuk złota'),
(2, 'Polowanie na smoka', 'Zabij smoka w jaskini na górze.', '300 sztuk złota, Miecz Smoczego Zabójcy'),
(3, 'Eskorta kupca', 'Dostarcz kupca do sąsiedniego miasta.', '20 sztuk złota, Mikstura leczenia'),
(4, 'Odnalezienie starożytnej relikwii', 'Znajdź zaginiony artefakt w ruinach.', '100 sztuk złota, Pierścień mocy');

-- Wstawianie danych do tabeli Ekwipunek
INSERT INTO Ekwipunek (id_ekwipunku, id_bohatera, przedmiot, ilosc) VALUES
(1, 1, 'Miecz', 1),
(2, 1, 'Tarcza', 1),
(3, 2, 'Łuk', 1),
(4, 2, 'Strzały', 20),
(5, 3, 'Kostur', 1),
(6, 3, 'Księga zaklęć', 1),
(7, 4, 'Miecz', 1),
(8, 4, 'Tarcza', 1);

-- Wstawianie danych do tabeli OdbyteMisje
INSERT INTO OdbyteMisje (id_odbytej_misji, id_bohatera, id_misji, data_odbycia, wynik) VALUES
(1, 1, 1, '2024-12-01', 'Sukces'),
(2, 2, 3, '2024-12-02', 'Sukces'),
(3, 3, 2, '2024-12-03', 'Porażka'),
(4, 4, 4, '2024-12-05', 'Sukces'),
(5, 5, 1, '2024-12-06', 'Sukces');
