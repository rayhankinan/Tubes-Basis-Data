-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tubes_basdat
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `tubes_basdat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tubes_basdat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tubes_basdat`;

--
-- Table structure for table `batch_vaksin`
--

DROP TABLE IF EXISTS `batch_vaksin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_vaksin` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Jumlah_Tersedia` int(10) unsigned NOT NULL,
  `Jumlah_Terpakai` int(10) unsigned NOT NULL,
  `Tanggal_Kadaluarsa` date NOT NULL,
  `ID_Fasilitas_Kesehatan` int(10) unsigned NOT NULL,
  `ID_Jenis_Vaksin` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Fasilitas_Kesehatan` (`ID_Fasilitas_Kesehatan`),
  KEY `ID_Jenis_Vaksin` (`ID_Jenis_Vaksin`),
  CONSTRAINT `batch_vaksin_ibfk_1` FOREIGN KEY (`ID_Fasilitas_Kesehatan`) REFERENCES `fasilitas_kesehatan` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `batch_vaksin_ibfk_2` FOREIGN KEY (`ID_Jenis_Vaksin`) REFERENCES `jenis_vaksin` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Available` CHECK (`Jumlah_Tersedia` >= `Jumlah_Terpakai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_vaksin`
--

LOCK TABLES `batch_vaksin` WRITE;
/*!40000 ALTER TABLE `batch_vaksin` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_vaksin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_effect`
--

DROP TABLE IF EXISTS `counter_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_effect` (
  `ID_Jenis_Vaksin` int(10) unsigned NOT NULL,
  `ID_Penyakit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID_Jenis_Vaksin`,`ID_Penyakit`),
  KEY `ID_Penyakit` (`ID_Penyakit`),
  CONSTRAINT `counter_effect_ibfk_1` FOREIGN KEY (`ID_Jenis_Vaksin`) REFERENCES `jenis_vaksin` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `counter_effect_ibfk_2` FOREIGN KEY (`ID_Penyakit`) REFERENCES `penyakit` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_effect`
--

LOCK TABLES `counter_effect` WRITE;
/*!40000 ALTER TABLE `counter_effect` DISABLE KEYS */;
INSERT INTO `counter_effect` (`ID_Jenis_Vaksin`, `ID_Penyakit`) VALUES (2,1),(2,2),(2,11),(2,13),(2,25),(2,26),(2,32),(2,40),(2,41),(2,59),(2,68),(2,78),(2,81),(2,82),(2,93),(3,21),(3,22),(3,25),(3,32),(3,37),(3,50),(3,62),(3,65),(3,69),(3,73),(3,79),(3,82),(3,92),(3,93),(4,6),(4,10),(4,15),(4,21),(4,30),(4,42),(4,59),(4,73),(4,76),(5,6),(5,16),(5,32),(5,35),(5,37),(5,38),(5,47),(5,50),(5,51),(5,52),(5,61),(5,67),(5,72),(5,76),(5,87),(5,88),(5,90),(5,93),(5,94),(5,98),(5,100),(6,1),(6,2),(6,13),(6,16),(6,31),(6,38),(6,51),(6,55),(6,59),(6,60),(6,61),(6,65),(6,67),(6,68),(6,80),(6,84),(6,90),(6,92),(6,94),(6,95),(6,100),(7,5),(7,11),(7,14),(7,31),(7,52),(7,54),(7,57),(7,64),(7,70),(7,74),(7,80),(7,86),(7,98),(8,2),(8,6),(8,7),(8,21),(8,24),(8,26),(8,29),(8,36),(8,39),(8,41),(8,44),(8,74),(8,78),(9,5),(9,26),(9,32),(9,35),(9,59),(9,63),(9,66),(9,68),(9,71),(9,78),(9,81),(9,89),(9,93),(9,100),(10,6),(10,7),(10,11),(10,14),(10,31),(10,38),(10,40),(10,50),(10,51),(10,70),(10,74),(10,79),(10,80),(10,82),(10,87),(10,88),(10,89),(10,91),(11,1),(11,10),(11,14),(11,17),(11,18),(11,34),(11,47),(11,48),(11,57),(11,62),(11,63),(11,64),(11,67),(11,84),(11,85),(11,90),(11,95),(11,98),(12,1),(12,2),(12,5),(12,13),(12,15),(12,29),(12,31),(12,34),(12,35),(12,42),(12,51),(12,52),(12,54),(12,55),(12,60),(12,72),(12,77),(12,79),(12,81),(12,84),(12,86),(12,87),(12,89),(12,90),(12,99),(13,5),(13,7),(13,11),(13,21),(13,25),(13,27),(13,35),(13,37),(13,38),(13,40),(13,47),(13,74),(13,75),(13,87),(13,98);
/*!40000 ALTER TABLE `counter_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divaksin`
--

DROP TABLE IF EXISTS `divaksin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divaksin` (
  `NIK` varchar(16) NOT NULL,
  `ID_Batch_Vaksin` int(10) unsigned NOT NULL,
  `Tahap_Vaksin` enum('Vaksin pertama','Vaksin kedua','Vaksin ketiga') NOT NULL,
  `Tanggal_Vaksin` date DEFAULT curdate(),
  PRIMARY KEY (`NIK`,`ID_Batch_Vaksin`),
  KEY `ID_Batch_Vaksin` (`ID_Batch_Vaksin`),
  CONSTRAINT `divaksin_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `penduduk` (`NIK`) ON DELETE CASCADE,
  CONSTRAINT `divaksin_ibfk_2` FOREIGN KEY (`ID_Batch_Vaksin`) REFERENCES `batch_vaksin` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divaksin`
--

LOCK TABLES `divaksin` WRITE;
/*!40000 ALTER TABLE `divaksin` DISABLE KEYS */;
/*!40000 ALTER TABLE `divaksin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_kesehatan`
--

DROP TABLE IF EXISTS `fasilitas_kesehatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_kesehatan` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Kapasitas_Vaksin` int(10) unsigned DEFAULT 0,
  `ID_Kabupaten_Kota` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Kabupaten_Kota` (`ID_Kabupaten_Kota`),
  CONSTRAINT `fasilitas_kesehatan_ibfk_1` FOREIGN KEY (`ID_Kabupaten_Kota`) REFERENCES `kabupaten_kota` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_kesehatan`
