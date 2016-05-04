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
  `User_Name` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES ('Ibra','Cisse','icisse','BigBlack','87706 Washington AV'),('Jason','Jensen','JJensen','Test','78548 Wahsington AV');
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
  `User_Name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('Brown','Harris','bHarris','dF49JR5QHI'),('Baker','Parker','bParker','4H0ygospiC'),('Campbell','Miller','cMiller','rLTs1wMDFe'),('Collins','Rodriguez','cRodriguez','Uz7Q3c6n0s'),('Clark','Wright','cWright','cedP8TMDeq'),('Davis','Martin','dMartin','IJ8RgrLRUO'),('Evans','Moorn','eMoorn','oY3jSdhcew'),('Hall','Adams','hAdams','MOfXDmg9mQ'),('King','Carter','kCarter','7ukTrGVrRH'),('Lewis','Hill','lHill','lKhuCvaBjq'),('Lopez','Perez','lPerez','NSjwCvVtAC'),('Martinez','Hernandez','mHernandez','O3YcnPvW9j'),('Mitchell','Johnson','mJohnson','DdFebCbA2w'),('Nelson','Edwards','nEdwards','AXDUZqKgcR'),('Roberts','Jones','rJones','LT38xN2InH'),('Smith','Anderson','sAnderson','qT1eNTBGYa'),('White','Lee','sLee','o3HO7BjFcW'),('Scott','Turner','sTurner','kibnV0OzR4'),('Thompson','Allen','tAllen','uV2B04I8DH'),('Thomas','Phillips','tPhillilps','Iu3hAaZDJH'),('Taylor','Robinson','tRobinson','6G0oJdYaBN'),('Wilson','Garcia','wGarcia','eI1oKxjtWM'),('Walker','Green','wGreen','opAeVRUxoN'),('Williams','Jackson','wJackson','xJpFsadqBL'),('Young','Gonzalez','yGonzalez','G8O0OmbZsT');
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
-- Temporary table structure for view `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!50001 DROP VIEW IF EXISTS `Rating`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rating` (
  `Generic` tinyint NOT NULL,
  `Rating` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews` (
  `User_Name` varchar(255) DEFAULT NULL,
  `Review` varchar(255) DEFAULT NULL,
  `Generic` varchar(255) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  KEY `User_Name` (`User_Name`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`User_Name`) REFERENCES `Clients` (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES ('sAnderson','This medicine is super awesome for cold.','Pseudoephedrine',10),('cWright','I took this medicine when I had headache, and it helped me out good.','Acetaminophen',9),('mJohnson','This medicine is not for everyone who has issues with gas, but it worked for me.','Esomeprazole',8),('tPhillilps','Had asthma, hate inhalers, but this medicine works really well for me.','Fluticasone',9),('kCarter','Cut myself while working on my yard.  This antibiotic works well for me.','Minocycline',7),('dMartin','My chest Pain are terrible for the most, none of the previous pills worked until this one.','Esomeprazole',9),('wJackson','I always get better sleep with the muscle relaxation rub I get.','Acetaminophen',8),('rJones','Always worked on cars and have muscle pain, but now I have something to releave it.','Acetaminophen',9),('lHill','Demo review!','Diazepam',9);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SideEffects`
--

DROP TABLE IF EXISTS `SideEffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SideEffects` (
  `Generic` varchar(255) DEFAULT NULL,
  `Side_Effect` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SideEffects`
--

LOCK TABLES `SideEffects` WRITE;
/*!40000 ALTER TABLE `SideEffects` DISABLE KEYS */;
INSERT INTO `SideEffects` VALUES ('Pseudoephedrine','Nervousness'),('Pseudoephedrine','Excitability'),('Pseudoephedrine','Dizziness'),('Pseudoephedrine','Insomnia'),('Pseudoephedrine','Stomach pain'),('Pseudoephedrine','Difficulty breathing'),('Pseudoephedrine','Changes in heart rate and activity'),('Esomeprazole','dizziness'),('Esomeprazole','confusion'),('Esomeprazole','fast, uneven heart rate'),('Esomeprazole','jerking muscle movements'),('Esomeprazole','jittery feeling'),('Esomeprazole','diarrhea'),('Esomeprazole','muscle cramps'),('Esomeprazole','muscle weakness'),('Esomeprazole','cough'),('Diazepam','drowsiness'),('Diazepam','dizziness'),('Diazepam','spinning sensation'),('Diazepam','fatigue'),('Diazepam','constipation'),('Diazepam','ataxia'),('Diazepam','memory problems'),('Diazepam','restlessness or irritability'),('Diazepam','muscle weakness'),('Diazepam','nausea'),('Diazepam','drooling or dry mouth'),('Diazepam','slurred speech'),('Diazepam','blurred or double vision'),('Diazepam','skin rash'),('Diazepam','itching'),('Diazepam','loss of interest in sex.'),('Acetaminophen','nausea'),('Acetaminophen','upper stomach pain'),('Acetaminophen','itching'),('Acetaminophen','loss of appetite'),('Minocycline','joint pain'),('Minocycline','muscle pain'),('Cephalexin','diarrhea'),('Cephalexin','dizziness'),('Cephalexin','tiredness'),('Cephalexin','headache'),('Cephalexin','stomach pain'),('Cephalexin','abdominal pain'),('Cephalexin','joint pain'),('Cephalexin','vaginal itching or discharge'),('Cephalexin','nausea/vomiting'),('Cephalexin','itching/swelling'),('Cephalexin','rash'),('Haloperidol','nausea'),('Haloperidol','vomiting'),('Haloperidol','diarrhea'),('Haloperidol','dry mouth'),('Haloperidol','nervousness'),('Haloperidol','headache'),('Haloperidol','dizziness'),('Haloperidol','spinning sensation'),('Haloperidol','drowsiness'),('Aripiprazole','dizziness'),('Aripiprazole','weakness'),('Aripiprazole','lightheadedness'),('Aripiprazole','nausea'),('Aripiprazole','vomiting'),('Aripiprazole','stomach pain'),('Aripiprazole','tiredness'),('Aripiprazole','excess saliva or drooling'),('Aripiprazole','choking or trouble swallowing'),('Aripiprazole','blurred vision'),('Adalimumab','redness'),('Adalimumab','itching'),('Adalimumab','pain'),('Adalimumab','bruising or swelling at the injection site'),('Adalimumab','headache'),('Adalimumab','stuffy nose'),('Adalimumab','sinus pain'),('Adalimumab','or stomach pain'),('Etanercept','redness'),('Etanercept','itching'),('Etanercept','pain'),('Etanercept','swelling at the site of injection'),('Infliximab','infection'),('Infliximab','fever'),('Infliximab','chills'),('Infliximab','flu symptoms'),('Infliximab','confusion'),('Infliximab','pain'),('Infliximab','warmth'),('Infliximab','redness of your skin'),('Fluticasone','severe or ongoing nosebleeds'),('Tiotropium','constipation'),('Tiotropium','upset stomach'),('Tiotropium','vomiting'),('Glargine','Hypoglycemia'),('Sitagliptin','pancreatitis'),('Sitagliptin','severe pain in your upper stomach spreading to your back'),('Sitagliptin','nausea and vomiting'),('Sitagliptin','loss of appetite'),('Sitagliptin','fast heart rate'),('Rosuvastatin','muscle pain'),('Rosuvastatin','muscle tenderness'),('Rosuvastatin','muscle weakness'),('Duloxetine','nausea'),('Duloxetine','upper stomach pain'),('Duloxetine','itching'),('Duloxetine','loss of appetite'),('Duloxetine','dark urine'),('Duloxetine','clay-colored stools'),('Duloxetine','jaundice');
/*!40000 ALTER TABLE `SideEffects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suggestions`
--

DROP TABLE IF EXISTS `Suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suggestions` (
  `User_Name` varchar(255) DEFAULT NULL,
  `Suggestion` varchar(255) DEFAULT NULL,
  KEY `User_Name` (`User_Name`),
  CONSTRAINT `Suggestions_ibfk_1` FOREIGN KEY (`User_Name`) REFERENCES `Clients` (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suggestions`
--

LOCK TABLES `Suggestions` WRITE;
/*!40000 ALTER TABLE `Suggestions` DISABLE KEYS */;
INSERT INTO `Suggestions` VALUES ('sTurner','The medicine for back pain should have a higher ranking.'),('bHarris','can you add medicine for bird flue'),('wGreen','Can you add different antibiotics for cleaning your immune system.'),('sLee','i am curious on some of the ingredients of the meds I am taking. Please list everything'),('lPerez','where the pharmacy at?');
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

--
-- Final view structure for view `Rating`
--

/*!50001 DROP TABLE IF EXISTS `Rating`*/;
/*!50001 DROP VIEW IF EXISTS `Rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Rating` AS select `Medicine`.`Generic` AS `Generic`,ifnull(round(avg(`Reviews`.`Rating`),2),0) AS `Rating` from (`Medicine` left join `Reviews` on((`Medicine`.`Generic` = `Reviews`.`Generic`))) group by `Medicine`.`Generic` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04  8:48:07
