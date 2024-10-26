-- Active: 1729445084290@@127.0.0.1@3306@akazame

-- Version : MariaDB Server 11.5.2 Rolling


--------- Base de données : "Monde de RP Akazame"
-----------------------------------------------

--------- Début de la création des tables
--(ajout des contraintes, clé primaire et clé étrangère après les structures)
-----------------------------------------------

-- Structure table Etudes 

CREATE OR REPLACE TABLE `Etudes` (
    `nometude` VARCHAR(20),
    `domaine` VARCHAR(20),
    `nbrannee` INT,
    PRIMARY KEY (`nometude`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Personnes

CREATE OR REPLACE TABLE `Personnes` (
    `nom` VARCHAR(20),
    `prenom` VARCHAR(20),
    `datenaissance` date NOT NULL,
    `datemort` date, 
    `generation` int NOT NULL, 
    `orientation` VARCHAR(20) NOT NULL,
    `genre` VARCHAR(10) NOT NULL,
    `sexe` VARCHAR(10) NOT NULL,
    `handicap` VARCHAR(30),
    `citation` VARCHAR(150),
    `taille` INT NOT NULL,
    `tatouage` VARCHAR(100),
    `cicatrice` VARCHAR(100),
    `piercing` VARCHAR(100),
    PRIMARY KEY (`nom`,`prenom`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-----------------------------------------------
-- Structure table Metiers

CREATE OR REPLACE TABLE `Metiers` (
    `nommetier` VARCHAR(20),
    `domaine` VARCHAR(20),
    PRIMARY KEY(`nommetier`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Compagnies

CREATE OR REPLACE TABLE `Compagnies` (
    `nomcomp` VARCHAR(20),
    `typecomp` VARCHAR(20),
    `nbrmembre` INT,
    PRIMARY KEY (`nomcomp`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Evènements historiques

CREATE OR REPLACE TABLE `Evenements` (
    `nomevent` VARCHAR(20),
    `datedeb` date NOT NULL, 
    `datefin` date NOT NULL,
    `descriptionevent` VARCHAR(200),
    `consequence` VARCHAR(200),
    PRIMARY KEY (`nomevent`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Activités

CREATE OR REPLACE TABLE `Activites` (
    `nomactivite` VARCHAR(20),
    `descriptionact` VARCHAR(20),
    PRIMARY KEY (`nomactivite`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Passe-temps

CREATE OR REPLACE TABLE `Passetemps` (
    `nomhobby` VARCHAR(20),
    `descriptionhobby` VARCHAR(20),
    PRIMARY KEY (`nomhobby`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Animaux

CREATE OR REPLACE TABLE `Animaux` (
    `nom` VARCHAR(20),
    `sexe` VARCHAR(20) NOT NULL,
    `datenaissance` date NOT NULL, 
    `datemort` date,
    `raisonmort` VARCHAR(50),
    PRIMARY KEY (`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-----------------------------------------------
-- Structure table Villes

CREATE OR REPLACE TABLE `Villes` (
    `nomville` VARCHAR(20),
    `superficie` float, 
    `pop` INT,
    `zone` INT NOT NULL,
    PRIMARY KEY (`nomville`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Races

CREATE OR REPLACE TABLE `Races` (
    `nomrace` VARCHAR(20),
    `descript` VARCHAR(100),
    `espece` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`nomrace`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Batiments 

CREATE OR REPLACE TABLE `Batiments` (
    `nombatiment` VARCHAR(20),
    `nbretage` INT, 
    `descript` VARCHAR(200),
    `cardinalite` VARCHAR(10),
    `environnement` VARCHAR(100),
    `ville` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`nombatiment`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Zones (environnement)

CREATE OR REPLACE TABLE `Zones` (
    `numzone` INT,
    `nomzone` VARCHAR(20),
    `descript` VARCHAR(200),
    `partie` VARCHAR(20),
    PRIMARY KEY (`numzone`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Especes

CREATE OR REPLACE TABLE `Especes` (
    `nomespece` VARCHAR(20),
    `descript` VARCHAR(100),
    PRIMARY KEY (`nomespece`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Parties (de pays)

CREATE OR REPLACE TABLE `Parties` (
    `nompartie` VARCHAR(20),
    `topologie` VARCHAR(200),
    `pays` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`nompartie`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Pays

CREATE OR REPLACE TABLE `Pays` (
    `nompays` VARCHAR(20) NOT NULL,
    `superficie` float,
    `pop` INT,
    PRIMARY KEY (`nompays`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Groupes

CREATE OR REPLACE TABLE `Groupes` (
    `numero` INT,
    `nomgroupe` VARCHAR(20),
    `typerelation` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`numero`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-----------------------------------------------
---------- Table de liaison -------------------
-----------------------------------------------
-- Structure table Intégration

CREATE OR REPLACE TABLE `Integrations` (
    `groupe` INT, 
    `nom` VARCHAR(20),
    `prenom` VARCHAR(20),
    FOREIGN KEY(`groupe`) REFERENCES groupes(`numero`),
    FOREIGN KEY(`nom`, `prenom`) REFERENCES personnes(`nom`,`prenom`),
    PRIMARY KEY(`groupe`, `nom`,`prenom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Mariages
CREATE OR REPLACE TABLE `Mariages` (
    `nom1` VARCHAR(20), 
    `prenom1` VARCHAR(20), 
    `nom2`VARCHAR(20),
    `prenom2`VARCHAR(20),
    `nommariage` VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    FOREIGN KEY(`nom1`, `prenom1`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`nom2`, `prenom2`) REFERENCES personnes(`nom`,`prenom`),
    PRIMARY KEY(`nom1`,`prenom1`,`nom2`, `prenom2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Etudes Faites

CREATE OR REPLACE TABLE `Etudes_Faites`(
    `nom` VARCHAR(20),
    `prenom` VARCHAR(20),
    `etude` VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    `diplome` bool,
    FOREIGN KEY(`nom`, `prenom`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`etude`) REFERENCES etudes(`nometude`),
    PRIMARY KEY(`nom`,`prenom`,`etude`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Travails

CREATE OR REPLACE TABLE `Travails`(
    `nom` VARCHAR(20),
    `prenom` VARCHAR(20),
    `metier` VARCHAR(20),
    `compagnie` VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    FOREIGN KEY(`nom`,`prenom`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`metier`) REFERENCES metiers(`nommetier`),
    FOREIGN KEY(`compagnie`) REFERENCES compagnies(`nomcomp`),
    PRIMARY KEY(`nom`,`prenom`,`metier`,`compagnie`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Productions

CREATE OR REPLACE TABLE `Productions` (
    `compagnie` VARCHAR(20),
    `activite` VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    FOREIGN KEY(`activite`) REFERENCES activites(`nomactivite`),
    FOREIGN KEY(`compagnie`) REFERENCES compagnies(`nomcomp`),
    PRIMARY KEY(`activite`,`compagnie`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Amusements

CREATE OR REPLACE TABLE `Amusements`(
    `loisir` VARCHAR(20),
    `prenom` VARCHAR(20),
    `nom`  VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    FOREIGN KEY(`nom`,`prenom`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`loisir`) REFERENCES passetemps(`nomhobby`),
    PRIMARY KEY(`nom`,`prenom`,`loisir`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Adoptions

CREATE OR REPLACE TABLE `Adoptions`(
    `animal` VARCHAR(20),
    `prenom` VARCHAR(20),
    `nom`  VARCHAR(20),
    `datedeb` date NOT NULL,
    FOREIGN KEY(`nom`,`prenom`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`animal`) REFERENCES animaux(`nom`),
    PRIMARY KEY(`nom`,`prenom`,`animal`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Emplois Animaliers

CREATE OR REPLACE TABLE `Emplois_Animaliers`(
    `animal` VARCHAR(20),
    `metier` VARCHAR(20),
    `datedeb` date NOT NULL,
    FOREIGN KEY(`animal`) REFERENCES animaux(`nom`),
    FOREIGN KEY(`metier`) REFERENCES metiers(`nommetier`),
    PRIMARY KEY(`animal`,`metier`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Résidences

CREATE OR REPLACE TABLE `Residences`(
    `ville` VARCHAR(20),
    `prenom` VARCHAR(20),
    `nom`  VARCHAR(20),
    `datedeb` date NOT NULL,
    FOREIGN KEY(`nom`,`prenom`) REFERENCES personnes(`nom`,`prenom`),
    FOREIGN KEY(`ville`) REFERENCES villes(`nomville`),
    PRIMARY KEY(`nom`,`prenom`,`ville`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Lignages

CREATE OR REPLACE TABLE `Lignages`(
    `race` VARCHAR(20),
    `espece` VARCHAR(20),
    FOREIGN KEY(`race`) REFERENCES races(`nomrace`),
    FOREIGN KEY(`espece`) REFERENCES especes(`nomespece`),
    PRIMARY KEY(`race`,`espece`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-----------------------------------------------
-- Structure table Localisations

CREATE OR REPLACE TABLE `Localisations`(
    `evenement` VARCHAR(20),
    `zone` INT,
    FOREIGN KEY(`evenement`) REFERENCES evenements(`nomevent`),
    FOREIGN KEY(`zone`) REFERENCES zones(`numzone`),
    PRIMARY KEY(`evenement`,`zone`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-----------------------------------------------
-- Structure table Connexions

CREATE OR REPLACE TABLE `Connexions`(
    `compagnie1` VARCHAR(20),
    `compagnie2` VARCHAR(20),
    `type` VARCHAR(20),
    `datedeb` date NOT NULL,
    `datefin` date,
    FOREIGN KEY(`compagnie1`) REFERENCES compagnies(`nomcomp`),
    FOREIGN KEY(`compagnie2`) REFERENCES compagnies(`nomcomp`),
    PRIMARY KEY(`compagnie1`,`compagnie2`, `type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;