--

LOCK TABLES `fasilitas_kesehatan` WRITE;
/*!40000 ALTER TABLE `fasilitas_kesehatan` DISABLE KEYS */;
INSERT INTO `fasilitas_kesehatan` (`ID`, `Nama`, `Kapasitas_Vaksin`, `ID_Kabupaten_Kota`) VALUES (1,'RS Joshua',8720,57),(2,'Klinik Jeffrey',895,75),(3,'Puskesmas Shelby',1755,73),(4,'RS Michael',8990,94),(5,'Klinik Judy',750,54),(6,'RS Chelsea',9285,30),(7,'Klinik Steven',945,12),(8,'Klinik Natalie',515,91),(9,'Puskesmas Emily',805,32),(10,'Puskesmas Cynthia',890,47),(11,'Puskesmas Jennifer',340,71),(12,'Klinik Christopher',330,19),(13,'Puskesmas Andrew',1955,90),(14,'RS Jeremy',5965,13),(15,'Puskesmas Anthony',670,36),(16,'Klinik Candice',50,33),(17,'RS Lisa',7220,82),(18,'Puskesmas Cynthia',2270,44),(19,'RS Elijah',9605,4),(20,'Klinik Sandra',400,60),(21,'Klinik Kayla',745,3),(22,'RS Samantha',655,1),(23,'RS Joseph',8220,44),(24,'RS Holly',4105,86),(25,'Klinik Cynthia',260,9),(26,'Puskesmas Dana',435,80),(27,'Klinik Michelle',585,82),(28,'Klinik Colleen',160,39),(29,'Puskesmas Justin',2030,73),(30,'RS Cynthia',6890,69),(31,'RS Marie',6950,7),(32,'Puskesmas Amanda',2190,90),(33,'Klinik Danielle',260,44),(34,'Klinik James',715,58),(35,'Puskesmas Meagan',75,43),(36,'Klinik Joel',25,100),(37,'Puskesmas Stephanie',2315,12),(38,'RS Amanda',2630,57),(39,'Puskesmas Christopher',835,99),(40,'Puskesmas Thomas',1000,89),(41,'Puskesmas James',2125,54),(42,'Puskesmas David',795,28),(43,'RS Joseph',8335,7),(44,'Klinik Antonio',555,31),(45,'RS Brandon',615,68),(46,'RS Joseph',8655,97),(47,'Klinik Christopher',460,31),(48,'RS Christina',2475,100),(49,'Klinik Aaron',225,42),(50,'RS Matthew',3625,23),(51,'Puskesmas Jane',850,87),(52,'RS Vickie',1515,60),(53,'Puskesmas Carl',725,32),(54,'RS James',7625,81),(55,'Puskesmas Vickie',175,100),(56,'Puskesmas Stephen',500,45),(57,'RS Crystal',4760,16),(58,'Klinik Jill',555,76),(59,'RS Meagan',8535,49),(60,'Puskesmas Austin',2310,100),(61,'Klinik Jeffrey',400,34),(62,'RS Kathy',6715,76),(63,'Puskesmas Kim',1255,2),(64,'Klinik John',905,19),(65,'Puskesmas Andrea',1730,15),(66,'Klinik Kristina',80,2),(67,'RS Mary',6715,21),(68,'RS Alexis',5340,5),(69,'Klinik Jeffery',555,97),(70,'Puskesmas Kelly',2415,48),(71,'Klinik Bradley',250,72),(72,'RS David',2645,26),(73,'RS Mark',9050,63),(74,'Puskesmas Robert',395,50),(75,'RS Eric',7780,20),(76,'RS Misty',2800,58),(77,'Puskesmas Michael',1095,85),(78,'Puskesmas Cheyenne',2385,88),(79,'Klinik Vincent',430,4),(80,'Puskesmas Amy',2420,76),(81,'RS Rebecca',4060,90),(82,'Klinik Scott',530,85),(83,'Klinik Christopher',760,62),(84,'Puskesmas Marie',410,11),(85,'Klinik Jeffrey',970,90),(86,'Puskesmas Rebecca',265,16),(87,'Klinik Eric',215,72),(88,'Puskesmas Ebony',2510,96),(89,'Puskesmas Richard',225,33),(90,'RS Jennifer',6605,28),(91,'Puskesmas Jean',1280,27),(92,'Klinik Jeffery',870,52),(93,'Klinik Abigail',560,55),(94,'Puskesmas Kristine',95,91),(95,'Klinik Douglas',855,87),(96,'RS Corey',8775,64),(97,'Klinik Jill',865,48),(98,'Klinik Jacqueline',275,44),(99,'RS Christopher',2720,65),(100,'Puskesmas John',520,9),(101,'RS Felicia',1965,88),(102,'Puskesmas David',440,52),(103,'Klinik Trevor',275,76),(104,'Puskesmas Bruce',1960,37),(105,'RS Jesus',6325,66),(106,'Puskesmas Ashley',2135,7),(107,'RS Stephen',1240,81),(108,'Klinik Devin',270,32),(109,'Puskesmas Brittany',425,84),(110,'Klinik Jerry',450,22),(111,'Puskesmas Martin',1640,33),(112,'Klinik Christopher',65,65),(113,'Puskesmas Jenny',575,76),(114,'Klinik Jennifer',940,44),(115,'RS Jessica',1870,81),(116,'Puskesmas Jennifer',990,100),(117,'Klinik Shari',350,46),(118,'RS Eric',5495,41),(119,'Puskesmas Gregory',180,33),(120,'Puskesmas Kendra',1135,34),(121,'RS Lisa',5540,11),(122,'Puskesmas Lauren',420,92),(123,'RS Nichole',2360,97),(124,'RS Catherine',7915,15),(125,'Puskesmas Patricia',2145,50),(126,'Klinik Donna',45,45),(127,'RS Michelle',7855,36),(128,'Puskesmas Stephen',2495,70),(129,'Klinik Shannon',825,82),(130,'RS David',5085,55),(131,'Klinik Jose',680,89),(132,'Puskesmas Robert',540,76),(133,'Puskesmas James',230,31),(134,'Puskesmas Jesse',1015,49),(135,'Klinik David',310,7),(136,'Klinik David',115,61),(137,'Klinik Molly',470,84),(138,'Puskesmas Troy',1920,73),(139,'RS Tricia',2910,75),(140,'RS Charles',4095,50),(141,'RS Jessica',9325,62),(142,'Puskesmas Laura',1420,10),(143,'RS Kimberly',7070,74),(144,'Puskesmas Nancy',1780,35),(145,'Puskesmas Christopher',1500,47),(146,'Puskesmas Tabitha',450,100),(147,'Klinik Doris',565,94),(148,'RS Stephanie',6630,92),(149,'Puskesmas Joseph',1590,86),(150,'Klinik Tim',260,73),(151,'Puskesmas Martin',2010,66),(152,'Puskesmas Kimberly',2245,39),(153,'RS Margaret',5855,90),(154,'RS Christopher',6955,64),(155,'Puskesmas Kylie',1475,58),(156,'Klinik Kimberly',860,51),(157,'RS Shelley',5310,44),(158,'Puskesmas Kristin',2375,53),(159,'Puskesmas Sheila',2280,9),(160,'Puskesmas Stephanie',1945,64),(161,'RS Julie',2005,7),(162,'RS Luis',220,24),(163,'Puskesmas Janet',1560,62),(164,'Puskesmas Ashley',1375,47),(165,'Klinik Mathew',100,30),(166,'RS Jonathan',1570,87),(167,'Klinik Gary',410,79),(168,'Puskesmas Mark',1630,75),(169,'Klinik Maria',470,87),(170,'Puskesmas Michael',2135,36),(171,'RS Lucas',5495,65),(172,'Klinik Dakota',860,79),(173,'Klinik Bryce',950,48),(174,'Klinik Michelle',120,27),(175,'Klinik Diana',660,9),(176,'Puskesmas Ashley',95,42),(177,'Puskesmas William',2285,23),(178,'Klinik Kelly',980,68),(179,'Klinik Molly',965,25),(180,'RS William',4645,34),(181,'Klinik Alexandra',310,93),(182,'Klinik Zachary',580,4),(183,'RS Scott',9795,56),(184,'Klinik Pamela',615,15),(185,'RS Lindsay',3610,66),(186,'Klinik Dawn',170,63),(187,'Klinik Timothy',970,25),(188,'Klinik Kenneth',250,66),(189,'Klinik Dylan',965,1),(190,'Puskesmas Linda',455,95),(191,'Puskesmas Jeffrey',235,48),(192,'RS David',5890,22),(193,'Klinik Carl',630,19),(194,'Klinik Amy',880,66),(195,'Puskesmas Yvonne',500,86),(196,'RS Justin',7400,29),(197,'RS Megan',4250,13),(198,'Puskesmas Hunter',455,26),(199,'Klinik Micheal',265,98),(200,'Klinik John',860,94),(201,'Klinik Steven',535,51),(202,'RS James',5075,52),(203,'Klinik Mary',540,5),(204,'Puskesmas Sherri',690,32),(205,'RS Patricia',975,87),(206,'Puskesmas Anthony',195,92),(207,'Puskesmas Sean',380,72),(208,'RS Rebecca',2790,58),(209,'RS Michael',9465,22),(210,'RS James',3935,82),(211,'Puskesmas Amy',525,94),(212,'Puskesmas Antonio',310,26),(213,'Puskesmas Joshua',2120,51),(214,'Klinik Andrea',115,54),(215,'RS Tammie',7760,68),(216,'Puskesmas Vicki',1870,52),(217,'RS Sara',6215,12),(218,'Puskesmas Jason',1975,76),(219,'RS Nicole',8370,38),(220,'Klinik Bryan',145,9),(221,'RS Amber',180,43),(222,'RS Joseph',3220,46),(223,'Klinik Robert',260,19),(224,'Klinik Jeffrey',635,63),(225,'Puskesmas Cynthia',610,81),(226,'RS Amy',8285,63),(227,'Puskesmas Yolanda',245,58),(228,'RS Anthony',3140,93),(229,'Klinik Patricia',330,60),(230,'Puskesmas Tracey',505,71),(231,'Klinik William',115,64),(232,'Klinik Randy',265,93),(233,'RS Michael',6595,80),(234,'Puskesmas Terri',1440,21),(235,'Klinik Jonathan',130,34),(236,'RS Debra',450,19),(237,'Klinik Alexander',395,17),(238,'RS Edward',235,22),(239,'Puskesmas Misty',1545,94),(240,'RS Joseph',7805,51),(241,'Klinik Christie',700,28),(242,'Puskesmas Kevin',625,92),(243,'Klinik Mary',610,61),(244,'RS Jordan',9190,50),(245,'Puskesmas Oscar',1885,48),(246,'Puskesmas Jose',1715,77),(247,'RS Madeline',785,93),(248,'RS Katherine',5975,6),(249,'Klinik David',475,96),(250,'Klinik Devon',870,43);
/*!40000 ALTER TABLE `fasilitas_kesehatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_kesehatan_no_telp`
--

DROP TABLE IF EXISTS `fasilitas_kesehatan_no_telp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_kesehatan_no_telp` (
  `ID` int(10) unsigned NOT NULL,
  `No_Telp` varchar(31) NOT NULL,
  PRIMARY KEY (`ID`,`No_Telp`),
  CONSTRAINT `fasilitas_kesehatan_no_telp_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `fasilitas_kesehatan` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_kesehatan_no_telp`
--

LOCK TABLES `fasilitas_kesehatan_no_telp` WRITE;
/*!40000 ALTER TABLE `fasilitas_kesehatan_no_telp` DISABLE KEYS */;
INSERT INTO `fasilitas_kesehatan_no_telp` (`ID`, `No_Telp`) VALUES (1,'089936318885'),(2,'081370748110'),(2,'082462001474'),(3,'087503817153'),(3,'088690033133'),(4,'082280580549'),(4,'085033195386'),(4,'086805588936'),(5,'085960848859'),(5,'089654735808'),(6,'081695602667'),(6,'084124573495'),(6,'086483270937'),(7,'087372924243'),(8,'083327776942'),(8,'089945893320'),(9,'080768916663'),(9,'082286230078'),(9,'083189468150'),(10,'083421724194'),(11,'084455566595'),(12,'080937709449'),(12,'081795907206'),(13,'084972759022'),(14,'082839615429'),(15,'082383041256'),(15,'086045125571'),(15,'087392492067'),(16,'082815661835'),(16,'088271424283'),(16,'088859939621'),(17,'080204548611'),(17,'081830949873'),(17,'081869954847'),(18,'080753651857'),(18,'082814892764'),(18,'089872745205'),(19,'081423502083'),(19,'084033176150'),(20,'082722390001'),(20,'088588614208'),(21,'084248444806'),(22,'080108764255'),(23,'087044996421'),(24,'082673002806'),(25,'082509766980'),(25,'087923947644'),(26,'080241945082'),(27,'083645973977'),(27,'083807007449'),(27,'085572079212'),(28,'080812157863'),(29,'085472529421'),(30,'088782487578'),(31,'081282386489'),(31,'081536057543'),(32,'081785419728'),(33,'082520144094'),(34,'087513077838'),(35,'080393022984'),(35,'080968925966'),(35,'081720140767'),(36,'080214989760'),(36,'082119131732'),(36,'086242481996'),(37,'083117929366'),(37,'085445977104'),(38,'081509232857'),(38,'083883285256'),(39,'084815058099'),(39,'086481248869'),(40,'083523463554'),(40,'083811785656'),(41,'082600590995'),(41,'087457684659'),(41,'088576124577'),(42,'082630379247'),(42,'082743414759'),(43,'085728387186'),(44,'084828939225'),(44,'087627283024'),(45,'081333170815'),(45,'086932509204'),(45,'088059864569'),(46,'080198433342'),(46,'080236273486'),(47,'084371577755'),(47,'084897674495'),(48,'082508185932'),(48,'084505786642'),(48,'086786073859'),(49,'084266470883'),(49,'086515160211'),(49,'088138052423'),(50,'083447838256'),(50,'083915665392'),(50,'086587193017'),(51,'080476818929'),(51,'088516625428'),(51,'089309282723'),(52,'080331128762'),(52,'084007063331'),(52,'087237439778'),(53,'083861326685'),(53,'086538980427'),(54,'081607032469'),(54,'089916275736'),(55,'082364167866'),(55,'084610478986'),(56,'089015095342'),(57,'080059458445'),(57,'080169702706'),(57,'084905244347'),(58,'083759029966'),(58,'084447115531'),(58,'085280637322'),(59,'080291901045'),(60,'083721331183'),(61,'086241441038'),(61,'087286817838'),(62,'086074798438'),(63,'084129930545'),(63,'087819863649'),(64,'083170695003'),(64,'087659386894'),(65,'085050211714'),(65,'086322972096'),(66,'084161570135'),(66,'084976114069'),(66,'087309270205'),(67,'082250449489'),(67,'082280970427'),(68,'084019958990'),(69,'082037621236'),(69,'083041476063'),(70,'088468993142'),(71,'085528594754'),(72,'087790388866'),(72,'089056679969'),(73,'088011958707'),(74,'080468570559'),(74,'085699993043'),(74,'089049930405'),(75,'086137712315'),(76,'082886848506'),(77,'080004406119'),(77,'081104775460'),(77,'085526472278'),(78,'083561229039'),(78,'084433085190'),(78,'084735154364'),(79,'086882498195'),(79,'088181263035'),(79,'088449816809'),(80,'081249972966'),(80,'083713729256'),(81,'087150084190'),(82,'080293235868'),(82,'087859192334'),(83,'083279970561'),(83,'083927184037'),(84,'083207505491'),(84,'085575529336'),(84,'086806212320'),(85,'087989372954'),(85,'089647287053'),(86,'080828028222'),(87,'083144565165'),(87,'087561297992'),(88,'082474612371'),(88,'085658492952'),(88,'088226921923'),(89,'081308771785'),(89,'084783107177'),(89,'089828220438'),(90,'082941496643'),(90,'084011910929'),(90,'085550041041'),(91,'086004480556'),(91,'087913308532'),(91,'088219404885'),(92,'085103526610'),(92,'087568436203'),(92,'088101627721'),(93,'080590926683'),(94,'087923046698'),(95,'081216589454'),(95,'084971037426'),(95,'088591391168'),(96,'081520329219'),(97,'083390681059'),(97,'084566433932'),(97,'089936536526'),(98,'083002455543'),(98,'088096225837'),(98,'089855422384'),(99,'084152930190'),(100,'083658241096'),(101,'087513819810'),(102,'086219515661'),(103,'083809812891'),(103,'085166984052'),(104,'082789046730'),(104,'087459110093'),(104,'087645522531'),(105,'085663622375'),(105,'085955083058'),(105,'087251712687'),(106,'082990202002'),(107,'080415030669'),(107,'087439704496'),(107,'088159862841'),(108,'081568125188'),(108,'081966785980'),(108,'083773502810'),(109,'082960889862'),(109,'083118629050'),(109,'088732953795'),(110,'081486839277'),(110,'086643723834'),(110,'087300162301'),(111,'089133053729'),(112,'080048501801'),(113,'084161366462'),(114,'081305560602'),(114,'082123570347'),(115,'082119723367'),(115,'084970019658'),(115,'086453916332'),(116,'083849537868'),(117,'084639597857'),(117,'086037397192'),(117,'087193472686'),(118,'080729036890'),(118,'085574774456'),(118,'086504653005'),(119,'085660972294'),(119,'089843591447'),(120,'081562954874'),(120,'087134900033'),(121,'081743104019'),(122,'083137041499'),(123,'081327580005'),(124,'080581963368'),(124,'086055752542'),(124,'087428817137'),(125,'084083185979'),(125,'088380071058'),(125,'089266990154'),(126,'081837211237'),(127,'082138077040'),(127,'083360282303'),(127,'083646400979'),(128,'080620333926'),(129,'080290819661'),(129,'082086357889'),(129,'082616516981'),(130,'081848103228'),(130,'084127904383'),(130,'089682033063'),(131,'084082281629'),(131,'088799452098'),(131,'089124504467'),(132,'086719186021'),(132,'089230491832'),(133,'085278281177'),(134,'081067106826'),(134,'086631479971'),(134,'087356691819'),(135,'081666359912'),(135,'086766375875'),(136,'089464164563'),(137,'089058772542'),(138,'082828573207'),(139,'085307893189'),(140,'082509032169'),(140,'089878270642'),(141,'084740814224'),(141,'086962760748'),(141,'087285448228'),(142,'089404960989'),(143,'085604833583'),(143,'087556341310'),(143,'089669919294'),(144,'080142830133'),(144,'080585288455'),(145,'080463381696'),(145,'084094439945'),(146,'080178257564'),(146,'080929462122'),(146,'082347750035'),(147,'085562015851'),(147,'088606787089'),(148,'085414818355'),(149,'080092238102'),(149,'084103578809'),(149,'085326427418'),(150,'085751064209'),(150,'086685462213'),(150,'087703587758'),(151,'087818001610'),(152,'080507679611'),(153,'085325559906'),(154,'084026466175'),(155,'080300507775'),(155,'087026575763'),(156,'081943472246'),(156,'089432888104'),(157,'084547521881'),(157,'085600745899'),(158,'083254016295'),(158,'087117011960'),(159,'081743328394'),(159,'081906301487'),(159,'085181968855'),(160,'084661374260'),(160,'085283830364'),(161,'082711996066'),(161,'084496407210'),(161,'084497023307'),(162,'080060550354'),(163,'080763791481'),(163,'081923815585'),(164,'084102362412'),(164,'087494007135'),(165,'080242353065'),(165,'080675662420'),(166,'089192926115'),(167,'080816097449'),(167,'084955571978'),(167,'088912820041'),(168,'080761082507'),(168,'081901432867'),(168,'082140861605'),(169,'084592043256'),(170,'089842713471'),(171,'081887042714'),(171,'082248907541'),(171,'088562267434'),(172,'082218702823'),(172,'085522850211'),(172,'089668813642'),(173,'084218565376'),(173,'086113953708'),(174,'081478929701'),(174,'083395047262'),(174,'087601986429'),(175,'081341164128'),(176,'080793471590'),(176,'081125374707'),(176,'081787120731'),(177,'086243526036'),(178,'089356144531'),(179,'086637011966'),(179,'088834905619'),(180,'081842437537'),(180,'083727852745'),(180,'087793842231'),(181,'081536402980'),(181,'083417381268'),(181,'086104648667'),(182,'080820396889'),(182,'083491495106'),(182,'084465733172'),(183,'083324702913'),(183,'089090007322'),(184,'082880577902'),(185,'080542935407'),(186,'085350060796'),(186,'085502317610'),(186,'085868645387'),(187,'084184707252'),(187,'084704829435'),(188,'080808206099'),(188,'081150328944'),(188,'088245428570'),(189,'087295821209'),(190,'088736427286'),(191,'086733885722'),(191,'087318908354'),(192,'081345798555'),(192,'085858018159'),(192,'089190373947'),(193,'081634968262'),(194,'080881850980'),(194,'080907115289'),(194,'085484287768'),(195,'084006152520'),(195,'084207315434'),(195,'084800040389'),(196,'081965516987'),(196,'084138980222'),(197,'086487959812'),(197,'087943828773'),(198,'084272689679'),(199,'084034251370'),(199,'087136246206'),(200,'084080691338'),(200,'086444338043'),(201,'085972345186'),(202,'080417300313'),(202,'080822223263'),(202,'081594201408'),(203,'082787478965'),(203,'088856225374'),(204,'083976626617'),(205,'083695731269'),(205,'086183208713'),(205,'088558546315'),(206,'084218750853'),(206,'085393979815'),(206,'088886910628'),(207,'081770130123'),(208,'086661078395'),(208,'088686920150'),(209,'080926718865'),(209,'086770805348'),(210,'083308293332'),(211,'080766431311'),(212,'088586667134'),(213,'083245293890'),(213,'085956298870'),(214,'086262207616'),(214,'086333880556'),(215,'082327150177'),(215,'087266055181'),(216,'080054601782'),(216,'081473998238'),(217,'080025136479'),(217,'081556820539'),(217,'086261915227'),(218,'082676404030'),(218,'089330570320'),(218,'089933278066'),(219,'086952319553'),(220,'083694081669'),(220,'084418370303'),(220,'084971194031'),(221,'085278024107'),(221,'088367660882'),(222,'081296065323'),(222,'083420105886'),(222,'084419584091'),(223,'080160454189'),(223,'081138650010'),(223,'087180585029'),(224,'089081276009'),(225,'082519021002'),(226,'083274707523'),(226,'086130212072'),(227,'087978926201'),(228,'082215940292'),(228,'085111785883'),(228,'086187603530'),(229,'083376434518'),(230,'081418517025'),(230,'081488154182'),(230,'084437745699'),(231,'082741222635'),(231,'084336383124'),(232,'083352743043'),(232,'087246856770'),(232,'088222202226'),(233,'080306414446'),(233,'087820618709'),(233,'089673377076'),(234,'084844392872'),(234,'089988393905'),(235,'085730401362'),(235,'086756302238'),(235,'087320214670'),(236,'080957369998'),(236,'085682510547'),(236,'086043443351'),(237,'081560409284'),(237,'086715703795'),(237,'088805947436'),(238,'084108479300'),(239,'080757706980'),(239,'085703932125'),(240,'081852071799'),(240,'083039359351'),(240,'087550394728'),(241,'084991062588'),(242,'083278866024'),(242,'088494315170'),(242,'089276318060'),(243,'084102866009'),(243,'086669474336'),(243,'089522956477'),(244,'089529922712'),(245,'085044894129'),(245,'086329916601'),(245,'086692560500'),(246,'080642225146'),(246,'080942556713'),(247,'085025013898'),(247,'085958204733'),(248,'080000576999'),(249,'082279908305'),(249,'086761454451'),(250,'083212629488'),(250,'084210083763'),(250,'085558760612');
/*!40000 ALTER TABLE `fasilitas_kesehatan_no_telp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_vaksin`
--

DROP TABLE IF EXISTS `jenis_vaksin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_vaksin` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Produsen` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_vaksin`
--

LOCK TABLES `jenis_vaksin` WRITE;
/*!40000 ALTER TABLE `jenis_vaksin` DISABLE KEYS */;
INSERT INTO `jenis_vaksin` (`ID`, `Produsen`, `Nama`) VALUES (2,'China','Sinovac'),(3,'Inggris','AstraZeneca'),(4,'China','Sinopharm'),(5,'Amerika Serikat','Moderna'),(6,'Amerika Serikat','Pfizer'),(7,'Amerika Serikat','Novavax'),(8,'Rusia','Sputnik-V'),(9,'Belanda','Janssen'),(10,'China','Convidencia'),(11,'China','Zifivax'),(12,'China','CanSino'),(13,'China','RBD-Dimer');
/*!40000 ALTER TABLE `jenis_vaksin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kabupaten_kota`
--

DROP TABLE IF EXISTS `kabupaten_kota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kabupaten_kota` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `ID_Provinsi` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Provinsi` (`ID_Provinsi`),
  CONSTRAINT `kabupaten_kota_ibfk_1` FOREIGN KEY (`ID_Provinsi`) REFERENCES `provinsi` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kabupaten_kota`
--

LOCK TABLES `kabupaten_kota` WRITE;
/*!40000 ALTER TABLE `kabupaten_kota` DISABLE KEYS */;
INSERT INTO `kabupaten_kota` (`ID`, `Nama`, `ID_Provinsi`) VALUES (1,'Banda Aceh',1),(2,'Langsa',1),(3,'Lhokseumawe',1),(4,'Sabang',1),(5,'Subulussalam',1),(6,'Binjai',2),(7,'Gunungsitoli',2),(8,'Medan',2),(9,'Padang Sidempuan',2),(10,'Pematangsiantar',2),(11,'Sibolga',2),(12,'Tangjungbalai',2),(13,'Tebing Tinggi',2),(14,'Bukittinggi',3),(15,'Padang',3),(16,'Padang Panjang',3),(17,'Pariaman',3),(18,'Payakumbuh',3),(19,'Sawahlunto',3),(20,'Solok',3),(21,'Dumai',4),(22,'Pekanbaru',4),(23,'Jambi',5),(24,'Sungai Penuh',5),(25,'Batam',6),(26,'Tanjung Pinang',6),(27,'Bengkulu',7),(28,'Lubuklinggau',8),(29,'Pagar Alam',8),(30,'Palembang',8),(31,'Prabumulih',8),(32,'Pangkal Pinang',9),(33,'Bandar Lampung',10),(34,'Metro',10),(35,'Cilegon',11),(36,'Serang',11),(37,'Tanggerang Selatan',11),(38,'Tanggerang',11),(39,'Jakarta Barat',12),(40,'Jakarta Pusat',12),(41,'Jakarta Selatan',12),(42,'Jakarta Timur',12),(43,'Jakarta Utara',12),(44,'Bandung',13),(45,'Bandung Barat',13),(46,'Banjar',13),(47,'Bekasi',13),(48,'Bogor',13),(49,'Cimahi',13),(50,'Cirebon',13),(51,'Depok',13),(52,'Sukabumi',13),(53,'Tasikmalaya',13),(54,'Magelang',14),(55,'Pekalongan',14),(56,'Salatiga',14),(57,'Semarang',14),(58,'Surakarta',14),(59,'Tegal',14),(60,'Yogyakarta',15),(61,'Batu',16),(62,'Blitar',16),(63,'Kediri',16),(64,'Madiun',16),(65,'Malang',16),(66,'Mojokerto',16),(67,'Pasuruan',16),(68,'Probolinggo',16),(69,'Surabaya',16),(70,'Denpasar',17),(71,'Bima',18),(72,'Mataram',18),(73,'Kupang',19),(74,'Pontianak',20),(75,'Singkawang',20),(76,'Palangka Raya',21),(77,'Banjarbaru',22),(78,'Banjarmasin',22),(79,'Balikpapan',23),(80,'Bontang',23),(81,'Samarinda',23),(82,'Tarakan',24),(83,'Mamuju',25),(84,'Makassar',26),(85,'Palopo',26),(86,'Parepare',26),(87,'Baubau',27),(88,'Kendari',27),(89,'Palu',28),(90,'Gorontalo',29),(91,'Bitung',30),(92,'Kotamobagu',30),(93,'Manado',30),(94,'Tomohon',30),(95,'Ternate',31),(96,'Tidore',31),(97,'Ambon',32),(98,'Tual',32),(99,'Sorong',33),(100,'Jayapura',34);
/*!40000 ALTER TABLE `kabupaten_kota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klinik`
--

DROP TABLE IF EXISTS `klinik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klinik` (
  `ID` int(10) unsigned NOT NULL,
  `Kelas` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `klinik_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `fasilitas_kesehatan` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klinik`
--

LOCK TABLES `klinik` WRITE;
/*!40000 ALTER TABLE `klinik` DISABLE KEYS */;
/*!40000 ALTER TABLE `klinik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_record`
--

DROP TABLE IF EXISTS `log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_record` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Diterima','Tidak diterima') NOT NULL,
  `ID_Kabupaten_Kota` int(10) unsigned NOT NULL,
  `ID_Batch_Vaksin` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Kabupaten_Kota` (`ID_Kabupaten_Kota`),
  KEY `ID_Batch_Vaksin` (`ID_Batch_Vaksin`),
  CONSTRAINT `log_record_ibfk_1` FOREIGN KEY (`ID_Kabupaten_Kota`) REFERENCES `kabupaten_kota` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `log_record_ibfk_2` FOREIGN KEY (`ID_Batch_Vaksin`) REFERENCES `batch_vaksin` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_record`
--

LOCK TABLES `log_record` WRITE;
/*!40000 ALTER TABLE `log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mengidap`
--

DROP TABLE IF EXISTS `mengidap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mengidap` (
  `ID_Penyakit` int(10) unsigned NOT NULL,
  `NIK` varchar(16) NOT NULL,
  PRIMARY KEY (`ID_Penyakit`,`NIK`),
  KEY `NIK` (`NIK`),
  CONSTRAINT `mengidap_ibfk_1` FOREIGN KEY (`ID_Penyakit`) REFERENCES `penyakit` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `mengidap_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `penduduk` (`NIK`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mengidap`
--

LOCK TABLES `mengidap` WRITE;
/*!40000 ALTER TABLE `mengidap` DISABLE KEYS */;
/*!40000 ALTER TABLE `mengidap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penduduk`
--

DROP TABLE IF EXISTS `penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penduduk` (
  `NIK` varchar(16) NOT NULL,
  `Nama_Depan` varchar(255) NOT NULL,
  `Nama_Belakang` varchar(255) NOT NULL,
  `No_Telp` varchar(31) NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `Pekerjaan` varchar(255) NOT NULL,
  `Kategori` varchar(255) NOT NULL,
  `Status_Vaksinasi` enum('Belum divaksin','Vaksin pertama','Vaksin kedua','Vaksin ketiga') DEFAULT 'Belum divaksin',
  `Tanggal_Lahir` date NOT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penduduk`
--

LOCK TABLES `penduduk` WRITE;
/*!40000 ALTER TABLE `penduduk` DISABLE KEYS */;
/*!40000 ALTER TABLE `penduduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penyakit`
--

DROP TABLE IF EXISTS `penyakit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penyakit` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penyakit`
--

LOCK TABLES `penyakit` WRITE;
/*!40000 ALTER TABLE `penyakit` DISABLE KEYS */;
INSERT INTO `penyakit` (`ID`, `Nama`) VALUES (1,'Influenza'),(2,'TBC'),(3,'Muntaber'),(4,'Cacar Air'),(5,'Tifus'),(6,'Campak'),(7,'Pneumonia'),(8,'Hepatitis'),(9,'Kolera'),(10,'Polio'),(11,'Ebola'),(12,'AIDS'),(13,'DBD'),(14,'Rabies'),(15,'Kurap'),(16,'Malaria'),(17,'Cacingan'),(18,'Titanus'),(19,'SARS'),(20,'Rubella'),(21,'Flu Burung'),(22,'Chikungunya'),(23,'Demam Kuning'),(24,'Anthrax'),(25,'Leptospirosis'),(26,'Abses Paru'),(27,'Abses Gigi'),(28,'ADHD'),(29,'Amnesia'),(30,'Anemia'),(31,'Asma'),(32,'Bronkitis'),(33,'Depresi'),(34,'Difteri'),(35,'Diabetes'),(36,'Diare'),(37,'Beri-Beri'),(38,'Disentri'),(39,'Eksem'),(40,'Epilepsi'),(41,'Filariasis'),(42,'Fraktur Humerus'),(43,'Gagal Ginjal'),(44,'Gagal Jantung'),(45,'Hipotiroid'),(46,'Gastroparesis'),(47,'Hernia'),(48,'Herpes'),(49,'Hipertensi'),(50,'Hiperteroid'),(51,'Askariasis'),(52,'Ileus'),(53,'Entrobiasis'),(54,'Infertilitas'),(55,'Jamur Kuku'),(56,'Jamur Kepala'),(57,'Leukimia'),(58,'Katarak'),(59,'Kanker Paru'),(60,'Kanker Ovarium'),(61,'Kanker Serviks'),(62,'Hemofilia'),(63,'Gonorrhea'),(64,'Kudis'),(65,'Kista'),(66,'Labirintis'),(67,'Migrain'),(68,'Mastitis'),(69,'Panu'),(70,'Varises'),(71,'GERD'),(72,'Demensia'),(73,'Glaukoma'),(74,'Parkinson'),(75,'Pleuritis'),(76,'Pilek'),(77,'Batuk'),(78,'Pankreatitis'),(79,'Gastritis'),(80,'Miopia'),(81,'Bronkiolitis'),(82,'Prostatitis'),(83,'Viral Meningitis'),(84,'Sariawan'),(85,'Maag'),(86,'Sifilis'),(87,'Sinusitis'),(88,'Astigmatisme'),(89,'Tumor'),(90,'Apendisitis'),(91,'Volvulus'),(92,'Vaginitis'),(93,'Wasir'),(94,'Xanthelasma'),(95,'Faringitis'),(96,'Hipermetropia'),(97,'Gingivitis'),(98,'Ruptur Ginjal'),(99,'Carpal Tunnel'),(100,'ACL');
/*!40000 ALTER TABLE `penyakit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinsi`
--

DROP TABLE IF EXISTS `provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinsi` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinsi`
--

LOCK TABLES `provinsi` WRITE;
/*!40000 ALTER TABLE `provinsi` DISABLE KEYS */;
INSERT INTO `provinsi` (`ID`, `Nama`) VALUES (1,'Aceh'),(2,'Sumatra Utara'),(3,'Sumatra Barat'),(4,'Riau'),(5,'Jambi'),(6,'Kepulauan Riau'),(7,'Bengkulu'),(8,'Sumatra Selatan'),(9,'Kepulauan Bangka Belitung'),(10,'Lampung'),(11,'Banten'),(12,'DKI Jakarta'),(13,'Jawa Barat'),(14,'Jawa Tengah'),(15,'DI Yogyakarta'),(16,'Jawa Timur'),(17,'Bali'),(18,'NTB'),(19,'NTT'),(20,'Kalimantan Barat'),(21,'Kalimantan Tengah'),(22,'Kalimantan Selatan'),(23,'Kalimantan Timur'),(24,'Kalimantan Utara'),(25,'Sulawesi Barat'),(26,'Sulawesi Selatan'),(27,'Sulawesi Tenggara'),(28,'Sulawesi Tengah'),(29,'Gorontalo'),(30,'Sulawesi Utara'),(31,'Maluku Utara'),(32,'Maluku'),(33,'Papua Barat'),(34,'Papua');
/*!40000 ALTER TABLE `provinsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puskesmas`
--

DROP TABLE IF EXISTS `puskesmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puskesmas` (
  `ID` int(10) unsigned NOT NULL,
  `IsRawatInap` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `puskesmas_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `fasilitas_kesehatan` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puskesmas`
--

LOCK TABLES `puskesmas` WRITE;
/*!40000 ALTER TABLE `puskesmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `puskesmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rumah_sakit`
--

DROP TABLE IF EXISTS `rumah_sakit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rumah_sakit` (
  `ID` int(10) unsigned NOT NULL,
  `Kepemilikkan` enum('Negeri','Swasta') NOT NULL,
  `Kelas` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `rumah_sakit_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `fasilitas_kesehatan` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rumah_sakit`
--

LOCK TABLES `rumah_sakit` WRITE;
/*!40000 ALTER TABLE `rumah_sakit` DISABLE KEYS */;
/*!40000 ALTER TABLE `rumah_sakit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07 21:26:47
