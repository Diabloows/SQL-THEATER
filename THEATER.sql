CREATE DATABASE IF NOT EXISTS theater SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE CINEMA(
   Id_CINEMA INT NOT NULL AUTO_INCREMENT,
   NOM_CINEMA VARCHAR(50),
   ADRESSE_P VARCHAR(150),
   PRIMARY KEY(Id_CINEMA)
) ENGINE=InnoDB;

CREATE TABLE CLIENT(
   Id_CLIENT INT NOT NULL AUTO_INCREMENT,
   PRENOM VARCHAR(50) NOT NULL,
   NOM VARCHAR(50) NOT NULL,
   MAIL VARCHAR(50) NOT NULL,
   MDP VARCHAR(200) NOT NULL,
   HISTORIQUE VARCHAR(50),
   ADRESSE VARCHAR(50),
   Id_CINEMA INT NOT NULL,
   PRIMARY KEY(Id_CLIENT),
   FOREIGN KEY(Id_CINEMA) REFERENCES CINEMA(Id_CINEMA)
) ENGINE=InnoDB;

CREATE TABLE FILMS(
   Id_FILMS INT NOT NULL AUTO_INCREMENT,
   TITRE VARCHAR(50),
   CATEGORIE VARCHAR(50),
   DUREE INT,
   PRIMARY KEY(Id_FILMS)
) ENGINE=InnoDB;

CREATE TABLE RESERVATIONS(
   Id_RESERVATIONS INT NOT NULL AUTO_INCREMENT,
   HEURE_RESA DATETIME NOT NULL,
   NUMERO_DE_PLACE INT NOT NULL,
   PRIX FLOAT NOT NULL,
   Id_CLIENT INT NOT NULL,
   PRIMARY KEY(Id_RESERVATIONS),
   FOREIGN KEY(Id_CLIENT) REFERENCES CLIENT(Id_CLIENT)
) ENGINE=InnoDB;

CREATE TABLE SEANCES(
   Id_SEANCES INT NOT NULL AUTO_INCREMENT,
   HORAIRES DATETIME,
   NUMERO_DE_SALLE INT(50),
   Id_FILMS INT NOT NULL,
   PRIMARY KEY (Id_SEANCES),
   FOREIGN KEY(Id_FILMS) REFERENCES FILMS(Id_FILMS)
) ENGINE=InnoDB;

CREATE TABLE SALLES(
   Id_SALLES INT NOT NULL AUTO_INCREMENT,
   NB_DE_PLACES INT NOT NULL,
   Id_SEANCES INT,
   PRIMARY KEY(Id_SALLES),
   FOREIGN KEY(Id_SEANCES) REFERENCES SEANCES(Id_SEANCES)
) ENGINE=InnoDB;

CREATE TABLE TARIFS(
   Id_TARIFS INT NOT NULL AUTO_INCREMENT,
   TARIF FLOAT NOT NULL,
   SYNOPSIS VARCHAR(50) NOT NULL,
   PRIMARY KEY (Id_TARIFS) 
) ENGINE=InnoDB;

insert into CINEMA (NOM_CINEMA, ADRESSE_P) values ('CGR LILLE', '9903 Chinook Alley');
insert into CINEMA (NOM_CINEMA, ADRESSE_P) values ('CGR TOULOUSE', '08 Spaight Way');
insert into CINEMA (NOM_CINEMA, ADRESSE_P) values ('CGR BORDEAUX', '926 Tennessee Hill');
insert into CINEMA (NOM_CINEMA, ADRESSE_P) values ('CGR LYON', '11959 Everett Court');
insert into CINEMA (NOM_CINEMA, ADRESSE_P) values ('CGR STAUGUSTIN', '6834 Grayhawk Place');

insert into CLIENT (Id_CINEMA, PRENOM, NOM, MAIL, MDP,  HISTORIQUE, ADRESSE) values (1,'Cody', 'Vida', 'cvida0@forbes.com', '$2y$10$2SnNfO7GmpngCZsjnZmUc.1VpAOAUKS53HM4hJpVuo3YdtES8Q4oK', 'None', '9182 Ridgeview Plaza');
insert into CLIENT (Id_CINEMA, PRENOM, NOM, MAIL, MDP,  HISTORIQUE, ADRESSE) values (2,'Jammal', 'Ronci', 'jronci1@domainmarket.com', '$2y$10$TeB5B/IqeFbEyu.s3FQ5Q.lNbt2QgGKF8hP7X/3YI3kHPC69aJ5M2', 'None', '437 Northport Trail');
insert into CLIENT (Id_CINEMA, PRENOM, NOM, MAIL, MDP,  HISTORIQUE, ADRESSE) values (3,'Whitney', 'Prettyman', 'wprettyman2@wikia.com', '$2y$10$zIR.B0iWf6y39rmZ8/QIjeUZ50a7e839bsf79gnaKCZyhuhNxOhce', 'None', '33 Veith Street');
insert into CLIENT (Id_CINEMA, PRENOM, NOM, MAIL, MDP,  HISTORIQUE, ADRESSE) values (4,'Irwin', 'Geeritz', 'igeeritz3@topsy.com', '$2y$10$L.M5nXPDpHQnXJdSJStt9eA7MKYvHxRRWAUaYJilo3HyNO9e1MPY.', 'None', '71 Stephen Hill');
insert into CLIENT (Id_CINEMA, PRENOM, NOM, MAIL, MDP,  HISTORIQUE, ADRESSE) values (5,'Gusti', 'Costock', 'gcostock4@cyberchimps.com', '$2y$10$j9.cNVxeCi1GszAXKhCivOydTxyMh8MuW.sfYXwaMQLTEMEshuH8u', 'None', '598 Esch Court');

