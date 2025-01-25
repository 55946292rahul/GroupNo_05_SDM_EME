-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalmanagement
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `pfkey_idx` (`patient_id`),
  KEY `dfkey_idx` (`doctor_id`),
  KEY `rfkey_idx` (`room_id`),
  CONSTRAINT `dfkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `pfkey` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `rfkey` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `cityid_fk_idx` (`cityid`),
  CONSTRAINT `cityid_fk` FOREIGN KEY (`cityid`) REFERENCES `city` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'karve nagar','411021',1),(2,'shivaji nagar','411005',1),(3,'swargate','411042',1),(4,'pimpri','413102',1),(5,'CBS','422001',2),(6,'Dwarka circle','422001',2),(7,'Nashik road','422101',2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL,
  `did` int NOT NULL,
  `amount` float DEFAULT NULL,
  `discharge_date` date NOT NULL,
  `cat_id` int NOT NULL,
  `admission_id` int DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `billfkey_idx` (`did`),
  KEY `categoryfkey_idx` (`cat_id`),
  KEY `adkey_idx` (`admission_id`),
  CONSTRAINT `adkey` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`aid`),
  CONSTRAINT `categoryfkey` FOREIGN KEY (`cat_id`) REFERENCES `roomcategory` (`roomcatid`),
  CONSTRAINT `dockey` FOREIGN KEY (`did`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Pune'),(2,'Nashik'),(3,'Jalgaon'),(4,'Satara'),(5,'Sagli'),(6,'Samhajiagar');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Allergists'),(2,'Dermatologists'),(3,'Ophthalmologists'),(4,'gynecologists'),(5,'Cardiologists'),(6,'Endocrinologists'),(7,'Gastroenterologists'),(8,'Nephrologists'),(9,'Urologists'),(10,'Pulmonologists'),(11,'Otolaryngologists'),(12,'Neurologists'),(13,'Psychiatrists'),(14,'Oncologists'),(15,'Radiologists'),(16,'General surgeon'),(17,'Orthopedic surgeon'),(18,'Anesthesiologists');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `df_name` varchar(255) DEFAULT NULL,
  `dl_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `d_address` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  `DOJ` date NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `dept_id` int NOT NULL,
  `Login_id` int NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `registration_id_UNIQUE` (`registration_id`),
  KEY `loginfkey_idx` (`Login_id`),
  KEY `deptfkey_idx` (`dept_id`),
  CONSTRAINT `deptfkey` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `loginfkey` FOREIGN KEY (`Login_id`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'saurabh','patil','5453526747','saurabh@gmail.com','karve nagar,pune','1293993','2024-03-03','nuerologist',1,74),(2,'string','string','string','string@14242','string','string','2024-08-11','string',1,75),(3,'dsasda','asdas','safdasda','abhi@gmail.com','sdasd','sadasd','2024-08-20','Ortho',1,76),(6,'striasdasdasdng','strasdasfing','strsdfsding','strisfdsdffsdng','strfdssfdfsding','strdsffsdfsding','2024-08-11','stsaddsaring',1,79),(7,'weqawe','wqeqw','wqewqe','qwewe@sdsa','sadas','asdasd','2024-08-13','sadsa',1,80),(8,'aaaaweqawe','aaaawqeqw','aaawqewqe','aaaqwewe@sdsa','aaasadas','aaaasdasd','2024-08-14','aaaasaaaaadsa',1,81),(9,'aaaaa','aaaaa','aaaaa','aaaa@aaa','aaa','aaaaa','2024-08-15','aaa',1,82),(10,'bbb','bbbb','bbb','bbbb@bb','bbbb','bbbbb','2024-08-16','bbbbbb',1,83),(12,'bbbsdasd','bbbbsdas','bbbsads','bbbb@bbsdsd','bbbbsads','bbbbbsadsd','2024-08-16','bbbbbb',1,85),(13,'cccc','cccc','cccc','ccc@cc','ccc','cc','2024-08-18','ccc',1,86);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `r_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `rolefkey_idx` (`r_id`),
  CONSTRAINT `rolefkey` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'akash.salvi','123@456',3,'Active'),(2,'kunnal.p','123E345',3,'Active'),(3,'ram.patil','ram.patil',3,'Active'),(4,'gaurang.mulay','gaurang.mulay',3,'Active'),(5,'omkar.vaidya','omkar.vaidya',3,'Active'),(6,'yash.patil','yash.patil',3,'Active'),(7,'hiten.rathod','hiten.rathod',3,'Active'),(8,'anuja.deshmukh','anuja.deshmukh',3,'Active'),(9,'string.string','string.string',3,'Active'),(10,'string.string','string.string',3,'Active'),(11,'string.string','string.string',3,'Active'),(12,'string.string','string.string',3,'Active'),(13,'string.string','string.string',3,'Active'),(14,'yaysyys.mulay','yaysyys.mulay',3,'Active'),(15,'qww.weerrf','qww.weerrf',3,'Active'),(16,'kunal.wrwr','kunal.wrwr',3,'Active'),(17,'kunal.pingle','kunal.pingle',3,'Active'),(18,'string.string','string.string',3,'Active'),(19,'string.string','string.string',3,'Active'),(20,'kunal.pingle','kunal.pingle',3,'Active'),(21,'kunal.pingle','kunal.pingle',3,'Active'),(22,'kunal.pingle','kunal.pingle',3,'Active'),(23,'string.string','string.string',3,'Active'),(24,'string.string','string.string',3,'Active'),(25,'string.string','string.string',3,'Active'),(26,'string.string','string.string',3,'Active'),(27,'string.string','string.string',3,'Active'),(28,'John.Doe','John.Doe',3,'Active'),(29,'John.Doe','John.Doe',3,'Active'),(30,'kunal.pingle','kunal.pingle',3,'Active'),(31,'asdds.dfsdf','asdds.dfsdf',3,'Active'),(32,'gsggssv.bvxsvxv','gsggssv.bvxsvxv',3,'Active'),(33,'sads.sadas','sads.sadas',3,'Active'),(34,'string.string','string.string',3,'Active'),(35,'string.string','string.string',3,'Active'),(36,'string.string','string.string',3,'Active'),(37,'sads.sadas','sads.sadas',3,'Active'),(38,'sads.sadas','sads.sadas',3,'Active'),(39,'sadas.sadas','sadas.sadas',3,'Active'),(40,'sadsa.dasa','sadsa.dasa',3,'Active'),(41,'asdsa.asdas','asdsa.asdas',3,'Active'),(42,'sadsa.asdasd','sadsa.asdasd',3,'Active'),(43,'asdsa.asdas','asdsa.asdas',3,'Active'),(44,'sads.sdas','sads.sdas',3,'Active'),(45,'sadasd.asdas','sadasd.asdas',3,'Active'),(46,'asdsa.asdas','asdsa.asdas',3,'Active'),(47,'string.string','string.string',3,'Active'),(48,'sadasdas.asdas','sadasdas.asdas',3,'Active'),(49,'sadsad.asdas','sadsad.asdas',3,'Active'),(50,'sadsad.asdas','sadsad.asdas',3,'Active'),(51,'sadsad.asdas','sadsad.asdas',3,'Active'),(52,'sadsad.asdas','sadsad.asdas',3,'Active'),(53,'sadsad.asdas','sadsad.asdas',3,'Active'),(54,'string.string','string.string',3,'Active'),(55,'sadsad.asdas','sadsad.asdas',3,'Active'),(56,'sadsad.asdas','sadsad.asdas',3,'Active'),(57,'sadsad.asdas','sadsad.asdas',3,'Active'),(58,'string.string','string.string',3,'Active'),(59,'sdas.sdas','sdas.sdas',3,'Active'),(60,'sdas.sdas','sdas.sdas',3,'Active'),(61,'sdas.sdas','sdas.sdas',3,'Active'),(62,'sdad.sdas','sdad.sdas',3,'Active'),(63,'sdad.sdas','sdad.sdas',3,'Active'),(64,'sdad.sdas','sdad.sdas',3,'Active'),(65,'sdasd.asdas','sdasd.asdas',3,'Active'),(66,'sads.fcsdfsd','sads.fcsdfsd',3,'Active'),(67,'abhishek.ingle','abhishek.ingle',3,'Active'),(68,'abhishek.ingle','abhishek.ingle',3,'Active'),(69,'abhishek.ingle','abhishek.ingle',3,'Active'),(70,'FDSSD.ASDSD','FDSSD.ASDSD',3,'Active'),(71,'Abhishek.Ingle','Abhishek.Ingle',3,'Active'),(72,'sdsa.sdf','sdsa.sdf',3,'Active'),(73,'admin.admin','admin.admin',1,'Active'),(74,'doctor.doctor','doctor.doctor',2,'Active'),(75,'string','string',2,'Active'),(76,'dsasda','dsasda',2,'Active'),(77,'dsasda','dsasda',2,'Active'),(78,'dsasda','dsasda',2,'Active'),(79,'striasdasdasdng','striasdasdasdng',2,'Active'),(80,'weqawe','weqawe',2,'Active'),(81,'aaaaweqawe','aaaaweqawe',2,'Active'),(82,'aaaaa','aaaaa',2,'Active'),(83,'bbb','bbb',2,'Active'),(84,'bbb','bbb',2,'Active'),(85,'bbbsdasd','bbbsdasd',2,'Active'),(86,'cccc','cccc',2,'Active');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `mob_no` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `p_address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_grp` varchar(255) DEFAULT NULL,
  `dob` date NOT NULL,
  `areaid` int NOT NULL,
  `loginid` int NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`),
  UNIQUE KEY `aadhar_no_UNIQUE` (`aadhar_no`),
  KEY `areaid_fk_idx` (`areaid`),
  KEY `loginid_fk_idx` (`loginid`),
  CONSTRAINT `areaid_fk` FOREIGN KEY (`areaid`) REFERENCES `area` (`aid`),
  CONSTRAINT `loginid_fk` FOREIGN KEY (`loginid`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'akash','salvi','','akashSalvi@gmail.com','12345678','flat no.303 dyandeep colony,karve nagar, pune','M','o+','1998-07-27',1,1),(25,'string','string','','string','string','string','string','string','2024-08-05',1,2),(26,'ram','patil','','ram.patil','12344444444','karve ','M','O+ve','2024-08-06',1,3),(27,'gaurang','mulay','','gaurang.mulay','1263664','karve nagar,pune','Male','B+ve','2024-01-02',1,4),(28,'omkar','vaidya','','omkar@gmail.com','32344415552','karve nagar,pune','Male','O+ve','2024-08-05',1,5),(29,'yash','patil','','yash@patil','43552626','shivajiagar,pune','Male','B+ve','2024-08-05',2,6),(30,'hiten','rathod','','hiten@gmail.com','525263781','karve nagar,pune','Male','O+ve','2024-08-05',1,7),(31,'anuja','deshmukh','','anuja@gmail.com','14256637388','karve nagar,pune','Female','A+ve','2024-08-05',1,8),(32,'string','string','string','string111','string11111111','string','string','string','2024-08-08',1,10),(33,'string','string','string','strin2344g','strin1223g','string','string','string','2024-08-09',1,11),(34,'string','string','string','strin2344gll','strinss1223g','string','string','string','2024-08-09',1,12),(35,'string','string','string','strin2tt344gll','strittnss1223g','string','string','string','2024-08-09',1,13),(37,'qww','weerrf','9578736348','123@gm','122343456','karve nagar,pune','Male','B+ve','2024-08-07',1,15),(45,'John','Doe','1234567890','john.doe@example.com','123412341234','123 Main St, City, State','Male','O+','1990-01-01',1,28),(46,'John','Doe','1234567890','john.doe@examp3322le.com','1234121234','123 Main St, City, State','Male','O+','1990-01-01',1,29),(53,'string','string','string','strsadasdsing','strinsdasg','strinsadasg','string','string','2024-08-09',1,36),(62,'string','string','string','strsdasdaing','strasdasdsaing','strasdsaing','string','string','2024-08-09',1,47),(69,'string','string','string','stsdadsring','strsdasing','string','string','string','2024-08-09',1,54),(73,'string','string','string','string@example.sdadsdacom','strisdassdang','strsadasing','strasding','string','2024-08-09',1,58),(79,'sdad','sdas','asdas','sadas@asdas','sadas323','asdsad','Male','O+ve','2024-06-01',1,64),(80,'sdasd','asdas','sadasdas','dasd@sdasd','asdsa3','sadsa','Female','O+ve','2024-08-08',1,65),(81,'sads','fcsdfsd','23423432','dsajdsjn@jdsfsk','sdfk43','sfdasda','Female','B+ve','2024-08-09',1,66),(82,'FDSSD','ASDSD','34234','sads@dsf','sadasd','sdsdf','Male','B+ve','2024-08-01',1,70),(83,'Abhishek','Ingle','7249658000','abhi@gmail.com','545415454','Mauli niwas','Male','O+ve','2024-08-06',1,71),(84,'sdsa','sdf','sfdfsdr54','`sdsd@fds','sdfs45','`sdasdcasdf','Female','B+ve','2024-08-07',1,72);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `amount` float DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `dofkey` (`doctor_id`),
  KEY `pafkey` (`patient_id`),
  KEY `bilfkey` (`bill_id`),
  CONSTRAINT `bilfkey` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  CONSTRAINT `dofkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `pafkey` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `r_id` int NOT NULL,
  `r_name` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin',NULL),(2,'Doctor',NULL),(3,'Patient',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `roomcatid` int NOT NULL,
  `availability` bit(1) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `room_number` varchar(255) DEFAULT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `rckey_idx` (`roomcatid`),
  CONSTRAINT `rckey` FOREIGN KEY (`roomcatid`) REFERENCES `roomcategory` (`roomcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomcategory`
--

DROP TABLE IF EXISTS `roomcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomcategory` (
  `roomcatid` int NOT NULL,
  `charges` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcategory`
--

LOCK TABLES `roomcategory` WRITE;
/*!40000 ALTER TABLE `roomcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 10:57:08
