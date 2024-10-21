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
    genre VARCHAR(10) NOT NULL,
    sexe VARCHAR(10) NOT NULL,
    handicap VARCHAR(30),
    citation VARCHAR(150),
    taille INT NOT NULL,
    tatouage VARCHAR(100),
    cicatrice VARCHAR(100),
    piercing VARCHAR(100));

-----------------------------------------------
-- Structure table Metiers

CREATE OR REPLACE TABLE Metiers (
    nommetier VARCHAR(20) NOT NULL,
    domaine VARCHAR(20)
);

-----------------------------------------------
-- Structure table Compagnies

CREATE OR REPLACE TABLE Compagnies (
    nomcomp VARCHAR(20) NOT NULL,
    typecomp VARCHAR(20),
    nbrmembre INT
);

-----------------------------------------------
-- Structure table Evènements historiques

CREATE OR REPLACE TABLE Evenements (
    nomevent VARCHAR(20) NOT NULL,
    datedeb date NOT NULL, 
    datefin date NOT NULL,
    descriptionevent VARCHAR(200),
    consequence VARCHAR(200)
);

-----------------------------------------------
-- Structure table Activités

CREATE OR REPLACE TABLE Activites (
    nomactivite VARCHAR(20) NOT NULL,
    descriptionact VARCHAR(20)
);

-----------------------------------------------
-- Structure table Passe-temps

CREATE OR REPLACE TABLE Passetemps (
    nomhobby VARCHAR(20) NOT NULL,
    descriptionhobby VARCHAR(20)
);

-----------------------------------------------
-- Structure table Animaux

CREATE OR REPLACE TABLE Animaux (
    nom VARCHAR(20) NOT NULL,
    sexe VARCHAR(20) NOT NULL,
    datenaissance date NOT NULL, 
    datemort date,
    raisonmort VARCHAR(50)
);
-----------------------------------------------
-- Structure table Villes

CREATE OR REPLACE TABLE Villes (
    nomville VARCHAR(20) NOT NULL,
    superficie float, 
    pop INT,
    nzone INT
);

-----------------------------------------------
-- Structure table Races

CREATE OR REPLACE TABLE Races (
    nomrace VARCHAR(20) NOT NULL,
    descriptrace VARCHAR(100),
    espece VARCHAR(20) NOT NULL
);

-----------------------------------------------
-- Structure table Batiments 

CREATE OR REPLACE TABLE Batiments (
    nombatiment VARCHAR(20) NOT NULL,
    nbretage INT, 
    descript VARCHAR(200),
    cardinalite VARCHAR(10),
    environnement VARCHAR(100),
    ville VARCHAR(20) NOT NULL, 
);

-----------------------------------------------
-- Structure table Zones (environnement)

CREATE OR REPLACE TABLE Zones (
    numzone INT NOT NULL,
    nomzone VARCHAR(20),
    descript VARCHAR(200),
    partie VARCHAR(20)
);

-----------------------------------------------
-- Structure table Especes

CREATE OR REPLACE TABLE Especes (
    nomespece VARCHAR(20) NOT NULL,
    descript VARCHAR(100)
);

-----------------------------------------------
-- Structure table Parties (de pays)

CREATE OR REPLACE TABLE Parties (
    nompartie VARCHAR(20) NOT NULL,
    topologie VARCHAR(200),
    pays VARCHAR(20) NOT NULL
);

-----------------------------------------------
-- Structure table Pays

CREATE OR REPLACE TABLE Pays (
    nompays VARCHAR(20) NOT NULL,
    superficie float,
    pop INT
);

-----------------------------------------------
-- Structure table Groupes

CREATE OR REPLACE TABLE Groupes (
    numero INT NOT NULL,
    nomgroupe VARCHAR(20),
    typerelation VARCHAR(10) NOT NULL,
);
-----------------------------------------------
---------- Table de liaison -------------------