insert into FILMS (TITRE, CATEGORIE, DUREE) values ('Selfish Giant, The', 'Drama', 2);
insert into FILMS (TITRE, CATEGORIE, DUREE) values ('Mr. Nice', 'Comedy|Drama', 2);
insert into FILMS (TITRE, CATEGORIE, DUREE) values ('Land of the Pharaohs', 'Drama', 3);
insert into FILMS (TITRE, CATEGORIE, DUREE) values ('Lisbon Story', 'Drama', 3);
insert into FILMS (TITRE, CATEGORIE, DUREE) values ('Podwórka', 'Documentary', 2);

insert into RESERVATIONS (Id_CLIENT, HEURE_RESA, NUMERO_DE_PLACE, PRIX) values (1,'2021-09-15 14:00:00', 1, 9.20);
insert into RESERVATIONS (Id_CLIENT, HEURE_RESA, NUMERO_DE_PLACE, PRIX) values (2,'2021-09-15 10:50:00', 2, 7.60);
insert into RESERVATIONS (Id_CLIENT, HEURE_RESA, NUMERO_DE_PLACE, PRIX) values (3,'2021-09-15 12:50:00', 3, 5.90);
insert into RESERVATIONS (Id_CLIENT, HEURE_RESA, NUMERO_DE_PLACE, PRIX) values (4,'2021-09-15 13:30:00', 4, 9.20);
insert into RESERVATIONS (Id_CLIENT, HEURE_RESA, NUMERO_DE_PLACE, PRIX) values (5,'2021-09-15 09:30:00', 5, 9.20);

insert into SEANCES (Id_FILMS, HORAIRES, NUMERO_DE_SALLE) values (1,'2021-09-15 14:00:00', 1);
insert into SEANCES (Id_FILMS, HORAIRES, NUMERO_DE_SALLE) values (2,'2021-09-15 10:50:00', 2);
insert into SEANCES (Id_FILMS, HORAIRES, NUMERO_DE_SALLE) values (3,'2021-09-15 12:50:00', 3);
insert into SEANCES (Id_FILMS, HORAIRES, NUMERO_DE_SALLE) values (4,'2021-09-15 13:30:00', 4);
insert into SEANCES (Id_FILMS, HORAIRES, NUMERO_DE_SALLE) values (5,'2021-09-15 09:30:00', 5);

insert into SALLES (Id_SEANCES, NB_DE_PLACES) values (1,150);
insert into SALLES (Id_SEANCES, NB_DE_PLACES) values (2,49);
insert into SALLES (Id_SEANCES, NB_DE_PLACES) values (3,49);
insert into SALLES (Id_SEANCES, NB_DE_PLACES) values (4,100);
insert into SALLES (Id_SEANCES, NB_DE_PLACES) values (5,150);

insert into TARIFS (TARIF, SYNOPSIS) values (9.20, 'PLEIN TARIF');
insert into TARIFS (TARIF, SYNOPSIS) values (7.60, 'ETUDIANT');
insert into TARIFS (TARIF, SYNOPSIS) values (5.90, 'MOINS DE 14ANS');

CREATE USER 'admin'@'localhost' IDENTIFIED BY '$2y$10$MCEYU57NNuSPWEURSgVlr.8QmRu7MkRt6Vn3od/SnPCM.p4EySOSe';
CREATE USER 'lambda'@'localhost' IDENTIFIED BY '$2y$10$ZrhgJiGQZ2/fy1rOyJK56ekYVzYgpfjW/NeCtKXp13J/rTv./3wF.';

GRANT ALL ON theater.* TO 'admin'@'localhost'
GRANT SELECT ON theater.* TO 'lambda'@'localhost'

/* pour sauvegarder toutes les bases de données*/
'mysqldump --user=mon_user --password=mon_password --all-databases > fichier_destination.sql'

or 

'mysqldump --user=mon_user --password=mon_password --databases nom_de_la_base > fichier_destination.sql'

/* puis pour restaure on utilise la commande */
'mysql --user=mon_user --password=mon_password < fichier_source.sql'