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

CREATE TABLE RodzajePrzedmiotow (
    id_przedmiotu INT PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    opis TEXT
);

CREATE TABLE Ekwipunek (
    id_ekwipunku INT PRIMARY KEY,
    id_bohatera INT,
    id_przedmiotu INT,
    ilosc INT DEFAULT 1,
    FOREIGN KEY (id_bohatera) REFERENCES Bohaterowie(id_bohatera),
    FOREIGN KEY (id_przedmiotu) REFERENCES RodzajePrzedmiotow(id_przedmiotu)
);

-- Wstawianie danych do tabeli Bohaterowie
INSERT INTO Bohaterowie (id_bohatera, imie, klasa, zdolnosci, zloto) VALUES
(1, 'Aragorn', 'Wojownik', 'Walka mieczem, Przywództwo', 100),
(2, 'Legolas', 'Łucznik', 'Strzelanie z łuku, Zwinność', 150),
(3, 'Gandalf', 'Mag', 'Magia, Poradnictwo', 200),
(4, 'Boromir', 'Wojownik', 'Walka mieczem, Odwaga', 50),
(5, 'Frodo', 'Zwiadowca', 'Skradanie się, Odporność na pokusy', 30);

-- Wstawianie danych do tabeli Misje
INSERT INTO Misje (id_misji, nazwa, opis, nagroda) VALUES
(1, 'Obrona wioski', 'Odeprzyj atak goblinów na wioskę.', '50 sztuk złota'),
(2, 'Polowanie na smoka', 'Zabij smoka w jaskini na górze.', '300 sztuk złota, Miecz Smoczego Zabójcy'),
(3, 'Eskorta kupca', 'Dostarcz kupca do sąsiedniego miasta.', '20 sztuk złota, Mikstura leczenia'),
(4, 'Odnalezienie starożytnej relikwii', 'Znajdź zaginiony artefakt w ruinach.', '100 sztuk złota, Pierścień mocy');

-- Wstawianie danych do tabeli RodzajePrzedmiotow
INSERT INTO RodzajePrzedmiotow (id_przedmiotu, nazwa, opis) VALUES
(1, 'Miecz', 'Ostry miecz wykonany z wytrzymałej stali'),
(2, 'Tarcza', 'Solidna tarcza z drewna i metalu'),
(3, 'Łuk', 'Lekki łuk idealny dla łucznika'),
(4, 'Kostur', 'Magiczny kostur wspomagający rzucanie zaklęć'),
(5, 'Księga zaklęć', 'Zawiera wiele potężnych zaklęć'),
(6, 'Mikstura leczenia', 'Leczy rany i przywraca zdrowie');

-- Wstawianie danych do tabeli Ekwipunek
INSERT INTO Ekwipunek (id_ekwipunku, id_bohatera, id_przedmiotu, ilosc) VALUES
(1, 1, 1, 1), -- Aragorn ma miecz
(2, 1, 2, 1), -- Aragorn ma tarczę
(3, 2, 3, 1), -- Legolas ma łuk
(4, 2, 6, 2), -- Legolas ma 2 mikstury leczenia
(5, 3, 4, 1), -- Gandalf ma kostur
(6, 3, 5, 1), -- Gandalf ma księgę zaklęć
(7, 4, 1, 1), -- Boromir ma miecz
(8, 4, 2, 1); -- Boromir ma tarczę

