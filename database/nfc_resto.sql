-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: nfc_resto
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Selecting DataBase
--

USE nfc_resto;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `Horodatage` varchar(45) NOT NULL,
  `T_idTables` int(11) NOT NULL,
  `U_idUsers` int(11) NOT NULL,
  `detail` varchar(125) NOT NULL,
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCommande`),
  KEY `fk_Commandes_Users1_idx` (`U_idUsers`),
  KEY `fk_Commandes_Tables1_idx` (`T_idTables`),
  CONSTRAINT `fk_Commandes_Tables1` FOREIGN KEY (`T_idTables`) REFERENCES `tables` (`idTables`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commandes_Users1` FOREIGN KEY (`U_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plats`
--

DROP TABLE IF EXISTS `plats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plats` (
  `nom` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `T_idTarif` int(11) NOT NULL,
  `idPlat` int(11) NOT NULL AUTO_INCREMENT,
  `idType_Plat` int(11) NOT NULL,
  PRIMARY KEY (`idPlat`),
  KEY `fk_Plats_Tarif1_idx` (`T_idTarif`),
  KEY `idType_Plat_idx` (`idType_Plat`),
  CONSTRAINT `fk_Plats_Tarif1` FOREIGN KEY (`T_idTarif`) REFERENCES `tarif` (`idTarif`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plats`
--

LOCK TABLES `plats` WRITE;
/*!40000 ALTER TABLE `plats` DISABLE KEYS */;
INSERT INTO `plats` VALUES ('Salade Niçoise','Tomates thon comcombres olives','https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Salade_ni%C3%A7oise_001.jpg/280px-Salade_ni%C3%A7oise_001.jpg',1,2,1),('Hamburger','Boeuf fromage frites','https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Cheeseburger_maison_2.jpg/220px-Cheeseburger_maison_2.jpg',2,3,2),('Tarte aux citron','Confis de citron crème légère','https://fr.wikipedia.org/wiki/Tarte_au_citron#/media/File:Tarte_au_citron_05.jpg',1,4,3),('Jus de citrons','Verre de 20 cl glaçon,rondelle de citron','https://files.meilleurduchef.com/mdc/photo/produit/met/jus-citron-vert/jus-citron-vert-1-400.jpg',6,5,4),('Penne à la bolognaise','Viande haché poivron carotte piment','http://vignette4.wikia.nocookie.net/recipes/images/e/ef/Penne_Arabiatta_(Pasta_with_a_Spicy_Sauce).jpg/revision/latest?cb=20080516004731',4,6,2),('Crêpes Nutella','Crêpes chaudes nappé de sauce au choco Nutella','http://recipegeek.com/sites/default/files/styles/large/public/cover_photos/recipe_crepes_with_chocolate_ganache.jpg?itok=ABEnqtRF',1,7,3),('Omlette aux fromages','Fromage fondue persil noix de muscade','https://fr.wikipedia.org/wiki/Omelette#/media/File:FoodOmelete.jpg',1,8,1),('CocaCola','Verre de 20 cl glaçon ','http://pharmaciehoteldeville.fr/wp-content/uploads/2015/11/coca-cola.jpg',6,9,4),('Boga','Verre de 20 cl glaçon','http://i2.cdscdn.com/pdt2/0/2/2/1/700x700/mo646447022/rw/boga-cidre-soda-1-5l.jpg',6,10,4),('Caviare','Oeuf de poisson d\'hiver à l\'huile de tournesol','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Caviar_and_spoon.jpg/220px-Caviar_and_spoon.jpg',4,11,1);
/*!40000 ALTER TABLE `plats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `idTables` int(11) NOT NULL,
  `guid` varchar(200) NOT NULL,
  PRIMARY KEY (`idTables`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarif` (
  `idTarif` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` varchar(45) DEFAULT NULL,
  `date_fin` varchar(45) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`idTarif`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,'05/11/2017','05/11/2020',0.25,5),(2,'05/11/2017','05/11/2020',0.25,6),(3,'05/11/2017','05/11/2020',0.25,7),(4,'05/11/2017','05/11/2020',0.25,8),(5,NULL,NULL,NULL,2.5),(6,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_plat`
--

DROP TABLE IF EXISTS `type_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_plat` (
  `idType_Plat` int(11) NOT NULL AUTO_INCREMENT,
  `NomTypePlats` varchar(250) NOT NULL,
  PRIMARY KEY (`idType_Plat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_plat`
--

LOCK TABLES `type_plat` WRITE;
/*!40000 ALTER TABLE `type_plat` DISABLE KEYS */;
INSERT INTO `type_plat` VALUES (1,'Entrees'),(2,'Plats'),(3,'Desserts'),(4,'Boissons');
/*!40000 ALTER TABLE `type_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `noTel` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'And','Roid','1122','1122');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-15 21:46:38