/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Gestion_Com
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `CATEGORIE`
--

DROP TABLE IF EXISTS `CATEGORIE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIE` (
  `Code_cat` char(5) NOT NULL,
  `Libelle_cat` varchar(30) NOT NULL,
  PRIMARY KEY (`Code_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIE`
--

LOCK TABLES `CATEGORIE` WRITE;
/*!40000 ALTER TABLE `CATEGORIE` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `CATEGORIE` VALUES
('Biere','Biere'),
('Brico','Outils de bricolage'),
('ELECM','Electro-menager'),
('FROMG','Fromagerie'),
('PATES','Pates alimentaires'),
('VEST','Vestimentaire'),
('Vinsp','Vins et Spiriteux');
/*!40000 ALTER TABLE `CATEGORIE` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `Id_clt` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  `Prenoms` varchar(30) NOT NULL,
  `Adresse` varchar(60) NOT NULL,
  `Telephone` char(14) DEFAULT NULL,
  PRIMARY KEY (`Id_clt`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `CLIENT` VALUES
(1,'KODJA','Ami','70, Boulevard','90000001'),
(2,'KALIFA','MIA','71, Boulevard','90000002'),
(3,'KODI','Amira','72, Boulevard','90000003'),
(4,'KORA','Eve','73, Boulevard','90000004'),
(5,'AVATAR','Hang','74, Boulevard','90000005'),
(6,'SEIGNEUR','ZOUKO','75, Boulevard','90000006'),
(7,'GENERALE','LEE','76, Boulevard','90000007'),
(8,'LIEUTENENT','KOUVIRA','77, Boulevard','90000008'),
(9,'INVENT','VARIK','78, Boulevard','90000009'),
(10,'AMEL','BENT','79, Boulevard','90000010');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `COMMANDE`
--

DROP TABLE IF EXISTS `COMMANDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDE` (
  `Id_cde` int NOT NULL AUTO_INCREMENT,
  `Date_cde` date NOT NULL,
  `Id_clt` int NOT NULL,
  PRIMARY KEY (`Id_cde`),
  KEY `Id_clt` (`Id_clt`),
  CONSTRAINT `COMMANDE_ibfk_1` FOREIGN KEY (`Id_clt`) REFERENCES `CLIENT` (`Id_clt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDE`
--

LOCK TABLES `COMMANDE` WRITE;
/*!40000 ALTER TABLE `COMMANDE` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `COMMANDE` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `DETAIL_COM`
--

DROP TABLE IF EXISTS `DETAIL_COM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DETAIL_COM` (
  `Id_cde` int NOT NULL,
  `Id_prod` int NOT NULL,
  `Qte_cte` int NOT NULL,
  PRIMARY KEY (`Id_cde`,`Id_prod`),
  KEY `Id_prod` (`Id_prod`),
  CONSTRAINT `DETAIL_COM_ibfk_1` FOREIGN KEY (`Id_cde`) REFERENCES `COMMANDE` (`Id_cde`),
  CONSTRAINT `DETAIL_COM_ibfk_2` FOREIGN KEY (`Id_prod`) REFERENCES `PRODUIT` (`Id_prod`),
  CONSTRAINT `DETAIL_COM_chk_1` CHECK ((`Qte_cte` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETAIL_COM`
--

LOCK TABLES `DETAIL_COM` WRITE;
/*!40000 ALTER TABLE `DETAIL_COM` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `DETAIL_COM` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sortie_Stock` AFTER INSERT ON `DETAIL_COM` FOR EACH ROW BEGIN
	Declare Qte_dispo INT; 
	select Qte_stock into Qte_dispo
	from PRODUIT
	where Id_prod = New.Id_prod;
	
	if new.Qte_cte > Qte_dispo Then
	SIGNAL SQLSTATE '45000'
	set MESSAGE_TEXT='Stock insuffisant : la quantite disponible est inferieur a la quantite commandee';
	else
		UPdate PRODUIT
		SET Qte_stock = Qte_stock - New.Qte_cte
		WHERE Id_prod = New.Id_prod;
	
END if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `FOURNISSEUR`
--

DROP TABLE IF EXISTS `FOURNISSEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOURNISSEUR` (
  `Id_four` int NOT NULL AUTO_INCREMENT,
  `Nom_four` varchar(60) NOT NULL,
  `Adresse_four` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Id_four`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOURNISSEUR`
--

LOCK TABLES `FOURNISSEUR` WRITE;
/*!40000 ALTER TABLE `FOURNISSEUR` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `FOURNISSEUR` VALUES
(1,'ETS Ibrahim & Fils','13, Rue du Commerce'),
(2,'ETS La Foi','14, Rue du Commerce'),
(3,'ETS La Gloire','15, Rue du Commerce'),
(4,'ETS Ibra','16, Rue du Commerce'),
(5,'ETS Mahtma','17, Rue du Commerce'),
(6,'ETS Lou & Fils','18, Rue du Commerce'),
(7,'ETS Aubrey','19, Rue du Commerce'),
(8,'ETS Laura','20, Rue du Commerce'),
(9,'ETS Clara','21, Rue du Commerce'),
(10,'ETS Lune','22, Rue du Commerce');
/*!40000 ALTER TABLE `FOURNISSEUR` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `LIVRAISON`
--

DROP TABLE IF EXISTS `LIVRAISON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVRAISON` (
  `Id_livre` int NOT NULL AUTO_INCREMENT,
  `Id_four` int NOT NULL,
  `Id_prod` int NOT NULL,
  `Date_livre` date NOT NULL,
  `Qte_livre` int NOT NULL,
  `Prix_livre` float NOT NULL,
  `Delai` int NOT NULL,
  PRIMARY KEY (`Id_livre`,`Id_four`,`Id_prod`),
  KEY `Id_four` (`Id_four`),
  KEY `Id_prod` (`Id_prod`),
  CONSTRAINT `LIVRAISON_ibfk_1` FOREIGN KEY (`Id_four`) REFERENCES `FOURNISSEUR` (`Id_four`),
  CONSTRAINT `LIVRAISON_ibfk_2` FOREIGN KEY (`Id_prod`) REFERENCES `PRODUIT` (`Id_prod`),
  CONSTRAINT `LIVRAISON_chk_1` CHECK ((`Qte_livre` >= 0)),
  CONSTRAINT `LIVRAISON_chk_2` CHECK ((`Prix_livre` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVRAISON`
--

LOCK TABLES `LIVRAISON` WRITE;
/*!40000 ALTER TABLE `LIVRAISON` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `LIVRAISON` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Entree_Stock` AFTER INSERT ON `LIVRAISON` FOR EACH ROW Begin
	UPDATE PRODUIT
	SET Qte_stock=Qte_stock + New.Qte_livre,
	Prix_invent = CASE
		when new.Prix_livre Between 100 and 10000
		then Prix_livre * (1+ 0.3)
		when new.Prix_livre Between 10001 and 50000
		then Prix_livre * (1+ 0.2)
		when new.Prix_livre Between 50001 and 200000
		then Prix_livre * (1+ 0.15)
		when new.Prix_livre Between 200001 and 1000000
		then Prix_livre * (1+ 0.1)
		else new.Prix_livre * (1+ 0.05)
	END
	WHERE Id_prod = NEW.Id_prod;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PRODUIT`
--

DROP TABLE IF EXISTS `PRODUIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUIT` (
  `Id_prod` int NOT NULL AUTO_INCREMENT,
  `Qte_stock` int NOT NULL DEFAULT '0',
  `Prix_invent` int NOT NULL DEFAULT '0',
  `Code_cat` char(5) NOT NULL,
  `Libelle_prod` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_prod`),
  KEY `Code_cat` (`Code_cat`),
  CONSTRAINT `PRODUIT_ibfk_1` FOREIGN KEY (`Code_cat`) REFERENCES `CATEGORIE` (`Code_cat`),
  CONSTRAINT `PRODUIT_chk_1` CHECK ((`Qte_stock` >= 0)),
  CONSTRAINT `PRODUIT_chk_2` CHECK ((`Prix_invent` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUIT`
--

LOCK TABLES `PRODUIT` WRITE;
/*!40000 ALTER TABLE `PRODUIT` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PRODUIT` VALUES
(1,0,0,'PATES','Riz Thai 50kg'),
(2,0,0,'PATES','Riz Thai 25kg'),
(3,0,0,'Vinsp','Vin Rouge RLG'),
(4,0,0,'Vinsp','Vin Blanc Moileux'),
(6,0,0,'PATES','Spageti mamam'),
(7,0,0,'ELECM','Machine a lave'),
(8,0,0,'FROMG','Gruerre'),
(9,0,0,'Brico','Marteaux'),
(10,0,0,'Biere','Biere Brune');
/*!40000 ALTER TABLE `PRODUIT` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-12-14 14:35:14
