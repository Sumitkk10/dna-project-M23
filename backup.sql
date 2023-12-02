-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: finalphase4
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ARPersonnel`
--

DROP TABLE IF EXISTS `ARPersonnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARPersonnel` (
  `ar_id` int NOT NULL,
  PRIMARY KEY (`ar_id`),
  CONSTRAINT `ARPersonnel_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARPersonnel`
--

LOCK TABLES `ARPersonnel` WRITE;
/*!40000 ALTER TABLE `ARPersonnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARPersonnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AR_IndustryConnections`
--

DROP TABLE IF EXISTS `AR_IndustryConnections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AR_IndustryConnections` (
  `ar_id` int NOT NULL,
  `industry_connection` varchar(255) NOT NULL,
  PRIMARY KEY (`ar_id`,`industry_connection`),
  CONSTRAINT `AR_IndustryConnections_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `ARPersonnel` (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AR_IndustryConnections`
--

LOCK TABLES `AR_IndustryConnections` WRITE;
/*!40000 ALTER TABLE `AR_IndustryConnections` DISABLE KEYS */;
/*!40000 ALTER TABLE `AR_IndustryConnections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album` (
  `AlbumID` int NOT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `label_id` int DEFAULT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `Album` (`label_id`),
  CONSTRAINT `Album` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`),
  CONSTRAINT `FK_ArtistName_Albums` FOREIGN KEY (`AlbumID`) REFERENCES `Artists` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
