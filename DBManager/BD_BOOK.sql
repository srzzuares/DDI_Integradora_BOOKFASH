CREATE DATABASE  IF NOT EXISTS `bookfash` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bookfash`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bookfash
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `tbb_autor`
--

DROP TABLE IF EXISTS `tbb_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_autor` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT,
  `PersonaId` int(10) unsigned NOT NULL,
  `LibroId` int(10) unsigned NOT NULL,
  `cantidadlibros` int(11) DEFAULT '1',
  `biografiaAutor` varchar(205) DEFAULT 'Biografia no disponible',
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_autor`
--

LOCK TABLES `tbb_autor` WRITE;
/*!40000 ALTER TABLE `tbb_autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_criterio`
--

DROP TABLE IF EXISTS `tbb_criterio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_criterio` (
  `id_criterio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT 'Anonimo',
  `descripcioncriterio` varchar(200) DEFAULT 'Sin Criterio',
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_criterio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_criterio`
--

LOCK TABLES `tbb_criterio` WRITE;
/*!40000 ALTER TABLE `tbb_criterio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_criterio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_editorial`
--

DROP TABLE IF EXISTS `tbb_editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_editorial` (
  `id_editorial` int(11) NOT NULL AUTO_INCREMENT,
  `nombreeditorial` varchar(100) NOT NULL,
  `autoresEditorial` varchar(100) DEFAULT 'Autor Anonimo',
  `logoEditorial` longblob,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_editorial`
--

LOCK TABLES `tbb_editorial` WRITE;
/*!40000 ALTER TABLE `tbb_editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_genero`
--

DROP TABLE IF EXISTS `tbb_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(45) NOT NULL,
  `GeneroPadre` int(11) DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_genero`
--

LOCK TABLES `tbb_genero` WRITE;
/*!40000 ALTER TABLE `tbb_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_libro`
--

DROP TABLE IF EXISTS `tbb_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_libro` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT,
  `AutorId` int(10) unsigned NOT NULL,
  `titulolibro` varchar(100) NOT NULL,
  `portada` longblob,
  `CriterioId` int(10) unsigned DEFAULT NULL,
  `EditorialId` int(10) unsigned NOT NULL,
  `GeneroId` int(10) unsigned NOT NULL,
  `numeroPaginas` int(11) DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `descripcionlibro` varchar(200) DEFAULT NULL,
  `ValoracionId` int(10) unsigned NOT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_libro`
--

LOCK TABLES `tbb_libro` WRITE;
/*!40000 ALTER TABLE `tbb_libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_persona`
--

DROP TABLE IF EXISTS `tbb_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `genero` enum('Hombre','Mujer') NOT NULL DEFAULT 'Hombre',
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_persona`
--

LOCK TABLES `tbb_persona` WRITE;
/*!40000 ALTER TABLE `tbb_persona` DISABLE KEYS */;
INSERT INTO `tbb_persona` VALUES (1,'Crystian','Suarez','Hombre','Crys@gmail.com','1234','2023-07-21','Activo',NULL,'2023-07-21 08:08:55'),(2,'Dober','Suarez Cuevas','Hombre','crysss@gmail.com','12344','2000-07-21','Inactivo','2023-07-21 08:16:17','2023-07-21 08:09:26'),(3,'nombre_persona','apellido_persona','','correo_persona@gmail.com','contrasena_persona','0000-00-00','Activo',NULL,'2023-07-24 22:11:10'),(91,'Antonio','Hernández','Hombre','antonio.hernández@example.com','73010edc!43','2007-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(92,'Miguel','Fernández','Mujer','miguel.fernández@example.com','73147180!98','1981-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(93,'Manuel','Gómez','Hombre','manuel.gómez@example.com','73204f0b!93','2003-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(94,'María','González','Mujer','maría.gonzález@example.com','73312d25!13','1983-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(95,'Juan','Ramos','Hombre','juan.ramos@example.com','733e414e!62','2005-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(96,'Luis','López','Mujer','luis.lópez@example.com','735316c0!11','2015-01-01','Inactivo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(97,'María','Fernández','Mujer','maría.fernández@example.com','735ef131!65','1998-01-01','Activo','2023-07-25 00:37:35','2023-07-25 00:37:35'),(98,'José','Gómez','Hombre','josé.gómez@example.com','736e5088!74','2022-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(99,'Manuel','Pérez','Mujer','manuel.pérez@example.com','73750a8e!87','2021-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(100,'Pedro','Gómez','Hombre','pedro.gómez@example.com','737da81d!38','1997-01-01','Inactivo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(101,'María','Gómez','Mujer','maría.gómez@example.com','738617f5!1','1980-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(102,'José','Rodríguez','Hombre','josé.rodríguez@example.com','738df87f!90','1959-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(103,'Juan','Ortega','Mujer','juan.ortega@example.com','739b66ae!95','1986-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(104,'Manuel','Martínez','Mujer','manuel.martínez@example.com','73a2cac2!27','1961-01-01','Inactivo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(105,'Luis','Martínez','Mujer','luis.martínez@example.com','73ab51be!33','1983-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(106,'Andrés','López','Mujer','andrés.lópez@example.com','73b4d095!73','1960-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(107,'Alejandro','Ramos','Hombre','alejandro.ramos@example.com','73bf826c!28','1962-01-01','Inactivo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(108,'Manuel','Fernández','Mujer','manuel.fernández@example.com','73c65b01!74','2016-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(109,'Javier','Gómez','Hombre','javier.gómez@example.com','73d3ef2b!22','2017-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(110,'Carmen','Fernández','Hombre','carmen.fernández@example.com','73de3307!11','1990-01-01','Inactivo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(111,'Carmen','Hernández','Mujer','carmen.hernández@example.com','73e4fd5e!34','1993-01-01','Inactivo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(112,'Eduardo','Gómez','Mujer','eduardo.gómez@example.com','73eba826!29','1981-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(113,'Sergio','López','Hombre','sergio.lópez@example.com','73f5fbee!51','1985-01-01','Activo','2023-07-25 00:37:36','2023-07-25 00:37:36'),(114,'Diego','Rodríguez','Mujer','diego.rodríguez@example.com','73fe3450!30','1971-01-01','Activo','2023-07-25 00:37:37','2023-07-25 00:37:37'),(115,'Ricardo','Pérez','Hombre','ricardo.pérez@example.com','74051098!28','1951-01-01','Activo','2023-07-25 00:37:37','2023-07-25 00:37:37'),(117,'Antonio','Rodríguez','Mujer','antonio.rodríguez@example.com','7a876a36!64','1999-01-01','Activo','2023-07-25 00:37:47','2023-07-25 00:37:47'),(118,'Manuel','Ortega','Hombre','manuel.ortega@example.com','7a8cd7cb!43','2021-01-01','Activo','2023-07-25 00:37:48','2023-07-25 00:37:48'),(119,'Miguel','Martínez','Hombre','miguel.martínez@example.com','7a938cea!56','1977-01-01','Activo','2023-07-25 00:37:48','2023-07-25 00:37:48'),(120,'Carlos','Ortega','Mujer','carlos.ortega@example.com','7a9b7f1d!60','1971-01-01','Activo','2023-07-25 00:37:48','2023-07-25 00:37:48'),(122,'David','Pérez','Mujer','david.pérez@gmail.com','26425e43!58','1986-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(123,'Miguel','Martínez','Hombre','miguel.martínez@gmail.com','264b55d3!79','1966-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(124,'Fernando','Hernández','Hombre','fernando.hernández@gmail.com','26555201!72','2020-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(125,'Fernando','Gómez','Mujer','fernando.gómez@gmail.com','265e179b!18','2006-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(126,'Jonathan','González','Hombre','jonathan.gonzález@gmail.com','266655de!72','1982-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(127,'Damián','López','Mujer','damián.lópez@gmail.com','2670d312!51','1988-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(128,'César','Ortega','Hombre','césar.ortega@gmail.com','267731a6!58','1990-01-01','Activo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(129,'Francisco','Hernández','Hombre','francisco.hernández@gmail.com','267c601c!86','2008-01-01','Inactivo','2023-07-25 00:49:45','2023-07-25 00:49:45'),(130,'Andrés','Ramos','Mujer','andrés.ramos@gmail.com','26814c3b!19','1952-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(131,'Germán','Hernández','Mujer','germán.hernández@gmail.com','26868cc1!82','1991-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(132,'Edgar','Ramos','Mujer','edgar.ramos@gmail.com','268b9bdf!29','1996-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(133,'Saúl','Hernández','Mujer','saúl.hernández@gmail.com','2690b02c!53','1994-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(134,'Pedro','Martínez','Hombre','pedro.martínez@gmail.com','26988f37!79','1975-01-01','Inactivo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(135,'Gerardo','Hernández','Hombre','gerardo.hernández@gmail.com','26a0a041!77','2022-01-01','Inactivo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(136,'Gabriel','López','Mujer','gabriel.lópez@gmail.com','26a84b70!53','1988-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(137,'Rafael','Ortega','Mujer','rafael.ortega@gmail.com','26af3b94!22','2006-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(138,'Enrique','González','Hombre','enrique.gonzález@gmail.com','26b48e85!19','2022-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(139,'Leonardo','Ramos','Mujer','leonardo.ramos@gmail.com','26bb3a29!52','1965-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(140,'Héctor','Ramos','Hombre','héctor.ramos@gmail.com','26c05d9a!81','1965-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(141,'Rodrigo','Rodríguez','Mujer','rodrigo.rodríguez@gmail.com','26c6ddec!50','1956-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(142,'Ángel','Ramos','Hombre','ángel.ramos@gmail.com','26cc4cfb!53','1961-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(143,'Miguel','López','Hombre','miguel.lópez@gmail.com','26d2c586!26','1989-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(144,'Armando','Hernández','Mujer','armando.hernández@gmail.com','26d7bd90!83','1966-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(145,'Rafael','González','Hombre','rafael.gonzález@gmail.com','26dcf94e!11','1994-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(146,'Felipe','Fernández','Mujer','felipe.fernández@gmail.com','26e1f006!35','1963-01-01','Activo','2023-07-25 00:49:46','2023-07-25 00:49:46'),(148,'Jonathan','Hernández','Hombre','jonathan.hernández@gmail.com','80c7e2f6!89','1997-01-01','Activo','2023-07-25 00:52:17','2023-07-25 00:52:17'),(149,'Sergio','Pérez','Mujer','sergio.pérez@gmail.com','80d0d5c3!28','1960-01-01','Activo','2023-07-25 00:52:17','2023-07-25 00:52:17'),(150,'Antonio','Hernández','Hombre','antonio.hernández@gmail.com','80d734e7!57','2007-01-01','Activo','2023-07-25 00:52:17','2023-07-25 00:52:17'),(151,'Santiago','Ramos','Hombre','santiago.ramos@gmail.com','80de533e!28','2007-01-01','Activo','2023-07-25 00:52:17','2023-07-25 00:52:17'),(153,'Javier','McDaniel','Hombre','javier.mcdaniel@gmail.com','e8267a80!63','2019-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(154,'Claudia','Hurtado','Hombre','claudia.hurtado@gmail.com','e84b9a25!35','1988-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(155,'Rafael','Sullivan','Mujer','rafael.sullivan@gmail.com','e857180c!26','2023-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(156,'Jaime','Beck','Mujer','jaime.beck@gmail.com','e86040d9!79','2021-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(157,'Héctor','Martín','Mujer','héctor.martín@gmail.com','e86f1db0!76','1975-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(158,'Elena','Daniels','Mujer','elena.daniels@gmail.com','e87bb86e!97','1978-01-01','Activo','2023-07-25 01:02:20','2023-07-25 01:02:20'),(159,'Sergio','Alexander','Hombre','sergio.alexander@gmail.com','e88bbfef!98','1964-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(160,'Eva','Escobar','Hombre','eva.escobar@gmail.com','e8950d60!34','1996-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(161,'Daniela','Newman','Hombre','daniela.newman@gmail.com','e89f0be0!43','2000-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(162,'Enrique','Bowman','Hombre','enrique.bowman@gmail.com','e8aa57ff!57','1967-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(163,'Rosa','Haynes','Mujer','rosa.haynes@gmail.com','e8b1bd61!52','1986-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(164,'Ricardo','Mendoza','Mujer','ricardo.mendoza@gmail.com','e8c02ecd!61','1955-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(165,'Cecilia','Hale','Hombre','cecilia.hale@gmail.com','e8c77d24!80','1981-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(166,'Samuel','Love','Hombre','samuel.love@gmail.com','e8cf13f6!22','2014-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(167,'Marta','Hale','Mujer','marta.hale@gmail.com','e8d53bcd!78','1999-01-01','Inactivo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(168,'Felipe','Soto','Hombre','felipe.soto@gmail.com','e8dc23c8!90','1992-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(169,'Víctor','Rodríguez','Mujer','víctor.rodríguez@gmail.com','e8e2e844!18','1993-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(170,'Adriana','Hale','Mujer','adriana.hale@gmail.com','e8e9ac20!3','1970-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(171,'Marta','Newman','Hombre','marta.newman@gmail.com','e8f05707!55','1982-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(172,'Regina','Holmes','Mujer','regina.holmes@gmail.com','e8f733a0!21','1971-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(173,'Mateo','Haynes','Mujer','mateo.haynes@gmail.com','e8fdeec4!84','2019-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(174,'Federico','Hale','Hombre','federico.hale@gmail.com','e904d802!95','1968-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(175,'Angélica','Mendoza','Hombre','angélica.mendoza@gmail.com','e90b8778!48','1986-01-01','Inactivo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(176,'Alan','Rhodes','Mujer','alan.rhodes@gmail.com','e918037e!55','1973-01-01','Activo','2023-07-25 01:02:21','2023-07-25 01:02:21'),(177,'Teresa','Love','Hombre','teresa.love@gmail.com','e9244508!8','2017-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(178,'Laura','Andrade','Hombre','laura.andrade@gmail.com','e9315de5!87','1996-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(179,'Eva','McCoy','Hombre','eva.mccoy@gmail.com','e93ee29e!9','1999-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(180,'Jaime','Newman','Mujer','jaime.newman@gmail.com','e94b350a!99','1969-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(181,'Teresa','Ross','Mujer','teresa.ross@gmail.com','e9569c0a!4','1976-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(182,'Cristopher','Vargas','Hombre','cristopher.vargas@gmail.com','e963191a!99','1975-01-01','Inactivo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(183,'Gustavo','Jackson','Mujer','gustavo.jackson@gmail.com','e96efe48!24','1992-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(184,'Mario','Mendoza','Mujer','mario.mendoza@gmail.com','e97ad24e!7','1955-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(185,'Germán','Love','Hombre','germán.love@gmail.com','e988ea72!81','1998-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(186,'Mercedes','Webb','Hombre','mercedes.webb@gmail.com','e99a257d!3','1966-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(187,'Antonia','Ramos','Mujer','antonia.ramos@gmail.com','e9a4a702!19','2020-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(188,'Martín','Mendoza','Mujer','martín.mendoza@gmail.com','e9b0c2e4!84','1954-01-01','Activo','2023-07-25 01:02:22','2023-07-25 01:02:22'),(189,'Alexis','Mendoza','Mujer','alexis.mendoza@gmail.com','e9bc7bdf!89','1950-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(190,'Rafael','Payne','Mujer','rafael.payne@gmail.com','e9ca04bc!42','1983-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(191,'Renata','Pena','Mujer','renata.pena@gmail.com','e9d68975!88','2016-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(192,'Valentina','Newman','Hombre','valentina.newman@gmail.com','e9f23bfb!29','2005-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(193,'David','Hunter','Mujer','david.hunter@gmail.com','ea0cc3f1!27','2023-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(194,'Guillermo','Pena','Mujer','guillermo.pena@gmail.com','ea1901e8!39','1964-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(195,'Rafael','Mendoza','Mujer','rafael.mendoza@gmail.com','ea25935e!38','1982-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(196,'Daniel','Beck','Hombre','daniel.beck@gmail.com','ea345b68!14','2002-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(197,'Gustavo','Pena','Hombre','gustavo.pena@gmail.com','ea3d5eee!26','1970-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(198,'David','Love','Mujer','david.love@gmail.com','ea4798e4!26','2007-01-01','Activo','2023-07-25 01:02:23','2023-07-25 01:02:23'),(199,'Ismael','Ibarra','Mujer','ismael.ibarra@gmail.com','ea56d49d!94','2010-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(200,'Julieta','Hernández','Mujer','julieta.hernández@gmail.com','ea6175f9!62','2011-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(201,'Hugo','Velasco','Hombre','hugo.velasco@gmail.com','ea6ce793!84','1989-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(202,'Emmanuel','Hale','Hombre','emmanuel.hale@gmail.com','ea79e014!34','1957-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(203,'Guillermo','Lozano','Mujer','guillermo.lozano@gmail.com','eaa4317c!46','1961-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(204,'Adriana','Harris','Hombre','adriana.harris@gmail.com','eab10f86!91','2022-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(205,'Camila','Núñez','Mujer','camila.núñez@gmail.com','eabc7e1b!91','1988-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(206,'Manuel','Webb','Hombre','manuel.webb@gmail.com','eac88fed!64','1961-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(207,'Adrián','Hale','Mujer','adrián.hale@gmail.com','eae01c88!47','1979-01-01','Activo','2023-07-25 01:02:24','2023-07-25 01:02:24'),(208,'Alma','Osorio','Hombre','alma.osorio@gmail.com','eaebe203!78','2009-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(209,'Gabriel','Lawrence','Hombre','gabriel.lawrence@gmail.com','eaf7d40e!81','1967-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(210,'Hernán','Haynes','Mujer','hernán.haynes@gmail.com','eb03a546!7','1958-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(211,'Mercedes','Mendoza','Mujer','mercedes.mendoza@gmail.com','eb0f8904!2','1989-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(212,'Margarita','Beck','Mujer','margarita.beck@gmail.com','eb1de047!97','1957-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(213,'José','Rhodes','Mujer','josé.rhodes@gmail.com','eb2ab11a!46','1967-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(214,'Raquel','Jones','Hombre','raquel.jones@gmail.com','eb39e667!62','1978-01-01','Inactivo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(215,'Hugo','Newman','Hombre','hugo.newman@gmail.com','eb4625c4!93','1973-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(216,'Alberto','Mendoza','Mujer','alberto.mendoza@gmail.com','eb55223f!97','2004-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(217,'Rogelio','Fernández','Hombre','rogelio.fernández@gmail.com','eb65771c!69','1993-01-01','Activo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(218,'Gabriela','Ramos','Mujer','gabriela.ramos@gmail.com','eb75920d!32','1966-01-01','Inactivo','2023-07-25 01:02:25','2023-07-25 01:02:25'),(219,'Rubén','Haynes','Mujer','rubén.haynes@gmail.com','eb815231!40','2009-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(220,'Rubén','Fuentes','Hombre','rubén.fuentes@gmail.com','eb8ce89d!96','1971-01-01','Inactivo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(221,'Samuel','Hale','Mujer','samuel.hale@gmail.com','eb98eb60!78','1970-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(222,'Luis','Rhodes','Hombre','luis.rhodes@gmail.com','eba6bf99!58','2000-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(223,'Óscar','Reid','Hombre','óscar.reid@gmail.com','ebb3085c!55','1957-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(224,'Armando','Rhodes','Mujer','armando.rhodes@gmail.com','ebc203d7!24','2022-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(225,'Raúl','Newman','Mujer','raúl.newman@gmail.com','ebd19eb9!2','1970-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(226,'Luz','Hale','Mujer','luz.hale@gmail.com','ebde81af!49','1967-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(227,'Fernando','Love','Mujer','fernando.love@gmail.com','ebeadc3f!15','2008-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(228,'Héctor','Quintero','Mujer','héctor.quintero@gmail.com','ebf7c035!0','2020-01-01','Activo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(229,'Rosa','Hale','Mujer','rosa.hale@gmail.com','ec0411d9!58','1997-01-01','Inactivo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(230,'Sofía','Fernandez','Hombre','sofía.fernandez@gmail.com','ec0fc812!76','1971-01-01','Inactivo','2023-07-25 01:02:26','2023-07-25 01:02:26'),(231,'Esperanza','McDaniel','Mujer','esperanza.mcdaniel@gmail.com','ec1b5e31!86','2020-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(232,'Adela','McDaniel','Hombre','adela.mcdaniel@gmail.com','ec27576f!45','2020-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(233,'Adrián','Dixon','Hombre','adrián.dixon@gmail.com','ec34b584!46','1961-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(234,'Marina','Conde','Hombre','marina.conde@gmail.com','ec417ca3!53','1962-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(235,'Ricardo','McDaniel','Hombre','ricardo.mcdaniel@gmail.com','ec4f1ff5!77','1952-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(236,'Luis','Haynes','Hombre','luis.haynes@gmail.com','ec5bdb76!85','1972-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(237,'Sergio','Ortega','Hombre','sergio.ortega@gmail.com','ec69fe4d!2','1958-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(238,'Alejandro','Mendoza','Mujer','alejandro.mendoza@gmail.com','ec777fed!23','1994-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(239,'Jaime','Estrada','Mujer','jaime.estrada@gmail.com','ec84c001!53','1993-01-01','Inactivo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(240,'Ulises','Mendoza','Hombre','ulises.mendoza@gmail.com','ec92f121!70','1957-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(241,'Leonardo','Martínez','Mujer','leonardo.martínez@gmail.com','eca17efd!22','1974-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(242,'Emmanuel','Simmons','Hombre','emmanuel.simmons@gmail.com','ecae4e64!54','2008-01-01','Activo','2023-07-25 01:02:27','2023-07-25 01:02:27'),(243,'Emmanuel','Armendáriz','Hombre','emmanuel.armendáriz@gmail.com','ecbd8708!54','2003-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(244,'Carolina','Mendoza','Mujer','carolina.mendoza@gmail.com','ecc7a1b7!98','1970-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(245,'Laura','Fernández','Hombre','laura.fernández@gmail.com','ecd0e7b2!56','1964-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(246,'Emmanuel','Ruiz','Hombre','emmanuel.ruiz@gmail.com','ecd94e51!71','1960-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(247,'Ernesto','Love','Hombre','ernesto.love@gmail.com','ece189d1!69','1986-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(248,'Laura','Thomas','Hombre','laura.thomas@gmail.com','eceaa847!77','1981-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(249,'Roberto','Mendoza','Mujer','roberto.mendoza@gmail.com','ecf73d05!7','1993-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(250,'Brenda','Haynes','Hombre','brenda.haynes@gmail.com','ed00ad00!75','1988-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(251,'Santiago','Newman','Mujer','santiago.newman@gmail.com','ed0e2581!15','1950-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(252,'Héctor','Washington','Hombre','héctor.washington@gmail.com','ed162ce2!75','1991-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(253,'Carmen','Newman','Mujer','carmen.newman@gmail.com','ed1e9c59!73','2020-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(254,'Federico','Rhodes','Hombre','federico.rhodes@gmail.com','ed25187d!1','1980-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(255,'Armando','Love','Hombre','armando.love@gmail.com','ed2d8063!78','1981-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(256,'Patricia','Webb','Hombre','patricia.webb@gmail.com','ed345d73!18','1953-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(257,'Mercedes','Rosas','Hombre','mercedes.rosas@gmail.com','ed3b044a!7','1986-01-01','Inactivo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(258,'Adrián','Bell','Mujer','adrián.bell@gmail.com','ed488350!56','2015-01-01','Activo','2023-07-25 01:02:28','2023-07-25 01:02:28'),(259,'Laura','Estrada','Hombre','laura.estrada@gmail.com','ed550fb6!70','1997-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(260,'Ezequiel','Simmons','Mujer','ezequiel.simmons@gmail.com','ed6158d1!82','1993-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(261,'Josefina','Aguirre','Hombre','josefina.aguirre@gmail.com','ed6d8f6b!40','2007-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(262,'Gloria','Beck','Mujer','gloria.beck@gmail.com','ed7b297a!25','1980-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(263,'Miguel','Obrien','Mujer','miguel.obrien@gmail.com','ed87e229!25','1998-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(264,'Raquel','Borrego','Mujer','raquel.borrego@gmail.com','ed9fa8f1!56','2008-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(265,'Luz','Thomas','Mujer','luz.thomas@gmail.com','edae7896!96','2016-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(266,'Juana','Mendoza','Mujer','juana.mendoza@gmail.com','edbb63ce!18','1975-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(267,'Beatriz','Love','Mujer','beatriz.love@gmail.com','edc8452b!74','1988-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(268,'José','Washington','Hombre','josé.washington@gmail.com','edd45a73!84','1963-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(269,'Armando','Borboa','Hombre','armando.borboa@gmail.com','ede024da!50','1995-01-01','Activo','2023-07-25 01:02:29','2023-07-25 01:02:29'),(270,'Héctor','Castañeda','Hombre','héctor.castañeda@gmail.com','edf484f9!99','1995-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(271,'Julieta','Hale','Hombre','julieta.hale@gmail.com','ee046f56!21','1965-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(272,'Gloria','Newman','Mujer','gloria.newman@gmail.com','ee15537a!24','2001-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(273,'Rocío','Love','Mujer','rocío.love@gmail.com','ee2071f6!25','1985-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(274,'Fernando','Hamilton','Hombre','fernando.hamilton@gmail.com','ee539944!23','1963-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(275,'Eva','Williams','Mujer','eva.williams@gmail.com','ee65034f!11','2001-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(276,'Antonio','Saucedo','Hombre','antonio.saucedo@gmail.com','ee727308!2','1961-01-01','Activo','2023-07-25 01:02:30','2023-07-25 01:02:30'),(277,'Enrique','Wilson','Mujer','enrique.wilson@gmail.com','ee7d281d!69','1958-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(278,'Fernando','Peña','Hombre','fernando.peña@gmail.com','ee876c9d!65','2006-01-01','Inactivo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(279,'Ernesto','Romero','Mujer','ernesto.romero@gmail.com','ee92dd0e!49','1957-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(280,'Eduardo','Mendoza','Hombre','eduardo.mendoza@gmail.com','eea006e5!20','2015-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(281,'Julia','Ortega','Mujer','julia.ortega@gmail.com','eeaef147!64','1961-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(282,'Ismael','Hicks','Mujer','ismael.hicks@gmail.com','eeb5fc0f!80','1975-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(283,'Alan','McDaniel','Mujer','alan.mcdaniel@gmail.com','eebe7448!9','1993-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(284,'Eduardo','Valencia','Hombre','eduardo.valencia@gmail.com','eecb2495!94','1955-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(285,'Gustavo','Mendoza','Mujer','gustavo.mendoza@gmail.com','eed3b439!32','1999-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(286,'Raúl','Haynes','Mujer','raúl.haynes@gmail.com','eeddca96!97','1969-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(287,'Marta','McKinney','Mujer','marta.mckinney@gmail.com','eee4abaf!81','2020-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(288,'Fernando','Rhodes','Mujer','fernando.rhodes@gmail.com','eef19a21!10','1996-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(289,'Jonathan','Love','Mujer','jonathan.love@gmail.com','eeff2dd4!60','1974-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(290,'Armando','Mendoza','Mujer','armando.mendoza@gmail.com','ef0c3ec5!83','1981-01-01','Activo','2023-07-25 01:02:31','2023-07-25 01:02:31'),(291,'Silvia','Rhodes','Hombre','silvia.rhodes@gmail.com','ef19ec6f!57','1991-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(292,'Luis','Rivas','Mujer','luis.rivas@gmail.com','ef28da32!61','1967-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(293,'Julia','Love','Mujer','julia.love@gmail.com','ef34da51!54','2008-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(294,'Juan','Rhodes','Hombre','juan.rhodes@gmail.com','ef438efa!33','2015-01-01','Inactivo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(295,'Leonardo','Beck','Hombre','leonardo.beck@gmail.com','ef50af3d!98','2012-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(296,'Saúl','Love','Hombre','saúl.love@gmail.com','ef60a1a9!4','1982-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(297,'Ángela','Graham','Hombre','ángela.graham@gmail.com','ef6ce2fc!84','1961-01-01','Activo','2023-07-25 01:02:32','2023-07-25 01:02:32'),(299,'Regina','Beck','Mujer','regina.beck@gmail.com','1f0abef1!25','2013-01-01','Activo','2023-07-25 01:03:52','2023-07-25 01:03:52'),(300,'Eduardo','Enciso','Mujer','eduardo.enciso@gmail.com','1f1ce74e!98','2017-01-01','Activo','2023-07-25 01:03:52','2023-07-25 01:03:52'),(301,'Esmeralda','Mendoza','Mujer','esmeralda.mendoza@gmail.com','1f2f7144!78','2015-01-01','Activo','2023-07-25 01:03:52','2023-07-25 01:03:52'),(302,'Gabriela','Moreno','Hombre','gabriela.moreno@gmail.com','1f41e84a!5','1995-01-01','Activo','2023-07-25 01:03:52','2023-07-25 01:03:52'),(303,'Rogelio','Love','Hombre','rogelio.love@gmail.com','1f52b612!97','2013-01-01','Activo','2023-07-25 01:03:52','2023-07-25 01:03:52'),(304,'Hugo','Ojeda','Mujer','hugo.ojeda@gmail.com','1f67716f!83','1979-01-01','Inactivo','2023-07-25 01:03:53','2023-07-25 01:03:53'),(305,'Javier','Newman','Hombre','javier.newman@gmail.com','1f76d184!45','1972-01-01','Activo','2023-07-25 01:03:53','2023-07-25 01:03:53'),(306,'Regina','McDaniel','Hombre','regina.mcdaniel@gmail.com','1f86c347!95','2014-01-01','Activo','2023-07-25 01:03:53','2023-07-25 01:03:53'),(307,'Regina','Hale','Mujer','regina.hale@gmail.com','1fb42d39!46','1989-01-01','Activo','2023-07-25 01:03:53','2023-07-25 01:03:53'),(308,'Gabriel','Báez','Mujer','gabriel.báez@gmail.com','1fc8a4e8!38','1953-01-01','Activo','2023-07-25 01:03:53','2023-07-25 01:03:53'),(310,'Adriana','Pena','Hombre','adriana.pena@gmail.com','37724fb8!28','1968-01-01','Activo','2023-07-25 01:04:33','2023-07-25 01:04:33'),(311,'Manuela','Pacheco','Mujer','manuela.pacheco@gmail.com','378adc0b!1','1988-01-01','Activo','2023-07-25 01:04:33','2023-07-25 01:04:33'),(312,'Carmen','Fuentes','Mujer','carmen.fuentes@gmail.com','37a48f72!65','1989-01-01','Activo','2023-07-25 01:04:33','2023-07-25 01:04:33'),(313,'Antonia','Beck','Hombre','antonia.beck@gmail.com','37bb109c!77','1968-01-01','Activo','2023-07-25 01:04:33','2023-07-25 01:04:33'),(314,'Cristopher','Ramírez','Hombre','cristopher.ramírez@gmail.com','37d28dfe!94','2008-01-01','Activo','2023-07-25 01:04:34','2023-07-25 01:04:34'),(315,'César','Rhodes','Hombre','césar.rhodes@gmail.com','37eb3ca8!39','2006-01-01','Activo','2023-07-25 01:04:34','2023-07-25 01:04:34'),(316,'Elena','González','Hombre','elena.gonzález@gmail.com','380277a9!21','2000-01-01','Activo','2023-07-25 01:04:34','2023-07-25 01:04:34'),(317,'Martín','Hernández','Hombre','martín.hernández@gmail.com','381ae86c!87','1972-01-01','Activo','2023-07-25 01:04:34','2023-07-25 01:04:34'),(318,'José','Jenkins','Hombre','josé.jenkins@gmail.com','38335672!37','2004-01-01','Activo','2023-07-25 01:04:34','2023-07-25 01:04:34'),(320,'Hugo','Shaw','Hombre','hugo.shaw@gmail.com','b7626fac!1','1951-01-01','Activo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(321,'Efraín','Newman','Hombre','efraín.newman@gmail.com','b7844938!53','2018-01-01','Activo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(322,'Benjamín','Valdez','Hombre','benjamín.valdez@gmail.com','b7a3517b!93','2012-01-01','Activo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(323,'Gustavo','Love','Hombre','gustavo.love@gmail.com','b7bd9934!66','2012-01-01','Activo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(324,'Damián','Beck','Hombre','damián.beck@gmail.com','b7d4cc45!74','1982-01-01','Activo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(325,'Felipe','Haynes','Mujer','felipe.haynes@gmail.com','b7ecc5e9!13','2017-01-01','Inactivo','2023-07-25 01:08:08','2023-07-25 01:08:08'),(326,'Paula','Newman','Mujer','paula.newman@gmail.com','b8054cb7!96','1954-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(327,'Irene','Haynes','Mujer','irene.haynes@gmail.com','b81dae66!4','1983-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(328,'Alejandro','Hale','Hombre','alejandro.hale@gmail.com','b8353e57!32','1956-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(329,'Clara','Pena','Hombre','clara.pena@gmail.com','b8502b3e!55','1959-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(330,'Rosa','González','Mujer','rosa.gonzález@gmail.com','b86726b0!20','2014-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(331,'Elena','Báez','Hombre','elena.báez@gmail.com','b87e3bab!37','1962-01-01','Activo','2023-07-25 01:08:09','2023-07-25 01:08:09'),(332,'Ángel','Pena','Hombre','ángel.pena@gmail.com','b89d9da2!73','1976-01-01','Activo','2023-07-25 01:08:10','2023-07-25 01:08:10'),(333,'Alan','Beck','Mujer','alan.beck@gmail.com','b8b5b304!51','2013-01-01','Inactivo','2023-07-25 01:08:10','2023-07-25 01:08:10'),(334,'Alejandro','Love','Mujer','alejandro.love@gmail.com','b91b22f8!61','1958-01-01','Activo','2023-07-25 01:08:10','2023-07-25 01:08:10'),(335,'Gustavo','Henry','Hombre','gustavo.henry@gmail.com','b9339c65!66','1992-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(336,'Alejandra','Palmer','Hombre','alejandra.palmer@gmail.com','b957fe47!81','1967-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(337,'Adrián','Beck','Mujer','adrián.beck@gmail.com','b966cf85!93','1996-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(338,'Marcos','Beck','Mujer','marcos.beck@gmail.com','b96fe59a!0','2023-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(339,'Diana','Pena','Mujer','diana.pena@gmail.com','b97a2e8b!73','1982-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(340,'Saúl','McDaniel','Mujer','saúl.mcdaniel@gmail.com','b98462f7!45','1967-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(341,'Carmen','Love','Hombre','carmen.love@gmail.com','b98ea42f!17','1980-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(342,'Pilar','Haynes','Mujer','pilar.haynes@gmail.com','b998fcde!3','2001-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(343,'Lourdes','Beck','Hombre','lourdes.beck@gmail.com','b9a2e226!33','1981-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(344,'Humberto','Rhodes','Hombre','humberto.rhodes@gmail.com','b9ad1259!43','2009-01-01','Activo','2023-07-25 01:08:11','2023-07-25 01:08:11'),(345,'Gerardo','Newman','Hombre','gerardo.newman@gmail.com','b9bc8550!48','2008-01-01','Activo','2023-07-25 01:08:12','2023-07-25 01:08:12'),(346,'Alan','Haynes','Hombre','alan.haynes@gmail.com','b9c68203!23','1999-01-01','Activo','2023-07-25 01:08:12','2023-07-25 01:08:12'),(347,'Manuel','Love','Hombre','manuel.love@gmail.com','b9de721e!0','1999-01-01','Activo','2023-07-25 01:08:12','2023-07-25 01:08:12'),(348,'Ernesto','Kelly','Hombre','ernesto.kelly@gmail.com','ba281d44!11','1968-01-01','Activo','2023-07-25 01:08:12','2023-07-25 01:08:12'),(350,'Rosa','Johnston','Hombre','rosa.johnston@gmail.com','cb40becd!3','1971-01-01','Activo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(351,'Gabriel','Medina','Mujer','gabriel.medina@gmail.com','cb56027b!38','2010-01-01','Activo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(352,'Santiago','Urzúa','Mujer','santiago.urzúa@gmail.com','cb62d706!12','1977-01-01','Activo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(353,'Juana','Haynes','Mujer','juana.haynes@gmail.com','cb6e8ced!20','1952-01-01','Inactivo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(354,'Marcos','Haynes','Hombre','marcos.haynes@gmail.com','cb7a956d!97','1993-01-01','Activo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(355,'Ricardo','Reyes','Mujer','ricardo.reyes@gmail.com','cb86405e!83','1968-01-01','Activo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(356,'Cristina','Hernández','Hombre','cristina.hernández@gmail.com','cb9a4fee!42','1953-01-01','Inactivo','2023-07-25 01:08:41','2023-07-25 01:08:41'),(357,'María','Love','Mujer','maría.love@gmail.com','cbd15000!56','2016-01-01','Activo','2023-07-25 01:08:42','2023-07-25 01:08:42'),(358,'Amanda','Beck','Hombre','amanda.beck@gmail.com','cbf41e53!66','1950-01-01','Activo','2023-07-25 01:08:42','2023-07-25 01:08:42'),(359,'Mercedes','Hernández','Mujer','mercedes.hernández@gmail.com','cc0fbdc4!47','2020-01-01','Activo','2023-07-25 01:08:42','2023-07-25 01:08:42'),(360,'Óscar','McKinney','Hombre','óscar.mckinney@gmail.com','cc2bdaf8!0','1987-01-01','Activo','2023-07-25 01:08:42','2023-07-25 01:08:42'),(361,'Martín','Hale','Hombre','martín.hale@gmail.com','cc45a1b7!17','1958-01-01','Activo','2023-07-25 01:08:43','2023-07-25 01:08:43'),(362,'Rodrigo','McDaniel','Hombre','rodrigo.mcdaniel@gmail.com','cc5f4ad1!6','1982-01-01','Activo','2023-07-25 01:08:43','2023-07-25 01:08:43'),(363,'Daniela','Beck','Mujer','daniela.beck@gmail.com','cc80bf8b!50','2009-01-01','Activo','2023-07-25 01:08:43','2023-07-25 01:08:43'),(364,'Mario','Newman','Mujer','mario.newman@gmail.com','cc9cd4d8!89','1989-01-01','Activo','2023-07-25 01:08:43','2023-07-25 01:08:43'),(365,'Gustavo','Byrd','Mujer','gustavo.byrd@gmail.com','ccb98021!57','2011-01-01','Activo','2023-07-25 01:08:43','2023-07-25 01:08:43'),(366,'Esperanza','Pena','Hombre','esperanza.pena@gmail.com','ccd1a6ef!50','1989-01-01','Inactivo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(367,'Hernán','Myers','Mujer','hernán.myers@gmail.com','cce9e58e!3','2009-01-01','Activo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(368,'Laura','Villegas','Mujer','laura.villegas@gmail.com','cd0236ae!25','1962-01-01','Activo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(369,'Federico','Elliott','Mujer','federico.elliott@gmail.com','cd1ae948!84','1956-01-01','Inactivo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(370,'Victoria','Ramos','Mujer','victoria.ramos@gmail.com','cd2f912f!24','2005-01-01','Inactivo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(371,'Valentina','Haynes','Hombre','valentina.haynes@gmail.com','cd49b121!74','1977-01-01','Activo','2023-07-25 01:08:44','2023-07-25 01:08:44'),(372,'Mateo','Foster','Mujer','mateo.foster@gmail.com','cd98ab28!64','1999-01-01','Activo','2023-07-25 01:08:45','2023-07-25 01:08:45'),(373,'Manuel','Mendoza','Hombre','manuel.mendoza@gmail.com','cdd4d935!41','2004-01-01','Activo','2023-07-25 01:08:45','2023-07-25 01:08:45'),(374,'Paula','Miramontes','Hombre','paula.miramontes@gmail.com','cdf6a955!88','1973-01-01','Activo','2023-07-25 01:08:45','2023-07-25 01:08:45'),(375,'Rosa','Beck','Mujer','rosa.beck@gmail.com','ce09c1c6!41','1978-01-01','Inactivo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(376,'Hugo','Rhodes','Mujer','hugo.rhodes@gmail.com','ce1801ad!67','1950-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(377,'Natalia','Love','Mujer','natalia.love@gmail.com','ce289604!84','1960-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(378,'Alma','Rodríguez','Mujer','alma.rodríguez@gmail.com','ce3aee66!4','2021-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(379,'Humberto','Ortega','Mujer','humberto.ortega@gmail.com','ce4eac76!46','1956-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(380,'Jorge','McDaniel','Mujer','jorge.mcdaniel@gmail.com','ce698dce!94','1974-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(381,'Emilia','Fernandez','Mujer','emilia.fernandez@gmail.com','ce8ad273!83','2007-01-01','Activo','2023-07-25 01:08:46','2023-07-25 01:08:46'),(382,'Fernando','Hale','Hombre','fernando.hale@gmail.com','cead40f9!33','2003-01-01','Activo','2023-07-25 01:08:47','2023-07-25 01:08:47'),(383,'Antonia','Johnson','Mujer','antonia.johnson@gmail.com','cecfee4c!87','2015-01-01','Activo','2023-07-25 01:08:47','2023-07-25 01:08:47'),(384,'Ingrid','Haynes','Hombre','ingrid.haynes@gmail.com','cef0a939!59','2000-01-01','Inactivo','2023-07-25 01:08:47','2023-07-25 01:08:47'),(385,'Arturo','McDaniel','Mujer','arturo.mcdaniel@gmail.com','cf08cf44!15','1988-01-01','Activo','2023-07-25 01:08:47','2023-07-25 01:08:47'),(386,'David','Rhodes','Mujer','david.rhodes@gmail.com','cf204e73!98','1991-01-01','Activo','2023-07-25 01:08:47','2023-07-25 01:08:47'),(387,'Brenda','Newman','Hombre','brenda.newman@gmail.com','cf38add5!64','1990-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(388,'Gabriela','Johnson','Hombre','gabriela.johnson@gmail.com','cf4fe451!17','1969-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(389,'Antonia','Mendoza','Mujer','antonia.mendoza@gmail.com','cf67a98f!72','1995-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(390,'Arturo','Rhodes','Hombre','arturo.rhodes@gmail.com','cf8491f1!69','2017-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(391,'Elena','McDaniel','Hombre','elena.mcdaniel@gmail.com','cf9de987!94','2012-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(392,'Rubén','Rodríguez','Hombre','rubén.rodríguez@gmail.com','cfb5808c!33','1998-01-01','Activo','2023-07-25 01:08:48','2023-07-25 01:08:48'),(393,'Juana','Rhodes','Mujer','juana.rhodes@gmail.com','cfcd63b6!33','2001-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(394,'Bryan','Mendoza','Hombre','bryan.mendoza@gmail.com','cfe4cb46!51','2005-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(395,'Samuel','Sánchez','Mujer','samuel.sánchez@gmail.com','cffcbeb8!31','2007-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(396,'Gloria','Haynes','Mujer','gloria.haynes@gmail.com','d018ca62!25','2012-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(397,'Héctor','Newman','Hombre','héctor.newman@gmail.com','d031aba0!84','1967-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(398,'Estela','Herrera','Hombre','estela.herrera@gmail.com','d04b053a!46','2010-01-01','Activo','2023-07-25 01:08:49','2023-07-25 01:08:49'),(399,'Irene','Mendoza','Hombre','irene.mendoza@gmail.com','d062075a!59','1962-01-01','Activo','2023-07-25 01:08:50','2023-07-25 01:08:50'),(400,'Ángel','McDaniel','Hombre','ángel.mcdaniel@gmail.com','d07ecf7a!41','1963-01-01','Activo','2023-07-25 01:08:50','2023-07-25 01:08:50'),(401,'Óscar','Estrada','Mujer','óscar.estrada@gmail.com','d0c67ca0!20','1964-01-01','Activo','2023-07-25 01:08:50','2023-07-25 01:08:50'),(402,'Fernando','López','Hombre','fernando.lópez@gmail.com','d0f4145a!79','1952-01-01','Inactivo','2023-07-25 01:08:50','2023-07-25 01:08:50'),(403,'Gabriel','Morris','Mujer','gabriel.morris@gmail.com','d1166b0e!89','1960-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(404,'Eugenia','Johnson','Mujer','eugenia.johnson@gmail.com','d12bc30a!75','2021-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(405,'Adrián','McDaniel','Mujer','adrián.mcdaniel@gmail.com','d139d8a9!59','2001-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(406,'Carmen','Mendoza','Hombre','carmen.mendoza@gmail.com','d1460bf6!46','1993-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(407,'Rogelio','Greene','Mujer','rogelio.greene@gmail.com','d15174d3!53','2007-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(408,'Alma','Mendoza','Hombre','alma.mendoza@gmail.com','d15d8234!98','1982-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(409,'Cristian','Carpenter','Mujer','cristian.carpenter@gmail.com','d16942ba!36','2001-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(410,'Inés','Jimenez','Hombre','inés.jimenez@gmail.com','d1757630!50','1978-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(411,'José','Hale','Hombre','josé.hale@gmail.com','d181004a!36','1960-01-01','Activo','2023-07-25 01:08:51','2023-07-25 01:08:51'),(413,'Luz','Sims','Hombre','luz.sims@gmail.com','d36386c1!68','1985-01-01','Inactivo','2023-07-25 01:08:55','2023-07-25 01:08:55'),(414,'Regina','Walker','Hombre','regina.walker@gmail.com','d3845f04!25','2003-01-01','Activo','2023-07-25 01:08:55','2023-07-25 01:08:55'),(415,'Rafael','Green','Mujer','rafael.green@gmail.com','d3a68043!65','1955-01-01','Activo','2023-07-25 01:08:55','2023-07-25 01:08:55'),(416,'María','Nelson','Hombre','maría.nelson@gmail.com','d3c64606!63','1965-01-01','Activo','2023-07-25 01:08:55','2023-07-25 01:08:55'),(417,'Laura','Castañeda','Hombre','laura.castañeda@gmail.com','d3ea8d36!96','2021-01-01','Inactivo','2023-07-25 01:08:55','2023-07-25 01:08:55'),(418,'Francisco','Borboa','Mujer','francisco.borboa@gmail.com','d40f12d1!56','1980-01-01','Activo','2023-07-25 01:08:56','2023-07-25 01:08:56'),(419,'Víctor','Morales','Hombre','víctor.morales@gmail.com','d43addd2!68','2021-01-01','Activo','2023-07-25 01:08:56','2023-07-25 01:08:56'),(420,'César','McDaniel','Hombre','césar.mcdaniel@gmail.com','d462b0e3!62','2009-01-01','Activo','2023-07-25 01:08:56','2023-07-25 01:08:56'),(421,'Saúl','Mendoza','Mujer','saúl.mendoza@gmail.com','d4914f46!93','2002-01-01','Activo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(422,'Cristina','Jones','Mujer','cristina.jones@gmail.com','d4a90fad!66','2015-01-01','Activo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(423,'Sergio','McDaniel','Hombre','sergio.mcdaniel@gmail.com','d4b8fa0f!2','2018-01-01','Activo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(424,'Angélica','Ortega','Mujer','angélica.ortega@gmail.com','d4c91776!1','1976-01-01','Inactivo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(425,'Jaime','Kelly','Hombre','jaime.kelly@gmail.com','d4d7e543!16','2002-01-01','Activo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(426,'Agustín','Morgan','Mujer','agustín.morgan@gmail.com','d50013ba!81','1994-01-01','Activo','2023-07-25 01:08:57','2023-07-25 01:08:57'),(427,'Efraín','Beck','Mujer','efraín.beck@gmail.com','d5285b5a!91','1979-01-01','Activo','2023-07-25 01:08:58','2023-07-25 01:08:58'),(428,'Adrián','Love','Hombre','adrián.love@gmail.com','d5518704!85','2008-01-01','Inactivo','2023-07-25 01:08:58','2023-07-25 01:08:58'),(429,'Josefina','Howard','Mujer','josefina.howard@gmail.com','d57a0753!4','2012-01-01','Activo','2023-07-25 01:08:58','2023-07-25 01:08:58'),(430,'Guillermo','Carpenter','Mujer','guillermo.carpenter@gmail.com','d59e24ab!74','2015-01-01','Activo','2023-07-25 01:08:58','2023-07-25 01:08:58'),(431,'Damián','Love','Mujer','damián.love@gmail.com','d5c52e6a!85','1958-01-01','Inactivo','2023-07-25 01:08:59','2023-07-25 01:08:59'),(432,'Armando','Cárdenas','Hombre','armando.cárdenas@gmail.com','d5e5b647!71','2011-01-01','Activo','2023-07-25 01:08:59','2023-07-25 01:08:59'),(433,'María','McDaniel','Mujer','maría.mcdaniel@gmail.com','d6064348!33','1952-01-01','Activo','2023-07-25 01:08:59','2023-07-25 01:08:59'),(434,'Leonardo','Rhodes','Hombre','leonardo.rhodes@gmail.com','d627e5fc!7','1953-01-01','Activo','2023-07-25 01:08:59','2023-07-25 01:08:59'),(435,'Antonio','Esquivel','Hombre','antonio.esquivel@gmail.com','d63ed821!26','2016-01-01','Activo','2023-07-25 01:08:59','2023-07-25 01:08:59'),(436,'Laura','Newman','Hombre','laura.newman@gmail.com','d656bfdf!22','1970-01-01','Activo','2023-07-25 01:09:00','2023-07-25 01:09:00'),(437,'Regina','Haynes','Mujer','regina.haynes@gmail.com','d6797575!10','2009-01-01','Activo','2023-07-25 01:09:00','2023-07-25 01:09:00'),(438,'Rosa','Aguilera','Mujer','rosa.aguilera@gmail.com','d6b87eb4!99','1990-01-01','Activo','2023-07-25 01:09:00','2023-07-25 01:09:00'),(439,'Inés','Newman','Hombre','inés.newman@gmail.com','d6dd6345!65','1978-01-01','Activo','2023-07-25 01:09:00','2023-07-25 01:09:00'),(440,'Rubén','Mendoza','Hombre','rubén.mendoza@gmail.com','d705049d!61','1959-01-01','Activo','2023-07-25 01:09:01','2023-07-25 01:09:01'),(441,'Alan','Mendoza','Hombre','alan.mendoza@gmail.com','d7268794!30','1972-01-01','Activo','2023-07-25 01:09:01','2023-07-25 01:09:01'),(442,'Carmen','Beck','Mujer','carmen.beck@gmail.com','d73a22b9!29','1976-01-01','Activo','2023-07-25 01:09:01','2023-07-25 01:09:01'),(443,'Rodrigo','Pena','Hombre','rodrigo.pena@gmail.com','d78759fe!16','1992-01-01','Activo','2023-07-25 01:09:01','2023-07-25 01:09:01'),(444,'María','Rhodes','Mujer','maría.rhodes@gmail.com','d7aec9c2!7','1974-01-01','Activo','2023-07-25 01:09:02','2023-07-25 01:09:02'),(445,'Angélica','Beck','Hombre','angélica.beck@gmail.com','d7da0e58!76','1968-01-01','Activo','2023-07-25 01:09:02','2023-07-25 01:09:02'),(446,'Gustavo','Newman','Mujer','gustavo.newman@gmail.com','d7f469bf!64','1969-01-01','Activo','2023-07-25 01:09:02','2023-07-25 01:09:02'),(447,'Ángel','Young','Mujer','ángel.young@gmail.com','d8107159!19','1996-01-01','Activo','2023-07-25 01:09:02','2023-07-25 01:09:02'),(449,'Teresa','Mendoza','Mujer','teresa.mendoza@gmail.com','e071271c!8','2023-01-01','Activo','2023-07-25 01:09:16','2023-07-25 01:09:16'),(450,'Pedro','Hale','Hombre','pedro.hale@gmail.com','e0aeff7a!4','1985-01-01','Activo','2023-07-25 01:09:17','2023-07-25 01:09:17'),(451,'Sergio','Beck','Mujer','sergio.beck@gmail.com','e0e1297c!19','1966-01-01','Activo','2023-07-25 01:09:17','2023-07-25 01:09:17'),(452,'Andrés','Hale','Mujer','andrés.hale@gmail.com','e162a329!65','2016-01-01','Activo','2023-07-25 01:09:18','2023-07-25 01:09:18'),(453,'Rocío','Hale','Hombre','rocío.hale@gmail.com','e1836ff2!50','1960-01-01','Activo','2023-07-25 01:09:18','2023-07-25 01:09:18'),(454,'Benjamín','Beck','Hombre','benjamín.beck@gmail.com','e19f93f3!41','1974-01-01','Activo','2023-07-25 01:09:18','2023-07-25 01:09:18'),(455,'Andrea','Ortega','Mujer','andrea.ortega@gmail.com','e1bd8837!6','1950-01-01','Activo','2023-07-25 01:09:19','2023-07-25 01:09:19'),(456,'Sara','Solís','Mujer','sara.solís@gmail.com','e1cd127f!48','1985-01-01','Inactivo','2023-07-25 01:09:19','2023-07-25 01:09:19'),(457,'Francisco','Cazares','Hombre','francisco.cazares@gmail.com','e1e172e1!81','2013-01-01','Activo','2023-07-25 01:09:19','2023-07-25 01:09:19'),(458,'María','Cazares','Hombre','maría.cazares@gmail.com','e1f5ac39!78','1990-01-01','Activo','2023-07-25 01:09:19','2023-07-25 01:09:19'),(459,'Héctor','Mendoza','Hombre','héctor.mendoza@gmail.com','e22e1a35!35','1981-01-01','Activo','2023-07-25 01:09:19','2023-07-25 01:09:19'),(460,'Fernando','Rodríguez','Mujer','fernando.rodríguez@gmail.com','e26c5142!31','2016-01-01','Activo','2023-07-25 01:09:20','2023-07-25 01:09:20'),(461,'Teresa','Pena','Mujer','teresa.pena@gmail.com','e2c5ae8c!65','1950-01-01','Activo','2023-07-25 01:09:20','2023-07-25 01:09:20'),(462,'Alicia','Calderón','Hombre','alicia.calderón@gmail.com','e2ee9218!58','1963-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(463,'Benjamín','McDaniel','Mujer','benjamín.mcdaniel@gmail.com','e310a9fa!1','2015-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(464,'Silvia','McDaniel','Hombre','silvia.mcdaniel@gmail.com','e320cb00!96','1951-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(465,'Ricardo','Carter','Mujer','ricardo.carter@gmail.com','e32f749f!84','2009-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(466,'Rosa','McDaniel','Hombre','rosa.mcdaniel@gmail.com','e33ee4bf!94','1997-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(467,'Diego','Newman','Mujer','diego.newman@gmail.com','e34df33a!58','1989-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(468,'Felicia','Newman','Hombre','felicia.newman@gmail.com','e35d32e3!82','2022-01-01','Activo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(469,'Manuela','Mendoza','Hombre','manuela.mendoza@gmail.com','e36cf8df!80','1951-01-01','Inactivo','2023-07-25 01:09:21','2023-07-25 01:09:21'),(470,'Gustavo','Sánchez','Hombre','gustavo.sánchez@gmail.com','e37da393!39','2014-01-01','Activo','2023-07-25 01:09:22','2023-07-25 01:09:22'),(471,'Mario','Garza','Mujer','mario.garza@gmail.com','e3a335f5!83','1963-01-01','Activo','2023-07-25 01:09:22','2023-07-25 01:09:22'),(472,'Rafael','Newman','Mujer','rafael.newman@gmail.com','e3d4606d!84','1958-01-01','Activo','2023-07-25 01:09:22','2023-07-25 01:09:22'),(473,'Ángela','Beck','Mujer','ángela.beck@gmail.com','e400eecf!4','2022-01-01','Activo','2023-07-25 01:09:22','2023-07-25 01:09:22'),(474,'Emmanuel','Mendoza','Mujer','emmanuel.mendoza@gmail.com','e429f5b7!43','2014-01-01','Activo','2023-07-25 01:09:23','2023-07-25 01:09:23'),(475,'Antonia','Pena','Hombre','antonia.pena@gmail.com','e4529c0a!47','2021-01-01','Activo','2023-07-25 01:09:23','2023-07-25 01:09:23'),(476,'Camila','Mendoza','Hombre','camila.mendoza@gmail.com','e46ff816!18','1972-01-01','Activo','2023-07-25 01:09:23','2023-07-25 01:09:23'),(478,'Ximena','Hale','Mujer','ximena.hale@gmail.com','e91d9cd7!12','1989-01-01','Activo','2023-07-25 01:09:31','2023-07-25 01:09:31'),(479,'Sandra','Newman','Mujer','sandra.newman@gmail.com','e93152b9!97','1962-01-01','Activo','2023-07-25 01:09:31','2023-07-25 01:09:31'),(480,'Delia','Vargas','Mujer','delia.vargas@gmail.com','e9425c82!98','1991-01-01','Activo','2023-07-25 01:09:31','2023-07-25 01:09:31'),(481,'Marcos','Mendoza','Hombre','marcos.mendoza@gmail.com','e953290c!44','1981-01-01','Inactivo','2023-07-25 01:09:31','2023-07-25 01:09:31'),(482,'Mariano','Hale','Mujer','mariano.hale@gmail.com','e964241c!98','1959-01-01','Activo','2023-07-25 01:09:31','2023-07-25 01:09:31'),(483,'Julieta','Scott','Hombre','julieta.scott@gmail.com','e974f3ea!49','2019-01-01','Activo','2023-07-25 01:09:32','2023-07-25 01:09:32'),(484,'José','Love','Hombre','josé.love@gmail.com','e9a71c1f!72','1962-01-01','Activo','2023-07-25 01:09:32','2023-07-25 01:09:32'),(485,'Estela','Stewart','Hombre','estela.stewart@gmail.com','e9da3ca5!58','2014-01-01','Activo','2023-07-25 01:09:32','2023-07-25 01:09:32'),(486,'Laura','Ramos','Mujer','laura.ramos@gmail.com','e9fd2036!67','1967-01-01','Activo','2023-07-25 01:09:32','2023-07-25 01:09:32'),(487,'Eduardo','Hale','Mujer','eduardo.hale@gmail.com','ea1f6593!50','2014-01-01','Inactivo','2023-07-25 01:09:33','2023-07-25 01:09:33'),(488,'Adrián','Haynes','Hombre','adrián.haynes@gmail.com','ea44333d!19','1986-01-01','Activo','2023-07-25 01:09:33','2023-07-25 01:09:33'),(489,'Renata','Beck','Mujer','renata.beck@gmail.com','ea67f55d!84','1983-01-01','Activo','2023-07-25 01:09:33','2023-07-25 01:09:33'),(490,'Laura','Jones','Mujer','laura.jones@gmail.com','ea8d0a92!96','1973-01-01','Inactivo','2023-07-25 01:09:33','2023-07-25 01:09:33'),(491,'Julieta','Hall','Mujer','julieta.hall@gmail.com','eab0c13c!88','1952-01-01','Activo','2023-07-25 01:09:34','2023-07-25 01:09:34'),(492,'Luciana','Hurtado','Mujer','luciana.hurtado@gmail.com','eb2aa040!75','2015-01-01','Activo','2023-07-25 01:09:34','2023-07-25 01:09:34'),(493,'Hugo','Álvarez','Hombre','hugo.álvarez@gmail.com','eb5342c7!66','2013-01-01','Activo','2023-07-25 01:09:35','2023-07-25 01:09:35'),(494,'Emmanuel','Talamantes','Hombre','emmanuel.talamantes@gmail.com','eb82353e!72','1983-01-01','Activo','2023-07-25 01:09:35','2023-07-25 01:09:35'),(495,'Antonia','Cota','Hombre','antonia.cota@gmail.com','eb9f7611!87','2018-01-01','Activo','2023-07-25 01:09:35','2023-07-25 01:09:35'),(496,'Eva','Rhodes','Hombre','eva.rhodes@gmail.com','ebbed192!59','1988-01-01','Activo','2023-07-25 01:09:35','2023-07-25 01:09:35'),(497,'Ernesto','McDaniel','Hombre','ernesto.mcdaniel@gmail.com','ebdf7d65!18','1975-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(498,'José','Haynes','Hombre','josé.haynes@gmail.com','ec003251!26','1999-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(499,'Enrique','Beck','Hombre','enrique.beck@gmail.com','ec1434f1!57','1976-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(500,'Emmanuel','Kim','Hombre','emmanuel.kim@gmail.com','ec28131a!62','2002-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(501,'Manuela','Stanley','Hombre','manuela.stanley@gmail.com','ec3a753a!94','1966-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(502,'Teresa','Rhodes','Mujer','teresa.rhodes@gmail.com','ec4cdb59!58','2014-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36'),(503,'Valeria','Hale','Mujer','valeria.hale@gmail.com','ec5e63da!33','2013-01-01','Activo','2023-07-25 01:09:36','2023-07-25 01:09:36');
/*!40000 ALTER TABLE `tbb_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_recomendacion`
--

DROP TABLE IF EXISTS `tbb_recomendacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_recomendacion` (
  `id_recomendacion` int(11) NOT NULL AUTO_INCREMENT,
  `LibroId` int(10) unsigned NOT NULL,
  `PersonaId` int(10) unsigned NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_recomendacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_recomendacion`
--

LOCK TABLES `tbb_recomendacion` WRITE;
/*!40000 ALTER TABLE `tbb_recomendacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_recomendacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_valoracion`
--

DROP TABLE IF EXISTS `tbb_valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_valoracion` (
  `id_valoracion` int(11) NOT NULL AUTO_INCREMENT,
  `LibroId` int(10) unsigned NOT NULL,
  `PersonaId` int(10) unsigned NOT NULL,
  `numeroestrellas` int(10) unsigned NOT NULL DEFAULT '1',
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_valoracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_valoracion`
--

LOCK TABLES `tbb_valoracion` WRITE;
/*!40000 ALTER TABLE `tbb_valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookfash'
--

--
-- Dumping routines for database 'bookfash'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar`()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE nombres VARCHAR(50);
  DECLARE apellidos VARCHAR(50);
  DECLARE genero ENUM('Hombre', 'Mujer');
  DECLARE correo VARCHAR(100);
  DECLARE contrasena VARCHAR(50);
  DECLARE fecha_nacimiento DATE;
  DECLARE estatus ENUM('Activo', 'Inactivo');
  DECLARE fecha_actualizacion TIMESTAMP;
  DECLARE fecha_registro TIMESTAMP;

  CREATE TEMPORARY TABLE IF NOT EXISTS temp_nombres (nombre VARCHAR(50));
  CREATE TEMPORARY TABLE IF NOT EXISTS temp_apellidos (apellido VARCHAR(50));

  INSERT INTO temp_nombres (nombre) VALUES
  ('Juan'), ('Pedro'), ('Luis'), ('Carlos'), ('Manuel'), ('Andrés'), ('Diego'), ('Francisco'), ('Alejandro'), ('Miguel'),
('Javier'), ('Sergio'), ('David'), ('Ricardo'), ('Eduardo'), ('Daniel'), ('José'), ('Antonio'), ('Pablo'), ('Fernando'),
('Mario'), ('Hugo'), ('Fernando'), ('Rafael'), ('Emilio'), ('Guillermo'), ('Jaime'), ('Samuel'), ('Gustavo'), ('Alberto'),
('Armando'), ('Santiago'), ('Enrique'), ('Roberto'), ('Felipe'), ('Oscar'), ('Gerardo'), ('Héctor'), ('Gabriel'), ('Hugo'),
('Leonardo'), ('Ignacio'), ('Marcos'), ('Adrián'), ('Benjamín'), ('Óscar'), ('Humberto'), ('Arturo'), ('Hernán'), ('Víctor'),
('Martín'), ('Efraín'), ('Mateo'), ('Rogelio'), ('Raúl'), ('Ezequiel'), ('Abraham'), ('Manuel'), ('César'), ('Ernesto'),
('Federico'), ('Mariano'), ('Ismael'), ('Alberto'), ('Cristian'), ('Edgar'), ('Alexis'), ('Damián'), ('Jorge'), ('Rubén'),
('Jonathan'), ('Joaquín'), ('Bryan'), ('Ángel'), ('Ricardo'), ('César'), ('Ulises'), ('Cristian'), ('Rogelio'), ('Marcos'),
('Agustín'), ('José'), ('Giovanni'), ('Pedro'), ('Ezequiel'), ('Sergio'), ('Hugo'), ('Martín'), ('Alan'), ('Mario'),
('Saúl'), ('Óscar'), ('Javier'), ('Rodrigo'), ('Felipe'), ('Rafael'), ('David'), ('Ángel'), ('Leonardo'), ('Fernando'),
('Gustavo'), ('Manuel'), ('Eduardo'), ('Germán'), ('Gerardo'), ('Armando'), ('Cristopher'), ('César'), ('Alejandro'), ('Daniel'),
('Emmanuel'), ('Jaime'), ('Benjamín'), ('Santiago'), ('Ricardo'), ('Raúl'), ('Federico'), ('Gabriel'), ('José'), ('Fernando'),
('Enrique'), ('Héctor'), ('Adrián'), ('Leonardo'), ('José'), ('Hugo'), ('Marcos'), ('Damián'), ('Alan'), ('Ángel'),
('Martín'), ('Mario'), ('Ernesto'), ('Ezequiel'), ('Rubén'), ('Rodrigo'), ('Fernando'), ('Gustavo'), ('Ismael'), ('Sergio'),
('Óscar'), ('Agustín'), ('Jonathan'), ('Ricardo'), ('Raúl'), ('Armando'), ('José'), ('Martín'), ('Manuel'), ('César'),
('Javier'), ('David'), ('Jaime'), ('Federico'), ('Eduardo'), ('Gerardo'), ('Gabriel'), ('Gustavo'), ('Hugo'), ('Felipe'),
('Alan'), ('Fernando'), ('Benjamín'), ('Emmanuel'), ('Rafael'), ('Mario'), ('Marcos'), ('Rodrigo'), ('Adrián'), ('Leonardo'),
('Ángel'), ('Héctor'), ('Ernesto'), ('Sergio'), ('Rubén'), ('Fernando'), ('Damián'), ('Óscar'), ('Jonathan'), ('Ezequiel'),
('Germán'), ('Armando'), ('Raúl'), ('Adrián'), ('Alan'), ('José'), ('Hugo'), ('Fernando'), ('David'), ('Rafael'),
('Gustavo'), ('Daniel'), ('Sergio'), ('Emmanuel'), ('Federico'), ('Marcos'), ('Manuel'), ('Mario'), ('Ángel'), ('César'),
('Felipe'), ('Leonardo'), ('Gerardo'), ('Eduardo'), ('Benjamín'), ('Adrián'), ('Jaime'), ('Germán'), ('Rubén'), ('Jonathan'),
('Héctor'), ('Armando'), ('Jonathan'), ('Ricardo'), ('Gabriel'), ('Óscar'), ('Damián'), ('Gustavo'), ('Manuel'), ('Sergio'),
('Alan'), ('Armando'), ('Raúl'), ('Felipe'), ('José'), ('Emmanuel'), ('Marcos'), ('Rafael'), ('Hugo'), ('Gustavo'), ('María'), ('Ana'), ('Laura'), ('Carmen'), ('Isabel'), ('Sofía'), ('Valentina'), ('Valeria'), ('Camila'), ('Mariana'),
('Emma'), ('Ximena'), ('Fernanda'), ('Lucía'), ('Regina'), ('Paula'), ('Diana'), ('Abril'), ('Mía'), ('Renata'),
('Alejandra'), ('Daniela'), ('Carolina'), ('Andrea'), ('Natalia'), ('Victoria'), ('Gabriela'), ('Luz'), ('Brenda'), ('Amanda'),
('Jimena'), ('Adriana'), ('Antonia'), ('Elena'), ('Rocío'), ('Claudia'), ('Eva'), ('Mónica'), ('Gloria'), ('Silvia'),
('Rosa'), ('Adela'), ('Elsa'), ('Olga'), ('Gabriela'), ('Irene'), ('Alma'), ('Marta'), ('Cristina'), ('Estela'),
('Teresa'), ('Beatriz'), ('Juana'), ('Laura'), ('Marina'), ('Celia'), ('Alicia'), ('Patricia'), ('Laura'), ('Elena'),
('Pilar'), ('Dolores'), ('Eugenia'), ('Manuela'), ('Lourdes'), ('Josefa'), ('Diana'), ('Mercedes'), ('Clara'), ('Sara'),
('Eugenia'), ('Ángela'), ('Josefina'), ('Margarita'), ('Rosa'), ('Inés'), ('Graciela'), ('Rita'), ('Angélica'), ('Sandra'),
('Julieta'), ('Alma'), ('Ingrid'), ('Daniela'), ('Camila'), ('Cecilia'), ('Esmeralda'), ('Cristina'), ('Elena'), ('Felicia'),
('Gabriela'), ('Adela'), ('Carmen'), ('Delia'), ('Eva'), ('Emilia'), ('Liliana'), ('Raquel'), ('Luz'), ('Rocío'),
('Delfina'), ('Yolanda'), ('Ana'), ('María'), ('Laura'), ('Sofía'), ('Valentina'), ('Fernanda'), ('Camila'), ('Ximena'),
('Regina'), ('Isabella'), ('Abril'), ('Daniela'), ('Luciana'), ('Gabriela'), ('Paulina'), ('Antonia'), ('Valeria'), ('Renata'),
('Victoria'), ('Amanda'), ('Carolina'), ('Diana'), ('Luz'), ('Mariana'), ('Elena'), ('Brenda'), ('Claudia'), ('Rosa'),
('María'), ('Alejandra'), ('Natalia'), ('Julia'), ('Gabriela'), ('Adriana'), ('Ángela'), ('Catalina'), ('Lourdes'), ('Carmen'),
('Teresa'), ('Sara'), ('Mercedes'), ('Laura'), ('Eugenia'), ('Pilar'), ('Beatriz'), ('Marina'), ('Olga'), ('Irene'),
('Graciela'), ('Josefa'), ('Clara'), ('Esperanza'), ('Alma'), ('Manuela'), ('Josefina'), ('Rocío'), ('Dolores'), ('Julieta'),
('Margarita'), ('Inés'), ('Silvia'), ('Ingrid'), ('Mónica'), ('Marta'), ('Eva'), ('Estela'), ('Angélica'), ('Celia'),
('Emilia'), ('Adela'), ('Raquel'), ('Laura'), ('María'), ('Sofía'), ('Valentina'), ('Isabella'), ('Valeria'), ('Camila'),
('Renata'), ('Fernanda'), ('Abril'), ('Luz'), ('Luciana'), ('Diana'), ('Gabriela'), ('Antonia'), ('Regina'), ('Victoria'),
('Paulina'), ('Brenda'), ('Ximena'), ('Carolina'), ('Daniela'), ('Claudia'), ('Rocío'), ('Elena'), ('Amanda'), ('Mariana'),
('Marina'), ('Laura'), ('Ángela'), ('Teresa'), ('Gabriela'), ('Julia'), ('Lourdes'), ('Carmen'), ('Pilar'), ('Sara'),
('Mercedes'), ('Eugenia'), ('Ingrid'), ('Beatriz'), ('Mónica'), ('Irene'), ('Manuela'), ('Clara'), ('Laura'), ('Josefina'),
('María'), ('Rosa'), ('Esmeralda'), ('Cecilia'), ('Sandra'), ('Rita'), ('Adriana'), ('María'), ('Rosa'), ('Eva');


  INSERT INTO temp_apellidos (apellido) VALUES
   ('Gómez'), ('Pérez'), ('López'), ('Martínez'), ('Rodríguez'), ('González'), ('Hernández'), ('García'), ('Martín'), ('Romero'),
('Fernández'), ('Torres'), ('Sánchez'), ('Rivera'), ('Vargas'), ('Ramos'), ('Vega'), ('Mendoza'), ('Castillo'), ('Guerrero'),
('Núñez'), ('Jiménez'), ('Silva'), ('Chávez'), ('Gutiérrez'), ('Rojas'), ('Cruz'), ('Reyes'), ('Méndez'), ('Ortega'),
('Morales'), ('Delgado'), ('Mendoza'), ('Montes'), ('Cabrera'), ('Pacheco'), ('Juárez'), ('Campos'), ('Guerra'), ('Solís'),
('Báez'), ('Miranda'), ('Valenzuela'), ('Villanueva'), ('Velasco'), ('Santos'), ('Salgado'), ('Herrera'), ('Fuentes'), ('Cervantes'),
('Fuentes'), ('Vidal'), ('Galván'), ('Castañeda'), ('Leyva'), ('Soto'), ('Carmona'), ('Lozano'), ('Sandoval'), ('Guillén'),
('Miramontes'), ('Salazar'), ('Verdugo'), ('Padilla'), ('Cota'), ('Quintero'), ('Sepúlveda'), ('Palacios'), ('Casas'), ('Bernal'),
('Estrada'), ('Montaño'), ('Ruelas'), ('Cota'), ('Valdez'), ('Valencia'), ('Valenzuela'), ('Álvarez'), ('Cárdenas'), ('Navarro'),
('Calderón'), ('Beltrán'), ('Andrade'), ('Escalante'), ('Burgos'), ('Camacho'), ('Galindo'), ('Valle'), ('Palma'), ('Frías'),
('Ojeda'), ('Heredia'), ('Dávila'), ('Alcaraz'), ('Navarro'), ('Estrada'), ('Ruiz'), ('Figueroa'), ('Zavala'), ('Ramos'),
('Zepeda'), ('Amaya'), ('Lara'), ('Esquivel'), ('Castañeda'), ('Zavala'), ('Villa'), ('Vizcarra'), ('Zaragoza'), ('Vargas'),
('Saucedo'), ('Rosas'), ('Ramos'), ('Navarro'), ('Macedo'), ('López'), ('Ibarra'), ('Haro'), ('Galván'), ('Escobar'),
('Ceja'), ('Figueroa'), ('Leyva'), ('Contreras'), ('Villegas'), ('Osorio'), ('Valdez'), ('Godoy'), ('Enciso'), ('Coronado'),
('Conde'), ('Armendáriz'), ('Zazueta'), ('Galindo'), ('Leyva'), ('Valdés'), ('Medina'), ('Enciso'), ('Serrano'), ('Cuevas'),
('Quintana'), ('Vargas'), ('Zamora'), ('Araiza'), ('Cázares'), ('Ochoa'), ('Lizárraga'), ('Lomelí'), ('Orozco'), ('De la Rosa'),
('Cano'), ('Sánchez'), ('Mata'), ('Olivares'), ('Ocampo'), ('Bernal'), ('Talamantes'), ('Hernández'), ('Hernández'), ('Estrada'),
('Cortés'), ('Estrada'), ('Aguilar'), ('Morales'), ('Peña'), ('Valencia'), ('Romero'), ('Solís'), ('Aguilera'), ('Ruiz'),
('Valdez'), ('Becerra'), ('De la Cruz'), ('Espinosa'), ('Hurtado'), ('Ornelas'), ('Quintero'), ('Valencia'), ('Bernal'), ('Villegas'),
('Mata'), ('Heredia'), ('López'), ('Márquez'), ('Rivas'), ('Estrada'), ('Aguilera'), ('De la Cruz'), ('Solís'), ('Ruiz'),
('Mata'), ('Ortega'), ('Borboa'), ('Romero'), ('Varela'), ('Zarate'), ('Medina'), ('Cazares'), ('Barraza'), ('Camargo'),
('Ballesteros'), ('Aguirre'), ('Gálvez'), ('Barrón'), ('Urzúa'), ('Cardozo'), ('Parra'), ('López'), ('Villegas'),
('Esparza'), ('Cazares'), ('Zaragoza'), ('Valdés'), ('Munguía'), ('Yáñez'), ('Valdez'), ('Borrego'), ('Sánchez'), ('Lozano'), ('Peinado'),
('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'), ('Miller'), ('Davis'), ('García'), ('Rodríguez'), ('Martínez'),
('Hernández'), ('López'), ('González'), ('Pérez'), ('Wilson'), ('Lee'), ('Anderson'), ('Taylor'), ('Thomas'), ('Moore'),
('Jackson'), ('Martin'), ('White'), ('Thompson'), ('Harris'), ('García'), ('Martínez'), ('Robinson'), ('Clark'), ('Rodríguez'),
('Lewis'), ('Lee'), ('Walker'), ('Hall'), ('Allen'), ('Young'), ('Hernández'), ('King'), ('Wright'), ('López'),
('Hill'), ('Scott'), ('Green'), ('Adams'), ('Baker'), ('González'), ('Nelson'), ('Carter'), ('Mitchell'), ('Pérez'),
('Roberts'), ('Turner'), ('Phillips'), ('Campbell'), ('Parker'), ('Evans'), ('Edwards'), ('Collins'), ('Stewart'), ('Sánchez'),
('Morris'), ('Rogers'), ('Reed'), ('Cook'), ('Morgan'), ('Bell'), ('Murphy'), ('Bailey'), ('Cooper'), ('Richardson'),
('Cox'), ('Howard'), ('Ward'), ('Torres'), ('Peterson'), ('Gray'), ('Ramírez'), ('James'), ('Watson'), ('Brooks'),
('Kelly'), ('Sanders'), ('Price'), ('Bennett'), ('Wood'), ('Barnes'), ('Ross'), ('Hernández'), ('Coleman'), ('Jenkins'),
('Perry'), ('Powell'), ('Long'), ('Patterson'), ('Hughes'), ('Flores'), ('Washington'), ('Butler'), ('Simmons'), ('Foster'),
('González'), ('Bryant'), ('Alexander'), ('Russell'), ('Griffin'), ('Díaz'), ('Hayes'), ('Myers'), ('Ford'), ('Hamilton'),
('Graham'), ('Sullivan'), ('Wallace'), ('Woods'), ('Cole'), ('West'), ('Jordan'), ('Owens'), ('Reynolds'), ('Fisher'),
('Ellis'), ('Harrison'), ('Gibson'), ('McDonald'), ('Cruz'), ('Marshall'), ('Ortiz'), ('Gómez'), ('Murray'), ('Freeman'),
('Wells'), ('Webb'), ('Simpson'), ('Stevens'), ('Tucker'), ('Porter'), ('Hunter'), ('Hicks'), ('Crawford'), ('Henry'),
('Boyd'), ('Mason'), ('Morales'), ('Kennedy'), ('Warren'), ('Dixon'), ('Ramos'), ('Reyes'), ('Burns'), ('Gordon'),
('Shaw'), ('Holmes'), ('Rice'), ('Robertson'), ('Hunt'), ('Black'), ('Daniels'), ('Palmer'), ('Mills'), ('Nichols'),
('Grant'), ('Knight'), ('Ferguson'), ('Rose'), ('Stone'), ('Hawkins'), ('Dunn'), ('Perkins'), ('Hudson'), ('Spencer'),
('Gardner'), ('Stephens'), ('Payne'), ('Pierce'), ('Berry'), ('Matthews'), ('Arnold'), ('Wagner'), ('Willis'), ('Ray'),
('Watkins'), ('Olson'), ('Carroll'), ('Duncan'), ('Snyder'), ('Hart'), ('Cunningham'), ('Bradley'), ('Lane'), ('Andrews'),
('Ruiz'), ('Harper'), ('Fox'), ('Riley'), ('Armstrong'), ('Carpenter'), ('Weaver'), ('Greene'), ('Lawrence'), ('Elliott'),
('Chavez'), ('Sims'), ('Austin'), ('Peters'), ('Kelley'), ('Franklin'), ('Lawson'), ('Fields'), ('Gutierrez'), ('Ryan'),
('Schmidt'), ('Carr'), ('Vasquez'), ('Castillo'), ('Wheeler'), ('Chapman'), ('Oliver'), ('Montgomery'), ('Richards'), ('Williamson'),
('Johnston'), ('Banks'), ('Meyer'), ('Bishop'), ('McCoy'), ('Howell'), ('Alvarez'), ('Morrison'), ('Hansen'), ('Fernandez'),
('Garza'), ('Harvey'), ('Little'), ('Burton'), ('Stanley'), ('Nguyen'), ('George'), ('Jacobs'), ('Reid'), ('Kim'),
('Fuller'), ('Lynch'), ('Dean'), ('Gilbert'), ('Garrett'), ('Romero'), ('Welch'), ('Larson'), ('Frazier'), ('Burke'),
('Hanson'), ('Day'), ('Mendoza'), ('Moreno'), ('Bowman'), ('Medina'), ('Fowler'), ('Brewer'), ('Hoffman'), ('Carlson'),
('Silva'), ('Pearson'), ('Holland'), ('Douglas'), ('Fleming'), ('Jensen'), ('Vargas'), ('Byrd'), ('Davidson'), ('Hopkins'),
('May'), ('Terry'), ('Herrera'), ('Wade'), ('Soto'), ('Walters'), ('Curtis'), ('Neal'), ('Caldwell'), ('Lowe'),
('Jennings'), ('Barnett'), ('Graves'), ('Jimenez'), ('Horton'), ('Shelton'), ('Barrett'), ('Obrien'), ('Castro'), ('Sutton'),
('Gregory'), ('McKinney'), ('Lucas'), ('Miles'), ('Craig'), ('Rodriguez'), ('Chambers'), ('Holt'), ('Lambert'), ('Fletcher'),
('Watts'), ('Bates'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Horton'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'),
('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'),
('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'),
('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'),
('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'),
('Beck'), ('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'),
('Newman'), ('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'),
('Haynes'), ('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'),
('McDaniel'), ('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck'), ('Newman'), ('Haynes'), ('McDaniel'),
('Mendoza'), ('Love'), ('Hale'), ('Rhodes'), ('Pena'), ('Beck');

  WHILE i < 500 DO
    -- Generar nombres y apellidos aleatorios
    SET nombres = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(nombre ORDER BY RAND()), ',', 1) FROM temp_nombres);
    SET apellidos = (SELECT SUBSTRING_INDEX(GROUP_CONCAT(apellido ORDER BY RAND()), ',', 1) FROM temp_apellidos);

    -- Generar género aleatorio
    SET genero = IF(RAND() < 0.5, 'Hombre', 'Mujer');

    -- Generar fecha de nacimiento aleatoria (entre 1950 y 2003)
    SET fecha_nacimiento = DATE_ADD('1950-01-01', INTERVAL FLOOR(RAND() * (YEAR(CURDATE()) - 1950 + 1)) YEAR);

    -- Generar correo y contraseña basados en nombre y apellido
    SET correo = CONCAT(LOWER(REPLACE(nombres, ' ', '')), '.', LOWER(REPLACE(apellidos, ' ', '')), '@gmail.com');
    SET contrasena = CONCAT(LEFT(UUID(), 8), '!', FLOOR(RAND()*100));

    -- Generar estatus, fecha de registro y fecha de actualización
    SET estatus = IF(RAND() < 0.9, 'Activo', 'Inactivo');
    SET fecha_registro = CURRENT_TIMESTAMP;
    SET fecha_actualizacion = fecha_registro;

    -- Insertar el registro en la tabla tbb_persona
    INSERT INTO tbb_persona (nombre, apellido, genero, fecha_nacimiento, correo, contrasena, estatus, fecha_actualizacion, fecha_registro)
    VALUES (nombres, apellidos, genero, fecha_nacimiento, correo, contrasena, estatus, fecha_actualizacion, fecha_registro);

    SET i = i + 1;
  END WHILE;

  -- Eliminar tablas temporales
  DROP TEMPORARY TABLE IF EXISTS temp_nombres;
  DROP TEMPORARY TABLE IF EXISTS temp_apellidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_status_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_bd`()
BEGIN
	(SELECT "Autor" as Tabla,	 COUNT(*) as Total_Registros FROM tbb_autor)
	UNION
	(SELECT "Criterio" as Tabla, COUNT(*) as Total_Registros FROM tbb_criterio)
     UNION
	(SELECT "Editorial" as Tabla, COUNT(*) as Total_Registros FROM tbb_editorial)
     UNION
	(SELECT "Genero" as Tabla,  COUNT(*) as Total_Registros FROM tbb_genero)
     UNION
	(SELECT "Libro" as Tabla,	 COUNT(*) as Total_Registros FROM tbb_libro)
     UNION
	(SELECT "Persona" as Tabla, COUNT(*) as Total_Registros FROM tbb_persona)
     UNION
	(SELECT "Recomendacion" as Tabla, COUNT(*) as Total_Registros FROM tbb_recomendacion)
     UNION
	(SELECT "Valoracion" as Tabla, COUNT(*) as Total_Registros FROM tbb_valoracion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-24 20:11:30
