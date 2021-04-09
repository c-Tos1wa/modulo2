-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: marketplace_da_blue
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `categorias_produto`
--

DROP TABLE IF EXISTS `categorias_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_produto` (
  `id_categoria_produto` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categoria_produto_geral` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_categoria_produto`),
  KEY `fk_pai_idx` (`id_categoria_produto_geral`),
  CONSTRAINT `fk_pai` FOREIGN KEY (`id_categoria_produto_geral`) REFERENCES `categorias_produto` (`id_categoria_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_produto`
--

LOCK TABLES `categorias_produto` WRITE;
/*!40000 ALTER TABLE `categorias_produto` DISABLE KEYS */;
INSERT INTO `categorias_produto` VALUES (7,'Tecnologia',NULL),(8,'Smartphone',7),(9,'Iphone',8),(10,'Windows Phone',8),(11,'Android',8);
/*!40000 ALTER TABLE `categorias_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  `sigla_estado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_usuarios` (`id_usuario`),
  KEY `fk_sigla_estado_estados` (`sigla_estado`),
  CONSTRAINT `fk_id_usuario_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_sigla_estado_estados` FOREIGN KEY (`sigla_estado`) REFERENCES `estados` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `sigla` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(7,2) NOT NULL,
  `id_categoria_produto` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_categoria_produto_categoria_idx` (`id_categoria_produto`),
  CONSTRAINT `fk_categoria_produto_categoria` FOREIGN KEY (`id_categoria_produto`) REFERENCES `categorias_produto` (`id_categoria_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_venda` date DEFAULT NULL,
  `id_usuario` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendas_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_vendas_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_produtos`
--

DROP TABLE IF EXISTS `vendas_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_produtos` (
  `vendas_id_venda` int unsigned NOT NULL,
  `produtos_id_produto` int unsigned NOT NULL,
  `quantidade` int unsigned DEFAULT NULL,
  PRIMARY KEY (`vendas_id_venda`,`produtos_id_produto`),
  KEY `fk_vendas_produtos_produtos1_idx` (`produtos_id_produto`),
  CONSTRAINT `fk_vendas_produtos_id_venda` FOREIGN KEY (`vendas_id_venda`) REFERENCES `vendas` (`id`),
  CONSTRAINT `fk_vendas_produtos_produtos1` FOREIGN KEY (`produtos_id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_produtos`
--

LOCK TABLES `vendas_produtos` WRITE;
/*!40000 ALTER TABLE `vendas_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-09 19:53:29
