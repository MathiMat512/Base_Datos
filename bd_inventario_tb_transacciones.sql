-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_inventario
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `tb_transacciones`
--

DROP TABLE IF EXISTS `tb_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_transacciones` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `fecha_movimiento` datetime DEFAULT NULL,
  `tipo_transaccion` varchar(7) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `cantidad_actual` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `fk_transacciones_producto` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transacciones`
--

LOCK TABLES `tb_transacciones` WRITE;
/*!40000 ALTER TABLE `tb_transacciones` DISABLE KEYS */;
INSERT INTO `tb_transacciones` VALUES (1,16,'2025-05-19 08:01:58','ENTRADA',4,'5'),(2,16,'2025-05-19 08:08:54','SALIDA',4,'1'),(3,16,'2025-05-19 08:24:24','ENTRADA',4,'5'),(4,16,'2025-05-19 08:25:06','SALIDA',4,'1'),(6,16,'2025-05-19 08:32:11','ENTRADA',1,'2'),(7,16,'2025-05-19 09:18:01','ENTRADA',1,'3'),(8,17,'2025-05-19 09:18:55','ENTRADA',4,'5'),(9,5,'2025-05-27 10:37:16','SALIDA',2,'5');
/*!40000 ALTER TABLE `tb_transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 16:24:27
