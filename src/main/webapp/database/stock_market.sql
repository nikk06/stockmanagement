-- MySQL dump 10.10
--
-- Host: localhost    Database: stock_market
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `uname` varchar(45) default NULL,
  `password` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--


/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
LOCK TABLES `admin` WRITE;
INSERT INTO `admin` VALUES (1,'admin','java@1991','admin@admin.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

--
-- Table structure for table `admin_config`
--

DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config` (
  `admin_id` int(11) default NULL,
  `admin_user_name` varchar(45) default NULL,
  `logo_name` varchar(400) default NULL,
  `logo_path` varchar(500) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_config`
--


/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;
LOCK TABLES `admin_config` WRITE;
INSERT INTO `admin_config` VALUES (1,'admin','74.jpg','F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/74.jpg');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;

--
-- Table structure for table `client_config`
--

DROP TABLE IF EXISTS `client_config`;
CREATE TABLE `client_config` (
  `client_id` int(11) default NULL,
  `logo_name` varchar(400) default NULL,
  `name` varchar(100) default NULL,
  `logo_path` varchar(500) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_config`
--


/*!40000 ALTER TABLE `client_config` DISABLE KEYS */;
LOCK TABLES `client_config` WRITE;
INSERT INTO `client_config` VALUES (2082,'13.jpg','Trade Watch','F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/13.jpg'),(1793,'8.jpg','Trade Watch','F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/8.jpg');
UNLOCK TABLES;
/*!40000 ALTER TABLE `client_config` ENABLE KEYS */;

--
-- Table structure for table `client_details`
--

DROP TABLE IF EXISTS `client_details`;
CREATE TABLE `client_details` (
  `client_id` int(11) NOT NULL auto_increment,
  `client_name` varchar(100) default NULL,
  `client_address` varchar(400) default NULL,
  `client_phone_number` varchar(100) default NULL,
  `client_email` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_details`
--


/*!40000 ALTER TABLE `client_details` DISABLE KEYS */;
LOCK TABLES `client_details` WRITE;
INSERT INTO `client_details` VALUES (1793,'Javed Tamboli','Charoli, Bhosari, Pune.','9632587412','javedtamboli@gmail.com','javed','javed@123'),(2082,'Kishor Balasaheb Kadam','16 No, Wakad, Pune.','9404308673','kadamk33@gmail.com','kishor','java@1991'),(2401,'Govind Raut','Hadapsar, Pune.','8874241500','gavindraut@gmail.com','govind','govind@123'),(4389,'AMOL SHIVAJI PATIL','Amrutdham, Panchavati,Nashik','8007755999','sanchitpandit02@gmail.com','amol','12345'),(4794,'SANCHIT BABANRAO PANDIT','JANARDHAN SWAMI NAGAR,OJHAR(MIG),NASHIK','9823722909','sanchitpandit02@gmail.com','sanchit','sanchit123'),(5643,'Gaurav Dinkar Wakchaure','Hinjewadi, Pune.','7276763516','gauravwakchuare@gmail.com','gaurav','gaurav@123'),(7104,'Sagar Kharmale','Malwadi, Pune.','8689362542','sagarkharmale@gmail.com','sagar','sagar@123'),(9066,'rahul thorat','ozar','9823722909','thoratrn@gmail.com','rahul','1710555');
UNLOCK TABLES;
/*!40000 ALTER TABLE `client_details` ENABLE KEYS */;

--
-- Table structure for table `trade_details`
--

DROP TABLE IF EXISTS `trade_details`;
CREATE TABLE `trade_details` (
  `trade_id` int(11) NOT NULL auto_increment,
  `client_id` int(11) default NULL,
  `date` date default NULL,
  `script` varchar(400) default NULL,
  `trade_limit` varchar(200) default NULL,
  `buy_price` double default NULL,
  `quantity` int(45) default NULL,
  `sell_price` double default NULL,
  `volume` double default NULL,
  `total_pool_amount` int(45) default NULL,
  `brokarage` double default NULL,
  `profit_loss` double default NULL,
  `net_balance` double default NULL,
  PRIMARY KEY  (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trade_details`
--


/*!40000 ALTER TABLE `trade_details` DISABLE KEYS */;
LOCK TABLES `trade_details` WRITE;
INSERT INTO `trade_details` VALUES (4,7317,'2019-07-27','Nifty 15 July 2019','3 times',1400,25,1850,114000,450000,740,900,43500),(5,9066,'2019-07-31','Nifty29Aug','100000',11063,12,15223,10000545,15555596,150,11000,1588888),(6,4389,'2019-07-01','NIFTYCE12000 29AUG ','10000000',228,1050,245,5394000,5300593,1256,17500,5318093),(7,4389,'2019-07-01','NIFTYPE11600 29AUG: + 17500: 126.','10000000',126,1750,139,5894000,5318593,1056,22750,5340093),(8,4389,'2019-07-03','BANKNIFTY25JULY','10000000',31731,200,31843,12737200,5340093,1906,21690,5361783),(9,4389,'2019-07-03',' BANKNIFTY25JULYCE32800 + 2000: 76.80','10000000',77,2000,84,308000,5340093,150,14610,5519602),(10,6794,'2019-07-11','Nifty29Aug','10000000',11480,150,11570,3471000,5351593,1290,13500,5364560),(11,4389,'2019-07-15','NIFTY25JULY-750:11590.','10000000',11528,750,11590,17385000,5364500,1656,46500,5411560),(12,4389,'2019-07-24','NIFTY29AUG2019 11000PE','10000000',235,600,315,3780000,5415780,1509,47800,5463580),(13,4389,'2019-07-03','BANKNIFTY25JULY','10000000',31730,2000,31794,6386953,5351593,3695,128400,5583580),(14,4389,'2019-07-03',' BANKNIFTY25JULYCE32800 ','10000000',77,2000,104,508000,5563859,680,55200,5583580),(15,4389,'2019-07-08','NIFTY25JULY11600PE','10000000',155,1750,190,709052,5563859,693,61250,5631986),(16,4389,'2019-07-08','NIFTY 29AUG 11900CE','10000000',71,9250,67,1805932,5631950,559,-27750,5604920),(17,4389,'2019-07-04','NIFTY25JULY','10000000',11618,750,11556,8667009,5604920,3285,-46500,5558420),(18,4389,'2019-07-09','NIFTY25JULY','10000000',11473,750,11505,8693695,5558262,2359,24075,5582059),(19,4389,'2019-07-10','NIFTY25JULY','10000000',11485,750,11554,9684922,5582059,2169,51975,5634034),(20,4389,'2019-07-11','NIFTY25JULY','10000000',11480,150,11570,5394000,5634034,1250,13350,5647387),(21,4389,'2019-07-15','NIFTY25JULY','10000000',527,750,590,926869,5647387,3520,47175,5694362),(22,4389,'2019-07-15','NIFTY25JULY 11000PE','10000000',161,375,105,1000055,5694362,2091,-21000,5673362),(23,4389,'2019-07-24','NIFTYPE11600 29AUG 11000PE','10000000',280,600,315,1000055,5673362,2206,21040,5694402),(24,4389,'2019-07-31','NIFTY29AUG2019 11000PE','10000000',98,600,138,160125,5694402,935,24109,7459630.8),(25,4794,'2019-07-22','NIFTY25JULY','80000000',11363,4500,11400,10000545,25693654,4906,48369,25740093),(26,4794,'2019-07-23','INFY29AUG2019','80000000',784,12000,786.5,10000545,25740093,4856,29635,25770089),(27,0,'2019-07-24','SBI29AUG2019','80000000',319.5,6000,320.5,5394000,25770596,1625,6000,25776963),(28,4794,'2019-07-25','TCS29AUG2019','80000000',2228.5,2500,2231.1,12737200,25776963,3255,6500,25783659),(29,4794,'2019-07-25','BPCL29AUG2019','80000000',342.6,16000,341.6,4394000,25783695,1906,-16000,25767985),(30,4794,'2019-07-25','APOLLOHOSPITAL29AUG2019','80000000',1325.5,10000,1327,4394000,25767965,1980,15000,25782693),(31,4794,'2019-07-26','LT29AUG2019','80000000',1385.9,8000,1387.9,5894000,25782693,2695,16000,25798695),(32,4794,'2019-07-29','Nifty29Aug','80000000',11063.8,6000,11070.2,1000055,25798693,2569,36025,25834718);
UNLOCK TABLES;
/*!40000 ALTER TABLE `trade_details` ENABLE KEYS */;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `client_id` int(11) default NULL,
  `payment` int(45) default NULL,
  `bank` varchar(100) default NULL,
  `mode` varchar(100) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_details`
--


/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
LOCK TABLES `transaction_details` WRITE;
INSERT INTO `transaction_details` VALUES (1,2082,45000,'SBI','By Cash','2019-08-02'),(2,5643,5000,'HDFC','By Cash','2019-08-02'),(3,7104,760,'ICICI Bank','By Cash','2019-06-25'),(4,9387,45000,'SBI','By Cash','2019-07-29'),(5,4389,500000,'','CASH','2018-11-02'),(6,4389,350000,'','CASH','2019-12-05');
UNLOCK TABLES;
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

