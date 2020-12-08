CREATE DATABASE  IF NOT EXISTS `tecnovitate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tecnovitate`;
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idcategorias` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'CELULARES'),(3,'HARDWARE'),(4,'SOFTWARE'),(5,'VIDEOJUEGOS'),(6,'IA');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int NOT NULL AUTO_INCREMENT,
  `usuario` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cometario` text,
  `noticia` int DEFAULT NULL,
  `likes` int DEFAULT '0',
  `dislikes` int DEFAULT '0',
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_coment_usua_idx` (`usuario`),
  CONSTRAINT `fk_coment_usua` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (4,NULL,'2020-12-07 17:49:49','Zy Ez Chino No JALa',3,0,0);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favs`
--

DROP TABLE IF EXISTS `favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favs` (
  `idfavs` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `noticia` int DEFAULT NULL,
  PRIMARY KEY (`idfavs`),
  KEY `fk_favs_noti_idx` (`noticia`),
  CONSTRAINT `fk_favs_noti` FOREIGN KEY (`noticia`) REFERENCES `noticia` (`idnoticia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favs`
--

LOCK TABLES `favs` WRITE;
/*!40000 ALTER TABLE `favs` DISABLE KEYS */;
INSERT INTO `favs` VALUES (3,1,3);
/*!40000 ALTER TABLE `favs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` VALUES (3,'OnePlus 8T, anÃ¡lisis: olvidarse de cargar el mÃ³vil sin renunciar a la fluidez de los 120 Hz','OnePlus ya avanzÃ³ sobre su segunda ronda que no habrÃ­a versiÃ³n Pro, de modo que al mÃ¡s reciente OnePlus Nord le esperaba un solo hermano. ','Precisamente es el que nos ocupa en este artÃ­culo, el anÃ¡lisis del OnePlus 8T, en el que comprobamos a fondo cÃ³mo ha evolucionado la experiencia \"Never Settle\" tras unos meses.\r\n\r\nYa que, aunque estrictamente hablando es el heredero directo del OnePlus 7T, el mÃ³vil llega seis meses despuÃ©s de los OnePlus 8 y OnePlus 8 Pro, y lo hace manteniendo parte del ADN de gama alta de sus predecesores pero con novedades entre sus caracterÃ­sticas.',2,'assets/images/image1607247630200.jpg','assets/images/image21607247630200.jpg','assets/images/image31607247630200.jpg',NULL,1,0,0,'2020-12-06',1,NULL),(4,'Xiaomi Mi 10T Pro llega a Mexico: 144 Hz, 108 megapixeles y Snapdragon 865 por menos de 20,000 pesos','Se termino el misterio, el Xiaomi Mi 10T Pro ha llegado a Mexico para complementar la oferta de la compania en la gama mas alta del mercado, solo representada por el Xiaomi Mi 10 en nuestro pais.','El Xiaomi Mi 10T Pro tendra un precio en Mexico de 16,999 pesos, disponible a partir del 10 de diciembre en el catalogo de Telcel. Gracias a su distribucion con el operador tendra beneficios adicionales: 24 meses de garantia por defectos de fabrica y 6 meses de proteccion de pantalla. Este ultimo beneficio hace acreedor al usuario a un cambio completo de panel sin costo y sin preguntas, dentro de ese periodo de tiempo. \r\nPosteriormente el Mi 10T Pro llegara a otros puntos de venta, con el mismo beneficio de la garantiÂ­a extendida y la proteccion de pantalla.',2,'assets/images/image1607401238068.jpg','assets/images/image21607401238074.jpg','assets/images/image31607401238074.jpg',NULL,1,0,0,'2020-12-07',1,NULL);
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `redes` text,
  `avatar` varchar(99) DEFAULT NULL,
  `descripcion` text,
  `tipo_usua` int DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Moderador','moderador@moderador.com','moderador','fb.com/moderador','assets/images/foto1607247458368.jpg','Soy el moderador xd',2),(2,'Lessli','lessli@gmail.com','456',NULL,'assets/image/anonimo.jpg',NULL,1),(3,'Angel','angel@gmail.com','123',NULL,'assets/image/anonimo.jpg',NULL,1),(4,'Alejandro','alejandro@hotmail.com','789','','assets/images/foto1607247940761.jpg','',1),(7,'prueba','prueba@gmail.com','Prueba123',NULL,'assets/image/anonimo.jpg',NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tecnovitate'
--

--
-- Dumping routines for database 'tecnovitate'
--
/*!50003 DROP PROCEDURE IF EXISTS `editarUsua` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editarUsua`(
IN `pNombre` varchar(60),
IN `pEmail` varchar(60),
IN `pNewContraseña` varchar(45),
IN `pRedes` text,
IN `pAvatar` varchar(99),
IN `pDescripcion` text,
IN `pIdusuario` int,
IN `pContraseña` varchar(45))
BEGIN
UPDATE `tecnovitate`.`usuario`
SET
`nombre` = pNombre,
`email` = pEmail,
`contraseña` = pNewContraseña,
`redes` = pRedes,
`avatar` = pAvatar,
`descripcion` = pDescripcion
WHERE `idusuario` = pIdusuario
AND
`contraseña` = pContraseña;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarComentario`(
IN `pIdcomentarios` int)
BEGIN
DELETE FROM `tecnovitate`.`comentarios`
WHERE `idcomentarios` = pIdcomentarios;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarFav` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarFav`(
IN `pIdfavs` int)
BEGIN
DELETE FROM `tecnovitate`.`favs`
WHERE `idfavs` = pIdfavs;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategoria`(
IN `pIdcategorias` int)
BEGIN
SELECT `categorias`.`idcategorias`,
    `categorias`.`categoria`
FROM `tecnovitate`.`categorias`
where `categorias`.`idcategorias` = pIdcategorias;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategorias`()
BEGIN
SELECT `categorias`.`idcategorias`,
    `categorias`.`categoria`
FROM `tecnovitate`.`categorias`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getComentariosByNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getComentariosByNew`(
IN `pIdNew` int)
BEGIN
SELECT `comentarios`.`idcomentarios`,
    `comentarios`.`usuario`,
    `comentarios`.`fecha`,
    `comentarios`.`cometario`,
    `comentarios`.`noticia`,
    `comentarios`.`likes`,
    `comentarios`.`dislikes`
FROM `tecnovitate`.`comentarios`
where `comentarios`.`noticia` = pIdNew;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFavs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFavs`(
IN `pUser` int)
BEGIN
SELECT `favs`.`idfavs`,
    `favs`.`user`,
    `favs`.`noticia`
FROM `tecnovitate`.`favs`
where `favs`.`user` = pUser;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFavsAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFavsAll`()
BEGIN
SELECT `favs`.`idfavs`,
    `favs`.`user`,
    `favs`.`noticia`
FROM `tecnovitate`.`favs`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNotiCancelados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNotiCancelados`(
IN `pUser` int)
BEGIN
SELECT `noticia`.`idnoticia`,
    `noticia`.`titulo`,
    `noticia`.`descripcion`,
    `noticia`.`noticia`,
    `noticia`.`categoria`,
    `noticia`.`ima1`,
    `noticia`.`ima2`,
    `noticia`.`ima3`,
    `noticia`.`video`,
    `noticia`.`estadoNoticia`,
    `noticia`.`likes`,
    `noticia`.`dislikes`,
    `noticia`.`fecha`,
    `noticia`.`user`
FROM `tecnovitate`.`noticia`
where `noticia`.`estadoNoticia` = 2
AND `user` = pUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNoticia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNoticia`(
IN `pIdnoticia` int)
BEGIN
SELECT `noticia`.`idnoticia`,
    `noticia`.`titulo`,
    `noticia`.`descripcion`,
    `noticia`.`noticia`,
    `noticia`.`categoria`,
    `noticia`.`ima1`,
    `noticia`.`ima2`,
    `noticia`.`ima3`,
    `noticia`.`video`,
    `noticia`.`estadoNoticia`,
    `noticia`.`likes`,
    `noticia`.`dislikes`,
    `noticia`.`fecha`,
    `noticia`.`user`,
    `noticia`.`cambio`
FROM `tecnovitate`.`noticia`
WHERE `idnoticia` = pIdnoticia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNoticias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNoticias`()
BEGIN
SELECT `noticia`.`idnoticia`,
    `noticia`.`titulo`,
    `noticia`.`descripcion`,
    `noticia`.`noticia`,
    `noticia`.`categoria`,
    `noticia`.`ima1`,
    `noticia`.`ima2`,
    `noticia`.`ima3`,
    `noticia`.`video`,
    `noticia`.`estadoNoticia`,
    `noticia`.`likes`,
    `noticia`.`dislikes`,
    `noticia`.`fecha`,
    `noticia`.`user`,
    `noticia`.`cambio`
FROM `tecnovitate`.`noticia`
WHERE `noticia`.`estadoNoticia` = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNotiPendientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNotiPendientes`()
BEGIN
SELECT `noticia`.`idnoticia`,
    `noticia`.`titulo`,
    `noticia`.`descripcion`,
    `noticia`.`noticia`,
    `noticia`.`categoria`,
    `noticia`.`ima1`,
    `noticia`.`ima2`,
    `noticia`.`ima3`,
    `noticia`.`video`,
    `noticia`.`estadoNoticia`,
    `noticia`.`likes`,
    `noticia`.`dislikes`,
    `noticia`.`fecha`,
    `noticia`.`user`
FROM `tecnovitate`.`noticia`
where `noticia`.`estadoNoticia` = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniSesion`(
IN `pEmail` varchar(60),
IN `pContraseña` varchar(45))
BEGIN
SELECT `usuario`.`idusuario`,
    `usuario`.`nombre`,
    `usuario`.`email`,
    `usuario`.`contraseña`,
    `usuario`.`redes`,
    `usuario`.`avatar`,
    `usuario`.`descripcion`,
    `usuario`.`tipo_usua`
FROM `tecnovitate`.`usuario`
where `usuario`.`email` = pEmail
and
    `usuario`.`contraseña` = pContraseña;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniSesionId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniSesionId`(
IN `pIdusuario` int)
BEGIN
SELECT `usuario`.`idusuario`,
    `usuario`.`nombre`,
    `usuario`.`email`,
    `usuario`.`contraseña`,
    `usuario`.`redes`,
    `usuario`.`avatar`,
    `usuario`.`descripcion`,
    `usuario`.`tipo_usua`
FROM `tecnovitate`.`usuario`
Where `usuario`.`idusuario` = pIdusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modiNoti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modiNoti`(
IN `pTitulo` text,
IN `pDescripcion` text,
IN `pNoticia` text,
IN `pCategoria` int,
IN `pIma1` varchar(99),
IN `pIma2` varchar(99),
IN `pIma3` varchar(99),
IN `pVideo` varchar(99),
IN `idNoti` int)
BEGIN
UPDATE `tecnovitate`.`noticia`
SET
`titulo` = pTitulo,
`descripcion` = pDescripcion,
`noticia` = pNoticia,
`categoria` = pCategoria,
`ima1` = pIma1,
`ima2` = pIma2,
`ima3` = pIma3,
`video` = pVideo,
`estadoNoticia` = 0,
`fecha` = NOW(),
`cambio` = NULL
WHERE `idnoticia` = idNoti;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarse`(
IN `pNombre` varchar(60),
IN `pEmail` varchar(60),
IN `pContraseña` varchar(45),
IN `pAvatar` varchar(99))
BEGIN
INSERT INTO `tecnovitate`.`usuario`
(
`nombre`,
`email`,
`contraseña`,
`avatar`)
VALUES
(
pNombre,
pEmail,
pContraseña,
pAvatar);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setAceptado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setAceptado`(
IN `pIdnoticia` int)
BEGIN
UPDATE `tecnovitate`.`noticia`
SET
`estadoNoticia` = 1,
`cambio` = NULL
WHERE `idnoticia` = pIdnoticia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setCancelado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setCancelado`(
IN `pIdnoticia` int,
IN `pCambio` text)
BEGIN
UPDATE `tecnovitate`.`noticia`
SET
`estadoNoticia` = 2,
`cambio` = pCambio
WHERE `idnoticia` = pIdnoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setComentario`(
IN `pCometario` text,
IN `pUsuario` int,
IN `pNoticia` int)
BEGIN
INSERT INTO `tecnovitate`.`comentarios`
(
`usuario`,
`fecha`,
`cometario`,
`noticia`)
VALUES
(
pUsuario,
NOW(),
pCometario,
pNoticia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setFav` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setFav`(
IN `pUser` int,
IN `pNoticia` int)
BEGIN
INSERT INTO `tecnovitate`.`favs`
(
`user`,
`noticia`)
VALUES
(
pUser,
pNoticia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setNoticia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setNoticia`(
IN `pTitulo` text,
IN `pDescripcion` text,
IN `pNoticia` text,
IN `pCategoria` int,
IN `pIma1` varchar(99),
IN `pIma2` varchar(99),
IN `pIma3` varchar(99),
IN `pVideo` varchar(99),
IN `pUser` int)
BEGIN
INSERT INTO `tecnovitate`.`noticia`
(
`titulo`,
`descripcion`,
`noticia`,
`categoria`,
`ima1`,
`ima2`,
`ima3`,
`video`,
`fecha`,
`user`)
VALUES
(
pTitulo,
pDescripcion,
pNoticia,
pCategoria,
pIma1,
pIma2,
pIma3,
pVideo,
NOW(),
pUser);

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

-- Dump completed on 2020-12-07 22:32:13