/*!40000 ALTER TABLE `Album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlbumCover`
--

DROP TABLE IF EXISTS `AlbumCover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlbumCover` (
  `CoverID` int NOT NULL,
  `CreationDate` date DEFAULT NULL,
  PRIMARY KEY (`CoverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumCover`
--

LOCK TABLES `AlbumCover` WRITE;
/*!40000 ALTER TABLE `AlbumCover` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlbumCover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlbumName`
--

DROP TABLE IF EXISTS `AlbumName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlbumName` (
  `CoverID` int DEFAULT NULL,
  `AlbumName` varchar(255) DEFAULT NULL,
  KEY `CoverID` (`CoverID`),
  CONSTRAINT `AlbumName_ibfk_1` FOREIGN KEY (`CoverID`) REFERENCES `AlbumCover` (`CoverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumName`
--

LOCK TABLES `AlbumName` WRITE;
/*!40000 ALTER TABLE `AlbumName` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlbumName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlbumScouts`
--

DROP TABLE IF EXISTS `AlbumScouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlbumScouts` (
  `ar_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`ar_id`,`artist_id`,`album_id`),
  KEY `artist_id` (`artist_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `AlbumScouts_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `ARPersonnel` (`ar_id`),
  CONSTRAINT `AlbumScouts_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`artist_id`),
  CONSTRAINT `AlbumScouts_ibfk_3` FOREIGN KEY (`album_id`) REFERENCES `Album` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumScouts`
--

LOCK TABLES `AlbumScouts` WRITE;
/*!40000 ALTER TABLE `AlbumScouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlbumScouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Album_Tracklist`
--

DROP TABLE IF EXISTS `Album_Tracklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album_Tracklist` (
  `AlbumID` int DEFAULT NULL,
  `TrackList` varchar(255) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `Album_Tracklist_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album_Tracklist`
--

LOCK TABLES `Album_Tracklist` WRITE;
/*!40000 ALTER TABLE `Album_Tracklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Album_Tracklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlbumsWrittenBySongwriters`
--

DROP TABLE IF EXISTS `AlbumsWrittenBySongwriters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlbumsWrittenBySongwriters` (
  `album_id` int NOT NULL,
  `writer_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`writer_id`),
  KEY `writer_id` (`writer_id`),
  CONSTRAINT `AlbumsWrittenBySongwriters_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Album` (`AlbumID`),
  CONSTRAINT `AlbumsWrittenBySongwriters_ibfk_2` FOREIGN KEY (`writer_id`) REFERENCES `SongWriters` (`writer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumsWrittenBySongwriters`
--

LOCK TABLES `AlbumsWrittenBySongwriters` WRITE;
/*!40000 ALTER TABLE `AlbumsWrittenBySongwriters` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlbumsWrittenBySongwriters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArtistPhoneNumbers`
--

DROP TABLE IF EXISTS `ArtistPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArtistPhoneNumbers` (
  `artist_id` int NOT NULL,
  `phone_number` bigint NOT NULL,
  PRIMARY KEY (`artist_id`,`phone_number`),
  CONSTRAINT `ArtistPhoneNumbers_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtistPhoneNumbers`
--

LOCK TABLES `ArtistPhoneNumbers` WRITE;
/*!40000 ALTER TABLE `ArtistPhoneNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArtistPhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artists`
--

DROP TABLE IF EXISTS `Artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artists` (
  `artist_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `album_id` int NOT NULL,
  `artist_name` varchar(255) DEFAULT NULL,
  `signing_date` date DEFAULT NULL,
  `num_released_albums` int DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `label_id` int DEFAULT NULL,
  `producer_id` int DEFAULT NULL,
  PRIMARY KEY (`artist_id`,`tour_id`,`album_id`),
  KEY `tour_id` (`tour_id`),
  KEY `album_id` (`album_id`),
  KEY `FK_RecordingLabel_Artist` (`label_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `Artists_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`tour_id`),
  CONSTRAINT `Artists_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `Producers` (`producer_id`),
  CONSTRAINT `FK_RecordingLabel_Artist` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artists`
--

LOCK TABLES `Artists` WRITE;
/*!40000 ALTER TABLE `Artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `Artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChartPosition`
--

DROP TABLE IF EXISTS `ChartPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChartPosition` (
  `AlbumID` int DEFAULT NULL,
  `ChartPositionNumber` int DEFAULT NULL,
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `ChartPosition_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChartPosition`
--

LOCK TABLES `ChartPosition` WRITE;
/*!40000 ALTER TABLE `ChartPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChartPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Charts`
--

DROP TABLE IF EXISTS `Charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Charts` (
  `chart_id` int NOT NULL,
  `label_id` int DEFAULT NULL,
  `charts_ranking` varchar(255) DEFAULT NULL,
  `chart_name` varchar(255) DEFAULT NULL,
  `chart_country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chart_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `Charts_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Charts`
--

LOCK TABLES `Charts` WRITE;
/*!40000 ALTER TABLE `Charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `D_head`
--

DROP TABLE IF EXISTS `D_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `D_head` (
  `department_id` int NOT NULL,
  `department_head` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  CONSTRAINT `D_head_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `D_head`
--

LOCK TABLES `D_head` WRITE;
/*!40000 ALTER TABLE `D_head` DISABLE KEYS */;
/*!40000 ALTER TABLE `D_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Designer_ArtisticStyle`
--

DROP TABLE IF EXISTS `Designer_ArtisticStyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Designer_ArtisticStyle` (
  `designer_id` int NOT NULL,
  `artistic_style` varchar(255) NOT NULL,
  PRIMARY KEY (`designer_id`,`artistic_style`),
  CONSTRAINT `Designer_ArtisticStyle_ibfk_1` FOREIGN KEY (`designer_id`) REFERENCES `Designers` (`designer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Designer_ArtisticStyle`
--

LOCK TABLES `Designer_ArtisticStyle` WRITE;
/*!40000 ALTER TABLE `Designer_ArtisticStyle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Designer_ArtisticStyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Designers`
--

DROP TABLE IF EXISTS `Designers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Designers` (
  `designer_id` int NOT NULL,
  `number_of_covers_designed` int DEFAULT NULL,
  `total_revenue_generated` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`designer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `Designers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Designers`
--

LOCK TABLES `Designers` WRITE;
/*!40000 ALTER TABLE `Designers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Designers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DesignersDesignAlbumCover`
--

DROP TABLE IF EXISTS `DesignersDesignAlbumCover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DesignersDesignAlbumCover` (
  `designer_id` int NOT NULL,
  `album_cover_id` int NOT NULL,
  PRIMARY KEY (`designer_id`,`album_cover_id`),
  KEY `album_cover_id` (`album_cover_id`),
  CONSTRAINT `DesignersDesignAlbumCover_ibfk_1` FOREIGN KEY (`designer_id`) REFERENCES `Designers` (`designer_id`),
  CONSTRAINT `DesignersDesignAlbumCover_ibfk_2` FOREIGN KEY (`album_cover_id`) REFERENCES `AlbumCover` (`CoverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DesignersDesignAlbumCover`
--

LOCK TABLES `DesignersDesignAlbumCover` WRITE;
/*!40000 ALTER TABLE `DesignersDesignAlbumCover` DISABLE KEYS */;
/*!40000 ALTER TABLE `DesignersDesignAlbumCover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistributionChannels`
--

DROP TABLE IF EXISTS `DistributionChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DistributionChannels` (
  `channel_id` int NOT NULL,
  `label_id` int DEFAULT NULL,
  `distribution_channel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`channel_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `DistributionChannels_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistributionChannels`
--

LOCK TABLES `DistributionChannels` WRITE;
/*!40000 ALTER TABLE `DistributionChannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `DistributionChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeDates`
--

DROP TABLE IF EXISTS `EmployeeDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeDates` (
  `employee_id` int NOT NULL,
  `joining_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `EmployeeDates_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeDates`
--

LOCK TABLES `EmployeeDates` WRITE;
/*!40000 ALTER TABLE `EmployeeDates` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeInfo`
--

DROP TABLE IF EXISTS `EmployeeInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeInfo` (
  `employee_id` int NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `FK_Department_Employee` (`DepartmentID`),
  CONSTRAINT `FK_Department_Employee` FOREIGN KEY (`DepartmentID`) REFERENCES `D_head` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeInfo`
--

LOCK TABLES `EmployeeInfo` WRITE;
/*!40000 ALTER TABLE `EmployeeInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeePhoneNumbers`
--

DROP TABLE IF EXISTS `EmployeePhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeePhoneNumbers` (
  `employee_id` int NOT NULL,
  `phone_number` bigint NOT NULL,
  PRIMARY KEY (`employee_id`,`phone_number`),
  CONSTRAINT `EmployeePhoneNumbers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeePhoneNumbers`
--

LOCK TABLES `EmployeePhoneNumbers` WRITE;
/*!40000 ALTER TABLE `EmployeePhoneNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeePhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntertainmentRelationship`
--

DROP TABLE IF EXISTS `EntertainmentRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EntertainmentRelationship` (
  `recording_label_id` int NOT NULL,
  `album_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `tour_id` int NOT NULL,
  PRIMARY KEY (`recording_label_id`,`album_id`,`artist_id`,`tour_id`),
  KEY `album_id` (`album_id`),
  KEY `artist_id` (`artist_id`),
  KEY `tour_id` (`tour_id`),
  CONSTRAINT `EntertainmentRelationship_ibfk_1` FOREIGN KEY (`recording_label_id`) REFERENCES `RecordingLabel` (`label_id`),
  CONSTRAINT `EntertainmentRelationship_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `Album` (`AlbumID`),
  CONSTRAINT `EntertainmentRelationship_ibfk_3` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`artist_id`),
  CONSTRAINT `EntertainmentRelationship_ibfk_4` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntertainmentRelationship`
--

LOCK TABLES `EntertainmentRelationship` WRITE;
/*!40000 ALTER TABLE `EntertainmentRelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `EntertainmentRelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `AlbumID` int DEFAULT NULL,
  `GenreType` varchar(255) DEFAULT NULL,
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `Genre_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvestmentDetails`
--

DROP TABLE IF EXISTS `InvestmentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvestmentDetails` (
  `investor_id` int NOT NULL,
  `investment_amount` int DEFAULT NULL,
  `investment_date` date DEFAULT NULL,
  `ownership_stake` int DEFAULT NULL,
  `return_on_investment` int DEFAULT NULL,
  `duration_of_investment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`investor_id`),
  CONSTRAINT `InvestmentDetails_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `Investors` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvestmentDetails`
--

LOCK TABLES `InvestmentDetails` WRITE;
/*!40000 ALTER TABLE `InvestmentDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvestmentDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvestorContactInfo`
--

DROP TABLE IF EXISTS `InvestorContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvestorContactInfo` (
  `investor_id` int NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `office_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`investor_id`),
  CONSTRAINT `InvestorContactInfo_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `Investors` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvestorContactInfo`
--

LOCK TABLES `InvestorContactInfo` WRITE;
/*!40000 ALTER TABLE `InvestorContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvestorContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvestorInvestsInRecordingLabel`
--

DROP TABLE IF EXISTS `InvestorInvestsInRecordingLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvestorInvestsInRecordingLabel` (
  `investor_id` int NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`investor_id`,`label_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `InvestorInvestsInRecordingLabel_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `Investors` (`investor_id`),
  CONSTRAINT `InvestorInvestsInRecordingLabel_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvestorInvestsInRecordingLabel`
--

LOCK TABLES `InvestorInvestsInRecordingLabel` WRITE;
/*!40000 ALTER TABLE `InvestorInvestsInRecordingLabel` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvestorInvestsInRecordingLabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Investors`
--

DROP TABLE IF EXISTS `Investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Investors` (
  `investor_id` int NOT NULL,
  `investor_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investors`
--

LOCK TABLES `Investors` WRITE;
/*!40000 ALTER TABLE `Investors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LegalContracts`
--

DROP TABLE IF EXISTS `LegalContracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LegalContracts` (
  `contract_id` int NOT NULL,
  `label_id` int DEFAULT NULL,
  `contract_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `LegalContracts_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LegalContracts`
--

LOCK TABLES `LegalContracts` WRITE;
/*!40000 ALTER TABLE `LegalContracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `LegalContracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `M_ArtistRoster`
--

DROP TABLE IF EXISTS `M_ArtistRoster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `M_ArtistRoster` (
  `manager_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`manager_id`,`artist_id`),
  CONSTRAINT `M_ArtistRoster_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `Managers` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `M_ArtistRoster`
--

LOCK TABLES `M_ArtistRoster` WRITE;
/*!40000 ALTER TABLE `M_ArtistRoster` DISABLE KEYS */;
/*!40000 ALTER TABLE `M_ArtistRoster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `M_TourEventManagement`
--

DROP TABLE IF EXISTS `M_TourEventManagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `M_TourEventManagement` (
  `manager_id` int NOT NULL,
  `event_name` varchar(255) NOT NULL,
  PRIMARY KEY (`manager_id`,`event_name`),
  CONSTRAINT `M_TourEventManagement_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `Managers` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `M_TourEventManagement`
--

LOCK TABLES `M_TourEventManagement` WRITE;
/*!40000 ALTER TABLE `M_TourEventManagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `M_TourEventManagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Managers` (
  `manager_id` int NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `Managers_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `Managers_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managers`
--

LOCK TABLES `Managers` WRITE;
/*!40000 ALTER TABLE `Managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `P_ArtistsHandled`
--

DROP TABLE IF EXISTS `P_ArtistsHandled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `P_ArtistsHandled` (
  `producer_id` int NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `contract_term` int DEFAULT NULL,
  PRIMARY KEY (`producer_id`,`artist_name`),
  CONSTRAINT `P_ArtistsHandled_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `Producers` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `P_ArtistsHandled`
--

LOCK TABLES `P_ArtistsHandled` WRITE;
/*!40000 ALTER TABLE `P_ArtistsHandled` DISABLE KEYS */;
/*!40000 ALTER TABLE `P_ArtistsHandled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producers`
--

DROP TABLE IF EXISTS `Producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producers` (
  `producer_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `total_revenue` int DEFAULT NULL,
  PRIMARY KEY (`producer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `Producers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producers`
--

LOCK TABLES `Producers` WRITE;
/*!40000 ALTER TABLE `Producers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProducesRelationship`
--

DROP TABLE IF EXISTS `ProducesRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProducesRelationship` (
  `recording_label_id` int NOT NULL,
  `album_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`recording_label_id`,`album_id`,`artist_id`),
  KEY `album_id` (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `ProducesRelationship_ibfk_1` FOREIGN KEY (`recording_label_id`) REFERENCES `RecordingLabel` (`label_id`),
  CONSTRAINT `ProducesRelationship_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `Album` (`AlbumID`),
  CONSTRAINT `ProducesRelationship_ibfk_3` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProducesRelationship`
--

LOCK TABLES `ProducesRelationship` WRITE;
/*!40000 ALTER TABLE `ProducesRelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProducesRelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublishesRelationship`
--

DROP TABLE IF EXISTS `PublishesRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublishesRelationship` (
  `recording_label_id` int NOT NULL,
  `album_id` int NOT NULL,
  `songwriter_id` int NOT NULL,
  PRIMARY KEY (`recording_label_id`,`album_id`,`songwriter_id`),
  KEY `album_id` (`album_id`),
  KEY `songwriter_id` (`songwriter_id`),
  CONSTRAINT `PublishesRelationship_ibfk_1` FOREIGN KEY (`recording_label_id`) REFERENCES `RecordingLabel` (`label_id`),
  CONSTRAINT `PublishesRelationship_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `Album` (`AlbumID`),
  CONSTRAINT `PublishesRelationship_ibfk_3` FOREIGN KEY (`songwriter_id`) REFERENCES `SongWriters` (`writer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublishesRelationship`
--

LOCK TABLES `PublishesRelationship` WRITE;
/*!40000 ALTER TABLE `PublishesRelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `PublishesRelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecordingLabel`
--

DROP TABLE IF EXISTS `RecordingLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecordingLabel` (
  `label_id` int NOT NULL,
  `recording_label_name` varchar(255) DEFAULT NULL,
  `revenue` int DEFAULT NULL,
  `number_of_employees` int DEFAULT NULL,
  `number_of_songs` int DEFAULT NULL,
  `parent_label_id` int DEFAULT NULL,
  PRIMARY KEY (`label_id`),
  KEY `parent_label_id` (`parent_label_id`),
  CONSTRAINT `RecordingLabel_ibfk_1` FOREIGN KEY (`parent_label_id`) REFERENCES `RecordingLabel` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecordingLabel`
--

LOCK TABLES `RecordingLabel` WRITE;
/*!40000 ALTER TABLE `RecordingLabel` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecordingLabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SW_SongCatalog`
--

DROP TABLE IF EXISTS `SW_SongCatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SW_SongCatalog` (
  `writer_id` int NOT NULL,
  `song_name` varchar(255) NOT NULL,
  PRIMARY KEY (`writer_id`,`song_name`),
  CONSTRAINT `SW_SongCatalog_ibfk_1` FOREIGN KEY (`writer_id`) REFERENCES `SongWriters` (`writer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SW_SongCatalog`
--

LOCK TABLES `SW_SongCatalog` WRITE;
/*!40000 ALTER TABLE `SW_SongCatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `SW_SongCatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SongWriters`
--

DROP TABLE IF EXISTS `SongWriters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SongWriters` (
  `writer_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`writer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `SongWriters_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SongWriters`
--

LOCK TABLES `SongWriters` WRITE;
/*!40000 ALTER TABLE `SongWriters` DISABLE KEYS */;
/*!40000 ALTER TABLE `SongWriters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourAddresses`
--

DROP TABLE IF EXISTS `TourAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TourAddresses` (
  `tour_id` int NOT NULL,
  `pincode` int DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  CONSTRAINT `TourAddresses_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourAddresses`
--

LOCK TABLES `TourAddresses` WRITE;
/*!40000 ALTER TABLE `TourAddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `TourAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourDates`
--

DROP TABLE IF EXISTS `TourDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TourDates` (
  `tour_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  CONSTRAINT `TourDates_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourDates`
--

LOCK TABLES `TourDates` WRITE;
/*!40000 ALTER TABLE `TourDates` DISABLE KEYS */;
/*!40000 ALTER TABLE `TourDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourLocations`
--

DROP TABLE IF EXISTS `TourLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TourLocations` (
  `tour_id` int NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  CONSTRAINT `TourLocations_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourLocations`
--

LOCK TABLES `TourLocations` WRITE;
/*!40000 ALTER TABLE `TourLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `TourLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tours`
--

DROP TABLE IF EXISTS `Tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tours` (
  `tour_id` int NOT NULL,
  `tour_name` varchar(255) DEFAULT NULL,
  `ticket_sales` int DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  CONSTRAINT `FK_Artist_Tours` FOREIGN KEY (`tour_id`) REFERENCES `Artists` (`tour_id`),
  CONSTRAINT `Tours_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Artists` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tours`
--

LOCK TABLES `Tours` WRITE;
/*!40000 ALTER TABLE `Tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertising_partners`
--

DROP TABLE IF EXISTS `advertising_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertising_partners` (
  `head_id` int DEFAULT NULL,
  `advertising_method` varchar(255) NOT NULL,
  PRIMARY KEY (`advertising_method`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `advertising_partners_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `marketing_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_partners`
--

LOCK TABLES `advertising_partners` WRITE;
/*!40000 ALTER TABLE `advertising_partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertising_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget_allocations`
--

DROP TABLE IF EXISTS `budget_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_allocations` (
  `head_id` int DEFAULT NULL,
  `budget_amount` int NOT NULL,
  PRIMARY KEY (`budget_amount`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `budget_allocations_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_allocations`
--

LOCK TABLES `budget_allocations` WRITE;
/*!40000 ALTER TABLE `budget_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `number_of_employees` int DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_campaigns`
--

DROP TABLE IF EXISTS `finance_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_campaigns` (
  `head_id` int DEFAULT NULL,
  `report_id` int NOT NULL,
  `ROI` int DEFAULT NULL,
  `revenue` int DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `finance_campaigns_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_campaigns`
--

LOCK TABLES `finance_campaigns` WRITE;
/*!40000 ALTER TABLE `finance_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `finance_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_department`
--

DROP TABLE IF EXISTS `finance_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_department` (
  `head_id` int NOT NULL,
  PRIMARY KEY (`head_id`),
  CONSTRAINT `finance_department_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_department`
--

LOCK TABLES `finance_department` WRITE;
/*!40000 ALTER TABLE `finance_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `finance_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_tracking`
--

DROP TABLE IF EXISTS `invoice_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_tracking` (
  `head_id` int DEFAULT NULL,
  `invoice_date` date NOT NULL,
  PRIMARY KEY (`invoice_date`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `invoice_tracking_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_tracking`
--

LOCK TABLES `invoice_tracking` WRITE;
/*!40000 ALTER TABLE `invoice_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `head_id` int DEFAULT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `Budget` int DEFAULT NULL,
  PRIMARY KEY (`campaign_name`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `marketing_campaigns_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `marketing_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_department`
--

DROP TABLE IF EXISTS `marketing_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_department` (
  `head_id` int NOT NULL,
  PRIMARY KEY (`head_id`),
  CONSTRAINT `marketing_department_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_department`
--

LOCK TABLES `marketing_department` WRITE;
/*!40000 ALTER TABLE `marketing_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_data`
--

DROP TABLE IF EXISTS `payroll_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_data` (
  `head_id` int DEFAULT NULL,
  `season_of_payment` varchar(255) NOT NULL,
  PRIMARY KEY (`season_of_payment`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `payroll_data_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_data`
--

LOCK TABLES `payroll_data` WRITE;
/*!40000 ALTER TABLE `payroll_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenue_streams`
--

DROP TABLE IF EXISTS `revenue_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue_streams` (
  `head_id` int DEFAULT NULL,
  `stream_name` varchar(255) NOT NULL,
  PRIMARY KEY (`stream_name`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `revenue_streams_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenue_streams`
--

LOCK TABLES `revenue_streams` WRITE;
/*!40000 ALTER TABLE `revenue_streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenue_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_contacts`
--

DROP TABLE IF EXISTS `social_media_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media_contacts` (
  `head_id` int DEFAULT NULL,
  `distribution_method` varchar(255) NOT NULL,
  PRIMARY KEY (`distribution_method`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `social_media_contacts_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `marketing_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_contacts`
--

LOCK TABLES `social_media_contacts` WRITE;
/*!40000 ALTER TABLE `social_media_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media_contacts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02  5:30:41
