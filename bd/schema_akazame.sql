-- Active: 1729445084290@@127.0.0.1@3306@akazame

-- Version : MariaDB Server 11.5.2 Rolling


--------- Base de données : "Monde de RP Akazame"
-----------------------------------------------

--------- Début de la création des tables
--(ajout des contraintes, clé primaire et clé étrangère après les structures)
-----------------------------------------------

-- Structure table Etudes 

CREATE OR REPLACE TABLE Etudes (
    nometude VARCHAR(20),
    domaine VARCHAR(20),
    nbrannee INT
);

-----------------------------------------------
-- Structure table Personnes

CREATE OR REPLACE TABLE Personnes (
    nom VARCHAR(20),
    prenom VARCHAR(20),
    datenaissance date NOT NULL,
    datemort date, 
    generation int NOT NULL, 
    orientation VARCHAR(20) NOT NULL,
    genre VARCHAR(10),
    sexe VARCHAR(10),
    handicap VARCHAR(30),
    citation VARCHAR(150),
    taille INT,
    tatouage VARCHAR(100),
    cicatrice VARCHAR(100),
    piercing VARCHAR(100));

-----------------------------------------------
-- Structure table Metiers

CREATE OR REPLACE TABLE Metiers (
    nommetier VARCHAR(20),
    domaine VARCHAR(20)
);

-----------------------------------------------
-- Structure table Compagnies

CREATE OR REPLACE TABLE Compagnies (
    nomcomp VARCHAR(20),
    typecomp VARCHAR(20),
    nbrmembre INT
)

