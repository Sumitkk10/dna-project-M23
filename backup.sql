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
  `NumberOfNewArtistsSigned` int DEFAULT NULL,
  `SuccessRateOfMatchingArtistWithProducer` float DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  CONSTRAINT `ARPersonnel_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `EmployeeInfo` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARPersonnel`
--

LOCK TABLES `ARPersonnel` WRITE;
/*!40000 ALTER TABLE `ARPersonnel` DISABLE KEYS */;
INSERT INTO `ARPersonnel` VALUES (201,15,0.85),(202,12,0.78),(203,20,0.92),(204,18,0.8),(205,25,0.88),(206,14,0.75),(207,22,0.9),(208,16,0.82),(209,19,0.87),(210,17,0.79);
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
INSERT INTO `AR_IndustryConnections` VALUES (201,'Recording Studios Inc.'),(202,'Music Producers Network'),(203,'Live Concert Organizers'),(204,'Independent Record Labels'),(205,'Talent Management Agencies'),(206,'Music Streaming Platforms'),(207,'Music Festivals Association'),(208,'Public Relations Firms'),(209,'Concert Venues Association'),(210,'Music Licensing Companies');
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
  `total_revenue` int DEFAULT NULL,
  `artist_id` int DEFAULT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `Album` (`label_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `Album` FOREIGN KEY (`label_id`) REFERENCES `RecordingLabel` (`label_id`),
  CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
INSERT INTO `Album` VALUES (101,'2023-01-10',201,120000,301),(102,'2023-02-15',202,90000,302),(103,'2023-03-20',203,110000,303),(104,'2023-04-25',204,75000,304),(105,'2023-05-30',205,100000,305),(106,'2023-06-05',206,85000,306),(107,'2023-07-10',207,95000,307),(108,'2023-08-15',208,80000,308),(109,'2023-09-20',209,105000,309),(110,'2023-10-25',210,98000,310);
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
INSERT INTO `AlbumCover` VALUES (1,'2023-01-01'),(2,'2023-02-05'),(3,'2023-03-10'),(4,'2023-04-15'),(5,'2023-05-20'),(6,'2023-06-25'),(7,'2023-07-30'),(8,'2023-08-04'),(9,'2023-09-09'),(10,'2023-10-14');
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
INSERT INTO `AlbumName` VALUES (1,'First Album'),(2,'Summer Vibes'),(3,'Eternal Harmony'),(4,'City Lights'),(5,'Ocean Breeze'),(6,'Serenade in the Rain'),(7,'Urban Jungle'),(8,'Celestial Symphony'),(9,'Golden Sunset'),(10,'Whispers of Nature');
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
INSERT INTO `Album_Tracklist` VALUES (101,'Dance Party, Summer Vibes, Groovy Beats',180),(102,'Epic Journey, Rock Anthem, Guitar Solo',210),(103,'Street Beats, Rap Rhymes, Urban Vibes',240),(104,'Indie Harmony, Acoustic Bliss, Melancholic Journey',190),(105,'Electronic Rhythms, Techno Wonderland, Ambient Journey',220),(106,'Jazz Fusion, Smooth Groove, Saxophone Serenade',200),(107,'Country Roads, Honky Tonk, Bluegrass Bliss',230),(108,'R&B Soul, Funky Vibes, Love Ballad',200),(109,'Reggae Roots, Dub Vibes, Island Groove',210),(110,'Classical Symphony, Piano Sonata, Orchestral Magic',250),(101,'Lively Beats, Tropical Vibes, Carnival Celebration',190),(102,'Alternative Anthem, Electric Sounds, Drumming Sensation',220),(103,'Hip-Hop Beats, Rap Lyrics, Street Style',240),(104,'Indie Pop, Acoustic Delight, Harmonic Journey',190),(105,'Electronic Dreams, Techno Fusion, Ambient Excursion',220),(106,'Smooth Jazz, Saxophone Serenity, Rhythmic Flow',200),(107,'Country Romance, Folk Melody, Bluegrass Journey',230),(108,'R&B Love, Funk Groove, Sensual Ballad',200),(109,'Reggae Vibes, Dub Harmony, Caribbean Fusion',210),(110,'Classical Elegance, Piano Sonata, Orchestral Fantasy',250),(101,'Dance Party 2, Summer Vibes 2, Groovy Beats 2',180),(102,'Epic Journey 2, Rock Anthem 2, Guitar Solo 2',210),(103,'Street Beats 2, Rap Rhymes 2, Urban Vibes 2',240),(104,'Indie Harmony 2, Acoustic Bliss 2, Melancholic Journey 2',190),(105,'Electronic Rhythms 2, Techno Wonderland 2, Ambient Journey 2',220),(106,'Jazz Fusion 2, Smooth Groove 2, Saxophone Serenade 2',200),(107,'Country Roads 2, Honky Tonk 2, Bluegrass Bliss 2',230),(108,'R&B Soul 2, Funky Vibes 2, Love Ballad 2',200),(109,'Reggae Roots 2, Dub Vibes 2, Island Groove 2',210),(110,'Classical Symphony 2, Piano Sonata 2, Orchestral Magic 2',250);
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
INSERT INTO `ArtistPhoneNumbers` VALUES (301,1234567890),(302,2345678901),(303,3456789012),(304,4567890123),(305,5678901234),(306,6789012345),(307,7890123456),(308,8901234567),(309,9012345678),(310,1023456789);
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
INSERT INTO `Artists` VALUES (301,1,101,'Adele','2008-06-20',5,'1988-05-05',201,401),(302,2,102,'Ed Sheeran','2011-08-26',7,'1991-02-17',202,402),(303,3,103,'Beyoncé','2003-09-04',6,'1981-09-04',203,403),(304,4,104,'Justin Bieber','2008-01-15',9,'1994-03-01',204,404),(305,5,105,'Taylor Swift','2006-10-24',10,'1989-12-13',205,405),(306,6,106,'Bruno Mars','2010-10-04',6,'1985-10-08',206,401),(307,7,107,'Ariana Grande','2008-12-01',8,'1993-06-26',207,402),(308,8,108,'Drake','2006-06-15',9,'1986-10-24',208,403),(309,9,109,'Rihanna','2005-03-08',8,'1988-02-20',209,404),(310,10,110,'Katy Perry','2001-07-06',6,'1984-10-25',210,405);
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
INSERT INTO `ChartPosition` VALUES (101,1),(102,2),(103,3),(104,4),(105,5),(106,6),(107,7),(108,8),(109,9),(110,10);
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
INSERT INTO `Charts` VALUES (1,201,'Top 10','Pop Hits','USA'),(2,202,'Top 20','Rock Classics','UK'),(3,203,'Top 30','Hip-Hop Vibes','Canada'),(4,204,'Top 40','Indie Mix','Australia'),(5,205,'Top 50','Electronic Beats','Germany'),(6,206,'Top 10','Latin Groove','Spain'),(7,207,'Top 20','Country Jams','Brazil'),(8,208,'Top 30','R&B Soul','France'),(9,209,'Top 40','Jazz Fusion','Italy'),(10,210,'Top 50','Reggae Vibes','Jamaica');
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
INSERT INTO `D_head` VALUES (101,'John Smith'),(102,'Jane Doe'),(103,'Robert Johnson'),(104,'Alice Brown'),(105,'Michael Davis'),(106,'Eva White'),(107,'David Miller'),(108,'Olivia Wilson'),(109,'Andrew Davis'),(110,'Lily Johnson');
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
INSERT INTO `Designer_ArtisticStyle` VALUES (301,'Abstract'),(302,'Minimalist'),(303,'Modern'),(304,'Gothic'),(305,'Surreal'),(306,'Pop Art'),(307,'Cubism'),(308,'Impressionist'),(309,'Realist'),(310,'Fauvist');
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
INSERT INTO `Designers` VALUES (301,15,75000,201),(302,20,100000,202),(303,12,60000,203),(304,18,90000,204),(305,22,110000,205),(306,14,70000,206),(307,17,85000,207),(308,19,95000,208),(309,16,80000,209),(310,21,105000,210);
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
INSERT INTO `DistributionChannels` VALUES (301,201,'Digital Platforms'),(302,202,'Physical Retail'),(303,203,'Online Retail'),(304,204,'Streaming Services'),(305,205,'Independent Stores'),(306,206,'Social Media Platforms'),(307,207,'Radio Stations'),(308,208,'TV Networks'),(309,209,'Concert Venues'),(310,210,'Specialty Stores');
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
INSERT INTO `EmployeeDates` VALUES (201,'2022-01-15','1980-05-10'),(202,'2021-05-20','1985-08-15'),(203,'2023-02-10','1990-03-25'),(204,'2020-11-05','1982-07-30'),(205,'2022-07-01','1988-12-05'),(206,'2023-03-10','1984-02-15'),(207,'2022-09-15','1986-06-20'),(208,'2021-12-20','1983-10-25'),(209,'2020-03-25','1981-01-30'),(210,'2021-06-30','1987-04-05');
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
INSERT INTO `EmployeeInfo` VALUES (201,'John Employee',60000,101),(202,'Jane Worker',70000,102),(203,'Michael Staff',80000,103),(204,'Emily Teammate',65000,104),(205,'Robert Colleague',75000,105),(206,'Sarah Team Member',90000,106),(207,'David Co-worker',72000,107),(208,'Olivia Partner',68000,108),(209,'Daniel Associate',85000,109),(210,'Sophia Fellow',80000,110),(211,'Liam Teammate',70000,101),(212,'Emma Worker',75000,102),(213,'Noah Employee',80000,103),(214,'Ava Colleague',85000,104),(215,'William Team Member',90000,105),(216,'Sophia Co-worker',72000,106),(217,'Oliver Partner',68000,107),(218,'Isabella Associate',85000,108),(219,'James Fellow',80000,109),(220,'Charlotte Employee',75000,110),(221,'Benjamin Worker',85000,101),(222,'Amelia Staff',90000,102),(223,'Elijah Teammate',72000,103),(224,'Mia Colleague',80000,104),(225,'Lucas Team Member',75000,105),(226,'Ava Co-worker',68000,106),(227,'Alexander Partner',90000,107),(228,'Luna Associate',72000,108),(229,'Henry Fellow',80000,109),(230,'Sophie Employee',85000,110);
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
INSERT INTO `EmployeePhoneNumbers` VALUES (201,1234567890),(202,9876543210),(203,5551234567),(204,7890123456),(205,3216549870),(206,5559876543),(207,4567890123),(208,7891234560),(209,9870123456),(210,3217896540);
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
INSERT INTO `Genre` VALUES (101,'Pop'),(102,'Rock'),(103,'Hip-Hop'),(104,'Indie'),(105,'Electronic'),(106,'Jazz'),(107,'Country'),(108,'R&B'),(109,'Reggae'),(110,'Classical');
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
INSERT INTO `InvestmentDetails` VALUES (1,50000,'2023-01-15',10,20000,'2 years'),(2,75000,'2023-02-20',15,30000,'3 years'),(3,100000,'2023-03-25',20,40000,'4 years'),(4,60000,'2023-04-30',12,25000,'2.5 years'),(5,80000,'2023-05-05',18,35000,'3.5 years'),(6,90000,'2023-06-10',8,18000,'2 years'),(7,120000,'2023-07-15',25,50000,'5 years'),(8,55000,'2023-08-20',14,22000,'2.2 years'),(9,70000,'2023-09-25',16,30000,'3 years'),(10,95000,'2023-10-30',22,42000,'4.2 years');
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
INSERT INTO `InvestorContactInfo` VALUES (1,1234567890,'John Doe','New York'),(2,9876543210,'Jane Smith','Los Angeles'),(3,5551234567,'Michael Johnson','Chicago'),(4,7890123456,'Emily Davis','San Francisco'),(5,3216549870,'Robert Brown','Miami'),(6,5559876543,'Sarah Wilson','Seattle'),(7,4567890123,'David Miller','Boston'),(8,7891234560,'Olivia Taylor','Dallas'),(9,9870123456,'Daniel White','Houston'),(10,3217896540,'Sophia Lewis','Atlanta');
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
INSERT INTO `Investors` VALUES (1,'John Doe'),(2,'Jane Smith'),(3,'Michael Johnson'),(4,'Emily Davis'),(5,'Robert Brown'),(6,'Sarah Wilson'),(7,'David Miller'),(8,'Olivia Taylor'),(9,'Daniel White'),(10,'Sophia Lewis');
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
INSERT INTO `LegalContracts` VALUES (401,201,'Digital Distribution Agreement'),(402,202,'Exclusive Licensing Contract'),(403,203,'Global Distribution Deal'),(404,204,'Streaming Rights Agreement'),(405,205,'Retail Distribution Contract'),(406,206,'Social Media Collaboration'),(407,207,'Radio Broadcast Licensing'),(408,208,'TV Show Soundtrack Deal'),(409,209,'Concert Performance Rights'),(410,210,'Retail Store Partnership');
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
INSERT INTO `M_TourEventManagement` VALUES (226,'World Tour 2023'),(227,'Summer Fest 2023'),(228,'City Lights Tour'),(229,'Rock Legends Concert'),(230,'Pop Extravaganza');
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
INSERT INTO `Managers` VALUES (226,101),(227,102),(228,103),(229,104),(230,105);
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
INSERT INTO `P_ArtistsHandled` VALUES (401,'Taylor Swift',3),(402,'Ed Sheeran',2),(403,'Adele',4),(404,'Bruno Mars',3),(405,'Rihanna',2);
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
INSERT INTO `Producers` VALUES (401,221,120000),(402,222,95000),(403,223,110000),(404,224,80000),(405,225,105000);
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
INSERT INTO `RecordingLabel` VALUES (201,'MusicMasters',5000000,50,200,NULL),(202,'Harmony Records',3500000,40,150,NULL),(203,'RhythmNation',6000000,60,250,NULL),(204,'CitySound Productions',4500000,55,180,NULL),(205,'OceanWave Records',7000000,70,300,NULL),(206,'RainyDay Entertainment',4000000,45,160,NULL),(207,'UrbanBeats Records',5500000,55,200,NULL),(208,'Celestial Records',6500000,65,280,NULL),(209,'SunsetSounds',4800000,48,190,NULL),(210,'NatureRhythms',7500000,75,320,NULL);
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
INSERT INTO `SW_SongCatalog` VALUES (401,'Melancholy Serenade'),(402,'Whispers of the Wind'),(403,'Eternal Echoes'),(404,'Serendipity Symphony'),(405,'Celestial Harmony'),(406,'Lullaby of the Stars'),(407,'Enchanted Melodies'),(408,'Moonlit Sonata'),(409,'Aurora Borealis Ballad'),(410,'Sapphire Serenity');
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
INSERT INTO `SongWriters` VALUES (301,201),(401,201),(302,202),(402,202),(303,203),(403,203),(304,204),(404,204),(305,205),(405,205),(406,206),(407,207),(408,208),(409,209),(410,210);
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
INSERT INTO `TourAddresses` VALUES (1,10001),(2,90001),(3,37201),(4,98101),(5,33101),(6,30301),(7,70112),(8,60601),(9,94101),(10,73301);
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
INSERT INTO `TourDates` VALUES (1,'2023-05-01','2023-05-15'),(2,'2023-06-01','2023-06-20'),(3,'2023-07-01','2023-07-10'),(4,'2023-08-01','2023-08-15'),(5,'2023-09-01','2023-09-25'),(6,'2023-10-01','2023-10-18'),(7,'2023-11-01','2023-11-10'),(8,'2023-12-01','2023-12-20'),(9,'2024-01-01','2024-01-15'),(10,'2024-02-01','2024-02-18');
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
INSERT INTO `TourLocations` VALUES (1,'New York','NY'),(2,'Los Angeles','CA'),(3,'Nashville','TN'),(4,'Seattle','WA'),(5,'Miami','FL'),(6,'Atlanta','GA'),(7,'New Orleans','LA'),(8,'Chicago','IL'),(9,'San Francisco','CA'),(10,'Austin','TX');
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
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tours`
--

LOCK TABLES `Tours` WRITE;
/*!40000 ALTER TABLE `Tours` DISABLE KEYS */;
INSERT INTO `Tours` VALUES (1,'Rock Revolution Tour',5000),(2,'Pop Extravaganza Tour',8000),(3,'Country Jamboree Tour',6000),(4,'Indie Showcase Tour',4000),(5,'Electronic Odyssey Tour',7000),(6,'Hip-Hop Nation Tour',9000),(7,'Jazz Fusion Tour',3500),(8,'Classical Elegance Tour',3000),(9,'World Music Journey Tour',4500),(10,'Metal Mayhem Tour',5500);
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
INSERT INTO `advertising_partners` VALUES (101,'Social Media Ads'),(102,'Email Marketing'),(103,'Influencer Collaborations'),(104,'Search Engine Marketing'),(105,'Content Sponsorship'),(106,'Video Advertisements'),(107,'Event Sponsorship'),(108,'Affiliate Marketing'),(109,'Print Media Advertising'),(110,'Billboard Campaigns');
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
INSERT INTO `department` VALUES (1,12,'delhi',120000),(101,50,'New York',100000),(102,30,'Los Angeles',80000),(103,45,'Chicago',90000),(104,20,'Houston',60000),(105,60,'San Francisco',120000),(106,40,'Miami',75000),(107,55,'Seattle',110000),(108,35,'Boston',85000),(109,25,'Dallas',70000),(110,50,'Atlanta',95000);
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
INSERT INTO `finance_campaigns` VALUES (101,201,15,50000),(102,202,20,70000),(103,203,18,60000),(104,204,25,80000),(105,205,22,75000),(106,206,30,90000),(107,207,28,85000),(108,208,35,100000),(109,209,32,95000),(110,210,40,120000);
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
INSERT INTO `finance_department` VALUES (101),(102),(103),(104),(105),(106),(107),(108),(109),(110);
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
INSERT INTO `invoice_tracking` VALUES (101,'2023-01-01'),(102,'2023-02-01'),(103,'2023-03-01'),(104,'2023-04-01'),(105,'2023-05-01'),(106,'2023-06-01'),(107,'2023-07-01'),(108,'2023-08-01'),(109,'2023-09-01'),(110,'2023-10-01');
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
INSERT INTO `marketing_campaigns` VALUES (101,'Album Launch - Pop Sensation',50000),(109,'Classical Confluence',85000),(104,'Country Hits Extravaganza',60000),(108,'Electronic Euphoria',90000),(107,'Hip-Hop Heatwave',120000),(105,'Indie Spotlight',80000),(106,'Jazz Jamboree',45000),(103,'R&B Revival',100000),(102,'Rocktober Fest',70000),(110,'World Music Showcase',75000);
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
INSERT INTO `marketing_department` VALUES (101),(102),(103),(104),(105),(106),(107),(108),(109),(110);
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
  KEY `head_id` (`head_id`),
  CONSTRAINT `payroll_data_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `finance_department` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_data`
--

LOCK TABLES `payroll_data` WRITE;
/*!40000 ALTER TABLE `payroll_data` DISABLE KEYS */;
INSERT INTO `payroll_data` VALUES (101,'Spring'),(102,'Summer'),(103,'Autumn'),(104,'Winter'),(105,'Spring'),(106,'Summer'),(107,'Autumn'),(108,'Winter'),(109,'Spring'),(110,'Summer');
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
INSERT INTO `revenue_streams` VALUES (101,'Subscription'),(102,'Advertising'),(103,'Product Sales'),(104,'Licensing'),(105,'Donations'),(106,'Royalties'),(107,'Affiliate Marketing'),(108,'Event Tickets'),(109,'Merchandising'),(110,'Consulting');
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
INSERT INTO `social_media_contacts` VALUES (101,'Facebook'),(102,'Instagram'),(103,'Twitter'),(104,'LinkedIn'),(105,'Pinterest'),(106,'Snapchat'),(107,'TikTok'),(108,'YouTube'),(109,'Reddit'),(110,'WhatsApp');
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

-- Dump completed on 2023-12-03  0:41:19
