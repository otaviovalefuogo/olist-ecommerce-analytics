-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: olist
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `olist_customers_dataset`
--

DROP TABLE IF EXISTS `olist_customers_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_customers_dataset` (
  `customer_id` text,
  `customer_unique_id` text,
  `customer_zip_code_prefix` text,
  `customer_city` text,
  `customer_state` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_items_dataset`
--

DROP TABLE IF EXISTS `olist_order_items_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_items_dataset` (
  `order_id` text,
  `order_item_id` int DEFAULT NULL,
  `product_id` text,
  `seller_id` text,
  `shipping_limit_date` text,
  `price` double DEFAULT NULL,
  `freight_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_payments_dataset`
--

DROP TABLE IF EXISTS `olist_order_payments_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_payments_dataset` (
  `order_id` text,
  `payment_sequential` text,
  `payment_type` text,
  `payment_installments` text,
  `payment_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_reviews_dataset`
--

DROP TABLE IF EXISTS `olist_order_reviews_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_reviews_dataset` (
  `review_id` text,
  `order_id` text,
  `review_score` text,
  `review_comment_title` text,
  `review_comment_message` text,
  `review_creation_date` text,
  `review_answer_timestamp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_orders_dataset`
--

DROP TABLE IF EXISTS `olist_orders_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_orders_dataset` (
  `order_id` text,
  `customer_id` text,
  `order_status` text,
  `order_purchase_timestamp` text,
  `order_approved_at` text,
  `order_delivered_carrier_date` text,
  `order_delivered_customer_date` text,
  `order_estimated_delivery_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_products_dataset`
--

DROP TABLE IF EXISTS `olist_products_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_products_dataset` (
  `product_id` text,
  `product_category_name` text,
  `product_name_lenght` text,
  `product_description_lenght` text,
  `product_photos_qty` text,
  `product_weight_g` text,
  `product_length_cm` text,
  `product_height_cm` text,
  `product_width_cm` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_sellers_dataset`
--

DROP TABLE IF EXISTS `olist_sellers_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_sellers_dataset` (
  `seller_id` text,
  `seller_zip_code_prefix` text,
  `seller_city` text,
  `seller_state` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category_name_translation`
--

DROP TABLE IF EXISTS `product_category_name_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_name_translation` (
  `product_category_name` text,
  `product_category_name_english` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_pedidos_detalhe`
--

DROP TABLE IF EXISTS `vw_pedidos_detalhe`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_detalhe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_detalhe` AS SELECT 
 1 AS `order_id`,
 1 AS `product_id`,
 1 AS `seller_id`,
 1 AS `nome_vendedor`,
 1 AS `data_compra`,
 1 AS `data_entrega`,
 1 AS `data_estimada`,
 1 AS `estado_cliente`,
 1 AS `categoria`,
 1 AS `valor_produto`,
 1 AS `valor_frete`,
 1 AS `peso_gramas`,
 1 AS `estado_vendedor`,
 1 AS `avaliacao`,
 1 AS `status_sla`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_pedidos_detalhe`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_detalhe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_detalhe` AS select `o`.`order_id` AS `order_id`,`i`.`product_id` AS `product_id`,`i`.`seller_id` AS `seller_id`,concat('Vendedor ',substr(`i`.`seller_id`,1,6)) AS `nome_vendedor`,cast(`o`.`order_purchase_timestamp` as date) AS `data_compra`,cast(`o`.`order_delivered_customer_date` as date) AS `data_entrega`,cast(`o`.`order_estimated_delivery_date` as date) AS `data_estimada`,`c`.`customer_state` AS `estado_cliente`,coalesce(replace(`pr`.`product_category_name`,'_',' '),'Outros') AS `categoria`,`i`.`price` AS `valor_produto`,`i`.`freight_value` AS `valor_frete`,`pr`.`product_weight_g` AS `peso_gramas`,`s`.`seller_state` AS `estado_vendedor`,`r`.`review_score` AS `avaliacao`,(case when ((`o`.`order_status` = 'delivered') and (`o`.`order_delivered_customer_date` > `o`.`order_estimated_delivery_date`)) then 'Atrasado' when ((`o`.`order_status` = 'delivered') and (`o`.`order_delivered_customer_date` <= `o`.`order_estimated_delivery_date`)) then 'No Prazo' else `o`.`order_status` end) AS `status_sla` from (((((`olist_orders_dataset` `o` join `olist_customers_dataset` `c` on((`o`.`customer_id` = `c`.`customer_id`))) join `olist_order_items_dataset` `i` on((`o`.`order_id` = `i`.`order_id`))) join `olist_products_dataset` `pr` on((`i`.`product_id` = `pr`.`product_id`))) join `olist_sellers_dataset` `s` on((`i`.`seller_id` = `s`.`seller_id`))) left join `olist_order_reviews_dataset` `r` on((`o`.`order_id` = `r`.`order_id`))) */;
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

-- Dump completed on 2026-10-13 23:38:00
