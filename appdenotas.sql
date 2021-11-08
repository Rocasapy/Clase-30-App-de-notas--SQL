-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.27

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
  `idCategorias` int NOT NULL AUTO_INCREMENT,
  `categoriasnombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Musica'),(2,'Entretenimiento'),(3,'Cosas que hacer'),(4,'Regalos'),(5,'Compras'),(6,'Paseos'),(7,'Trabajo'),(8,'Educacion'),(9,'Gastos'),(10,'Salud');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notas`
--

DROP TABLE IF EXISTS `Notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notas` (
  `idNotas` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_ult_edit` date NOT NULL,
  `idUsuarios` int NOT NULL,
  `gestion` varchar(45) NOT NULL,
  `idCategorias` int NOT NULL,
  `eliminada/conservada` varchar(10) NOT NULL,
  PRIMARY KEY (`idNotas`),
  KEY `idUsuarios_idx` (`idUsuarios`),
  KEY `idCategorisa_idx` (`idCategorias`),
  CONSTRAINT `idCategorisa` FOREIGN KEY (`idCategorias`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `idUsuarios` FOREIGN KEY (`idUsuarios`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notas`
--

LOCK TABLES `Notas` WRITE;
/*!40000 ALTER TABLE `Notas` DISABLE KEYS */;
INSERT INTO `Notas` VALUES (1,'Reunión de trabajo ','Reunion con Netflix para ajustar datos de mi bio serie','2021-11-05','2021-11-05',6,'creada',7,'conservada'),(2,'Regalos Navidad','Reloj, Zapatillas, Peluche de Minnie','2021-11-05','2021-11-05',2,'creada',5,'eliminada'),(3,'Impuestos','Monotributo, Impuestos a las Gnanacias: hablar con la contadora','2021-11-05','2021-11-08',4,'creada',9,'conservada'),(4,'Ir al cine','Pelicula: The Eternals, en el IMAX con Miranda','2021-11-05','2021-11-05',7,'creada',2,'conservada'),(5,'Cordoba','El centro, Estancias Jesuiticas, Villa Carlos Paz','2021-11-05','2021-11-05',7,'creada',6,'conservada'),(6,'Mendoza','Excursion de Alta Montaña, Viñedos','2021-11-05','2021-11-05',10,'creada',6,'conservada'),(7,'Pelis Favoritas','House of Card, Jackie, Diana','2021-10-05','2021-11-05',3,'creada',2,'conservada'),(8,'Clases de Running','Calentamiento, Run Walk- Run','2021-01-22','2021-11-05',8,'creada',10,'conservada'),(9,'Jugar Bowling','Reservar turno, al menos una semana antes','2021-11-05','2020-12-05',2,'creada',2,'eliminada'),(10,'Letras de canciones','Solitaria, camina la bikina y la gente se pone a murmurar  ','2021-11-05','2021-11-05',6,'creada',1,'conservada');
/*!40000 ALTER TABLE `Notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notas_y_sus_categorias`
--

DROP TABLE IF EXISTS `Notas_y_sus_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notas_y_sus_categorias` (
  `idNotas` int NOT NULL,
  `idCategorias` int NOT NULL,
  PRIMARY KEY (`idNotas`,`idCategorias`),
  KEY `idNotas_idx` (`idNotas`),
  KEY `fk_Notas_y_sus_categorias_categorias1_idx_idx` (`idCategorias`),
  CONSTRAINT `fk_Notas_y_sus_categorias_categorias1_idx` FOREIGN KEY (`idCategorias`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `fk_Notas_y_sus_categorias_notas1_idx` FOREIGN KEY (`idNotas`) REFERENCES `Notas` (`idNotas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notas_y_sus_categorias`
--

LOCK TABLES `Notas_y_sus_categorias` WRITE;
/*!40000 ALTER TABLE `Notas_y_sus_categorias` DISABLE KEYS */;
INSERT INTO `Notas_y_sus_categorias` VALUES (1,1),(2,4),(7,2),(8,1),(9,3),(10,4);
/*!40000 ALTER TABLE `Notas_y_sus_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Meghan','Markle','kensigtonpalace@uk.com'),(2,'Iván','Almeida','tricampeondeamerica@olimpia.com'),(3,'Silvana','Lopez','primeradama2021@hotmail.com'),(4,'Marie','Curie','quimica123@francia.com'),(5,'Jose','Feliciano','labamba@empresa.org'),(6,'Luis Miguel','Gallego','elsoldemexico@yahoo.com.mx'),(7,'Sarah','Parker','sexandthecity@hbo.latam.com'),(8,'Jorge','Clonney','jorgeclooney@academy.org'),(9,'Agustina','Cherry','chiquititas1988@telefe.com'),(10,'Miguel','De la Quadra','rutaquetzal1999@aventuras.org');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 17:17:08
