-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_requisitos
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cambio`
--

DROP TABLE IF EXISTS `Cambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cambio` (
  `id_cambio` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_cambio` date NOT NULL,
  `justificacion` text NOT NULL,
  `cambio_requisito` text NOT NULL,
  `id_requisito` int DEFAULT NULL,
  PRIMARY KEY (`id_cambio`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_requisito` (`id_requisito`),
  CONSTRAINT `Cambio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `Cambio_ibfk_2` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cambio`
--

LOCK TABLES `Cambio` WRITE;
/*!40000 ALTER TABLE `Cambio` DISABLE KEYS */;
INSERT INTO `Cambio` VALUES (1,2,'2025-07-02','Corrección descripción','Se actualizó el alcance',1),(2,1,'2025-07-02','Cambio de prioridad','Alta a Media',3),(3,3,'2025-07-02','Nuevo campo agregado','Se añadió campo de estado',2),(4,4,'2025-07-02','Corrección ortográfica','Revisión en nombres del formulario',4);
/*!40000 ALTER TABLE `Cambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `CambiosFuncionales`
--

DROP TABLE IF EXISTS `CambiosFuncionales`;
/*!50001 DROP VIEW IF EXISTS `CambiosFuncionales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CambiosFuncionales` AS SELECT 
 1 AS `id_cambio`,
 1 AS `justificacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CambiosLuis`
--

DROP TABLE IF EXISTS `CambiosLuis`;
/*!50001 DROP VIEW IF EXISTS `CambiosLuis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CambiosLuis` AS SELECT 
 1 AS `id_cambio`,
 1 AS `fecha_cambio`,
 1 AS `justificacion`,
 1 AS `cambio_requisito`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proyecto` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `identificador` varchar(50) NOT NULL,
  `descripcion` text,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  UNIQUE KEY `identificador` (`identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (1,'SGR','PR001','Sistema de Gestión de Requisitos','activo','2025-07-01'),(2,'Sistema Notas','PR002','Sistema de Notas UNL','inactivo','2025-06-15'),(3,'Evaluador UNL','PR003','Sistema de evaluación docente','activo','2025-07-02');
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ProyectosActivos`
--

DROP TABLE IF EXISTS `ProyectosActivos`;
/*!50001 DROP VIEW IF EXISTS `ProyectosActivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ProyectosActivos` AS SELECT 
 1 AS `nombre`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Relacion`
--

DROP TABLE IF EXISTS `Relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Relacion` (
  `id_relacion` int NOT NULL AUTO_INCREMENT,
  `id_requisito_origen` int DEFAULT NULL,
  `id_requisito_destino` int DEFAULT NULL,
  `tipo_relacion` varchar(50) DEFAULT NULL,
  `descripcion_relacion` text,
  PRIMARY KEY (`id_relacion`),
  KEY `id_requisito_origen` (`id_requisito_origen`),
  KEY `id_requisito_destino` (`id_requisito_destino`),
  CONSTRAINT `Relacion_ibfk_1` FOREIGN KEY (`id_requisito_origen`) REFERENCES `Requisito` (`id_requisito`),
  CONSTRAINT `Relacion_ibfk_2` FOREIGN KEY (`id_requisito_destino`) REFERENCES `Requisito` (`id_requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relacion`
--

LOCK TABLES `Relacion` WRITE;
/*!40000 ALTER TABLE `Relacion` DISABLE KEYS */;
INSERT INTO `Relacion` VALUES (1,1,3,'dependencia','Exportar depende de registrar requisitos'),(2,2,1,'restriccion','Seguridad restringe el registro'),(3,4,6,'dependencia','Reportes necesitan datos de usuarios registrados'),(4,5,4,'restriccion','Autenticación limita creación de usuarios');
/*!40000 ALTER TABLE `Relacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisito`
--

DROP TABLE IF EXISTS `Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requisito` (
  `id_requisito` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `prioridad` varchar(50) DEFAULT NULL,
  `clasificacion` varchar(50) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `id_usuario_creador` int DEFAULT NULL,
  `id_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`id_requisito`),
  KEY `id_usuario_creador` (`id_usuario_creador`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `Requisito_ibfk_1` FOREIGN KEY (`id_usuario_creador`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `Requisito_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisito`
--

LOCK TABLES `Requisito` WRITE;
/*!40000 ALTER TABLE `Requisito` DISABLE KEYS */;
INSERT INTO `Requisito` VALUES (1,'Registrar requisitos','propuesto','alta','funcionalidad','2025-07-01','funcional',1,1),(2,'Seguridad de acceso','aprobado','media','restriccion','2025-07-01','no funcional',2,1),(3,'Exportar a PDF','implementado','baja','informacion','2025-07-02','funcional',1,1),(4,'Registrar usuarios','propuesto','alta','funcionalidad','2025-07-02','funcional',4,3),(5,'Autenticación por token','aprobado','alta','restriccion','2025-07-02','no funcional',5,3),(6,'Generar reportes','propuesto','media','informacion','2025-07-02','funcional',2,3);
/*!40000 ALTER TABLE `Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `RequisitosAnaBaja`
--

DROP TABLE IF EXISTS `RequisitosAnaBaja`;
/*!50001 DROP VIEW IF EXISTS `RequisitosAnaBaja`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `RequisitosAnaBaja` AS SELECT 
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `RequisitosEstudiantes`
--

DROP TABLE IF EXISTS `RequisitosEstudiantes`;
/*!50001 DROP VIEW IF EXISTS `RequisitosEstudiantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `RequisitosEstudiantes` AS SELECT 
 1 AS `id_requisito`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Revision`
--

DROP TABLE IF EXISTS `Revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Revision` (
  `id_revision` int NOT NULL AUTO_INCREMENT,
  `fecha_creacion` date NOT NULL,
  `descripcion` text,
  `estado_revision` varchar(50) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_requisito` int DEFAULT NULL,
  PRIMARY KEY (`id_revision`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_requisito` (`id_requisito`),
  CONSTRAINT `Revision_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `Revision_ibfk_2` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revision`
--

LOCK TABLES `Revision` WRITE;
/*!40000 ALTER TABLE `Revision` DISABLE KEYS */;
INSERT INTO `Revision` VALUES (1,'2025-07-02','Revisión inicial','aprobado',3,1),(2,'2025-07-02','Observaciones funcionales','pendiente',3,3),(3,'2025-07-02','Validación de requerimientos','aprobado',5,5),(4,'2025-07-02','Corrección de inconsistencias','pendiente',2,6);
/*!40000 ALTER TABLE `Revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Ana','ana@unl.edu.ec','1234','estudiante'),(2,'Luis','luis@unl.edu.ec','abcd','estudiante'),(3,'Carlos','carlos@unl.edu.ec','pass','docente'),(4,'María','maria@unl.edu.ec','4321','estudiante'),(5,'Pedro','pedro@unl.edu.ec','xyz987','docente');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Proyecto`
--

DROP TABLE IF EXISTS `Usuario_Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario_Proyecto` (
  `id_usuario` int NOT NULL,
  `id_proyecto` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_proyecto`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `Usuario_Proyecto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `Usuario_Proyecto_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Proyecto`
--

LOCK TABLES `Usuario_Proyecto` WRITE;
/*!40000 ALTER TABLE `Usuario_Proyecto` DISABLE KEYS */;
INSERT INTO `Usuario_Proyecto` VALUES (1,1),(2,1),(3,1),(3,2),(2,3),(4,3),(5,3);
/*!40000 ALTER TABLE `Usuario_Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `CambiosFuncionales`
--

/*!50001 DROP VIEW IF EXISTS `CambiosFuncionales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CambiosFuncionales` AS select `c`.`id_cambio` AS `id_cambio`,`c`.`justificacion` AS `justificacion` from (`Requisito` `r` join `Cambio` `c` on((`r`.`id_requisito` = `c`.`id_requisito`))) where (`r`.`tipo` = 'funcional') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CambiosLuis`
--

/*!50001 DROP VIEW IF EXISTS `CambiosLuis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CambiosLuis` AS select `c`.`id_cambio` AS `id_cambio`,`c`.`fecha_cambio` AS `fecha_cambio`,`c`.`justificacion` AS `justificacion`,`c`.`cambio_requisito` AS `cambio_requisito` from (`Usuario` `u` join `Cambio` `c` on((`u`.`id_usuario` = `c`.`id_usuario`))) where (`u`.`nombre` = 'Luis') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProyectosActivos`
--

/*!50001 DROP VIEW IF EXISTS `ProyectosActivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProyectosActivos` AS select `Proyecto`.`nombre` AS `nombre`,`Proyecto`.`estado` AS `estado` from `Proyecto` where (`Proyecto`.`estado` = 'activo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `RequisitosAnaBaja`
--

/*!50001 DROP VIEW IF EXISTS `RequisitosAnaBaja`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `RequisitosAnaBaja` AS select `r`.`descripcion` AS `descripcion` from (`Usuario` `u` join `Requisito` `r` on((`u`.`id_usuario` = `r`.`id_usuario_creador`))) where ((`u`.`nombre` = 'Ana') and (`r`.`prioridad` = 'baja')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `RequisitosEstudiantes`
--

/*!50001 DROP VIEW IF EXISTS `RequisitosEstudiantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `RequisitosEstudiantes` AS select `r`.`id_requisito` AS `id_requisito`,`r`.`descripcion` AS `descripcion` from (`Usuario` `u` join `Requisito` `r` on((`u`.`id_usuario` = `r`.`id_usuario_creador`))) where (`u`.`rol` = 'estudiante') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 12:09:40
