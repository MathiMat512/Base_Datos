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
-- Table structure for table `tb_actividades`
--

DROP TABLE IF EXISTS `tb_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_actividades` (
  `id_actividad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_mov` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_actividad`),
  UNIQUE KEY `id_actividades_UNIQUE` (`id_actividad`),
  KEY `id_user_idx` (`id_user`),
  KEY `id_articulo_idx` (`id_producto`),
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `tb_usuarios` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_actividades`
--

LOCK TABLES `tb_actividades` WRITE;
/*!40000 ALTER TABLE `tb_actividades` DISABLE KEYS */;
INSERT INTO `tb_actividades` VALUES (7,'PRUEBA DE INSERCIÓN','2025-05-13 11:50:11',1,6),(8,NULL,'2025-05-13 11:50:57',1,6),(9,'Se insertó el producto con ID: 6','2025-05-13 11:52:30',1,6),(10,'Se editó el producto con ID: 6','2025-05-13 11:53:29',1,6),(11,'Se editó el producto con ID: 6','2025-05-13 11:59:16',1,6),(12,'Se editó el producto con ID: 5','2025-05-13 12:30:57',1,5),(13,'Se editó el producto con ID: 13','2025-05-13 12:57:42',1,13),(14,'Se editó el producto con ID: 11','2025-05-13 12:57:45',1,11),(15,'Se insertó el producto con ID: 16','2025-05-13 13:29:54',NULL,16),(16,'Se insertó el producto con ID: 17','2025-05-13 13:30:16',NULL,17),(17,'Se modificó el producto con ID: 17. ','2025-05-13 14:44:50',1,17),(18,'Se eliminó lógicamente el producto con ID: 17','2025-05-13 14:52:28',1,17),(19,'Se editó el producto con ID: 16. ','2025-05-13 16:36:23',1,16),(20,'Se editó el producto con ID: 4. ','2025-05-13 16:54:31',1,4),(21,'Se editó el producto con ID: 16. ','2025-05-19 08:08:54',1,16),(22,'Entrada de 4 unidades al producto ID: 16','2025-05-19 08:24:24',1,16),(23,'Salida de 4 unidades del producto ID: 16','2025-05-19 08:25:06',1,16),(24,'Entrada de 1 unidades al producto ID: 16','2025-05-19 08:32:11',1,16),(25,'Edición de datos del producto ID: 16','2025-05-19 08:59:16',1,16),(26,'Cambio de estado a 1 para producto ID: 17','2025-05-19 09:06:57',1,17),(27,'Eliminación del producto ID: 6','2025-05-19 09:14:35',1,6),(28,'Edición de datos del producto ID: 17','2025-05-19 09:16:38',1,17),(29,'Edición de datos del producto ID: 16','2025-05-19 09:17:24',1,16);
/*!40000 ALTER TABLE `tb_actividades` ENABLE KEYS */;
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
