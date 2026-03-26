-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_inventario
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `estado_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'admin','$2a$10$lRaVIws3CF59aJVtTtIY8u1OhPYKrzWC6d4fPjxOfAE7nJG/QG2Fi','Mathias','Bautista',1),(2,'mathias','$2a$10$BxfZ74mflZnNKvcEhXopGeUdWB7OAy02lxcR28YexWcRFAOi8FE3O','Mathias','Bautista',1),(3,'prueba','$2a$10$oTfedlzHYE6h3ErRoIu9xeXePUTCSGBdjxWUW8yflfI.PuetKkycu','Juan','Perez',1),(4,'alejandro','$2a$10$ADD7IK7VZ.I6VE8ER28ycOK7fykuyW0TAK8/auVc4zwmuzQLsxWVm','Alejandro','Sanchez',1),(5,'test','$2a$10$lr1NLfOpDDRSc5rvfn52NuTltgNMSHyajc.ktjt.R3nXogY413Imu','Carlos','Gomez',0),(9,'carlos','$2a$10$By8Pj.TDfbe.DtOKxeFak.smpxXBKibLyOoSsMCrgDesu8eoWjcvu','Carlos','Gomez',1),(11,'mbautista','$2a$10$O8M16pSIG9OMtxun8niNhOf3hKUnDqjwgxnt32Zyh0W5uXxySFInS','Mathias','Bautista',0);
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-25 23:53:20
