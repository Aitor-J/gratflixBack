 -- -----------------------------------------------------
 -- Database gratflix
 -- -----------------------------------------------------
 DROP DATABASE IF EXISTS `gratflix`;
 CREATE DATABASE `gratflix`;
 USE `gratflix`;

 DROP TABLE IF EXISTS `types`;
 DROP TABLE IF EXISTS `movies`;
 DROP TABLE IF EXISTS `users`;

 -- -----------------------------------------------------
 -- Table `Types`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `types` (
   `id` INT NOT NULL PRIMARY KEY,
   `name` VARCHAR(50) NOT NULL
 ) ENGINE = InnoDB;

-- -----------------------------------------------------
 -- Table `Movies`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(50) NOT NULL,
   `cover`VARCHAR(150) NOT NULL,
   `trailer` VARCHAR(150) NOT NULL,
   `year` VARCHAR(50) NOT NULL,
   `director` VARCHAR(100) NOT NULL,
   `length` VARCHAR(50) NOT NULL,
   `idType` INT NOT NULL,
   CONSTRAINT `fk_movies_types` FOREIGN KEY (`idType`) REFERENCES `types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;

-- -----------------------------------------------------
 -- Table `users`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
   `id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
   `firstName` VARCHAR(250) NOT NULL,
   `lastName` VARCHAR(250) NOT NULL,
   `userName` VARCHAR(150) NOT NULL,
   `email` VARCHAR(150) NOT NULL,
   `hashedPassword` VARCHAR(250) NOT NULL,
   `admin` BOOLEAN NOT NULL
 ) ENGINE = InnoDB;

-- -----------------------------------------------------
 -- INSERT INTO TABLES
 -- -----------------------------------------------------

 -- -----------------------------------------------------
 -- Table `types`
 -- -----------------------------------------------------
 INSERT INTO
 types (
 id, name
 )
VALUES
((1), ('Action')), 
((2),('Science Fiction')),
((3), ('Thriller')), 
((4),('Horror')),
((5), ('Animated')), 
((6), ('Comedy'));
 
-- -----------------------------------------------------
 -- Table `movies`
 -- -----------------------------------------------------
 INSERT INTO
 movies (
 name, cover, trailer, year, director, length, idType
)
VALUES
( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5)),
( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5)),

 ( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5)),

 ( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5)),
( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5)),

 ( ('THE CONJURING'),
 ('https://moviecovers.com/DATA/zipcache/CONJURING%20%20LES%20DOSSIERS%20WARREN%20(2013).jpg'),('https://www.youtube.com/watch?v=McOmzgX09wo'),
 ('2013'), ('James WAN'), ('1H52'), (4)),

 ( ('ALIEN'),
 ('https://moviecovers.com/DATA/zipcache/ALIEN.jpg'),
 ('https://www.youtube.com/watch?v=o_rfh8wBnGE'),
 ('1979'), ('Ridley SCOTT'), ('1H57'), (4)),

 ( ('INTERSTELLAR'),
 ('https://moviecovers.com/DATA/zipcache/INTERSTELLAR%20(2014).jpg'),
 ('https://www.youtube.com/watch?v=VaOijhK3CRU'),
 ('2014'), ('Christopher NOLAN'), ('2H49'), (2)),

 ( ('BACK TO THE FUTURE PART III'),
 ('https://moviecovers.com/DATA/zipcache/RETOUR%20VERS%20LE%20FUTUR%203.jpg'),
 ('https://www.youtube.com/watch?v=GZlnASpsHHk'),
 ('1990'), ('Robert ZEMECKIS'), ('1H58'), (2)),

 ( ('THE TRANSPORTER'),
 ('https://moviecovers.com/DATA/zipcache/LE%20TRANSPORTEUR.jpg'),
 ('https://www.youtube.com/watch?v=CxMDrew0INA'),
 ('2002'), ('Louis LETERRIER'), ('1H32'), (1)),

 ( ("OSS 117 : LE CAIE NID D'ESPIONS"),
 ('https://moviecovers.com/DATA/zipcache/OSS%20117%20LE%20CAIRE%20NID%20D%27%20ESPIONS.jpg'),
 ('https://www.youtube.com/watch?v=I0aviu-FqNo'),
 ('2006'), ('Michel HAZANAVICIUS'), ('1H39'), (6)),

 ( ('MEMENTO'),
 ('https://moviecovers.com/DATA/zipcache/MEMENTO.jpg'),
 ('https://www.youtube.com/watch?v=rX7nZxY8OFk'),
 ('2000'), ('Christopher NOLAN'), ('1H53'), (3)),
 
 ( ('TOY STORY'),
 ('https://moviecovers.com/DATA/zipcache/TOY%20STORY.jpg'),
 ('https://www.youtube.com/watch?v=YzuUSdxoGUU'),
 ('1995'), ('John LASSETER'), ('1H21'), (5));
 
 
 
-- -----------------------------------------------------
 -- Table `users`
 -- -----------------------------------------------------
INSERT INTO
 users (
   firstName,
   lastName,
   userName,
   email,
   hashedPassword,
   admin
 )
VALUES
(
 ('Grat'),
 ('Flix'),
 ('Gratflix'),
 ('gratflix@gmail.com'),
 ('gratgrat'), (1));
 