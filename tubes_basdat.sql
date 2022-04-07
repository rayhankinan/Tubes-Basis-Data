-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tubes_basdat
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-1

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
INSERT INTO `divaksin` (`NIK`, `ID_Batch_Vaksin`, `Tahap_Vaksin`, `Tanggal_Vaksin`) VALUES 
		(3326164909000099, 1, Vaksin kedua, '2021-10-12'),   
                (3326164909000017, 46, Vaksin kedua, '2020-11-23'),  
                (3326164909000077, 20, Vaksin kedua, '2021-10-21'),  
                (3326164909000070, 24, Vaksin kedua, '2019-06-17'),  
                (3326164909000095, 50, Vaksin ketiga, '2021-08-28'), 
                (3326164909000055, 15, Vaksin pertama, '2021-04-16'),
                (3326164909000004, 61, Vaksin pertama, '2021-06-28'),
                (3326164909000065, 56, Vaksin ketiga, '2020-02-12'), 
                (3326164909000083, 20, Vaksin ketiga, '2019-12-25'),
                (3326164909000090, 60, Vaksin kedua, '2019-07-07'),
                (3326164909000090, 7, Vaksin pertama, '2021-07-02'),
                (3326164909000050, 67, Vaksin ketiga, '2019-04-25'),
                (3326164909000044, 10, Vaksin kedua, '2019-05-27'),
                (3326164909000059, 23, Vaksin kedua, '2021-05-07'),
                (3326164909000052, 37, Vaksin kedua, '2020-10-28'),
                (3326164909000036, 51, Vaksin ketiga, '2020-06-07'),
                (3326164909000002, 96, Vaksin kedua, '2019-07-05'),
                (3326164909000070, 46, Vaksin ketiga, '2021-05-06'),
                (3326164909000031, 9, Vaksin pertama, '2021-05-23'),
                (3326164909000045, 23, Vaksin kedua, '2020-05-10'),
                (3326164909000099, 66, Vaksin kedua, '2021-10-04'),
                (3326164909000086, 45, Vaksin kedua, '2021-03-16'),
                (3326164909000037, 63, Vaksin ketiga, '2020-10-10'),
                (3326164909000083, 77, Vaksin kedua, '2021-08-18'),
                (3326164909000048, 70, Vaksin ketiga, '2019-07-25'),
                (3326164909000033, 9, Vaksin ketiga, '2021-07-19'),
                (3326164909000048, 16, Vaksin ketiga, '2021-05-25'),
                (3326164909000099, 89, Vaksin kedua, '2021-05-15'),
                (3326164909000073, 30, Vaksin ketiga, '2020-08-02'),
                (3326164909000014, 66, Vaksin ketiga, '2020-04-27'),
                (3326164909000019, 33, Vaksin ketiga, '2020-02-21'),
                (3326164909000054, 58, Vaksin kedua, '2019-01-21'),
                (3326164909000093, 26, Vaksin pertama, '2020-10-22'),
                (3326164909000100, 29, Vaksin kedua, '2019-12-25'),
                (3326164909000053, 57, Vaksin kedua, '2019-12-11'),
                (3326164909000028, 39, Vaksin pertama, '2019-10-11'),
                (3326164909000040, 10, Vaksin kedua, '2021-03-07'),
                (3326164909000073, 18, Vaksin ketiga, '2021-07-03'),
                (3326164909000081, 48, Vaksin kedua, '2021-07-26'),
                (3326164909000055, 47, Vaksin kedua, '2020-11-13'),
                (3326164909000082, 24, Vaksin ketiga, '2021-02-17'),
                (3326164909000034, 73, Vaksin pertama, '2020-07-21'),
                (3326164909000020, 78, Vaksin pertama, '2021-02-01'),
                (3326164909000071, 48, Vaksin ketiga, '2020-02-18'),
                (3326164909000038, 87, Vaksin kedua, '2021-12-20'),
                (3326164909000072, 81, Vaksin kedua, '2021-07-11'),
                (3326164909000081, 59, Vaksin pertama, '2020-08-18'),
                (3326164909000025, 43, Vaksin ketiga, '2020-03-05'),
                (3326164909000093, 2, Vaksin kedua, '2021-03-26'),
                (3326164909000036, 23, Vaksin kedua, '2019-09-09'),
                (3326164909000004, 44, Vaksin kedua, '2019-03-16'),
                (3326164909000094, 15, Vaksin pertama, '2020-04-27'),
                (3326164909000058, 92, Vaksin pertama, '2019-05-03'),
                (3326164909000089, 31, Vaksin ketiga, '2019-01-10'),
                (3326164909000087, 24, Vaksin kedua, '2019-09-11'),
                (3326164909000048, 47, Vaksin kedua, '2019-11-12'),
                (3326164909000044, 49, Vaksin kedua, '2020-10-20'),
                (3326164909000065, 71, Vaksin ketiga, '2020-11-12'),
                (3326164909000014, 60, Vaksin kedua, '2021-07-26'),
                (3326164909000055, 1, Vaksin pertama, '2020-01-06'),
                (3326164909000072, 66, Vaksin ketiga, '2021-01-24'),
                (3326164909000014, 96, Vaksin kedua, '2019-12-17'),
                (3326164909000031, 75, Vaksin ketiga, '2020-09-24'),
                (3326164909000073, 14, Vaksin pertama, '2020-05-12'),
                (3326164909000013, 23, Vaksin kedua, '2020-06-14'),
                (3326164909000060, 82, Vaksin ketiga, '2020-11-21'),
                (3326164909000057, 49, Vaksin kedua, '2021-12-03'),
                (3326164909000066, 51, Vaksin pertama, '2020-06-16'),
                (3326164909000098, 29, Vaksin kedua, '2021-01-24'),
                (3326164909000021, 71, Vaksin ketiga, '2019-02-25'),
                (3326164909000035, 35, Vaksin ketiga, '2020-09-07'),
                (3326164909000018, 64, Vaksin pertama, '2019-07-17'),
                (3326164909000061, 83, Vaksin ketiga, '2019-03-03'),
                (3326164909000093, 50, Vaksin pertama, '2020-05-19'),
                (3326164909000050, 27, Vaksin kedua, '2020-11-11'),
                (3326164909000049, 65, Vaksin pertama, '2021-01-14'),
                (3326164909000072, 16, Vaksin ketiga, '2019-04-22'),
                (3326164909000025, 31, Vaksin ketiga, '2021-12-23'),
                (3326164909000051, 60, Vaksin pertama, '2021-01-07'),
                (3326164909000045, 71, Vaksin kedua, '2019-05-24'),
                (3326164909000093, 72, Vaksin ketiga, '2020-08-08'),
                (3326164909000059, 24, Vaksin kedua, '2020-06-03'),
                (3326164909000091, 94, Vaksin pertama, '2021-06-22'),
                (3326164909000097, 70, Vaksin ketiga, '2021-11-20'),
                (3326164909000092, 28, Vaksin ketiga, '2020-12-26'),
                (3326164909000058, 51, Vaksin pertama, '2021-10-11'),
                (3326164909000004, 96, Vaksin pertama, '2019-08-02'),
                (3326164909000001, 26, Vaksin pertama, '2020-04-20'),
                (3326164909000061, 67, Vaksin pertama, '2020-10-25'),
                (3326164909000085, 9, Vaksin pertama, '2020-08-08'),
                (3326164909000082, 20, Vaksin ketiga, '2021-07-04'),
                (3326164909000075, 93, Vaksin pertama, '2021-03-04'),
                (3326164909000094, 16, Vaksin ketiga, '2021-02-12'),
                (3326164909000018, 21, Vaksin kedua, '2021-09-20'),
                (3326164909000006, 42, Vaksin kedua, '2019-07-15'),
                (3326164909000094, 65, Vaksin ketiga, '2020-05-28'),
                (3326164909000030, 58, Vaksin ketiga, '2019-10-27'),
                (3326164909000048, 80, Vaksin kedua, '2019-07-12'),
                (3326164909000077, 84, Vaksin ketiga, '2019-03-13'),
                (3326164909000053, 54, Vaksin ketiga, '2019-11-26');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_kesehatan`
--

LOCK TABLES `fasilitas_kesehatan` WRITE;
/*!40000 ALTER TABLE `fasilitas_kesehatan` DISABLE KEYS */;
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
INSERT INTO `jenis_vaksin` VALUES (2,'China','Sinovac'),(3,'Inggris','AstraZeneca'),(4,'China','Sinopharm'),(5,'Amerika Serikat','Moderna'),(6,'Amerika Serikat','Pfizer'),(7,'Amerika Serikat','Novavax'),(8,'Rusia','Sputnik-V'),(9,'Belanda','Janssen'),(10,'China','Convidencia'),(11,'China','Zifivax'),(12,'China','CanSino'),(13,'China','RBD-Dimer');
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
INSERT INTO `penyakit` VALUES (1,'Influenza'),(2,'TBC'),(3,'Muntaber'),(4,'Cacar Air'),(5,'Tifus'),(6,'Campak'),(7,'Pneumonia'),(8,'Hepatitis'),(9,'Kolera'),(10,'Polio'),(11,'Ebola'),(12,'AIDS'),(13,'DBD'),(14,'Rabies'),(15,'Kurap'),(16,'Malaria'),(17,'Cacingan'),(18,'Titanus'),(19,'SARS'),(20,'Rubella'),(21,'Flu Burung'),(22,'Chikungunya'),(23,'Demam Kuning'),(24,'Anthrax'),(25,'Leptospirosis'),(26,'Abses Paru'),(27,'Abses Gigi'),(28,'ADHD'),(29,'Amnesia'),(30,'Anemia'),(31,'Asma'),(32,'Bronkitis'),(33,'Depresi'),(34,'Difteri'),(35,'Diabetes'),(36,'Diare'),(37,'Beri-Beri'),(38,'Disentri'),(39,'Eksem'),(40,'Epilepsi'),(41,'Filariasis'),(42,'Fraktur Humerus'),(43,'Gagal Ginjal'),(44,'Gagal Jantung'),(45,'Hipotiroid'),(46,'Gastroparesis'),(47,'Hernia'),(48,'Herpes'),(49,'Hipertensi'),(50,'Hiperteroid'),(51,'Askariasis'),(52,'Ileus'),(53,'Entrobiasis'),(54,'Infertilitas'),(55,'Jamur Kuku'),(56,'Jamur Kepala'),(57,'Leukimia'),(58,'Katarak'),(59,'Kanker Paru'),(60,'Kanker Ovarium'),(61,'Kanker Serviks'),(62,'Hemofilia'),(63,'Gonorrhea'),(64,'Kudis'),(65,'Kista'),(66,'Labirintis'),(67,'Migrain'),(68,'Mastitis'),(69,'Panu'),(70,'Varises'),(71,'GERD'),(72,'Demensia'),(73,'Glaukoma'),(74,'Parkinson'),(75,'Pleuritis'),(76,'Pilek'),(77,'Batuk'),(78,'Pankreatitis'),(79,'Gastritis'),(80,'Miopia'),(81,'Bronkiolitis'),(82,'Prostatitis'),(83,'Viral Meningitis'),(84,'Sariawan'),(85,'Maag'),(86,'Sifilis'),(87,'Sinusitis'),(88,'Astigmatisme'),(89,'Tumor'),(90,'Apendisitis'),(91,'Volvulus'),(92,'Vaginitis'),(93,'Wasir'),(94,'Xanthelasma'),(95,'Faringitis'),(96,'Hipermetropia'),(97,'Gingivitis'),(98,'Ruptur Ginjal'),(99,'Carpal Tunnel'),(100,'ACL');
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
INSERT INTO `provinsi` VALUES (1,'Aceh'),(2,'Sumatra Utara'),(3,'Sumatra Barat'),(4,'Riau'),(5,'Jambi'),(6,'Kepulauan Riau'),(7,'Bengkulu'),(8,'Sumatra Selatan'),(9,'Kepulauan Bangka Belitung'),(10,'Lampung'),(11,'Banten'),(12,'DKI Jakarta'),(13,'Jawa Barat'),(14,'Jawa Tengah'),(15,'DI Yogyakarta'),(16,'Jawa Timur'),(17,'Bali'),(18,'NTB'),(19,'NTT'),(20,'Kalimantan Barat'),(21,'Kalimantan Tengah'),(22,'Kalimantan Selatan'),(23,'Kalimantan Timur'),(24,'Kalimantan Utara'),(25,'Sulawesi Barat'),(26,'Sulawesi Selatan'),(27,'Sulawesi Tenggara'),(28,'Sulawesi Tengah'),(29,'Gorontalo'),(30,'Sulawesi Utara'),(31,'Maluku Utara'),(32,'Maluku'),(33,'Papua Barat'),(34,'Papua');
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

-- Dump completed on 2022-04-07 20:35:47
