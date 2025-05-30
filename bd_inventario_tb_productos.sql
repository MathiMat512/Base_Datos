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
  `descripcion_producto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `und_medida` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad_producto` int DEFAULT NULL,
  `cod_marca` int DEFAULT NULL,
  `cod_proveedor` int DEFAULT NULL,
  `cod_area` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `estado_producto` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES (1,'Mouse de Juanca','-','2023-09-15 00:00:00','2023-09-15 00:00:00',1,1,1,1,3,1),(2,'Teclado','-','2025-04-15 00:00:00','2025-04-16 00:00:00',1,2,2,2,1,1),(3,'Cable Jamma','60 cm','2025-05-10 00:00:00','2025-05-13 00:00:00',1,3,2,1,2,1),(4,'Multiconector','20m',NULL,NULL,5,2,1,1,1,1),(5,'Cables USB entrada C','cables',NULL,NULL,5,2,2,1,4,1),(6,'Tinta rosa','60 gramos',NULL,NULL,1,1,1,1,5,0),(11,'Tinta negra','',NULL,NULL,1,5,2,1,6,0),(13,'Tinta negra','',NULL,NULL,1,1,1,1,6,0),(16,'Tinta negraaa','30 gramos',NULL,NULL,3,2,1,2,2,1),(17,'Tinta Amarilla','',NULL,NULL,5,5,2,4,6,1);
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_productos_AFTER_INSERT` AFTER INSERT ON `tb_productos` FOR EACH ROW BEGIN
    INSERT INTO tb_actividades (descripcion, fecha_mov, id_user, id_producto)
    VALUES (CONCAT('Se insertó el producto con ID: ', COALESCE(CAST(NEW.id_producto AS CHAR), 'NULL')), NOW(), 1, NEW.id_producto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_productos_AFTER_UPDATE_CANTIDAD` AFTER UPDATE ON `tb_productos` FOR EACH ROW BEGIN
    DECLARE diferencia INT;
    DECLARE tipo_trans VARCHAR(7);
    
    -- 1. Manejo de cambios en cantidad (registra en tb_transacciones)
    IF OLD.cantidad_producto <> NEW.cantidad_producto THEN
        -- Calcular la diferencia
        SET diferencia = NEW.cantidad_producto - OLD.cantidad_producto;
        
        -- Determinar el tipo de transacción
        IF diferencia > 0 THEN
            SET tipo_trans = 'ENTRADA';
        ELSE
            SET tipo_trans = 'SALIDA';
            SET diferencia = ABS(diferencia);
        END IF;
        
        -- Registrar la transacción
        INSERT INTO tb_transacciones (
            id_producto, 
            fecha_movimiento, 
            tipo_transaccion, 
            cantidad, 
            cantidad_actual
        ) VALUES (
            NEW.id_producto, 
            NOW(), 
            tipo_trans, 
            diferencia, 
            NEW.cantidad_producto
        );
    END IF;
    
    -- 2. Manejo de cambios generales (registra en tb_actividades)
    IF OLD.estado_producto <> NEW.estado_producto THEN
        -- Eliminación lógica
        IF NEW.estado_producto = '0' THEN
            INSERT INTO tb_actividades (
                descripcion, 
                fecha_mov, 
                id_user, 
                id_producto
            ) VALUES (
                CONCAT('Eliminación del producto ID: ', OLD.id_producto),
                NOW(),
                1,
                OLD.id_producto
            );
        END IF;
    ELSE
        -- Edición general (si no fue cambio de cantidad ni estado)
        IF NOT (OLD.cantidad_producto <> NEW.cantidad_producto) THEN
            INSERT INTO tb_actividades (
                descripcion, 
                fecha_mov, 
                id_user, 
                id_producto
            ) VALUES (
                CONCAT('Edición de datos del producto ID: ', OLD.id_producto),
                NOW(),
                1,
                OLD.id_producto
            );
        END IF;
    END IF;
END */;;
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

-- Dump completed on 2025-05-30 16:24:28
