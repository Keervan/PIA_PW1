-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: tecnovitate
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia` (
  `idnoticia` int NOT NULL AUTO_INCREMENT,
  `titulo` text,
  `descripcion` text,
  `noticia` text,
  `categoria` int DEFAULT NULL,
  `ima1` varchar(99) DEFAULT NULL,
  `ima2` varchar(99) DEFAULT NULL,
  `ima3` varchar(99) DEFAULT NULL,
  `video` varchar(99) DEFAULT NULL,
  `estadoNoticia` int DEFAULT '0',
  `likes` int DEFAULT '0',
  `dislikes` int DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `user` int DEFAULT NULL,
  `cambio` text,
  PRIMARY KEY (`idnoticia`),
  KEY `fk_noti_cat_idx` (`categoria`),
  KEY `fk_noti_usa_idx` (`user`),
  CONSTRAINT `fk_noti_cat` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`idcategorias`),
  CONSTRAINT `fk_noti_usa` FOREIGN KEY (`user`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` VALUES (3,'OnePlus 8T, anÃ¡lisis: olvidarse de cargar el mÃ³vil sin renunciar a la fluidez de los 120 Hz','OnePlus ya avanzÃ³ sobre su segunda ronda que no habrÃ­a versiÃ³n Pro, de modo que al mÃ¡s reciente OnePlus Nord le esperaba un solo hermano. ','Precisamente es el que nos ocupa en este artÃ­culo, el anÃ¡lisis del OnePlus 8T, en el que comprobamos a fondo cÃ³mo ha evolucionado la experiencia \"Never Settle\" tras unos meses.\r\n\r\nYa que, aunque estrictamente hablando es el heredero directo del OnePlus 7T, el mÃ³vil llega seis meses despuÃ©s de los OnePlus 8 y OnePlus 8 Pro, y lo hace manteniendo parte del ADN de gama alta de sus predecesores pero con novedades entre sus caracterÃ­sticas.',2,'assets/images/image1607247630200.jpg','assets/images/image21607247630200.jpg','assets/images/image31607247630200.jpg',NULL,1,0,0,'2020-12-06',1,NULL);
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06  4:16:21
