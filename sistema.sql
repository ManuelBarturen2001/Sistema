-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_uniquecdgcategoria` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'101','zapatilla'),(2,'102','zapato'),(3,'103','botas'),(4,'106','sandalia'),(5,'107','camisa'),(6,'108','polo'),(7,'109','polera'),(8,'104','taco'),(9,'210','chompa'),(10,'215','short'),(11,'320','pantalon');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'hombre'),(2,'mujer'),(3,'niño'),(4,'niña'),(5,'unisex');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesproduct`
--

DROP TABLE IF EXISTS `imagenesproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenesproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idproduct` int NOT NULL,
  `slugproduct` varchar(450) NOT NULL,
  `imagen1` varchar(450) NOT NULL,
  `imagen2` varchar(450) DEFAULT NULL,
  `imagen3` varchar(450) DEFAULT NULL,
  `imagen4` varchar(450) DEFAULT NULL,
  `imagen5` varchar(450) DEFAULT NULL,
  `imagen6` varchar(450) DEFAULT NULL,
  `imagen7` varchar(450) DEFAULT NULL,
  `imagen8` varchar(450) DEFAULT NULL,
  `imagen9` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idproduct_UNIQUE` (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesproduct`
--

LOCK TABLES `imagenesproduct` WRITE;
/*!40000 ALTER TABLE `imagenesproduct` DISABLE KEYS */;
INSERT INTO `imagenesproduct` VALUES (1,1,'zapatillas-para-hombre-dc-shoes-fit-lifestyle-estilo-dc-shoes-cure','imagenp.jpeg','imagenp1.jpeg','imagenp2.jpeg','imagenp3.jpeg','imagenp4.jpeg',NULL,NULL,NULL,NULL),(2,2,'zapatillas-para-hombre-dc-shoes-heritage-lynxzeros-xksb','imagenq.jpeg','imagenq1.jpeg','imagenq2.jpeg','imagenq3.jpeg','imagenq4.jpeg',NULL,NULL,NULL,NULL),(3,3,'zapatillas-para-hombre-new-balance-heritage-574-mul','WhatsApp Image 2024-04-16 at 18.17.41.jpeg','WhatsApp Image 2024-04-16 at 18.17.48.jpeg','WhatsApp Image 2024-04-16 at 18.17.55.jpeg','WhatsApp Image 2024-04-16 at 18.18.05.jpeg','WhatsApp Image 2024-04-16 at 18.18.10.jpeg',NULL,NULL,NULL,NULL),(4,4,'zapatillas-unisex-vans-heritage-era-fs8','WhatsApp Image 2024-04-16 at 18.21.27.jpeg','WhatsApp Image 2024-04-16 at 18.21.42.jpeg','WhatsApp Image 2024-04-16 at 18.21.46.jpeg','WhatsApp Image 2024-04-16 at 18.21.54.jpeg','WhatsApp Image 2024-04-16 at 18.22.00.jpeg',NULL,NULL,NULL,NULL),(5,5,'zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-bkw','WhatsApp Image 2024-04-16 at 18.18.23.jpeg','WhatsApp Image 2024-04-16 at 18.18.26.jpeg','WhatsApp Image 2024-04-16 at 18.18.32.jpeg','WhatsApp Image 2024-04-16 at 18.18.41.jpeg','WhatsApp Image 2024-04-16 at 18.18.46.jpeg',NULL,NULL,NULL,NULL),(6,6,'zapatillas-unisex-dunkelvolk-shoes-original-d-whtbe','WhatsApp Image 2024-04-16 at 18.18.52.jpeg','WhatsApp Image 2024-04-16 at 18.19.01.jpeg','WhatsApp Image 2024-04-16 at 18.19.11.jpeg','WhatsApp Image 2024-04-16 at 18.19.24.jpeg','WhatsApp Image 2024-04-16 at 18.19.32.jpeg',NULL,NULL,NULL,NULL),(7,7,'zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-hmt','WhatsApp Image 2024-04-16 at 18.19.55.jpeg','WhatsApp Image 2024-04-16 at 18.19.56.jpeg','WhatsApp Image 2024-04-16 at 18.20.03.jpeg','WhatsApp Image 2024-04-16 at 18.20.04.jpeg','WhatsApp Image 2024-04-16 at 18.20.08.jpeg',NULL,NULL,NULL,NULL),(8,8,'zapatillas-para-hombre-adidas-gz1338-postmove-mid-wcg','WhatsApp Image 2024-04-16 at 18.20.39.jpeg','WhatsApp Image 2024-04-16 at 18.20.40.jpeg','WhatsApp Image 2024-04-16 at 18.20.45.jpeg','WhatsApp Image 2024-04-16 at 18.20.55.jpeg','WhatsApp Image 2024-04-16 at 18.20.56.jpeg',NULL,NULL,NULL,NULL),(26,41,'zapatillas-unisex-converse-heritage-chuck-70-seasonal-color-89c','WhatsApp Image 2024-04-16 at 23.20.39.jpeg','WhatsApp Image 2024-04-16 at 23.20.41.jpeg','WhatsApp Image 2024-04-16 at 23.20.46.jpeg','WhatsApp Image 2024-04-16 at 23.20.51.jpeg','WhatsApp Image 2024-04-16 at 23.21.04.jpeg',NULL,NULL,NULL,NULL),(27,42,'zapatillas-para-hombre-adidas-ie7218-forum-low-cl-218','WhatsApp Image 2024-04-16 at 23.33.45.jpeg','WhatsApp Image 2024-04-16 at 23.33.53.jpeg','WhatsApp Image 2024-04-16 at 23.33.55.jpeg','WhatsApp Image 2024-04-16 at 23.34.07.jpeg','WhatsApp Image 2024-04-16 at 23.34.16.jpeg',NULL,NULL,NULL,NULL),(28,44,'sandalias-para-hombre-quiksilver-beach-carver-leather-tkd0','WhatsApp Image 2024-04-17 at 12.33.06.jpeg','WhatsApp Image 2024-04-17 at 12.33.11.jpeg','WhatsApp Image 2024-04-17 at 12.33.15.jpeg','WhatsApp Image 2024-04-17 at 12.33.20.jpeg',NULL,NULL,NULL,NULL,NULL),(30,46,'polera-para-hombre-champion-gf89h586cpa-powerblend-graphic-hoodie-1ic','WhatsApp Image 2024-04-17 at 12.10.14.jpeg','WhatsApp Image 2024-04-17 at 12.10.21.jpeg','WhatsApp Image 2024-04-17 at 12.10.25.jpeg','WhatsApp Image 2024-04-17 at 12.10.30.jpeg',NULL,NULL,NULL,NULL,NULL),(31,47,'polera-para-hombre-quiksilver-sin-zip-neon-slab-pfm0','WhatsApp Image 2024-04-19 at 15.34.25.jpeg','WhatsApp Image 2024-04-19 at 15.34.33.jpeg','WhatsApp Image 2024-04-19 at 15.34.39.jpeg','WhatsApp Image 2024-04-19 at 15.34.44.jpeg','WhatsApp Image 2024-04-19 at 15.34.59.jpeg','WhatsApp Image 2024-04-19 at 15.35.04.jpeg','WhatsApp Image 2024-04-19 at 15.35.10.jpeg','WhatsApp Image 2024-04-19 at 15.35.16.jpeg',NULL),(32,48,'polera-para-hombre-champion-gf88h586cka-powerblend-graphic-crew-1ic','WhatsApp Image 2024-04-19 at 16.06.39.jpeg','WhatsApp Image 2024-04-19 at 16.06.44.jpeg','WhatsApp Image 2024-04-19 at 16.06.49.jpeg','WhatsApp Image 2024-04-19 at 16.06.53.jpeg','WhatsApp Image 2024-04-19 at 16.07.02.jpeg',NULL,NULL,NULL,NULL),(33,49,'polera-para-hombre-fox-sin-zip-disciple-pullover-dkin','WhatsApp Image 2024-04-19 at 16.12.55.jpeg','WhatsApp Image 2024-04-19 at 16.13.00.jpeg','WhatsApp Image 2024-04-19 at 16.13.11.jpeg','WhatsApp Image 2024-04-19 at 16.13.15.jpeg','WhatsApp Image 2024-04-19 at 16.13.20.jpeg',NULL,NULL,NULL,NULL),(34,50,'polera-para-hombre-reef-crew-neck-reef-lotto-crew-kvj0','WhatsApp Image 2024-04-19 at 16.19.25.jpeg','WhatsApp Image 2024-04-19 at 16.19.30.jpeg','WhatsApp Image 2024-04-19 at 16.19.36.jpeg','WhatsApp Image 2024-04-19 at 16.19.41.jpeg','WhatsApp Image 2024-04-19 at 16.19.46.jpeg','WhatsApp Image 2024-04-19 at 16.19.51.jpeg',NULL,NULL,NULL),(35,51,'polera-para-hombre-quiksilver-crew-neck-first-up-adbe','WhatsApp Image 2024-04-19 at 16.23.27.jpeg','WhatsApp Image 2024-04-19 at 16.23.43.jpeg','WhatsApp Image 2024-04-19 at 16.23.49.jpeg','WhatsApp Image 2024-04-19 at 16.23.56.jpeg','WhatsApp Image 2024-04-19 at 16.24.03.jpeg','WhatsApp Image 2024-04-19 at 16.24.11.jpeg','WhatsApp Image 2024-04-19 at 16.24.23.jpeg',NULL,NULL),(36,52,'polera-para-hombre-dunkelvolk-con-zip-espiritu-the-tiger-ft-wht','WhatsApp Image 2024-04-19 at 16.37.46.jpeg','WhatsApp Image 2024-04-19 at 16.37.53.jpeg','WhatsApp Image 2024-04-19 at 16.38.01.jpeg','WhatsApp Image 2024-04-19 at 16.38.06.jpeg','WhatsApp Image 2024-04-19 at 16.38.12.jpeg','WhatsApp Image 2024-04-19 at 16.38.17.jpeg','WhatsApp Image 2024-04-19 at 16.38.27.jpeg',NULL,NULL),(37,53,'polera-para-hombre-dunkelvolk-con-zip-new-logo-arms-blnc','WhatsApp Image 2024-04-19 at 16.38.43.jpeg','WhatsApp Image 2024-04-19 at 16.38.47.jpeg','WhatsApp Image 2024-04-19 at 16.38.52.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(38,54,'polera-para-hombre-quiksilver-con-zip-triple-stacks-aqwb','WhatsApp Image 2024-04-19 at 16.39.07.jpeg','WhatsApp Image 2024-04-19 at 16.39.12.jpeg','WhatsApp Image 2024-04-19 at 16.39.18.jpeg','WhatsApp Image 2024-04-19 at 16.39.26.jpeg',NULL,NULL,NULL,NULL,NULL),(39,55,'polera-para-mujer-dvk-crew-neck-new-york-fleece-ace','WhatsApp Image 2024-04-19 at 16.41.46.jpeg','WhatsApp Image 2024-04-19 at 16.41.52.jpeg','WhatsApp Image 2024-04-19 at 16.41.57.jpeg','WhatsApp Image 2024-04-19 at 16.42.05.jpeg','WhatsApp Image 2024-04-19 at 16.42.07.jpeg','WhatsApp Image 2024-04-19 at 16.42.14.jpeg','WhatsApp Image 2024-04-19 at 16.42.23.jpeg',NULL,NULL),(40,56,'polera-para-mujer-dvk-crew-neck-california-fleece-azl','WhatsApp Image 2024-04-19 at 16.42.36.jpeg','WhatsApp Image 2024-04-19 at 16.42.41.jpeg','WhatsApp Image 2024-04-19 at 16.42.46.jpeg','WhatsApp Image 2024-04-19 at 16.42.51.jpeg','WhatsApp Image 2024-04-19 at 16.42.56.jpeg','WhatsApp Image 2024-04-19 at 16.43.01.jpeg','WhatsApp Image 2024-04-19 at 16.43.07.jpeg',NULL,NULL),(41,57,'polera-para-mujer-dvk-crew-neck-lima-fleece-vrd','WhatsApp Image 2024-04-19 at 16.43.25.jpeg','WhatsApp Image 2024-04-19 at 16.43.30.jpeg','WhatsApp Image 2024-04-19 at 16.43.36.jpeg','WhatsApp Image 2024-04-19 at 16.43.40.jpeg','WhatsApp Image 2024-04-19 at 16.43.45.jpeg','WhatsApp Image 2024-04-19 at 16.43.50.jpeg',NULL,NULL,NULL),(42,58,'polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-pin','WhatsApp Image 2024-04-19 at 16.44.16.jpeg','WhatsApp Image 2024-04-19 at 16.44.26.jpeg','WhatsApp Image 2024-04-19 at 16.44.32.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(43,59,'polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-mel','WhatsApp Image 2024-04-19 at 16.44.44.jpeg','WhatsApp Image 2024-04-19 at 16.44.48.jpeg','WhatsApp Image 2024-04-19 at 16.44.55.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(44,60,'polera-para-mujer-champion-w7298586158-middleweight-long-sleeve-rib-crew-awjj','WhatsApp Image 2024-04-19 at 16.45.12.jpeg','WhatsApp Image 2024-04-19 at 16.45.18.jpeg','WhatsApp Image 2024-04-19 at 16.45.23.jpeg','WhatsApp Image 2024-04-19 at 16.45.29.jpeg','WhatsApp Image 2024-04-19 at 16.45.34.jpeg','WhatsApp Image 2024-04-19 at 16.45.39.jpeg','WhatsApp Image 2024-04-19 at 16.45.45.jpeg',NULL,NULL),(45,61,'polera-para-mujer-champion-gf536y08113-powerblend-relaxed-hoodie-7pq','WhatsApp Image 2024-04-19 at 16.45.56.jpeg','WhatsApp Image 2024-04-19 at 16.46.01.jpeg','WhatsApp Image 2024-04-19 at 16.46.06.jpeg','WhatsApp Image 2024-04-19 at 16.46.11.jpeg','WhatsApp Image 2024-04-19 at 16.46.21.jpeg','WhatsApp Image 2024-04-19 at 16.46.30.jpeg',NULL,NULL,NULL),(46,62,'polo-para-mujer-dvk-crop-basic-tee-nrg','WhatsApp Image 2024-04-19 at 18.26.41.jpeg','WhatsApp Image 2024-04-19 at 18.26.47.jpeg','WhatsApp Image 2024-04-19 at 18.26.52.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(47,63,'polo-para-mujer-dvk-crop-basic-tee-hue','WhatsApp Image 2024-04-19 at 18.27.00.jpeg','WhatsApp Image 2024-04-19 at 18.27.07.jpeg','WhatsApp Image 2024-04-19 at 18.27.12.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(48,64,'polo-para-mujer-dvk-crop-basic-tee-vrd','WhatsApp Image 2024-04-19 at 18.27.37.jpeg','WhatsApp Image 2024-04-19 at 18.27.42.jpeg','WhatsApp Image 2024-04-19 at 18.27.51.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(49,65,'polo-para-mujer-roxy-classic-surfing-babe-bbfc2-ochr','WhatsApp Image 2024-04-19 at 18.29.02.jpeg','WhatsApp Image 2024-04-19 at 18.29.08.jpeg','WhatsApp Image 2024-04-19 at 18.29.19.jpeg','WhatsApp Image 2024-04-19 at 18.29.24.jpeg',NULL,NULL,NULL,NULL,NULL),(50,66,'polo-para-mujer-adidas-gn2896-trefoil-tee-blk','WhatsApp Image 2024-04-19 at 18.30.01.jpeg','WhatsApp Image 2024-04-19 at 18.30.20.jpeg','WhatsApp Image 2024-04-19 at 18.30.28.jpeg','WhatsApp Image 2024-04-19 at 18.30.35.jpeg',NULL,NULL,NULL,NULL,NULL),(51,67,'polo-para-mujer-champion-w59446-soft-touch-eco-ruched-side-tee-001','WhatsApp Image 2024-04-19 at 18.30.51.jpeg','WhatsApp Image 2024-04-19 at 18.30.56.jpeg','WhatsApp Image 2024-04-19 at 18.31.00.jpeg','WhatsApp Image 2024-04-19 at 18.31.06 (1).jpeg','WhatsApp Image 2024-04-19 at 18.31.06.jpeg',NULL,NULL,NULL,NULL),(52,68,'polo-para-mujer-champion-w5950g586789-the-cropped-tee---graphic-ntc','WhatsApp Image 2024-04-19 at 18.31.17.jpeg','WhatsApp Image 2024-04-19 at 18.31.21.jpeg','WhatsApp Image 2024-04-19 at 18.31.27.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(53,69,'polo-para-mujer-champion-w5950g550757-the-cropped-tee-graphic-cbs','WhatsApp Image 2024-04-19 at 18.31.34.jpeg','WhatsApp Image 2024-04-19 at 18.31.40.jpeg','WhatsApp Image 2024-04-19 at 18.31.45.jpeg',NULL,NULL,NULL,NULL,NULL,NULL),(54,70,'polo-para-hombre-dunkelvolk-surf-script-logo-spn','WhatsApp Image 2024-04-19 at 18.33.29.jpeg','WhatsApp Image 2024-04-19 at 18.33.35.jpeg','WhatsApp Image 2024-04-19 at 18.33.40.jpeg','WhatsApp Image 2024-04-19 at 18.33.46.jpeg','WhatsApp Image 2024-04-19 at 18.33.51.jpeg',NULL,NULL,NULL,NULL),(55,71,'polo-para-hombre-quiksilver-classic-sunset-mind-mt0-rse','WhatsApp Image 2024-04-19 at 18.34.07.jpeg','WhatsApp Image 2024-04-19 at 18.34.12.jpeg','WhatsApp Image 2024-04-19 at 18.34.17.jpeg','WhatsApp Image 2024-04-19 at 18.34.24.jpeg','WhatsApp Image 2024-04-19 at 18.34.29.jpeg','WhatsApp Image 2024-04-19 at 18.34.43.jpeg',NULL,NULL,NULL),(56,72,'polo-para-hombre-quiksilver-classic-mw-classic-wbb0','WhatsApp Image 2024-04-19 at 18.34.57.jpeg','WhatsApp Image 2024-04-19 at 18.35.02.jpeg','WhatsApp Image 2024-04-19 at 18.35.07.jpeg','WhatsApp Image 2024-04-19 at 18.35.15.jpeg','WhatsApp Image 2024-04-19 at 18.35.20.jpeg','WhatsApp Image 2024-04-19 at 18.35.20.jpeg','WhatsApp Image 2024-04-19 at 18.35.28.jpeg','WhatsApp Image 2024-04-19 at 18.35.36.jpeg',NULL),(57,73,'polo-para-hombre-dunkelvolk-surf-vintage-shield-nvy','WhatsApp Image 2024-04-19 at 18.35.43.jpeg','WhatsApp Image 2024-04-19 at 18.35.49.jpeg','WhatsApp Image 2024-04-19 at 18.35.54.jpeg','WhatsApp Image 2024-04-19 at 18.36.00.jpeg','WhatsApp Image 2024-04-19 at 18.36.05.jpeg',NULL,NULL,NULL,NULL),(58,74,'polo-para-hombre-champion-c-gt23h586eha-classic-jersey-graphic-tee-045','WhatsApp Image 2024-04-19 at 18.36.15.jpeg','WhatsApp Image 2024-04-19 at 18.36.21.jpeg','WhatsApp Image 2024-04-19 at 18.36.27.jpeg','WhatsApp Image 2024-04-19 at 18.36.27.jpeg','WhatsApp Image 2024-04-19 at 18.36.32.jpeg','WhatsApp Image 2024-04-19 at 18.36.38.jpeg',NULL,NULL,NULL),(59,75,'polo-para-hombre-quiksilver-classic-into-waves-wbb0','WhatsApp Image 2024-04-19 at 18.37.18.jpeg','WhatsApp Image 2024-04-19 at 18.37.12.jpeg','WhatsApp Image 2024-04-19 at 18.37.38.jpeg','WhatsApp Image 2024-04-19 at 18.37.44.jpeg','WhatsApp Image 2024-04-19 at 18.37.51.jpeg',NULL,NULL,NULL,NULL),(60,76,'polo-para-hombre-reef-seasonal-reef-shackin-tee-wlbw','WhatsApp Image 2024-04-19 at 18.38.03.jpeg','WhatsApp Image 2024-04-19 at 18.38.08.jpeg','WhatsApp Image 2024-04-19 at 18.38.13.jpeg','WhatsApp Image 2024-04-19 at 18.38.20.jpeg','WhatsApp Image 2024-04-19 at 18.38.27.jpeg','WhatsApp Image 2024-04-19 at 18.38.33.jpeg','WhatsApp Image 2024-04-19 at 18.38.38.jpeg',NULL,NULL),(61,77,'polo-para-hombre-reef-classic-reef-dolo-tee-blk','WhatsApp Image 2024-04-19 at 18.39.43.jpeg','WhatsApp Image 2024-04-19 at 18.39.47.jpeg','WhatsApp Image 2024-04-19 at 18.39.54.jpeg','WhatsApp Image 2024-04-19 at 18.40.00.jpeg','WhatsApp Image 2024-04-19 at 18.40.08.jpeg',NULL,NULL,NULL,NULL),(62,78,'camisa-para-hombre-lee-shirt-ls-worker-shirt-20-idk','WhatsApp Image 2024-04-26 at 20.32.59.jpeg','WhatsApp Image 2024-04-26 at 20.33.04.jpeg','WhatsApp Image 2024-04-26 at 20.33.07.jpeg','WhatsApp Image 2024-04-26 at 20.33.12.jpeg','WhatsApp Image 2024-04-26 at 20.33.17.jpeg','WhatsApp Image 2024-04-26 at 20.33.21.jpeg','WhatsApp Image 2024-04-26 at 20.33.28.jpeg','WhatsApp Image 2024-04-26 at 20.33.29.jpeg',NULL);
/*!40000 ALTER TABLE `imagenesproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,70926433,'Alexia','wallpaperflare.com_wallpaper (2).jpg');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(450) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `slug` varchar(450) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `marca` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'LIFESTYLE DC SHOES CURE BGM','Zapatillas para Hombre DC SHOES. Fit: LIFESTYLE. Estilo: DC SHOES CURE','zapatillas-para-hombre-dc-shoes-fit-lifestyle-estilo-dc-shoes-cure','hombre','zapatilla',259,'dc-shoes','Negro','imagenp.jpeg'),(2,'HERITAGE LYNXZEROS XKSB','Zapatillas para Hombre DC SHOES HERITAGE LYNXZEROS XKSB','zapatillas-para-hombre-dc-shoes-heritage-lynxzeros-xksb','hombre','zapatilla',319,'dc-shoes','Azul','imagenq.jpeg'),(3,'NEW BALANCE HERITAGE 574 MUL','Zapatillas para Hombre NEW BALANCE HERITAGE 574 MUL','zapatillas-para-hombre-new-balance-heritage-574-mul','hombre','zapatilla',295,'new-balance','Azul','WhatsApp Image 2024-04-16 at 18.17.41.jpeg'),(4,'VANS HERITAGE ERA FS8','Zapatillas Unisex VANS HERITAGE ERA FS8','zapatillas-unisex-vans-heritage-era-fs8','unisex','zapatilla',300,'vans','Floreado','WhatsApp Image 2024-04-16 at 18.21.27.jpeg'),(5,'DC SHOES LIFESTYLE TRASE PLATFORM BKW','Zapatillas para Mujer DC SHOES LIFESTYLE TRASE PLATFORM BKW','zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-bkw','mujer','zapatilla',239,'dc-shoes','Black','WhatsApp Image 2024-04-16 at 18.18.23.jpeg'),(6,'Dunkelvolk SHOES ORIGINAL D WHTBE','Zapatillas Unisex Dunkelvolk SHOES ORIGINAL D WHTBE','zapatillas-unisex-dunkelvolk-shoes-original-d-whtbe','unisex','zapatilla',100,'dunkelvolk','Crema','WhatsApp Image 2024-04-16 at 18.18.52.jpeg'),(7,'DC SHOES LIFESTYLE TRASE PLATFORM HMT','Zapatillas para Mujer DC SHOES LIFESTYLE TRASE PLATFORM HMT','zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-hmt','mujer','zapatilla',200,'dc-shoes','Rayado','WhatsApp Image 2024-04-16 at 18.19.55.jpeg'),(8,'ADIDAS GZ1338 POSTMOVE MID WCG','Zapatillas para Hombre ADIDAS GZ1338 POSTMOVE MID WCG','zapatillas-para-hombre-adidas-gz1338-postmove-mid-wcg','hombre','zapatilla',349,'adidas','Blanco','WhatsApp Image 2024-04-16 at 18.20.39.jpeg'),(41,'CONVERSE HERITAGE Chuck 70 Seasonal Color 89C','Zapatillas Unisex CONVERSE HERITAGE Chuck 70 Seasonal Color 89C','zapatillas-unisex-converse-heritage-chuck-70-seasonal-color-89c','unisex','zapatilla',339,'converse','Brown','WhatsApp Image 2024-04-16 at 23.20.39.jpeg'),(42,'ADIDAS IE7218 FORUM LOW CL 218','Zapatillas para Hombre ADIDAS IE7218 FORUM LOW CL 218','zapatillas-para-hombre-adidas-ie7218-forum-low-cl-218','hombre','zapatilla',343,'adidas','Black','WhatsApp Image 2024-04-16 at 23.33.45.jpeg'),(44,'QUIKSILVER BEACH CARVER LEATHER TKD0','Sandalias para Hombre QUIKSILVER BEACH CARVER LEATHER TKD0','sandalias-para-hombre-quiksilver-beach-carver-leather-tkd0','hombre','sandalia',70,'quiksilver','Brown','WhatsApp Image 2024-04-17 at 12.33.06.jpeg'),(46,'CHAMPION GF89H586CPA POWERBLEND GRAPHIC HOODIE 1IC','Polera para Hombre CHAMPION GF89H586CPA POWERBLEND GRAPHIC HOODIE 1IC','polera-para-hombre-champion-gf89h586cpa-powerblend-graphic-hoodie-1ic','hombre','polera',110,'champion','Plomo','WhatsApp Image 2024-04-17 at 12.10.14.jpeg'),(47,'QUIKSILVER SIN ZIP NEON SLAB PFM0','Polera para Hombre QUIKSILVER SIN ZIP NEON SLAB PFM0','polera-para-hombre-quiksilver-sin-zip-neon-slab-pfm0','hombre','polera',196,'quiksilver','Rosado','WhatsApp Image 2024-04-19 at 15.34.25.jpeg'),(48,'CHAMPION GF88H586CKA POWERBLEND GRAPHIC CREW 1IC','Polera para Hombre CHAMPION GF88H586CKA POWERBLEND GRAPHIC CREW 1IC','polera-para-hombre-champion-gf88h586cka-powerblend-graphic-crew-1ic','hombre','polera',120,'champion','Plomo','WhatsApp Image 2024-04-19 at 16.06.39.jpeg'),(49,'FOX SIN ZIP DISCIPLE PULLOVER DKIN','Polera para Hombre FOX SIN ZIP DISCIPLE PULLOVER DKIN','polera-para-hombre-fox-sin-zip-disciple-pullover-dkin','hombre','polera',105,'fox','Azul','WhatsApp Image 2024-04-19 at 16.12.55.jpeg'),(50,'REEF CREW NECK REEF LOTTO CREW KVJ0','Polera para Hombre REEF CREW NECK REEF LOTTO CREW KVJ0','polera-para-hombre-reef-crew-neck-reef-lotto-crew-kvj0','hombre','polera',72,'reef','Negro','WhatsApp Image 2024-04-19 at 16.19.25.jpeg'),(51,'QUIKSILVER CREW NECK FIRST UP ADBE','Polera para Hombre QUIKSILVER CREW NECK FIRST UP ADBE','polera-para-hombre-quiksilver-crew-neck-first-up-adbe','hombre','polera',114,'quiksilver','Anaranjado','WhatsApp Image 2024-04-19 at 16.23.27.jpeg'),(52,'Dunkelvolk CON ZIP ESPIRITU THE TIGER FT WHT','Polera para Hombre Dunkelvolk CON ZIP ESPIRITU THE TIGER FT WHT','polera-para-hombre-dunkelvolk-con-zip-espiritu-the-tiger-ft-wht','hombre','polera',138,'dunkelvolk','Blanco','WhatsApp Image 2024-04-19 at 16.37.46.jpeg'),(53,'Dunkelvolk CON ZIP NEW LOGO ARMS BLNC','Polera para Hombre Dunkelvolk CON ZIP NEW LOGO ARMS BLNC','polera-para-hombre-dunkelvolk-con-zip-new-logo-arms-blnc','hombre','polera',115,'dunkelvolk','Blanco','WhatsApp Image 2024-04-19 at 16.38.43.jpeg'),(54,'QUIKSILVER CON ZIP TRIPLE STACKS AQWB','Polera para Hombre QUIKSILVER CON ZIP TRIPLE STACKS AQWB','polera-para-hombre-quiksilver-con-zip-triple-stacks-aqwb','hombre','polera',175,'quiksilver','Crema','WhatsApp Image 2024-04-19 at 16.39.07.jpeg'),(55,'DVK CREW NECK NEW YORK FLEECE ACE','Polera para Mujer DVK CREW NECK NEW YORK FLEECE ACE','polera-para-mujer-dvk-crew-neck-new-york-fleece-ace','mujer','polera',120,'dunkelvolk','Celeste','WhatsApp Image 2024-04-19 at 16.41.46.jpeg'),(56,'DVK CREW NECK CALIFORNIA FLEECE AZL','Polera para Mujer DVK CREW NECK CALIFORNIA FLEECE AZL','polera-para-mujer-dvk-crew-neck-california-fleece-azl','mujer','polera',120,'dunkelvolk','Negro','WhatsApp Image 2024-04-19 at 16.42.36.jpeg'),(57,'DVK CREW NECK LIMA FLEECE VRD','Polera para Mujer DVK CREW NECK LIMA FLEECE VRD','polera-para-mujer-dvk-crew-neck-lima-fleece-vrd','mujer','polera',120,'dunkelvolk','Verde','WhatsApp Image 2024-04-19 at 16.43.25.jpeg'),(58,'DC SHOES SIN ZIP STAR HOODIE L PIN','Polera para Mujer DC SHOES SIN ZIP STAR HOODIE L PIN','polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-pin','mujer','polera',75,'dc-shoes','Rosado','WhatsApp Image 2024-04-19 at 16.44.16.jpeg'),(59,'DC SHOES SIN ZIP STAR HOODIE L MEL','Polera para Mujer DC SHOES SIN ZIP STAR HOODIE L MEL','polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-mel','mujer','polera',75,'dc-shoes','Plomo','WhatsApp Image 2024-04-19 at 16.44.44.jpeg'),(60,'CHAMPION W7298586158 MIDDLEWEIGHT LONG SLEEVE RIB CREW AWJJ','Polera para Mujer CHAMPION W7298586158 MIDDLEWEIGHT LONG SLEEVE RIB CREW AWJJ','polera-para-mujer-champion-w7298586158-middleweight-long-sleeve-rib-crew-awjj','mujer','polera',100,'champion','Morado','WhatsApp Image 2024-04-19 at 16.45.12.jpeg'),(61,'CHAMPION GF536Y08113 POWERBLEND RELAXED HOODIE 7PQ','Polera para Mujer CHAMPION GF536Y08113 POWERBLEND RELAXED HOODIE 7PQ','polera-para-mujer-champion-gf536y08113-powerblend-relaxed-hoodie-7pq','mujer','polera',154,'champion','Fucsia','WhatsApp Image 2024-04-19 at 16.45.56.jpeg'),(62,'DVK CROP BASIC TEE NRG','Polo para Mujer DVK CROP BASIC TEE NRG','polo-para-mujer-dvk-crop-basic-tee-nrg','mujer','polo',56,'dunkelvolk','Negro','WhatsApp Image 2024-04-19 at 18.26.41.jpeg'),(63,'DVK CROP BASIC TEE HUE','Polo para Mujer DVK CROP BASIC TEE HUE','polo-para-mujer-dvk-crop-basic-tee-hue','mujer','polo',56,'dunkelvolk','Blanco','WhatsApp Image 2024-04-19 at 18.27.00.jpeg'),(64,'DVK CROP BASIC TEE VRD','Polo para Mujer DVK CROP BASIC TEE VRD','polo-para-mujer-dvk-crop-basic-tee-vrd','mujer','polo',56,'dunkelvolk','Mostaza','WhatsApp Image 2024-04-19 at 18.27.37.jpeg'),(65,'ROXY CLASSIC SURFING BABE BBFC2 OCHR','Polo para Mujer ROXY CLASSIC SURFING BABE BBFC2 OCHR','polo-para-mujer-roxy-classic-surfing-babe-bbfc2-ochr','mujer','polo',40,'roxy','Mostaza','WhatsApp Image 2024-04-19 at 18.29.02.jpeg'),(66,'ADIDAS GN2896 TREFOIL TEE BLK','Polo para Mujer ADIDAS GN2896 TREFOIL TEE BLK','polo-para-mujer-adidas-gn2896-trefoil-tee-blk','mujer','polo',63,'adidas','Negro','WhatsApp Image 2024-04-19 at 18.30.01.jpeg'),(67,'CHAMPION W59446 SOFT TOUCH ECO RUCHED SIDE TEE 001','Polo para Mujer CHAMPION W59446 SOFT TOUCH ECO RUCHED SIDE TEE 001','polo-para-mujer-champion-w59446-soft-touch-eco-ruched-side-tee-001','mujer','polo',65,'champion','Negro','WhatsApp Image 2024-04-19 at 18.30.51.jpeg'),(68,'CHAMPION W5950G586789 THE CROPPED TEE - GRAPHIC NTC','Polo para Mujer CHAMPION W5950G586789 THE CROPPED TEE - GRAPHIC NTC','polo-para-mujer-champion-w5950g586789-the-cropped-tee---graphic-ntc','mujer','polo',72,'champion','Blanco','WhatsApp Image 2024-04-19 at 18.31.17.jpeg'),(69,'CHAMPION W5950G550757 THE CROPPED TEE GRAPHIC CBS','Polo para Mujer CHAMPION W5950G550757 THE CROPPED TEE GRAPHIC CBS','polo-para-mujer-champion-w5950g550757-the-cropped-tee-graphic-cbs','mujer','polo',72,'champion','Rosado','WhatsApp Image 2024-04-19 at 18.31.34.jpeg'),(70,'DUNKELVOLK SURF SCRIPT LOGO SPN','Polo para Hombre DUNKELVOLK SURF SCRIPT LOGO SPN','polo-para-hombre-dunkelvolk-surf-script-logo-spn','hombre','polo',48,'dunkelvolk','Verde','WhatsApp Image 2024-04-19 at 18.33.29.jpeg'),(71,'QUIKSILVER CLASSIC SUNSET MIND MT0 RSE','Polo para Hombre QUIKSILVER CLASSIC SUNSET MIND MT0 RSE','polo-para-hombre-quiksilver-classic-sunset-mind-mt0-rse','hombre','polo',50,'quiksilver','rosado','WhatsApp Image 2024-04-19 at 18.34.07.jpeg'),(72,'QUIKSILVER CLASSIC MW CLASSIC WBB0','Polo para Hombre QUIKSILVER CLASSIC MW CLASSIC WBB0','polo-para-hombre-quiksilver-classic-mw-classic-wbb0','hombre','polo',50,'quiksilver','Blanco','WhatsApp Image 2024-04-19 at 18.34.57.jpeg'),(73,'DUNKELVOLK SURF VINTAGE SHIELD NVY','Polo para Hombre DUNKELVOLK SURF VINTAGE SHIELD NVY','polo-para-hombre-dunkelvolk-surf-vintage-shield-nvy','hombre','polo',40,'dunkelvolk','Azul','WhatsApp Image 2024-04-19 at 18.35.43.jpeg'),(74,'CHAMPION C-GT23H586EHA CLASSIC JERSEY GRAPHIC TEE 045','Polo para Hombre CHAMPION C-GT23H586EHA CLASSIC JERSEY GRAPHIC TEE 045','polo-para-hombre-champion-c-gt23h586eha-classic-jersey-graphic-tee-045','hombre','polo',60,'champion','Blanco','WhatsApp Image 2024-04-19 at 18.36.15.jpeg'),(75,'QUIKSILVER CLASSIC INTO WAVES WBB0','Polo para Hombre QUIKSILVER CLASSIC INTO WAVES WBB0','polo-para-hombre-quiksilver-classic-into-waves-wbb0','hombre','polo',60,'quiksilver','Blanco','WhatsApp Image 2024-04-19 at 18.37.18.jpeg'),(76,'REEF SEASONAL REEF SHACKIN TEE WLBW','Polo para Hombre REEF SEASONAL REEF SHACKIN TEE WLBW','polo-para-hombre-reef-seasonal-reef-shackin-tee-wlbw','hombre','polo',45,'reef','Verde','WhatsApp Image 2024-04-19 at 18.38.03.jpeg'),(77,'REEF CLASSIC REEF DOLO TEE BLK','Polo para Hombre REEF CLASSIC REEF DOLO TEE BLK','polo-para-hombre-reef-classic-reef-dolo-tee-blk','hombre','polo',50,'reef','Negro','WhatsApp Image 2024-04-19 at 18.39.43.jpeg'),(78,'LEE SHIRT LS WORKER SHIRT 2.0 IDK','Camisa para Hombre LEE SHIRT LS WORKER SHIRT 2.0 IDK','camisa-para-hombre-lee-shirt-ls-worker-shirt-20-idk','hombre','camisa',229,'Lee','Azul','WhatsApp Image 2024-04-26 at 20.32.59.jpeg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallasproduct`
--

DROP TABLE IF EXISTS `tallasproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallasproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idproduct` int NOT NULL,
  `slugproduct` varchar(450) NOT NULL,
  `t39` int DEFAULT NULL,
  `t40` int DEFAULT NULL,
  `t41` int DEFAULT NULL,
  `t42` int DEFAULT NULL,
  `ts` int DEFAULT NULL,
  `tm` int DEFAULT NULL,
  `tl` int DEFAULT NULL,
  `txl` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idproduct_UNIQUE` (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallasproduct`
--

LOCK TABLES `tallasproduct` WRITE;
/*!40000 ALTER TABLE `tallasproduct` DISABLE KEYS */;
INSERT INTO `tallasproduct` VALUES (1,1,'zapatillas-para-hombre-dc-shoes-fit-lifestyle-estilo-dc-shoes-cure',0,0,8,3,0,0,0,0),(2,2,'zapatillas-para-hombre-dc-shoes-heritage-lynxzeros-xksb',8,10,0,3,NULL,NULL,NULL,NULL),(3,3,'zapatillas-para-hombre-new-balance-heritage-574-mul',1,2,3,4,NULL,NULL,NULL,NULL),(4,4,'zapatillas-unisex-vans-heritage-era-fs8',14,10,5,12,NULL,NULL,NULL,NULL),(5,5,'zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-bkw',10,5,8,9,NULL,NULL,NULL,NULL),(6,6,'zapatillas-unisex-dunkelvolk-shoes-original-d-whtbe',0,0,2,10,NULL,NULL,NULL,NULL),(7,7,'zapatillas-para-mujer-dc-shoes-lifestyle-trase-platform-hmt',0,5,4,0,NULL,NULL,NULL,NULL),(8,8,'zapatillas-para-hombre-adidas-gz1338-postmove-mid-wcg',0,5,0,0,NULL,NULL,NULL,NULL),(27,41,'zapatillas-unisex-converse-heritage-chuck-70-seasonal-color-89c',15,12,11,1,NULL,NULL,NULL,NULL),(28,42,'zapatillas-para-hombre-adidas-ie7218-forum-low-cl-218',1,2,3,4,NULL,NULL,NULL,NULL),(30,44,'sandalias-para-hombre-quiksilver-beach-carver-leather-tkd0',8,8,8,4,NULL,NULL,NULL,NULL),(32,46,'polera-para-hombre-champion-gf89h586cpa-powerblend-graphic-hoodie-1ic',0,0,0,0,5,0,0,0),(33,47,'polera-para-hombre-quiksilver-sin-zip-neon-slab-pfm0',0,0,0,0,8,5,0,0),(34,48,'polera-para-hombre-champion-gf88h586cka-powerblend-graphic-crew-1ic',0,0,0,0,2,3,0,10),(35,49,'polera-para-hombre-fox-sin-zip-disciple-pullover-dkin',0,0,0,0,15,10,5,0),(36,50,'polera-para-hombre-reef-crew-neck-reef-lotto-crew-kvj0',0,0,0,0,5,4,3,2),(37,51,'polera-para-hombre-quiksilver-crew-neck-first-up-adbe',0,0,0,0,8,5,9,6),(38,52,'polera-para-hombre-dunkelvolk-con-zip-espiritu-the-tiger-ft-wht',0,0,0,0,18,15,10,16),(39,53,'polera-para-hombre-dunkelvolk-con-zip-new-logo-arms-blnc',0,0,0,0,3,2,1,4),(40,54,'polera-para-hombre-quiksilver-con-zip-triple-stacks-aqwb',0,0,0,0,12,11,14,13),(41,55,'polera-para-mujer-dvk-crew-neck-new-york-fleece-ace',0,0,0,0,5,5,5,3),(42,56,'polera-para-mujer-dvk-crew-neck-california-fleece-azl',0,0,0,0,8,0,8,0),(43,57,'polera-para-mujer-dvk-crew-neck-lima-fleece-vrd',0,0,0,0,0,8,0,8),(44,58,'polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-pin',0,0,0,0,10,0,0,0),(45,59,'polera-para-mujer-dc-shoes-sin-zip-star-hoodie-l-mel',0,0,0,0,0,0,0,6),(46,60,'polera-para-mujer-champion-w7298586158-middleweight-long-sleeve-rib-crew-awjj',0,0,0,0,0,0,16,0),(47,61,'polera-para-mujer-champion-gf536y08113-powerblend-relaxed-hoodie-7pq',0,0,0,0,0,13,0,0),(48,62,'polo-para-mujer-dvk-crop-basic-tee-nrg',0,0,0,0,5,0,10,0),(49,63,'polo-para-mujer-dvk-crop-basic-tee-hue',0,0,0,0,10,15,20,0),(50,64,'polo-para-mujer-dvk-crop-basic-tee-vrd',0,0,0,0,5,2,3,0),(51,65,'polo-para-mujer-roxy-classic-surfing-babe-bbfc2-ochr',0,0,0,0,5,6,0,0),(52,66,'polo-para-mujer-adidas-gn2896-trefoil-tee-blk',0,0,0,0,0,4,0,0),(53,67,'polo-para-mujer-champion-w59446-soft-touch-eco-ruched-side-tee-001',0,0,0,0,5,5,5,0),(54,68,'polo-para-mujer-champion-w5950g586789-the-cropped-tee---graphic-ntc',0,0,0,0,0,5,0,0),(55,69,'polo-para-mujer-champion-w5950g550757-the-cropped-tee-graphic-cbs',0,0,0,0,0,10,15,0),(56,70,'polo-para-hombre-dunkelvolk-surf-script-logo-spn',0,0,0,0,0,0,5,0),(57,71,'polo-para-hombre-quiksilver-classic-sunset-mind-mt0-rse',0,0,0,0,5,5,5,5),(58,72,'polo-para-hombre-quiksilver-classic-mw-classic-wbb0',0,0,0,0,0,5,10,15),(59,73,'polo-para-hombre-dunkelvolk-surf-vintage-shield-nvy',0,0,0,0,10,5,0,0),(60,74,'polo-para-hombre-champion-c-gt23h586eha-classic-jersey-graphic-tee-045',0,0,0,0,0,0,10,0),(61,75,'polo-para-hombre-quiksilver-classic-into-waves-wbb0',0,0,0,0,5,5,0,0),(62,76,'polo-para-hombre-reef-seasonal-reef-shackin-tee-wlbw',0,0,0,0,15,20,0,0),(63,77,'polo-para-hombre-reef-classic-reef-dolo-tee-blk',0,0,0,0,10,5,5,0),(64,78,'camisa-para-hombre-lee-shirt-ls-worker-shirt-20-idk',0,0,0,0,7,5,8,7);
/*!40000 ALTER TABLE `tallasproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Manuel','admin','123456'),(15,'invitado','Juanito','caja','12345'),(28,'admin2','Jorge','admin','$2a$08$Dl3rw7s09YGjyZIU.ftE1uUUPQzy91jX8iZt6rSMj65CFivFS5Lge'),(29,'city','Manuelito','admin','$2a$08$7YeDzmj6C3599ghcs3nLpuGuSNkkz8nEkbLFYj/QP5JUdR.0ZdTyG'),(30,'juan','Juan Manuel Barturen Chapoñan','admin','$2a$08$aLRB8U4sak6gpOQMaCbBJeqPbol6cIrnumjCLNhHsmy42jwwXuLim'),(31,'carmen','Carmen','admin','$2a$08$g6BVeN8cdukT9sudtEjz2ubmkPgvuumW5t3oNukhK1Eh3INH/OoUu'),(32,'noe','Noe Barturen Cajan','caja','$2a$08$7Adlq.2mcdLQpjEymcKgBe7nLEM3mSW14PxZpSMvjJ6vE5IMU2qPa'),(33,'pilar','Pilar Barturen Chapoñan','admin','pilar');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 16:04:04
