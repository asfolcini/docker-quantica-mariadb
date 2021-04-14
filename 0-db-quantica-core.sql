-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: db-quantica-core
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.9-MariaDB-1:10.5.9+maria~bionic

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
-- Current Database: `db-quantica-core`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db-quantica-core` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db-quantica-core`;

--
-- Table structure for table `brokers`
--

DROP TABLE IF EXISTS `brokers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brokers` (
  `runID` varchar(100) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `brokerDescription` varchar(200) DEFAULT NULL,
  `initialBalance` double NOT NULL,
  `balance` double NOT NULL,
  `currency` varchar(10) NOT NULL,
  `creditLimit` double DEFAULT NULL,
  `Fees` double NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`brokerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokers`
--

LOCK TABLES `brokers` WRITE;
/*!40000 ALTER TABLE `brokers` DISABLE KEYS */;
/*!40000 ALTER TABLE `brokers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candleevents`
--

DROP TABLE IF EXISTS `candleevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candleevents` (
  `runID` varchar(100) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `isin` varchar(12) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `timeStamp` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `highTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `lowTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `openPrice` double DEFAULT NULL,
  `highPrice` double DEFAULT NULL,
  `lowPrice` double DEFAULT NULL,
  `closePrice` double DEFAULT NULL,
  `volume` int(11) DEFAULT 0,
  `timeFrame` varchar(20) NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`symbol`,`timeStamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candleevents`
--

LOCK TABLES `candleevents` WRITE;
/*!40000 ALTER TABLE `candleevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `candleevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `runID` varchar(100) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `orderSide` varchar(20) NOT NULL,
  `orderType` varchar(20) NOT NULL,
  `orderStatus` varchar(20) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `expirationTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `executionTargetTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `orderCreationTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantityToFill` int(11) DEFAULT NULL,
  `limitPrice` double DEFAULT NULL,
  `stopPrice` double DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`orderID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionOpenTS` timestamp(6) NULL DEFAULT NULL,
  `positionCloseTS` timestamp(6) NULL DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `averagePrice` double DEFAULT NULL,
  `marketPrice` double DEFAULT NULL,
  `marketValue` double DEFAULT NULL,
  `profitAndLoss` double DEFAULT NULL,
  `positionSide` varchar(20) DEFAULT NULL,
  `positionStatus` varchar(20) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`positionID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_orders`
--

DROP TABLE IF EXISTS `positions_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions_orders` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`positionID`,`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_orders`
--

LOCK TABLES `positions_orders` WRITE;
/*!40000 ALTER TABLE `positions_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runids`
--

DROP TABLE IF EXISTS `runids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runids` (
  `runID` varchar(100) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `elapsed` bigint(20) DEFAULT NULL COMMENT 'millis',
  `mode` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'INIT',
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runids`
--

LOCK TABLES `runids` WRITE;
/*!40000 ALTER TABLE `runids` DISABLE KEYS */;
INSERT INTO `runids` VALUES ('TEST','quantica_user',NULL,'LIVE','INIT','2021-04-14 09:31:57.106945','2021-04-14 09:31:57.106945');
/*!40000 ALTER TABLE `runids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategies`
--

DROP TABLE IF EXISTS `strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategies` (
  `runID` varchar(100) NOT NULL,
  `strategyID` varchar(60) NOT NULL,
  `strategyName` varchar(200) DEFAULT NULL,
  `strategyDescription` text DEFAULT NULL,
  `strategyClassName` varchar(400) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`strategyID`),
  KEY `Indice 2` (`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategies`
--

LOCK TABLES `strategies` WRITE;
/*!40000 ALTER TABLE `strategies` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `runID` varchar(100) NOT NULL,
  `transactionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionID` varchar(60) DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `side` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `fees` double DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`runID`,`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsRepository`
--

DROP TABLE IF EXISTS `tsRepository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsRepository` (
  `runID` varchar(100) NOT NULL,
  `windowsCommand` varchar(500) DEFAULT NULL,
  `unixCommand` varchar(500) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsRepository`
--

LOCK TABLES `tsRepository` WRITE;
/*!40000 ALTER TABLE `tsRepository` DISABLE KEYS */;
INSERT INTO `tsRepository` VALUES ('TEST',NULL,'qexec quantica.tradingsystem.standalone.QuanticaWrapper','2021-04-14 09:42:41.464048','2021-04-14 09:42:41.464048');
/*!40000 ALTER TABLE `tsRepository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(100) NOT NULL,
  `psw` varchar(200) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `level` varchar(10) NOT NULL DEFAULT 'view',
  `active` int(1) NOT NULL DEFAULT 1,
  `creationDateTS` timestamp NOT NULL DEFAULT curdate(),
  `lastUpdateTS` timestamp NOT NULL DEFAULT curdate(),
  KEY `users_uid_IDX` (`uid`,`psw`,`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('demo','$2y$10$70u497BO4lcxaQu3qVhcmOlMitzeVC1Iq0xqCK4UG9jvig2/Dqf7.','Demo User','view',1,'2021-03-22 00:00:00','2021-03-22 00:00:00'),('admin','$2y$10$i36OHK6Nj2CHyyqf0XC8xusvJ3aERJjKht5eBdcGbp9/FC5/xl9ta','Administrator','admin',1,'2021-03-22 00:00:00','2021-03-22 00:00:00'),('alberto','$2y$10$APE2aedfSQPgxISy..ST5.nFcrYT/.Q9JTPffzO969G.vy04vIuBu','Alberto Sfolcini','user',1,'2021-03-22 00:00:00','2021-03-22 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_brokers`
--

DROP TABLE IF EXISTS `v_brokers`;
/*!50001 DROP VIEW IF EXISTS `v_brokers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_brokers` (
  `runID` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `brokerDescription` tinyint NOT NULL,
  `initialBalance` tinyint NOT NULL,
  `balance` tinyint NOT NULL,
  `currency` tinyint NOT NULL,
  `creditLimit` tinyint NOT NULL,
  `Fees` tinyint NOT NULL,
  `investedAmount` tinyint NOT NULL,
  `PnL` tinyint NOT NULL,
  `UPnL` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `returnOnAccount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_liveTradingSystems`
--

DROP TABLE IF EXISTS `v_liveTradingSystems`;
/*!50001 DROP VIEW IF EXISTS `v_liveTradingSystems`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_liveTradingSystems` (
  `runID` tinyint NOT NULL,
  `strategyID` tinyint NOT NULL,
  `strategyName` tinyint NOT NULL,
  `strategyDescription` tinyint NOT NULL,
  `strategyClassName` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `NrActiveTrades` tinyint NOT NULL,
  `totalTrades` tinyint NOT NULL,
  `PnL` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_positions`
--

DROP TABLE IF EXISTS `v_positions`;
/*!50001 DROP VIEW IF EXISTS `v_positions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_positions` (
  `mode` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `runID` tinyint NOT NULL,
  `positionID` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `strategyID` tinyint NOT NULL,
  `strategy` tinyint NOT NULL,
  `positionOpenTS` tinyint NOT NULL,
  `positionCloseTS` tinyint NOT NULL,
  `symbol` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `averagePrice` tinyint NOT NULL,
  `marketPrice` tinyint NOT NULL,
  `marketValue` tinyint NOT NULL,
  `profitAndLoss` tinyint NOT NULL,
  `positionSide` tinyint NOT NULL,
  `positionStatus` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `ProfitAndLoss_pc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_runids`
--

DROP TABLE IF EXISTS `v_runids`;
/*!50001 DROP VIEW IF EXISTS `v_runids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_runids` (
  `mode` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `RunID` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `accountBalance` tinyint NOT NULL,
  `investedAmount` tinyint NOT NULL,
  `realizedProfit` tinyint NOT NULL,
  `returnOnAccount` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `brokerDescription` tinyint NOT NULL,
  `initialBalance` tinyint NOT NULL,
  `sharpeRatio` tinyint NOT NULL,
  `profitFactor` tinyint NOT NULL,
  `unrealizedProfit` tinyint NOT NULL,
  `liveStrategies` tinyint NOT NULL,
  `NrOpenPositions` tinyint NOT NULL,
  `winTrades` tinyint NOT NULL,
  `lossTrades` tinyint NOT NULL,
  `oddTrades` tinyint NOT NULL,
  `maxWin` tinyint NOT NULL,
  `maxLoss` tinyint NOT NULL,
  `avgTrade` tinyint NOT NULL,
  `avgWinTrade` tinyint NOT NULL,
  `avgLossTrade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db-quantica-core'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `DELETE_OLD_EVENTS` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `DELETE_OLD_EVENTS` ON SCHEDULE EVERY 48 HOUR STARTS '2021-03-10 18:16:38' ON COMPLETION PRESERVE DISABLE ON SLAVE DO DELETE LOW_PRIORITY FROM candleevents WHERE lastupdateTS < DATE_SUB(NOW(), INTERVAL 1 YEAR) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db-quantica-core'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_equity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_equity`(
												IN p_mode varchar(20),
												IN p_runID varchar(100),
												IN p_period varchar(3)
											)
BEGIN
	
	SET @period_query = "";
	IF  p_period = 'YTD' THEN 
    	SET @period_query = "AND positionCloseTS >= MAKEDATE(YEAR(NOW()), 1)";
  	ELSEIF p_period = '1Y' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 YEAR)";
  	ELSEIF p_period = '6M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 6 MONTH)";
  	ELSEIF p_period = '3M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 3 MONTH)";
  	ELSEIF p_period = '1M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 MONTH)";
  	ELSEIF p_period = '1W' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 WEEK)";
  	ELSEIF p_period = '1D' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 DAY)";
	END IF;
		
	SET @query = CONCAT("
						 SELECT * FROM (
							 SELECT 
								positionCloseTS,
								profitAndLoss,
								(@equity := @equity + profitAndLoss) as cumEquity
							 FROM (
								SELECT 
									positionCloseTS,
									ProfitAndLoss
								FROM v_positions 
								WHERE 
									mode='",p_mode,"' and runID='",p_runID,"'
								ORDER BY positionCloseTS asc
								) p, (SELECT @equity := 0) x
							 ORDER BY positionCloseTS asc
							) e WHERE 1=1 ",@period_query
						);
				
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_profits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_profits`(
												IN p_mode varchar(20),
												IN p_runID varchar(100),
												IN p_period varchar(5)
											)
BEGIN

	SET @query = "SELECT 0 as period, 0 as profitAndLoss";
	
	IF  p_period = 'YEAR' THEN 
			SET @query = CONCAT("
								SELECT 
									YEAR(positionCloseTS) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'MONTH' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(MONTHNAME(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'WEEK' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(WEEK(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'DAY' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(DAYOFYEAR(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"' 	
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;



    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMOVE_runID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_runID`(
	IN `_runID` VARCHAR(100)
)
    COMMENT 'Delete all DB entries of a given runID'
BEGIN
	DELETE FROM brokers 		WHERE runID=_runID;
	DELETE FROM orders		WHERE runID=_runID;
	DELETE FROM positions	WHERE runID=_runID;
	DELETE FROM positions_orders WHERE runID=_runID;
	DELETE FROM transactions WHERE runID=_runID;
	DELETE FROM candleevents WHERE runID=_runID;
	DELETE FROM runids WHERE runID=_runID;
	DELETE FROM strategies WHERE runID=_runID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRUNCATE_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRUNCATE_ALL`()
    COMMENT 'Empty the whole DB'
BEGIN
	TRUNCATE brokers;
	TRUNCATE orders;
	TRUNCATE positions;
	TRUNCATE positions_orders;
	TRUNCATE transactions;
	TRUNCATE candleevents;
	TRUNCATE strategies;
	TRUNCATE runids;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db-quantica-core`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db-quantica-core` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db-quantica-core`;

--
-- Table structure for table `brokers`
--

DROP TABLE IF EXISTS `brokers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brokers` (
  `runID` varchar(100) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `brokerDescription` varchar(200) DEFAULT NULL,
  `initialBalance` double NOT NULL,
  `balance` double NOT NULL,
  `currency` varchar(10) NOT NULL,
  `creditLimit` double DEFAULT NULL,
  `Fees` double NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`brokerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokers`
--

LOCK TABLES `brokers` WRITE;
/*!40000 ALTER TABLE `brokers` DISABLE KEYS */;
/*!40000 ALTER TABLE `brokers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candleevents`
--

DROP TABLE IF EXISTS `candleevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candleevents` (
  `runID` varchar(100) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `isin` varchar(12) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `timeStamp` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `highTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `lowTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `openPrice` double DEFAULT NULL,
  `highPrice` double DEFAULT NULL,
  `lowPrice` double DEFAULT NULL,
  `closePrice` double DEFAULT NULL,
  `volume` int(11) DEFAULT 0,
  `timeFrame` varchar(20) NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`symbol`,`timeStamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candleevents`
--

LOCK TABLES `candleevents` WRITE;
/*!40000 ALTER TABLE `candleevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `candleevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `runID` varchar(100) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `orderSide` varchar(20) NOT NULL,
  `orderType` varchar(20) NOT NULL,
  `orderStatus` varchar(20) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `expirationTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `executionTargetTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `orderCreationTimeStamp` timestamp(6) NULL DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantityToFill` int(11) DEFAULT NULL,
  `limitPrice` double DEFAULT NULL,
  `stopPrice` double DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`orderID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionOpenTS` timestamp(6) NULL DEFAULT NULL,
  `positionCloseTS` timestamp(6) NULL DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `averagePrice` double DEFAULT NULL,
  `marketPrice` double DEFAULT NULL,
  `marketValue` double DEFAULT NULL,
  `profitAndLoss` double DEFAULT NULL,
  `positionSide` varchar(20) DEFAULT NULL,
  `positionStatus` varchar(20) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`positionID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_orders`
--

DROP TABLE IF EXISTS `positions_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions_orders` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`positionID`,`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_orders`
--

LOCK TABLES `positions_orders` WRITE;
/*!40000 ALTER TABLE `positions_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runids`
--

DROP TABLE IF EXISTS `runids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runids` (
  `runID` varchar(100) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `elapsed` bigint(20) DEFAULT NULL COMMENT 'millis',
  `mode` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'INIT',
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runids`
--

LOCK TABLES `runids` WRITE;
/*!40000 ALTER TABLE `runids` DISABLE KEYS */;
INSERT INTO `runids` VALUES ('TEST','quantica_user',NULL,'LIVE','INIT','2021-04-14 09:31:57.106945','2021-04-14 09:31:57.106945');
/*!40000 ALTER TABLE `runids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategies`
--

DROP TABLE IF EXISTS `strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategies` (
  `runID` varchar(100) NOT NULL,
  `strategyID` varchar(60) NOT NULL,
  `strategyName` varchar(200) DEFAULT NULL,
  `strategyDescription` text DEFAULT NULL,
  `strategyClassName` varchar(400) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`runID`,`strategyID`),
  KEY `Indice 2` (`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategies`
--

LOCK TABLES `strategies` WRITE;
/*!40000 ALTER TABLE `strategies` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `runID` varchar(100) NOT NULL,
  `transactionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionID` varchar(60) DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `side` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `fees` double DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`runID`,`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsRepository`
--

DROP TABLE IF EXISTS `tsRepository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsRepository` (
  `runID` varchar(100) NOT NULL,
  `windowsCommand` varchar(500) DEFAULT NULL,
  `unixCommand` varchar(500) DEFAULT NULL,
  `creationTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `lastupdateTS` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsRepository`
--

LOCK TABLES `tsRepository` WRITE;
/*!40000 ALTER TABLE `tsRepository` DISABLE KEYS */;
INSERT INTO `tsRepository` VALUES ('TEST',NULL,'qexec quantica.tradingsystem.standalone.QuanticaWrapper','2021-04-14 09:42:41.464048','2021-04-14 09:42:41.464048');
/*!40000 ALTER TABLE `tsRepository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(100) NOT NULL,
  `psw` varchar(200) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `level` varchar(10) NOT NULL DEFAULT 'view',
  `active` int(1) NOT NULL DEFAULT 1,
  `creationDateTS` timestamp NOT NULL DEFAULT curdate(),
  `lastUpdateTS` timestamp NOT NULL DEFAULT curdate(),
  KEY `users_uid_IDX` (`uid`,`psw`,`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('demo','$2y$10$70u497BO4lcxaQu3qVhcmOlMitzeVC1Iq0xqCK4UG9jvig2/Dqf7.','Demo User','view',1,'2021-03-22 00:00:00','2021-03-22 00:00:00'),('admin','$2y$10$i36OHK6Nj2CHyyqf0XC8xusvJ3aERJjKht5eBdcGbp9/FC5/xl9ta','Administrator','admin',1,'2021-03-22 00:00:00','2021-03-22 00:00:00'),('alberto','$2y$10$APE2aedfSQPgxISy..ST5.nFcrYT/.Q9JTPffzO969G.vy04vIuBu','Alberto Sfolcini','user',1,'2021-03-22 00:00:00','2021-03-22 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_brokers`
--

DROP TABLE IF EXISTS `v_brokers`;
/*!50001 DROP VIEW IF EXISTS `v_brokers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_brokers` (
  `runID` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `brokerDescription` tinyint NOT NULL,
  `initialBalance` tinyint NOT NULL,
  `balance` tinyint NOT NULL,
  `currency` tinyint NOT NULL,
  `creditLimit` tinyint NOT NULL,
  `Fees` tinyint NOT NULL,
  `investedAmount` tinyint NOT NULL,
  `PnL` tinyint NOT NULL,
  `UPnL` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `returnOnAccount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_liveTradingSystems`
--

DROP TABLE IF EXISTS `v_liveTradingSystems`;
/*!50001 DROP VIEW IF EXISTS `v_liveTradingSystems`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_liveTradingSystems` (
  `runID` tinyint NOT NULL,
  `strategyID` tinyint NOT NULL,
  `strategyName` tinyint NOT NULL,
  `strategyDescription` tinyint NOT NULL,
  `strategyClassName` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `NrActiveTrades` tinyint NOT NULL,
  `totalTrades` tinyint NOT NULL,
  `PnL` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_positions`
--

DROP TABLE IF EXISTS `v_positions`;
/*!50001 DROP VIEW IF EXISTS `v_positions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_positions` (
  `mode` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `runID` tinyint NOT NULL,
  `positionID` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `strategyID` tinyint NOT NULL,
  `strategy` tinyint NOT NULL,
  `positionOpenTS` tinyint NOT NULL,
  `positionCloseTS` tinyint NOT NULL,
  `symbol` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `averagePrice` tinyint NOT NULL,
  `marketPrice` tinyint NOT NULL,
  `marketValue` tinyint NOT NULL,
  `profitAndLoss` tinyint NOT NULL,
  `positionSide` tinyint NOT NULL,
  `positionStatus` tinyint NOT NULL,
  `creationTS` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `ProfitAndLoss_pc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_runids`
--

DROP TABLE IF EXISTS `v_runids`;
/*!50001 DROP VIEW IF EXISTS `v_runids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_runids` (
  `mode` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `RunID` tinyint NOT NULL,
  `lastupdateTS` tinyint NOT NULL,
  `accountBalance` tinyint NOT NULL,
  `investedAmount` tinyint NOT NULL,
  `realizedProfit` tinyint NOT NULL,
  `returnOnAccount` tinyint NOT NULL,
  `brokerID` tinyint NOT NULL,
  `brokerDescription` tinyint NOT NULL,
  `initialBalance` tinyint NOT NULL,
  `sharpeRatio` tinyint NOT NULL,
  `profitFactor` tinyint NOT NULL,
  `unrealizedProfit` tinyint NOT NULL,
  `liveStrategies` tinyint NOT NULL,
  `NrOpenPositions` tinyint NOT NULL,
  `winTrades` tinyint NOT NULL,
  `lossTrades` tinyint NOT NULL,
  `oddTrades` tinyint NOT NULL,
  `maxWin` tinyint NOT NULL,
  `maxLoss` tinyint NOT NULL,
  `avgTrade` tinyint NOT NULL,
  `avgWinTrade` tinyint NOT NULL,
  `avgLossTrade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db-quantica-core'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `DELETE_OLD_EVENTS` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `DELETE_OLD_EVENTS` ON SCHEDULE EVERY 48 HOUR STARTS '2021-03-10 18:16:38' ON COMPLETION PRESERVE DISABLE ON SLAVE DO DELETE LOW_PRIORITY FROM candleevents WHERE lastupdateTS < DATE_SUB(NOW(), INTERVAL 1 YEAR) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db-quantica-core'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_equity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_equity`(
												IN p_mode varchar(20),
												IN p_runID varchar(100),
												IN p_period varchar(3)
											)
BEGIN
	
	SET @period_query = "";
	IF  p_period = 'YTD' THEN 
    	SET @period_query = "AND positionCloseTS >= MAKEDATE(YEAR(NOW()), 1)";
  	ELSEIF p_period = '1Y' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 YEAR)";
  	ELSEIF p_period = '6M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 6 MONTH)";
  	ELSEIF p_period = '3M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 3 MONTH)";
  	ELSEIF p_period = '1M' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 MONTH)";
  	ELSEIF p_period = '1W' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 WEEK)";
  	ELSEIF p_period = '1D' THEN 
    	SET @period_query = "AND positionCloseTS > DATE_SUB(now(), INTERVAL 1 DAY)";
	END IF;
		
	SET @query = CONCAT("
						 SELECT * FROM (
							 SELECT 
								positionCloseTS,
								profitAndLoss,
								(@equity := @equity + profitAndLoss) as cumEquity
							 FROM (
								SELECT 
									positionCloseTS,
									ProfitAndLoss
								FROM v_positions 
								WHERE 
									mode='",p_mode,"' and runID='",p_runID,"'
								ORDER BY positionCloseTS asc
								) p, (SELECT @equity := 0) x
							 ORDER BY positionCloseTS asc
							) e WHERE 1=1 ",@period_query
						);
				
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_profits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_profits`(
												IN p_mode varchar(20),
												IN p_runID varchar(100),
												IN p_period varchar(5)
											)
BEGIN

	SET @query = "SELECT 0 as period, 0 as profitAndLoss";
	
	IF  p_period = 'YEAR' THEN 
			SET @query = CONCAT("
								SELECT 
									YEAR(positionCloseTS) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'MONTH' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(MONTHNAME(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'WEEK' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(WEEK(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions 
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"'
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;

	IF  p_period = 'DAY' THEN 
			SET @query = CONCAT("
								SELECT 
									CONCAT(DAYOFYEAR(positionCloseTS),'/',RIGHT(YEAR(positionCloseTS),2)) as period,
									SUM(profitAndLoss) as profitAndLoss
								FROM v_positions
								WHERE
									mode='",p_mode,"' and runID='",p_runID,"' 	
								GROUP BY 1
								ORDER BY positionCloseTS asc"
			);				
	END IF;



    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMOVE_runID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_runID`(
	IN `_runID` VARCHAR(100)
)
    COMMENT 'Delete all DB entries of a given runID'
BEGIN
	DELETE FROM brokers 		WHERE runID=_runID;
	DELETE FROM orders		WHERE runID=_runID;
	DELETE FROM positions	WHERE runID=_runID;
	DELETE FROM positions_orders WHERE runID=_runID;
	DELETE FROM transactions WHERE runID=_runID;
	DELETE FROM candleevents WHERE runID=_runID;
	DELETE FROM runids WHERE runID=_runID;
	DELETE FROM strategies WHERE runID=_runID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRUNCATE_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRUNCATE_ALL`()
    COMMENT 'Empty the whole DB'
BEGIN
	TRUNCATE brokers;
	TRUNCATE orders;
	TRUNCATE positions;
	TRUNCATE positions_orders;
	TRUNCATE transactions;
	TRUNCATE candleevents;
	TRUNCATE strategies;
	TRUNCATE runids;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db-quantica-core`
--

USE `db-quantica-core`;

--
-- Final view structure for view `v_brokers`
--

/*!50001 DROP TABLE IF EXISTS `v_brokers`*/;
/*!50001 DROP VIEW IF EXISTS `v_brokers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_brokers` AS select `b`.`runID` AS `runID`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,`b`.`balance` AS `balance`,`b`.`currency` AS `currency`,`b`.`creditLimit` AS `creditLimit`,`b`.`Fees` AS `Fees`,`b`.`investedAmount` AS `investedAmount`,`b`.`PnL` AS `PnL`,`b`.`UPnL` AS `UPnL`,`b`.`creationTS` AS `creationTS`,`b`.`lastupdateTS` AS `lastupdateTS`,`b`.`PnL` / `b`.`initialBalance` * 100 AS `returnOnAccount` from (select `b`.`runID` AS `runID`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,`b`.`balance` AS `balance`,`b`.`currency` AS `currency`,`b`.`creditLimit` AS `creditLimit`,`b`.`Fees` AS `Fees`,(select ifnull(sum(`v_positions`.`marketValue`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'OPEN') AS `investedAmount`,(select ifnull(sum(`v_positions`.`profitAndLoss`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'CLOSED') AS `PnL`,(select ifnull(sum(`v_positions`.`profitAndLoss`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'OPEN') AS `UPnL`,`b`.`creationTS` AS `creationTS`,`b`.`lastupdateTS` AS `lastupdateTS` from `db-quantica-core`.`brokers` `b`) `b` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_liveTradingSystems`
--

/*!50001 DROP TABLE IF EXISTS `v_liveTradingSystems`*/;
/*!50001 DROP VIEW IF EXISTS `v_liveTradingSystems`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_liveTradingSystems` AS select `s`.`runID` AS `runID`,`s`.`strategyID` AS `strategyID`,`s`.`strategyName` AS `strategyName`,`s`.`strategyDescription` AS `strategyDescription`,`s`.`strategyClassName` AS `strategyClassName`,`s`.`creationTS` AS `creationTS`,`s`.`lastupdateTS` AS `lastupdateTS`,(select count(`positions`.`positionID`) from `positions` where `positions`.`positionStatus` = 'OPEN' and `positions`.`strategyID` = `s`.`strategyID`) AS `NrActiveTrades`,(select count(`positions`.`positionID`) from `positions` where `positions`.`positionStatus` = 'CLOSED' and `positions`.`strategyID` = `s`.`strategyID`) AS `totalTrades`,(select sum(`positions`.`profitAndLoss`) from `positions` where `positions`.`strategyID` = `s`.`strategyID`) AS `PnL`,`r`.`status` AS `status` from (`strategies` `s` join `runids` `r` on(`s`.`runID` = `r`.`runID` and `r`.`mode` = 'LIVE')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_positions`
--

/*!50001 DROP TABLE IF EXISTS `v_positions`*/;
/*!50001 DROP VIEW IF EXISTS `v_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_positions` AS select `r`.`mode` AS `mode`,`r`.`status` AS `status`,`p`.`runID` AS `runID`,`p`.`positionID` AS `positionID`,`p`.`brokerID` AS `brokerID`,`p`.`strategyID` AS `strategyID`,(select `strategies`.`strategyName` from `strategies` where `strategies`.`strategyID` = `p`.`strategyID`) AS `strategy`,`p`.`positionOpenTS` AS `positionOpenTS`,`p`.`positionCloseTS` AS `positionCloseTS`,`p`.`symbol` AS `symbol`,`p`.`quantity` AS `quantity`,`p`.`averagePrice` AS `averagePrice`,`p`.`marketPrice` AS `marketPrice`,`p`.`marketValue` AS `marketValue`,`p`.`profitAndLoss` AS `profitAndLoss`,`p`.`positionSide` AS `positionSide`,`p`.`positionStatus` AS `positionStatus`,`p`.`creationTS` AS `creationTS`,`p`.`lastupdateTS` AS `lastupdateTS`,`p`.`profitAndLoss` / (`p`.`averagePrice` * `p`.`quantity`) * 100 AS `ProfitAndLoss_pc` from (`positions` `p` join `runids` `r` on(`p`.`runID` = `r`.`runID`)) order by `p`.`positionCloseTS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_runids`
--

/*!50001 DROP TABLE IF EXISTS `v_runids`*/;
/*!50001 DROP VIEW IF EXISTS `v_runids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_runids` AS select `r`.`mode` AS `mode`,`r`.`status` AS `status`,`r`.`runID` AS `RunID`,`r`.`lastupdateTS` AS `lastupdateTS`,`b`.`balance` AS `accountBalance`,`b`.`investedAmount` AS `investedAmount`,`b`.`PnL` AS `realizedProfit`,`b`.`returnOnAccount` AS `returnOnAccount`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,(select `v_brokers`.`returnOnAccount` from `db-quantica-core`.`v_brokers` where `v_brokers`.`runID` = `r`.`runID`) / (select std(`v_positions`.`ProfitAndLoss_pc`) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `r`.`runID` and `v_positions`.`positionStatus` = 'CLOSED') AS `sharpeRatio`,(select sum(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` >= 0) / ((select sum(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) * -1) AS `profitFactor`,`b`.`UPnL` AS `unrealizedProfit`,(select count(`db-quantica-core`.`strategies`.`strategyID`) from `db-quantica-core`.`strategies` where `db-quantica-core`.`strategies`.`runID` = `r`.`runID`) AS `liveStrategies`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'OPEN') AS `NrOpenPositions`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` > 0) AS `winTrades`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) AS `lossTrades`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` = 0) AS `oddTrades`,(select max(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `maxWin`,(select min(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `maxLoss`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `avgTrade`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` > 0) AS `avgWinTrade`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) AS `avgLossTrade` from (`db-quantica-core`.`runids` `r` left join `db-quantica-core`.`v_brokers` `b` on(`b`.`runID` = `r`.`runID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `db-quantica-core`
--

USE `db-quantica-core`;

--
-- Final view structure for view `v_brokers`
--

/*!50001 DROP TABLE IF EXISTS `v_brokers`*/;
/*!50001 DROP VIEW IF EXISTS `v_brokers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_brokers` AS select `b`.`runID` AS `runID`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,`b`.`balance` AS `balance`,`b`.`currency` AS `currency`,`b`.`creditLimit` AS `creditLimit`,`b`.`Fees` AS `Fees`,`b`.`investedAmount` AS `investedAmount`,`b`.`PnL` AS `PnL`,`b`.`UPnL` AS `UPnL`,`b`.`creationTS` AS `creationTS`,`b`.`lastupdateTS` AS `lastupdateTS`,`b`.`PnL` / `b`.`initialBalance` * 100 AS `returnOnAccount` from (select `b`.`runID` AS `runID`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,`b`.`balance` AS `balance`,`b`.`currency` AS `currency`,`b`.`creditLimit` AS `creditLimit`,`b`.`Fees` AS `Fees`,(select ifnull(sum(`v_positions`.`marketValue`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'OPEN') AS `investedAmount`,(select ifnull(sum(`v_positions`.`profitAndLoss`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'CLOSED') AS `PnL`,(select ifnull(sum(`v_positions`.`profitAndLoss`),0) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `b`.`runID` and `v_positions`.`brokerID` = `b`.`brokerID` and `v_positions`.`positionStatus` = 'OPEN') AS `UPnL`,`b`.`creationTS` AS `creationTS`,`b`.`lastupdateTS` AS `lastupdateTS` from `db-quantica-core`.`brokers` `b`) `b` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_liveTradingSystems`
--

/*!50001 DROP TABLE IF EXISTS `v_liveTradingSystems`*/;
/*!50001 DROP VIEW IF EXISTS `v_liveTradingSystems`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_liveTradingSystems` AS select `s`.`runID` AS `runID`,`s`.`strategyID` AS `strategyID`,`s`.`strategyName` AS `strategyName`,`s`.`strategyDescription` AS `strategyDescription`,`s`.`strategyClassName` AS `strategyClassName`,`s`.`creationTS` AS `creationTS`,`s`.`lastupdateTS` AS `lastupdateTS`,(select count(`positions`.`positionID`) from `positions` where `positions`.`positionStatus` = 'OPEN' and `positions`.`strategyID` = `s`.`strategyID`) AS `NrActiveTrades`,(select count(`positions`.`positionID`) from `positions` where `positions`.`positionStatus` = 'CLOSED' and `positions`.`strategyID` = `s`.`strategyID`) AS `totalTrades`,(select sum(`positions`.`profitAndLoss`) from `positions` where `positions`.`strategyID` = `s`.`strategyID`) AS `PnL`,`r`.`status` AS `status` from (`strategies` `s` join `runids` `r` on(`s`.`runID` = `r`.`runID` and `r`.`mode` = 'LIVE')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_positions`
--

/*!50001 DROP TABLE IF EXISTS `v_positions`*/;
/*!50001 DROP VIEW IF EXISTS `v_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_positions` AS select `r`.`mode` AS `mode`,`r`.`status` AS `status`,`p`.`runID` AS `runID`,`p`.`positionID` AS `positionID`,`p`.`brokerID` AS `brokerID`,`p`.`strategyID` AS `strategyID`,(select `strategies`.`strategyName` from `strategies` where `strategies`.`strategyID` = `p`.`strategyID`) AS `strategy`,`p`.`positionOpenTS` AS `positionOpenTS`,`p`.`positionCloseTS` AS `positionCloseTS`,`p`.`symbol` AS `symbol`,`p`.`quantity` AS `quantity`,`p`.`averagePrice` AS `averagePrice`,`p`.`marketPrice` AS `marketPrice`,`p`.`marketValue` AS `marketValue`,`p`.`profitAndLoss` AS `profitAndLoss`,`p`.`positionSide` AS `positionSide`,`p`.`positionStatus` AS `positionStatus`,`p`.`creationTS` AS `creationTS`,`p`.`lastupdateTS` AS `lastupdateTS`,`p`.`profitAndLoss` / (`p`.`averagePrice` * `p`.`quantity`) * 100 AS `ProfitAndLoss_pc` from (`positions` `p` join `runids` `r` on(`p`.`runID` = `r`.`runID`)) order by `p`.`positionCloseTS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_runids`
--

/*!50001 DROP TABLE IF EXISTS `v_runids`*/;
/*!50001 DROP VIEW IF EXISTS `v_runids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_runids` AS select `r`.`mode` AS `mode`,`r`.`status` AS `status`,`r`.`runID` AS `RunID`,`r`.`lastupdateTS` AS `lastupdateTS`,`b`.`balance` AS `accountBalance`,`b`.`investedAmount` AS `investedAmount`,`b`.`PnL` AS `realizedProfit`,`b`.`returnOnAccount` AS `returnOnAccount`,`b`.`brokerID` AS `brokerID`,`b`.`brokerDescription` AS `brokerDescription`,`b`.`initialBalance` AS `initialBalance`,(select `v_brokers`.`returnOnAccount` from `db-quantica-core`.`v_brokers` where `v_brokers`.`runID` = `r`.`runID`) / (select std(`v_positions`.`ProfitAndLoss_pc`) from `db-quantica-core`.`v_positions` where `v_positions`.`runID` = `r`.`runID` and `v_positions`.`positionStatus` = 'CLOSED') AS `sharpeRatio`,(select sum(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` >= 0) / ((select sum(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) * -1) AS `profitFactor`,`b`.`UPnL` AS `unrealizedProfit`,(select count(`db-quantica-core`.`strategies`.`strategyID`) from `db-quantica-core`.`strategies` where `db-quantica-core`.`strategies`.`runID` = `r`.`runID`) AS `liveStrategies`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'OPEN') AS `NrOpenPositions`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` > 0) AS `winTrades`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) AS `lossTrades`,(select count(`db-quantica-core`.`positions`.`positionID`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` = 0) AS `oddTrades`,(select max(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `maxWin`,(select min(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `maxLoss`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED') AS `avgTrade`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` > 0) AS `avgWinTrade`,(select avg(`db-quantica-core`.`positions`.`profitAndLoss`) from `db-quantica-core`.`positions` where `db-quantica-core`.`positions`.`runID` = `r`.`runID` and `db-quantica-core`.`positions`.`positionStatus` = 'CLOSED' and `db-quantica-core`.`positions`.`profitAndLoss` < 0) AS `avgLossTrade` from (`db-quantica-core`.`runids` `r` left join `db-quantica-core`.`v_brokers` `b` on(`b`.`runID` = `r`.`runID`)) */;
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

-- Dump completed on 2021-04-14 15:52:18
