-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: rtshop
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add catprod',6,'add_catprod'),(22,'Can change catprod',6,'change_catprod'),(23,'Can delete catprod',6,'delete_catprod'),(24,'Can view catprod',6,'view_catprod'),(25,'Can add produit',7,'add_produit'),(26,'Can change produit',7,'change_produit'),(27,'Can delete produit',7,'delete_produit'),(28,'Can view produit',7,'view_produit'),(29,'Can add user',8,'add_shopper'),(30,'Can change user',8,'change_shopper'),(31,'Can delete user',8,'delete_shopper'),(32,'Can view user',8,'view_shopper'),(33,'Can add commande',9,'add_commande'),(34,'Can change commande',9,'change_commande'),(35,'Can delete commande',9,'delete_commande'),(36,'Can view commande',9,'view_commande'),(37,'Can add panier',10,'add_panier'),(38,'Can change panier',10,'change_panier'),(39,'Can delete panier',10,'delete_panier'),(40,'Can view panier',10,'view_panier');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_shopper`
--

DROP TABLE IF EXISTS `clients_shopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_shopper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_shopper`
--

LOCK TABLES `clients_shopper` WRITE;
/*!40000 ALTER TABLE `clients_shopper` DISABLE KEYS */;
INSERT INTO `clients_shopper` VALUES (1,'pbkdf2_sha256$260000$xi6oTHEI92cBn4JUHbpFQv$fyB4n0Ezh24HWfOI5XGgocpI5r42PA+9wmSSJfD+DKk=','2022-06-17 11:31:50.782330',1,'toto','','','',1,1,'2022-06-12 17:06:36.084411'),(2,'pbkdf2_sha256$260000$8iyhjCCi4j9uy2tTDwl8xn$ISlAnrt3vR0bla+Pzo0DVqifkksEjmqhFaXXdxlGVdI=','2022-06-12 17:36:09.365597',0,'micha','','','',0,1,'2022-06-12 17:36:09.257473'),(3,'pbkdf2_sha256$260000$yOn47ZlDgcbbIN6fsZfd5m$cj/4hoeM+QarGJzc7qYU2oTm89jETd45qzQhBWKLTP0=','2022-06-16 13:58:04.314119',0,'candi','','','',0,1,'2022-06-13 08:28:30.042633'),(4,'pbkdf2_sha256$260000$DfT4KcE4fUtdTiViPNzrid$O5yXJejk7SxX0YdGcu8X3uHnLBQ4gUwh89EMEr9NyeY=','2022-06-13 08:49:27.197487',0,'Test','','','',0,1,'2022-06-13 08:49:27.099550'),(5,'pbkdf2_sha256$260000$EMpkLCUi8nNW4BN3OISc9A$jXd0OKKRWEiKuObSSdlqlIePA7Op5p4eJQnB0s9/KXQ=','2022-06-16 07:50:06.741113',0,'Faycal','','','',0,1,'2022-06-13 09:05:22.982516'),(7,'pbkdf2_sha256$260000$RWP1uavzvg7ZpuKQAdGOrX$XtuM2q4LSuwsyaX7W60N+BmyGeEE0G1cnIBkD5yfAR0=','2022-06-17 10:56:57.071663',1,'super','','','',1,1,'2022-06-14 12:12:05.906726'),(8,'pbkdf2_sha256$260000$xF3Owhgqzgjb4vd7gXM833$1iHkxsL3DaPaPp0OJQsuSCXwktyvJCfeS3vs0XGGG6U=','2022-06-16 13:54:39.049432',0,'Fayycal','','','',0,1,'2022-06-16 13:54:38.736568'),(9,'pbkdf2_sha256$260000$X4jyHPl9RrHaymZX1WdZad$OoYx4JA33Pw/Wve5t91dsdEuRz5Fms+Qm1oyaEAh7aA=','2022-06-17 11:13:52.232061',0,'Mister Bindel','','','',0,1,'2022-06-17 11:13:52.108141'),(10,'pbkdf2_sha256$260000$Nstz7YmtKgHBHe7nnBcda6$EDP2pC+Pgyn3OXUsVOfVi/RwEUhePM012gx/CeGuDCY=','2022-06-17 11:15:41.073715',0,'ojkiojoi','','','',0,1,'2022-06-17 11:15:40.888989');
/*!40000 ALTER TABLE `clients_shopper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_shopper_groups`
--

DROP TABLE IF EXISTS `clients_shopper_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_shopper_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shopper_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_shopper_groups_shopper_id_group_id_8052674f_uniq` (`shopper_id`,`group_id`),
  KEY `clients_shopper_groups_group_id_7f86dfce_fk_auth_group_id` (`group_id`),
  CONSTRAINT `clients_shopper_groups_group_id_7f86dfce_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `clients_shopper_groups_shopper_id_cfeb045e_fk_clients_shopper_id` FOREIGN KEY (`shopper_id`) REFERENCES `clients_shopper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_shopper_groups`
--

LOCK TABLES `clients_shopper_groups` WRITE;
/*!40000 ALTER TABLE `clients_shopper_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_shopper_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_shopper_user_permissions`
--

DROP TABLE IF EXISTS `clients_shopper_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_shopper_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shopper_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_shopper_user_per_shopper_id_permission_id_70988538_uniq` (`shopper_id`,`permission_id`),
  KEY `clients_shopper_user_permission_id_cd0cfb1b_fk_auth_perm` (`permission_id`),
  CONSTRAINT `clients_shopper_user_permission_id_cd0cfb1b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `clients_shopper_user_shopper_id_ef04f840_fk_clients_s` FOREIGN KEY (`shopper_id`) REFERENCES `clients_shopper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_shopper_user_permissions`
--

LOCK TABLES `clients_shopper_user_permissions` WRITE;
/*!40000 ALTER TABLE `clients_shopper_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_shopper_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_clients_shopper_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_clients_shopper_id` FOREIGN KEY (`user_id`) REFERENCES `clients_shopper` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-13 08:29:42.377255','1','Jogurt',1,'[{\"added\": {}}]',6,1),(2,'2022-06-13 08:30:07.333490','1','Danone',1,'[{\"added\": {}}]',7,1),(3,'2022-06-13 08:31:16.935986','1','Danone - 2',1,'[{\"added\": {}}]',9,1),(4,'2022-06-13 09:07:36.423273','2','Faycal',1,'[{\"added\": {}}]',7,1),(5,'2022-06-13 09:14:38.385452','2','Faycal',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(6,'2022-06-13 09:14:45.048972','1','Danone',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(7,'2022-06-13 12:53:16.285596','1','Danone',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(8,'2022-06-13 13:59:36.326664','1','toto',3,'',10,1),(9,'2022-06-13 14:02:24.176736','3','Faycal - 1',3,'',9,1),(10,'2022-06-13 14:02:24.190393','2','Danone - 1',3,'',9,1),(11,'2022-06-13 14:02:24.203923','1','Danone - 2',3,'',9,1),(12,'2022-06-13 14:02:31.004098','2','Faycal',3,'',7,1),(13,'2022-06-13 14:02:31.025137','1','Danone',3,'',7,1),(14,'2022-06-13 14:02:54.930770','2','toto',3,'',10,1),(15,'2022-06-13 14:09:20.133211','2','Gateaux',1,'[{\"added\": {}}]',6,1),(16,'2022-06-13 14:09:59.182551','3','Petit écolier',1,'[{\"added\": {}}]',7,1),(17,'2022-06-13 14:11:17.286189','4','perle de lait',1,'[{\"added\": {}}]',7,1),(18,'2022-06-13 14:12:59.005674','3','fruit',1,'[{\"added\": {}}]',6,1),(19,'2022-06-13 14:13:41.444768','5','banane',1,'[{\"added\": {}}]',7,1),(20,'2022-06-13 20:04:36.960684','6','toto',3,'',10,1),(21,'2022-06-13 20:04:56.179815','8','Petit écolier - 1',3,'',9,1),(22,'2022-06-13 20:07:12.789735','9','Petit écolier - 1',3,'',9,1),(23,'2022-06-13 20:13:24.084265','13','Petit écolier - 1',3,'',9,1),(24,'2022-06-13 20:13:24.098316','12','banane - 1',3,'',9,1),(25,'2022-06-13 20:13:24.117935','11','perle de lait - 1',3,'',9,1),(26,'2022-06-13 20:13:24.137831','10','Petit écolier - 1',3,'',9,1),(27,'2022-06-14 11:47:42.225923','21','banane - 1',3,'',9,1),(28,'2022-06-14 11:47:42.239288','20','Petit écolier - 1',3,'',9,1),(29,'2022-06-14 11:47:42.252877','18','Petit écolier - 1',3,'',9,1),(30,'2022-06-14 11:47:42.266341','16','Petit écolier - 1',3,'',9,1),(31,'2022-06-14 11:48:04.747897','16','toto',3,'',10,1),(32,'2022-06-14 11:48:04.765193','15','Faycal',3,'',10,1),(33,'2022-06-14 11:54:24.714430','23','Petit écolier - 1',2,'[{\"changed\": {\"fields\": [\"Ordered\"]}}]',9,1),(34,'2022-06-14 11:55:20.982169','23','Petit écolier - 1',2,'[{\"changed\": {\"fields\": [\"Datecommande\"]}}]',9,1),(35,'2022-06-14 12:47:26.922512','6','Cookies',1,'[{\"added\": {}}]',7,1),(36,'2022-06-14 12:50:58.779239','4','BABAN',3,'',6,1),(37,'2022-06-14 12:51:04.074695','23','Petit écolier - 1',3,'',9,1),(38,'2022-06-14 14:14:12.539797','7','Durian',1,'[{\"added\": {}}]',7,1),(39,'2022-06-16 12:01:39.539715','25','toto',3,'',10,1),(40,'2022-06-16 12:01:44.051469','27','super',3,'',10,1),(41,'2022-06-16 12:01:46.252528','26','candi',3,'',10,1),(42,'2022-06-16 12:31:03.393201','8','Stephane_Wojdila',1,'[{\"added\": {}}]',7,7),(43,'2022-06-16 12:46:05.750352','8','Stephane_Wojdila',3,'',7,7),(44,'2022-06-16 12:46:15.830672','7','Prof_de_merde',3,'',6,7),(45,'2022-06-16 17:23:26.298228','9','test',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'clients','shopper'),(4,'contenttypes','contenttype'),(6,'drive','catprod'),(9,'drive','commande'),(10,'drive','panier'),(7,'drive','produit'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-12 17:05:38.599174'),(2,'contenttypes','0002_remove_content_type_name','2022-06-12 17:05:38.861245'),(3,'auth','0001_initial','2022-06-12 17:05:40.268455'),(4,'auth','0002_alter_permission_name_max_length','2022-06-12 17:05:40.507935'),(5,'auth','0003_alter_user_email_max_length','2022-06-12 17:05:40.524172'),(6,'auth','0004_alter_user_username_opts','2022-06-12 17:05:40.543504'),(7,'auth','0005_alter_user_last_login_null','2022-06-12 17:05:40.560118'),(8,'auth','0006_require_contenttypes_0002','2022-06-12 17:05:40.575169'),(9,'auth','0007_alter_validators_add_error_messages','2022-06-12 17:05:40.592354'),(10,'auth','0008_alter_user_username_max_length','2022-06-12 17:05:40.608914'),(11,'auth','0009_alter_user_last_name_max_length','2022-06-12 17:05:40.626918'),(12,'auth','0010_alter_group_name_max_length','2022-06-12 17:05:40.673906'),(13,'auth','0011_update_proxy_permissions','2022-06-12 17:05:40.690644'),(14,'auth','0012_alter_user_first_name_max_length','2022-06-12 17:05:40.709202'),(15,'clients','0001_initial','2022-06-12 17:05:42.020964'),(16,'admin','0001_initial','2022-06-12 17:05:42.596860'),(17,'admin','0002_logentry_remove_auto_add','2022-06-12 17:05:42.614537'),(18,'admin','0003_logentry_add_action_flag_choices','2022-06-12 17:05:42.636285'),(19,'drive','0001_initial','2022-06-12 17:05:43.030117'),(20,'sessions','0001_initial','2022-06-12 17:05:43.190709'),(21,'drive','0002_commande','2022-06-12 17:56:04.204184'),(22,'drive','0003_auto_20220612_1804','2022-06-12 18:04:28.698378'),(23,'drive','0004_produit_slug','2022-06-13 09:14:01.765424'),(24,'drive','0005_alter_commande_date','2022-06-13 13:59:13.146921'),(25,'drive','0006_remove_commande_date','2022-06-13 20:07:32.068342'),(26,'drive','0007_alter_produit_photo','2022-06-16 17:22:12.540097'),(27,'drive','0008_alter_produit_photo','2022-06-17 10:38:39.966605');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2n1mzgo1xj13yty88x211p88zog1aklj','.eJxVjMsOwiAURP-FtSE8BFqX7vsNzXC5SNW0SWlXxn9Xki50N5lzZl5ixL6Vca-8jlMSFxHE6beLoAfPDaQ75tsiaZm3dYqyKfKgVQ5L4uf1cP8OCmr5rrVG4h7K-A6dSlAB7FwILXnjyQKOEMnnSGS453PW1gdnLSudFYn3B_nTOHo:1o1kNI:M_QaP6f33XAl5TGJR3QNJklWSjcYCjveh0UHq7o6cpU','2022-06-30 07:57:08.054418'),('34uil7l6ygdx95q6f5548q0lfsipoqqw','e30:1o29KU:oi4MX8cfzOlLsQOD42G_-Qf5kh3O72JIvG3xCUy_nsk','2022-07-01 10:35:54.825989'),('3b6op9q5mtkj8tcvcvfluevglar8q2ov','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o29xF:Ka3P6TBfwG_MdiLqZQanjFQACZ6uDhRJ8Vps5fpHQNo','2022-07-01 11:15:57.953143'),('4zavb0er6f3kr6hf7s87rc4wgy0lwelt','e30:1o29wl:Iljg-wnVV9TZdBeMd9M16dD4UXFbuzAe5Y5tozRgQDc','2022-07-01 11:15:27.759515'),('5ac6g8snjvv7257uc9ddvkohxznuj689','e30:1o176N:wU29k-dsMbXbIKp0aeOx3RG22u6iy_tTPEOLqGyr1PI','2022-06-28 14:01:03.285302'),('5gl55myc2uiq43behlbpn5z7ehosw3z2','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o1nxH:u-gxp7o6GFSgvTGSBbxdA0b7_O_F1tzCam1CFlmwHhI','2022-06-30 11:46:31.261790'),('630y7brm2zthcw14fq1hor7hx6vpr22l','e30:1o0g0J:Ejy_c8sQ1nfWCT8tKDFfQJUjVRdJwbKsY5hXR0dPf8Q','2022-06-27 09:04:59.298678'),('6vwaczqb8rm700h6hn1a9yqzbbgarjxp','e30:1o1px2:gXFoxYM0sbE2WHYhXe1JX7iL46H_AFxdh5XUzkFj3V8','2022-06-30 13:54:24.277997'),('ajxls4yu0lz57ylr4bh6cw5dcxh5b7hn','.eJxVjMsOwiAURP-FtSE8BFqX7vsNzXC5SNW0SWlXxn9Xki50N5lzZl5ixL6Vca-8jlMSFxHE6beLoAfPDaQ75tsiaZm3dYqyKfKgVQ5L4uf1cP8OCmr5rrVG4h7K-A6dSlAB7FwILXnjyQKOEMnnSGS453PW1gdnLSudFYn3B_nTOHo:1o17R4:xOazFqVVJaVrtBFPoEWBPpOezIgteZuffyg80xV0p-k','2022-06-28 14:22:26.217868'),('awkh4r7dfbgmnnpt63k79yin7s06gbd0','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o2ACc:G9kG7dU080Sk0-G7uYH5jPhyHDu6Wl4LjiW2-DXL5vw','2022-07-01 11:31:50.798145'),('ay9mf3nsocot75bz7h0zqpoc3xzzyicb','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o1lkf:tj8-DuuV3NbIQTD4EGcnNTGSlqxI4J1Tw88tCHglHws','2022-06-30 09:25:21.804840'),('brftq3qfqqnkx5cetvxi4lwgquacs7u3','.eJxVjDsOwjAQBe_iGln-4PVCSc8ZrPWugwPIkeKkQtwdIqWA9s3Me6lE61LT2sucRlFn5dXhd8vEj9I2IHdqt0nz1JZ5zHpT9E67vk5Snpfd_Tuo1Ou3ttmAJfJAGE8o6I24ADb4AaHwEKhw9BSiRLTRuCPk7IB9EUBADqTeH87TN3w:1o1q0a:nniH6nilCLDBWG3CtdyDmUkKPs7wR0bFBZPYOE_pdoA','2022-06-30 13:58:04.344554'),('cogcl3mbhalspxzob03u36dsp35hrzwi','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o1CxH:3yTnAVs6hQ9jzx83IY_oor0_R5Azn65e0c929--cLik','2022-06-28 20:16:03.196010'),('f0w8o2g5v9xqiyrwuhfkm3kwvfo45yzd','e30:1o1nSD:o-VNUvRzZKTfH6yqP3pqnYpucsR-Wy-v8lVT5hrUX7c','2022-06-30 11:14:25.360228'),('g4p91ckrn3mf225kn8dx2x2vvzvo1mb7','e30:1o176S:jeFqugcEXKgJmGcm4PUe9no35IWPVqxIXGbHYykAr6I','2022-06-28 14:01:08.028175'),('gj3mtshq9v32qw4pa6txug52zo3fjfwq','e30:1o0iy5:ZiysEby0bN4qm1yh4BcUBt69h2WEaHbqtrVcD-8-vPo','2022-06-27 12:14:53.436167'),('oxdcnsveps4hpsbdrf44e35v27cj49lf','.eJxVjEEOwiAQRe_C2hCmAwFcuvcMZIBBqgaS0q6Md9cmXej2v_f-SwTa1hq2wUuYszgLI06_W6T04LaDfKd26zL1ti5zlLsiDzrktWd-Xg7376DSqN-6RFCozASIQIwAfoqEqAvFUpz3QGQ1JnBsLChFmZNyympKJjrWTrw_zYA3gQ:1o1jI1:WftZbwLUGTRIvuqLkEVAqL68m5y04C9-g1lqTuMF_Ec','2022-06-30 06:47:37.107364'),('pju5i7mm64snc33cj5ag5bo6oxtspl9z','e30:1o0iyx:GACToQ_vOdU8QwzAljl0y-iuNHpww_-_Anpw67t87u8','2022-06-27 12:15:47.538816'),('pnolhwu634y334262qg2mfozz9n6f0nb','e30:1o1nS6:7Isv_0vUTrklSL-MfaC4j0o1MYunEQEyqaF47ZkE5Sg','2022-06-30 11:14:18.693163'),('s3nyfglpkog0vpczaebry3nsxwegvwrd','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o1D7H:6ZQdJqeOXCJY0zlSsvDRccqBJUs1x0z-HmvyJQBCEqI','2022-06-28 20:26:23.711981'),('w6hrg8gk2cuveqe8xouw5mhdl53t4k87','.eJxVjDsOwjAQBe_iGlm7_gQvJT1nsNb2mgRQIsVJhbg7iZQC2pl5760ir0sf1yZzHIq6KFSnX5Y4P2XcRXnweJ90nsZlHpLeE33Ypm9Tkdf1aP8Oem79tq5nMpWcTZCtB-kIUdBQYLCIzCQbhxySAZ-dNw7AmQ6LJaoBvBf1-QK4jDZs:1o1CxG:zvepMLp39SWdkFyusVrFxw7H5u2-UTK13U8yW0avzfo','2022-06-28 20:16:02.940509'),('yt1wrhbq2p6b4ozmqw19qjuhwzfggcgc','.eJxVjMsOwiAURP-FtSE8BFqX7vsNzXC5SNW0SWlXxn9Xki50N5lzZl5ixL6Vca-8jlMSFxHE6beLoAfPDaQ75tsiaZm3dYqyKfKgVQ5L4uf1cP8OCmr5rrVG4h7K-A6dSlAB7FwILXnjyQKOEMnnSGS453PW1gdnLSudFYn3B_nTOHo:1o1nSN:ZjFdoinslRLhXmO07ow6dvaV5_IcwHxMpoM0fqZD1C0','2022-06-30 11:14:35.963916'),('zsnvfubhbfcazc82emws3s09ny0y7g7r','.eJxVjMsOwiAURP-FtSE8BFqX7vsNzXC5SNW0SWlXxn9Xki50N5lzZl5ixL6Vca-8jlMSFxHE6beLoAfPDaQ75tsiaZm3dYqyKfKgVQ5L4uf1cP8OCmr5rrVG4h7K-A6dSlAB7FwILXnjyQKOEMnnSGS453PW1gdnLSudFYn3B_nTOHo:1o1q3p:kxgsTNSq4ZENg8pLmykCY789RHGa3BSsakO3zbLwQxA','2022-06-30 14:01:25.065348');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_catprod`
--

DROP TABLE IF EXISTS `drive_catprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_catprod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descriptif` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_catprod`
--

LOCK TABLES `drive_catprod` WRITE;
/*!40000 ALTER TABLE `drive_catprod` DISABLE KEYS */;
INSERT INTO `drive_catprod` VALUES (1,'Yaourt','produit à base de produit lactique ou végétale. Contient des ferment lactique'),(2,'Gateaux','kà'),(3,'Fruit','');
/*!40000 ALTER TABLE `drive_catprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_commande`
--

DROP TABLE IF EXISTS `drive_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `Produit_id` int NOT NULL,
  `client_id` bigint NOT NULL,
  `datecommande` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drive_commande_Produit_id_dfad6030_fk_drive_produit_id` (`Produit_id`),
  KEY `drive_commande_client_id_a901df5f_fk_clients_shopper_id` (`client_id`),
  CONSTRAINT `drive_commande_client_id_a901df5f_fk_clients_shopper_id` FOREIGN KEY (`client_id`) REFERENCES `clients_shopper` (`id`),
  CONSTRAINT `drive_commande_Produit_id_dfad6030_fk_drive_produit_id` FOREIGN KEY (`Produit_id`) REFERENCES `drive_produit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_commande`
--

LOCK TABLES `drive_commande` WRITE;
/*!40000 ALTER TABLE `drive_commande` DISABLE KEYS */;
INSERT INTO `drive_commande` VALUES (26,1,1,6,1,'2022-06-14 20:19:08.206232'),(27,1,1,3,1,'2022-06-14 21:50:27.769728'),(29,1,1,5,1,'2022-06-14 22:15:30.966016'),(31,1,1,3,3,'2022-06-16 07:34:00.129179'),(33,1,1,3,1,'2022-06-16 09:23:19.489559'),(34,2,1,3,1,'2022-06-16 09:24:13.653458'),(36,2,1,3,7,'2022-06-16 11:18:24.929325'),(39,1,1,3,1,'2022-06-16 10:53:59.667416'),(47,1,1,6,7,'2022-06-16 11:18:24.951680'),(48,5,0,3,7,NULL),(49,9,0,3,1,NULL),(58,3,1,5,1,'2022-06-16 16:28:45.308906'),(62,2,0,5,3,NULL),(65,1,1,5,1,'2022-06-17 11:32:16.393111'),(66,1,0,5,1,NULL);
/*!40000 ALTER TABLE `drive_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_panier`
--

DROP TABLE IF EXISTS `drive_panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_panier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `client_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  CONSTRAINT `drive_panier_client_id_29f6814e_fk_clients_shopper_id` FOREIGN KEY (`client_id`) REFERENCES `clients_shopper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_panier`
--

LOCK TABLES `drive_panier` WRITE;
/*!40000 ALTER TABLE `drive_panier` DISABLE KEYS */;
INSERT INTO `drive_panier` VALUES (30,0,7),(31,0,3),(33,0,1);
/*!40000 ALTER TABLE `drive_panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_panier_commandes`
--

DROP TABLE IF EXISTS `drive_panier_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_panier_commandes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panier_id` int NOT NULL,
  `commande_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drive_panier_commandes_panier_id_commande_id_719c1957_uniq` (`panier_id`,`commande_id`),
  KEY `drive_panier_commandes_commande_id_be3bd49c_fk_drive_commande_id` (`commande_id`),
  CONSTRAINT `drive_panier_commandes_commande_id_be3bd49c_fk_drive_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `drive_commande` (`id`),
  CONSTRAINT `drive_panier_commandes_panier_id_7f1ed226_fk_drive_panier_id` FOREIGN KEY (`panier_id`) REFERENCES `drive_panier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_panier_commandes`
--

LOCK TABLES `drive_panier_commandes` WRITE;
/*!40000 ALTER TABLE `drive_panier_commandes` DISABLE KEYS */;
INSERT INTO `drive_panier_commandes` VALUES (61,31,62),(65,33,66);
/*!40000 ALTER TABLE `drive_panier_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_produit`
--

DROP TABLE IF EXISTS `drive_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `dateper` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `stock` int NOT NULL,
  `cat` int NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drive_produit_cat_22a4032a_fk_drive_catprod_id` (`cat`),
  KEY `drive_produit_slug_3189c03d` (`slug`),
  CONSTRAINT `drive_produit_cat_22a4032a_fk_drive_catprod_id` FOREIGN KEY (`cat`) REFERENCES `drive_catprod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_produit`
--

LOCK TABLES `drive_produit` WRITE;
/*!40000 ALTER TABLE `drive_produit` DISABLE KEYS */;
INSERT INTO `drive_produit` VALUES (3,'Petit écolier','2023-11-12','photosprod/petit-ecolier-chocolat-lait-lu-150g.jpg','LU',2.45,25,2,'Petit_ecolier'),(5,'banane','2022-06-08','photosprod/téléchargement_18.jpg','fruit_bio',1.4,42,3,'banane'),(6,'Cookies','2022-06-14','photosprod/cookies.png','Milka',10,9,2,'Cookies');
/*!40000 ALTER TABLE `drive_produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-17 18:57:37
