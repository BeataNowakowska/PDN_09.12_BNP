-- Tworzenie tabel
CREATE TABLE Bohaterowie (
    id_bohatera INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    klasa VARCHAR(50),
    zdolnosci TEXT
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
