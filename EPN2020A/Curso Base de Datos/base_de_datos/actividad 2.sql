-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: colegio
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `t_alumno`
--

DROP TABLE IF EXISTS `t_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_alumno` (
  `N_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `a_Nombre` varchar(250) DEFAULT NULL,
  `a_fechaNacimiento` date DEFAULT NULL,
  `a_Telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`N_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alumno`
--

LOCK TABLES `t_alumno` WRITE;
/*!40000 ALTER TABLE `t_alumno` DISABLE KEYS */;
INSERT INTO `t_alumno` VALUES (1,'juan','2018-02-01',2147483647),(2,'pepe','2018-02-02',432535345),(3,'andres','2018-02-03',435325235),(4,'marco','2018-02-04',2147483647),(5,'sofia','2018-02-05',2147483647),(6,'maria','2018-02-06',54323542),(7,'antonio','2018-02-07',2147483647),(8,'ines','2018-02-08',2147483647),(9,'matilda','2018-02-09',2147483647),(10,'pepa','2018-02-10',5435235),(11,'pepe','2018-02-11',354342523),(12,'diego','2018-02-12',2147483647),(13,'simon','2018-02-13',543432523),(14,'daniela','2018-02-14',43523245),(15,'daniel','2018-02-15',435345),(16,'dani','2018-02-16',2147483647),(17,'marco','2018-02-17',2147483647),(18,'sofia','2018-02-18',35424325),(19,'jose','2018-02-19',2147483647),(20,'andy','2018-02-20',2147483647),(21,'vicky','2018-02-21',2147483647),(22,'marcelo','2018-02-22',453324532),(23,'cesar','2018-02-23',45335423),(24,'maria','2018-02-24',2147483647),(25,'teresa','2018-02-25',543252354),(26,'lilibeth','2018-02-26',2147483647),(27,'miguel','2018-02-27',2147483647),(28,'fredy','2018-02-28',2147483647),(29,'mati','2018-02-01',2147483647),(30,'condor','2018-02-02',2147483647),(31,'antonio','2018-02-03',435243523),(32,'daniel','2018-02-04',2147483647),(33,'daniel','2018-02-05',2147483647),(34,'justin','2018-02-06',2147483647),(35,'lady','2018-02-01',2147483647),(36,'gag','2018-02-01',2147483647),(37,'gaga','2018-02-01',2147483647);
/*!40000 ALTER TABLE `t_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_asignatura`
--

DROP TABLE IF EXISTS `t_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_asignatura` (
  `codigo_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `s_Nombre` varchar(250) DEFAULT NULL,
  `N_matricula` int(11) DEFAULT NULL,
  `Id_P` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_asignatura`),
  KEY `fk_numeroMatricula_idx` (`N_matricula`),
  KEY `fk_idProfesor_idx` (`Id_P`),
  CONSTRAINT `fk_idProfesor` FOREIGN KEY (`Id_P`) REFERENCES `t_profesor` (`Id_P`),
  CONSTRAINT `fk_numeroMatricula` FOREIGN KEY (`N_matricula`) REFERENCES `t_alumno` (`N_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_asignatura`
--

LOCK TABLES `t_asignatura` WRITE;
/*!40000 ALTER TABLE `t_asignatura` DISABLE KEYS */;
INSERT INTO `t_asignatura` VALUES (1,'lengua',2,1),(2,'mate',12,1),(3,'ciencias',31,1),(4,'comunicacion',1,3),(5,'fisica',5,4),(6,'artes',18,5),(7,'humanidad',23,7),(8,'lengua',26,1);
/*!40000 ALTER TABLE `t_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profesor`
--

DROP TABLE IF EXISTS `t_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_profesor` (
  `Id_P` int(11) NOT NULL AUTO_INCREMENT,
  `p_Nombre` varchar(250) DEFAULT NULL,
  `p_Especialidad` varchar(250) DEFAULT NULL,
  `p_Telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_P`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profesor`
--

LOCK TABLES `t_profesor` WRITE;
/*!40000 ALTER TABLE `t_profesor` DISABLE KEYS */;
INSERT INTO `t_profesor` VALUES (1,'Marco','lengua',2147483647),(2,'David','mate',2147483647),(3,'Daniel','ciencias',2147483647),(4,'Jose','biologia',2147483647),(5,'Ivan','sociales',34221341),(6,'Liz','artes',2147483647),(7,'Joss','humanidad',14334241);
/*!40000 ALTER TABLE `t_profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 13:22:59
