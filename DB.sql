-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DB
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `Admins`
--

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admins` (
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `User_Name` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES ('Ibra','Cisse','icisse','BigBlack','87706 Washington AV'),('Jason','Jensen','JJensen','WhiteAndNerdy','78548 Wahsington AV');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `User_Name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipCode` varchar(5) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('Smith','Anderson','sAnderson','qT1eNTBGYa','742 Broadway New Philadelphia','OH','44663','M'),('Clark','Wright','cWright','cedP8TMDeq','532 Highland Avenue Port Jefferson Station','NY','11776','M'),('Mitchell','Johnson','mJohnson','DdFebCbA2w','970 Valley Drive Miami Gardens','FL','33056','M'),('Thomas','Phillips','tPhillilps','Iu3hAaZDJH','901 7th Street Peoria','IL','61604','M'),('Taylor','Robinson','tRobinson','6G0oJdYaBN','788 Route 5 Muskegon','MI','49445','M'),('King','Carter','kCarter','7ukTrGVrRH','592 Valley Drive Dorchester','MA','02125','M'),('Collins','Rodriguez','cRodriguez','Uz7Q3c6n0s','111 Orchard Street Staten Island','NY','10305','F'),('Davis','Martin','dMartin','IJ8RgrLRUO','623 Route 70 Akron','OH','44312','M'),('Hall','Adams','hAdams','MOfXDmg9mQ','100 Broad Street Kent','OH','44240','M'),('Campbell','Miller','cMiller','rLTs1wMDFe','633 Lafayette Street Leland','NC','28451','M'),('Thompson','Allen','tAllen','uV2B04I8DH','926 Briarwood Court Easley','SC','29640','M'),('Baker','Parker','bParker','4H0ygospiC','547 Devon Court Trenton','NJ','08610','M'),('Wilson','Garcia','wGarcia','eI1oKxjtWM','315 Route 32 Stratford','CT','06614','F'),('Young','Gonzalez','yGonzalez','G8O0OmbZsT','34 Sycamore Drive Cottage Grove','MN','55016','M'),('Evans','Moorn','eMoorn','oY3jSdhcew','800 Harrison Street Cranford','NJ','07016','M'),('Martinez','Hernandez','mHernandez','O3YcnPvW9j','578 High Street Spartanburg','SC','29301','M'),('Nelson','Edwards','nEdwards','AXDUZqKgcR','287 West Avenue Orange','NJ','07050','M'),('Lopez','Perez','lPerez','NSjwCvVtAC','888 Berkshire Drive Lakeville','MN','55044','F'),('Williams','Jackson','wJackson','xJpFsadqBL','389 Fairview Avenue Bettendorf','IA','52722','F'),('Lewis','Hill','lHill','lKhuCvaBjq','652 Country Club Road Anderson','SC','29621','M'),('Roberts','Jones','rJones','LT38xN2InH','526 Lexington Drive Baldwin','NY','11510','M'),('White','Lee','sLee','o3HO7BjFcW','818 Highland Avenue Shelbyville','TN','37160','M'),('Scott','Turner','sTurner','kibnV0OzR4','65 Hilltop Road Evansville','IN','47711','M'),('Brown','Harris','bHarris','dF49JR5QHI','865 Canal Street Tullahoma','TN','37388','M'),('Walker','Green','wGreen','opAeVRUxoN','360 Academy Street Ponte Vedra Beach','FL','32082','F');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicine` (
  `Generic` varchar(255) DEFAULT NULL,
  `Brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicine`
--

LOCK TABLES `Medicine` WRITE;
/*!40000 ALTER TABLE `Medicine` DISABLE KEYS */;
INSERT INTO `Medicine` VALUES ('Pseudoephedrine','Chlor Trimeton Nasal Decongestant'),('Pseudoephedrine','Contac Cold'),('Pseudoephedrine','Drixoral Decongestant Non-Drowsy'),('Pseudoephedrine','Elixsure Decongestant'),('Pseudoephedrine','Entex'),('Pseudoephedrine','Genaphed'),('Pseudoephedrine','Kid Kare Drops'),('Pseudoephedrine','Nasofed'),('Pseudoephedrine','Seudotabs'),('Pseudoephedrine','Silfedrine'),('Pseudoephedrine','Sudafed'),('Pseudoephedrine','Sudafed 12-Hour'),('Pseudoephedrine','Sudafed 24-Hour'),('Pseudoephedrine','Sudafed Children\'s Nasal Decongestant'),('Pseudoephedrine','Sudodrin'),('Pseudoephedrine','SudoGest'),('Pseudoephedrine','SudoGest 12 Hour'),('Pseudoephedrine','Suphedrin'),('Pseudoephedrine','Triaminic Softchews Allergy Congestion'),('Pseudoephedrine','Unifed'),('Esomeprazole','Esomeprazole Strontium'),('Esomeprazole','NexIUM'),('Diazepam','VALIUM'),('Acetaminophen','Actamin'),('Acetaminophen','Apra'),('Acetaminophen','Mapap'),('Acetaminophen','Q-Pap'),('Acetaminophen','Tactinal'),('Acetaminophen','Tempra'),('Acetaminophen','Tycolene'),('Acetaminophen','Tylenol'),('Acetaminophen','Vitapap'),('Minocycline','Dynacin'),('Minocycline','Minocin'),('Minocycline','Minocin PAC'),('Minocycline','Solodyn'),('Minocycline','Vectrin'),('Minocycline','Myrac'),('Haloperidol','Haldol'),('Cephalexin','Keflex'),('Cephalexin','Panixine'),('Cephalexin','Biocef'),('Cephalexin','Zartan'),('Aripiprazole','Abilify'),('Aripiprazole','Abilify Discmelt'),('Aripiprazole','Abilify Maintena'),('Aripiprazole','Aristada'),('Adalimumab','Humira'),('Adalimumab','Humira Pen'),('Adalimumab','Humira Pen Crohns Disease/Ulcerative Colitis Starter Package'),('Adalimumab','Humira Pen Psoriasis Starter Package'),('Adalimumab','Humira Pediatric'),('Adalimumab','Humira Pediatric Crohn\'s Disease Starter Pack'),('Rosuvastatin','Crestor'),('Fluticasone','Advair Diskus'),('Fluticasone','Advair HFA'),('Etanercept','Enbrel'),('Etanercept','Enbrel Prefilled Syringe'),('Etanercept','Enbrel SureClick'),('Infliximab','Remicade'),('Infliximab','Inflectra'),('Duloxetine','Cymbalta'),('Duloxetine','Irenka'),('Insulin Glargine','Basaglar KwikPen'),('Insulin Glargine','Lantus'),('Insulin Glargine','Lantus Solostar Pen'),('Insulin Glargine','Toujeo SoloStar'),('Insulin Glargine','Lantus OptiClik Cartridge'),('Tiotropium','Spiriva'),('Tiotropium','Spiriva Respimat 14 Dose'),('Tiotropium','Spiriva Respimat 30 Dose'),('Tiotropium','Spiriva Respimat 28'),('Tiotropium','Spiriva Respimat'),('Sitagliptin','Januvia');
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ranking`
--

DROP TABLE IF EXISTS `Ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ranking` (
  `Generic` varchar(255) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ranking`
--

LOCK TABLES `Ranking` WRITE;
/*!40000 ALTER TABLE `Ranking` DISABLE KEYS */;
INSERT INTO `Ranking` VALUES ('Pseudoephedrine',8),('Esomeprazole',5),('Diazepam',6),('Acetaminophen',9),('Minocycline',6),('Haloperidol',8),('Cephalexin',9),('Aripiprazole',10),('Adalimumab',7),('Rosuvastatin',6),('Fluticasone',9),('Etanercept',7),('Infliximab',4),('Duloxetine',5),('Insulin Glargine',6),('Tiotropium',7),('Sitagliptin',6);
/*!40000 ALTER TABLE `Ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews` (
  `User_Name` varchar(255) DEFAULT NULL,
  `Review` varchar(255) DEFAULT NULL,
  `Generic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suggestions`
--

DROP TABLE IF EXISTS `Suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suggestions` (
  `User_Name` varchar(255) DEFAULT NULL,
  `Suggestion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suggestions`
--

LOCK TABLES `Suggestions` WRITE;
/*!40000 ALTER TABLE `Suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Symptoms`
--

DROP TABLE IF EXISTS `Symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Symptoms` (
  `Symptom` varchar(255) DEFAULT NULL,
  `Generic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Symptoms`
--

LOCK TABLES `Symptoms` WRITE;
/*!40000 ALTER TABLE `Symptoms` DISABLE KEYS */;
INSERT INTO `Symptoms` VALUES ('cold','Pseudoephedrine'),('heartburn','Esomeprazole'),('anxiety','Diazepam'),('pain relief','Acetaminophen'),('fever reducer','Acetaminophen'),('antibiotic','Minocycline'),('antibiotic','Cephalexin'),('antipsychotic','Haloperidol'),('antipsychotic','Aripiprazole'),('arthritis','Adalimumab'),('arthritis','Etanercept'),('arthritis','Infliximab'),('asthma','Fluticasone'),('asthma','Tiotropium'),('diabetes','Insulin Glargine'),('diabetes','Sitagliptin'),('cholesterol','Rosuvastatin'),('depression','Duloxetine');
/*!40000 ALTER TABLE `Symptoms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-02  7:06:24
