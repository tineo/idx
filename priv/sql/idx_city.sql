-- MySQL dump 10.13  Distrib 5.6.35, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: wb2
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.10.1

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
-- Table structure for table `idx_city`
--

DROP TABLE IF EXISTS `idx_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `lat` decimal(12,7) NOT NULL,
  `lng` decimal(12,7) NOT NULL,
  `custom_filter` text NOT NULL,
  `view_qsearch` tinyint(1) NOT NULL,
  `view_advanced_search` tinyint(1) NOT NULL,
  `view_map` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_city`
--

LOCK TABLES `idx_city` WRITE;
/*!40000 ALTER TABLE `idx_city` DISABLE KEYS */;
INSERT INTO `idx_city` VALUES (1,'Atlantis','',0.0000000,0.0000000,'',0,0,0),(2,'Aventura','',25.9564819,-80.1392136,'',1,1,1),(3,'Bal Harbour','',25.8917618,-80.1269913,'',1,1,1),(4,'Bay Harbor Islands','',0.0000000,0.0000000,'',0,0,0),(5,'Belle Glade','',0.0000000,0.0000000,'',0,0,0),(6,'Biscayne Gardens','',0.0000000,0.0000000,'',0,0,0),(7,'Biscayne Park','',0.0000000,0.0000000,'',0,0,0),(8,'Boca Raton','',0.0000000,0.0000000,'',0,0,0),(9,'Boynton Beach','',0.0000000,0.0000000,'',0,0,0),(10,'Cloud Lake','',0.0000000,0.0000000,'',0,0,0),(11,'Coconut Creek','',0.0000000,0.0000000,'',0,0,0),(12,'Coconut Grove','',25.7114391,-80.2531357,'',1,1,1),(13,'Cooper City','',26.1277008,-80.2331543,'',1,1,1),(14,'Coral Gables','',25.7214909,-80.2683868,'',1,1,1),(15,'Coral Springs','',26.2711920,-80.2706040,'',1,1,1),(16,'Cutler Bay','',0.0000000,0.0000000,'',0,0,0),(17,'Dania','',0.0000000,0.0000000,'',0,0,0),(18,'Davie','',25.9777985,-80.2867126,'',1,1,1),(19,'Deerfield Beach','',0.0000000,0.0000000,'',0,0,0),(20,'Delray Beach','',0.0000000,0.0000000,'',0,0,0),(21,'Doral','',0.0000000,0.0000000,'',0,0,0),(22,'Eastern Shores','',0.0000000,0.0000000,'',0,0,0),(23,'El Portal','',0.0000000,0.0000000,'',0,0,0),(24,'Fellsmere','',0.0000000,0.0000000,'',0,0,0),(25,'Fisher Island','',25.7609329,-80.1400452,'',1,1,1),(26,'Florida City','',0.0000000,0.0000000,'',0,0,0),(27,'Fort Lauderdale','',0.0000000,0.0000000,'',1,1,1),(28,'Fort Pierce','',0.0000000,0.0000000,'',0,0,0),(29,'Golden Beach','',25.9650917,-80.1222687,'',1,1,1),(30,'Goulds','',0.0000000,0.0000000,'',0,0,0),(31,'Green Acres','',0.0000000,0.0000000,'',0,0,0),(32,'Hallandale','',25.9812012,-80.1483765,'',1,1,1),(33,'Hialeah','',0.0000000,0.0000000,'',0,0,0),(34,'Hialeah Gardens','',0.0000000,0.0000000,'',0,0,0),(35,'Highland Beach','',0.0000000,0.0000000,'',0,0,0),(36,'Hillsboro Beach','',0.0000000,0.0000000,'',0,0,0),(37,'Hobe Sound','',0.0000000,0.0000000,'',0,0,0),(38,'Hollywood','',26.0112019,-80.1494904,'',1,1,1),(39,'Homestead','',0.0000000,0.0000000,'',0,0,0),(40,'Hutchinson Island','',0.0000000,0.0000000,'',0,0,0),(41,'Hypoluxo','',0.0000000,0.0000000,'',0,0,0),(42,'Indian Creek','',25.8780613,-80.1366806,'',1,1,1),(44,'Islands/Caribbean','',0.0000000,0.0000000,'',0,0,0),(45,'Jensen Beach','',0.0000000,0.0000000,'',0,0,0),(46,'Juno Beach','',0.0000000,0.0000000,'',0,0,0),(47,'Jupiter','',0.0000000,0.0000000,'',0,0,0),(48,'Kendall','',0.0000000,0.0000000,'',0,0,0),(49,'Key Biscayne','',25.6937122,-80.1628265,'',1,1,1),(50,'Lake Park','',0.0000000,0.0000000,'',0,0,0),(51,'Lakeworth','',0.0000000,0.0000000,'',0,0,0),(52,'Lantana','',0.0000000,0.0000000,'',0,0,0),(53,'Lauderdale By The','',0.0000000,0.0000000,'',0,0,0),(54,'Lauderdale Lakes','',0.0000000,0.0000000,'',0,0,0),(55,'Lauderhill','',0.0000000,0.0000000,'',0,0,0),(56,'Lighthouse Point','',0.0000000,0.0000000,'',0,0,0),(57,'Loxahatchee','',0.0000000,0.0000000,'',0,0,0),(58,'Manalapan','',0.0000000,0.0000000,'',0,0,0),(59,'Margate','',0.0000000,0.0000000,'',0,0,0),(60,'Medley','',0.0000000,0.0000000,'',0,0,0),(61,'Miami','',25.7889690,-80.2264404,'',1,1,1),(62,'Miami Beach','',25.7937164,-80.1352081,'',1,1,1),(63,'Miami Gardens','',0.0000000,0.0000000,'',0,0,0),(64,'Miami Lakes','',0.0000000,0.0000000,'',0,0,0),(65,'Miami Shores','',25.8631516,-80.1928253,'',1,1,1),(66,'Miami Springs','',0.0000000,0.0000000,'',0,0,0),(67,'MIAMILKS','',0.0000000,0.0000000,'',0,0,0),(68,'Miramar','',26.1014957,-80.3998337,'',1,1,1),(69,'Naranja','',0.0000000,0.0000000,'',0,0,0),(70,'North Bay Village','',25.8462067,-80.1539383,'',1,1,1),(71,'North Lauderdale','',0.0000000,0.0000000,'',0,0,0),(72,'North Miami','',25.8900948,-80.1867142,'',1,1,1),(73,'North Miami Beach','',25.9331493,-80.1625443,'',0,0,0),(74,'North Palm Beach','',0.0000000,0.0000000,'',0,0,0),(75,'Oakland Park','',0.0000000,0.0000000,'',0,0,0),(76,'Opa-Locka','',0.0000000,0.0000000,'',0,0,0),(82,'Pahokee','',0.0000000,0.0000000,'',0,0,0),(83,'Palm Beach','',0.0000000,0.0000000,'',0,0,0),(84,'Palm Beach Gardens','',0.0000000,0.0000000,'',0,0,0),(85,'Palm Springs','',0.0000000,0.0000000,'',0,0,0),(86,'Palmetto Bay','',0.0000000,0.0000000,'',0,0,0),(87,'Parkland','',0.0000000,0.0000000,'',0,0,0),(88,'Pembroke Park','',0.0000000,0.0000000,'',0,0,0),(89,'Pembroke Pines','',26.0651093,-80.2331543,'',1,1,1),(90,'Perrine','',0.0000000,0.0000000,'',0,0,0),(91,'Pinecrest','',25.6622829,-80.3070374,'',1,1,1),(92,'Plantation','',26.0123615,-80.3152084,'',1,1,1),(93,'Pomp Bch','',0.0000000,0.0000000,'',0,0,0),(94,'Pompano Beach','',0.0000000,0.0000000,'',1,1,1),(95,'Port St. Lucie','',0.0000000,0.0000000,'',0,0,0),(96,'Riviera Beach','',0.0000000,0.0000000,'',0,0,0),(97,'Royal Palm Beach','',0.0000000,0.0000000,'',0,0,0),(98,'Saint Lucie West','',0.0000000,0.0000000,'',0,0,0),(99,'Sebastian','',0.0000000,0.0000000,'',0,0,0),(100,'Singer Island','',0.0000000,0.0000000,'',0,0,0),(101,'South Bay','',0.0000000,0.0000000,'',0,0,0),(102,'South Miami','',0.0000000,0.0000000,'',0,0,0),(103,'South Palm Beach','',0.0000000,0.0000000,'',0,0,0),(104,'Southwest Ranches','',0.0000000,0.0000000,'',0,0,0),(105,'Stuart','',0.0000000,0.0000000,'',0,0,0),(106,'Sunny Isles Beach','',25.9428711,-80.1233826,'',1,1,1),(107,'Sunrise','',0.0000000,0.0000000,'',0,0,0),(108,'Surfside','',25.8784275,-80.1256027,'',1,1,1),(109,'Sweetwater','',0.0000000,0.0000000,'',0,0,0),(111,'Tequesta','',0.0000000,0.0000000,'',0,0,0),(115,'Vero Beach','',0.0000000,0.0000000,'',0,0,0),(117,'Virginia Gardens','',0.0000000,0.0000000,'',0,0,0),(118,'Wellington','',0.0000000,0.0000000,'',0,0,0),(119,'West Miami','',0.0000000,0.0000000,'',0,0,0),(120,'West Palm Beach','',0.0000000,0.0000000,'',0,0,0),(121,'West Park','',0.0000000,0.0000000,'',0,0,0),(144,'Brickell','',25.7580032,-80.1930542,'zip regexp \\&quot;33129|33130|33131\\&quot;',1,1,1),(145,'Brickell Key','',25.7675230,-80.1854140,'st_name REGEXP \\&quot;BRICKELL KEY\\&quot;',1,1,1),(146,'weston','',0.0000000,0.0000000,'',0,0,0),(147,'tamarac','',0.0000000,0.0000000,'',0,0,0),(148,'other city - keys/islands/caribbean','',0.0000000,0.0000000,'',0,0,0),(149,'dania beach','',0.0000000,0.0000000,'',0,0,0),(150,'wilton manors','',0.0000000,0.0000000,'',0,0,0),(151,'other city - in the state of florida','',0.0000000,0.0000000,'',0,0,0),(152,'unincorporated dade county','',0.0000000,0.0000000,'',0,0,0),(153,'other county - not in usa','',0.0000000,0.0000000,'',0,0,0),(154,'other city value - out of area','',0.0000000,0.0000000,'',0,0,0),(155,'other city - not in the state of florida','',0.0000000,0.0000000,'',0,0,0),(156,'lauderdale by the sea','',0.0000000,0.0000000,'',0,0,0),(157,'gulfview','',0.0000000,0.0000000,'',0,0,0),(158,'sea ranch lakes','',0.0000000,0.0000000,'',0,0,0),(159,'palm city','',0.0000000,0.0000000,'',0,0,0),(160,'indian town','',0.0000000,0.0000000,'',0,0,0),(161,'haverhill','',0.0000000,0.0000000,'',0,0,0),(162,'Clewiston','',0.0000000,0.0000000,'',0,0,0),(163,'un-incorporated broward county','',0.0000000,0.0000000,'',0,0,0),(164,'un - incorporated pb county','',0.0000000,0.0000000,'',0,0,0),(165,'canal point','',0.0000000,0.0000000,'',0,0,0),(166,'palm beach shores','',0.0000000,0.0000000,'',0,0,0),(167,'gulfstream','',0.0000000,0.0000000,'',0,0,0),(168,'sewalls point','',0.0000000,0.0000000,'',0,0,0),(169,'mangonia park','',0.0000000,0.0000000,'',0,0,0),(170,'tropic','',0.0000000,0.0000000,'',0,0,0),(171,'ocean ridge','',0.0000000,0.0000000,'',0,0,0),(172,'indian river shores','',0.0000000,0.0000000,'',0,0,0),(173,'briny breezes','',0.0000000,0.0000000,'',0,0,0),(174,'williams island','',0.0000000,0.0000000,'',0,0,0),(175,'lake clarke shores','',0.0000000,0.0000000,'',0,0,0),(176,'okeechob','',0.0000000,0.0000000,'',0,0,0),(177,'crandon park','',0.0000000,0.0000000,'',0,0,0),(178,'winter beach','',0.0000000,0.0000000,'',0,0,0),(179,'jupiter inlet colony','',0.0000000,0.0000000,'',0,0,0),(180,'virginia key','',0.0000000,0.0000000,'',0,0,0),(181,'Gifford','',0.0000000,0.0000000,'',0,0,0),(182,'Lake Worth','',0.0000000,0.0000000,'',0,0,0),(183,'Lakewood Park ','',0.0000000,0.0000000,'',0,0,0),(184,'Pennsuco','',0.0000000,0.0000000,'',0,0,0),(185,'Lazy Lake','',0.0000000,0.0000000,'',0,0,0),(186,'Indiantown','',0.0000000,0.0000000,'',0,0,0),(187,'Port Saint Lucie','',0.0000000,0.0000000,'',0,0,0),(188,'Unincorporated Broward County','',0.0000000,0.0000000,'',0,0,0),(189,'Wabasso','',0.0000000,0.0000000,'',0,0,0);
/*!40000 ALTER TABLE `idx_city` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-15 12:54:56
