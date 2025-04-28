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
-- Table structure for table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion_producto` varchar(200) DEFAULT NULL,
  `und_medida` varchar(200) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad_producto` int DEFAULT NULL,
  `cod_marca` int DEFAULT NULL,
  `cod_proveedor` int DEFAULT NULL,
  `cod_area` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_articulo_UNIQUE` (`id_producto`),
  KEY `cod_marca_idx` (`cod_marca`),
  KEY `cod_proveedor_idx` (`cod_proveedor`),
  KEY `cod_area_idx` (`cod_area`),
  KEY `id_categoria_idx` (`id_categoria`),
  CONSTRAINT `cod_area` FOREIGN KEY (`cod_area`) REFERENCES `tb_area` (`id_area`),
  CONSTRAINT `cod_marca` FOREIGN KEY (`cod_marca`) REFERENCES `tb_marca` (`id_marca`),
  CONSTRAINT `cod_proveedor` FOREIGN KEY (`cod_proveedor`) REFERENCES `tb_proveedor` (`id_proveedor`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES (1,'Mouse de Juanca','-','2023-09-15 00:00:00','2023-09-15 00:00:00',1,1,1,1,3),(2,'Teclado','-','2025-04-15 00:00:00','2025-04-16 00:00:00',1,2,2,2,1);
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-28  8:58:23
