-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Іван','Іванов','+38095748357','ivan@gmail.com','Київ, вул. Бандери, 6'),(2,'Олександр','Коваль','+380501234567','alex.koval@example.com','Київ, вул. Шевченка, 1'),(3,'Марина','Шевченко','+380661234567','marina.shevchenko@example.com','Львів, вул. Франка, 2'),(4,'Ігор','Петров','+380671234567','igor.petrov@example.com','Одеса, вул. Дерибасівська, 3'),(5,'Тетяна','Іванова','+380931234567','tetyana.ivanova@example.com','Харків, вул. Пушкіна, 4'),(6,'Дмитро','Мельник','+380951234567','dmytro.melnik@example.com','Запоріжжя, вул. Перемоги, 5');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Марія','Менеджер','+380951234567','maria.manager@example.com'),(2,'Андрій','Фармацевт','+380671234567','andriy.pharmacist@example.com'),(3,'Олена','Менеджер','+380631234567','olena.manager@example.com'),(4,'Петро','Складський працівник','+380681234567','petro.worker@example.com'),(5,'Ірина','Адміністратор','+380691234567','irina.admin@example.com');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `id_medication` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`id_medication`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Парацетамол','500мг',10.50,'Фармацевт',100),(2,'Парацетамол','500 мг',20.50,'Здоров\'я',150),(3,'Ібупрофен','200 мг',15.30,'Фарма',200),(4,'Анальгін','250 мг',10.00,'Аптечна корпорація',120),(5,'Аспірин','500 мг',12.50,'Лекфарм',180),(6,'Калію перманганат','1% розчин',25.00,'ФармаСервіс',100);
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_medications`
--

DROP TABLE IF EXISTS `ordered_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_medications` (
  `id_order` int NOT NULL,
  `id_medication` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_order`,`id_medication`),
  KEY `id_medication` (`id_medication`),
  CONSTRAINT `ordered_medications_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `ordered_medications_ibfk_2` FOREIGN KEY (`id_medication`) REFERENCES `medications` (`id_medication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_medications`
--

LOCK TABLES `ordered_medications` WRITE;
/*!40000 ALTER TABLE `ordered_medications` DISABLE KEYS */;
INSERT INTO `ordered_medications` VALUES (1,1,2,20.50),(2,2,1,15.30),(3,3,5,10.00),(4,4,3,12.50),(5,5,10,25.00);
/*!40000 ALTER TABLE `ordered_medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `id_employee` int DEFAULT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_client` (`id_client`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2024-12-18',150.75),(2,2,2,'2024-12-19',100.50),(3,3,3,'2024-12-20',250.00),(4,4,4,'2024-12-21',175.30),(5,5,5,'2024-12-22',90.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ФармаГруп','Ірина Коваль','+380931234567','irina.koval@pharmagroup.com'),(2,'ЛікарФарм','Тарас Лещенко','+380951234567','taras.lechenko@likarfarm.com'),(3,'Здоров\'яПлюс','Олександр Нечипорук','+380961234567','oleksandr.nechyporuk@healthplus.com'),(4,'Аптека Сервіс','Іван Грек','+380971234567','ivan.grek@aptekaservice.com'),(5,'ФармаТех','Марина Дмитренко','+380981234567','marina.dmitrenko@pharmatech.com');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `id_supply` int NOT NULL AUTO_INCREMENT,
  `id_medication` int DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `supply_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_supply`),
  KEY `id_medication` (`id_medication`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`id_medication`) REFERENCES `medications` (`id_medication`),
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,1,1,200,'2024-12-15',18.00),(2,2,2,150,'2024-12-16',15.50),(3,3,3,300,'2024-12-17',10.50),(4,4,4,100,'2024-12-18',12.00),(5,5,5,50,'2024-12-19',20.00);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-20  8:38:47
