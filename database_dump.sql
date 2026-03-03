-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: u102942340_reymend_dba
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acl_admin_actions`
--

DROP TABLE IF EXISTS `acl_admin_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_admin_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_module_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `is_show` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_module_id` (`admin_module_id`),
  CONSTRAINT `acl_admin_actions_ibfk_1` FOREIGN KEY (`admin_module_id`) REFERENCES `acls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_admin_actions`
--

LOCK TABLES `acl_admin_actions` WRITE;
/*!40000 ALTER TABLE `acl_admin_actions` DISABLE KEYS */;
INSERT INTO `acl_admin_actions` VALUES (2,1,'My Account','AdminDashboardController@myaccount',1,'2023-12-28 09:51:08','2023-12-28 09:51:08'),(3,1,'Change Password','AdminDashboardController@changedPassword',1,'2023-12-28 09:51:21','2023-12-28 09:51:21'),(4,44,'Users List','UsersController@index',1,'2023-12-28 09:52:36','2023-12-28 09:52:36'),(5,44,'create','UsersController@create',1,'2023-12-28 09:52:51','2023-12-28 09:52:51'),(7,44,'view','UsersController@view',1,'2023-12-28 09:53:17','2023-12-28 09:53:17'),(8,44,'Delete','UsersController@destroy',1,'2023-12-28 09:53:32','2023-12-28 09:53:32'),(9,44,'changeStatus','UsersController@changeStatus',1,'2023-12-28 09:53:45','2023-12-28 09:53:45'),(10,44,'approvestatus','UsersController@approvestatus',1,'2023-12-28 09:53:56','2023-12-28 09:53:56'),(11,44,'changedPassword','UsersController@changedPassword',1,'2023-12-28 09:54:09','2023-12-28 09:54:09'),(12,44,'sendCredentials','UsersController@sendCredentials',1,'2023-12-28 09:54:22','2023-12-28 09:54:22'),(13,44,'deleterow','UsersController@deleterow',1,'2023-12-28 09:54:35','2023-12-28 09:54:35'),(14,7,'Listing','CmspagesController@index',1,'2023-12-28 09:58:14','2023-12-28 09:58:14'),(15,7,'Edit','CmspagesController@edit',1,'2023-12-28 09:58:26','2023-12-28 09:58:26'),(16,8,'Add','FaqController@create',1,'2023-12-28 10:00:45','2023-12-28 10:00:45'),(17,8,'Listing','FaqController@index',1,'2023-12-28 10:00:59','2023-12-28 10:00:59'),(18,8,'Edit','FaqController@edit',1,'2023-12-28 10:01:10','2023-12-28 10:01:10'),(19,8,'Delete','FaqController@delete',1,'2023-12-28 10:01:22','2023-12-28 10:01:22'),(20,9,'Edit','EmailtemplateController@edit',1,'2023-12-28 10:02:05','2023-12-28 10:02:05'),(21,9,'Listing','EmailtemplateController@index',1,'2023-12-28 10:02:16','2023-12-28 10:02:16'),(22,10,'Listing','EmailLogsController@index',1,'2023-12-28 10:02:49','2023-12-28 10:02:49'),(23,15,'Site Update','SettingsController@update',1,'2023-12-28 10:03:38','2023-12-28 10:03:38'),(24,14,'Reading Update','SettingsController@update',1,'2023-12-28 10:04:04','2023-12-28 10:04:04'),(25,40,'Contact Update','SettingsController@update',1,'2023-12-28 10:05:06','2023-12-28 10:05:06'),(26,41,'Social Update','SettingsController@update',1,'2023-12-28 10:06:31','2023-12-28 10:06:31'),(28,53,'Listing','StaffController@index',1,'2023-12-28 10:08:55','2023-12-28 10:08:55'),(29,53,'Change Status','StaffController@changeStatus',1,'2023-12-28 10:09:08','2023-12-28 10:09:08'),(30,53,'Delete','StaffController@destroy',1,'2023-12-28 10:09:21','2023-12-28 10:09:21'),(31,53,'Add','StaffController@create',1,'2023-12-28 10:09:34','2023-12-28 10:09:34'),(32,53,'View','StaffController@show',1,'2023-12-28 10:09:46','2023-12-28 10:09:46'),(33,53,'Changed Password','StaffController@changedPassword',1,'2023-12-28 10:10:00','2023-12-28 10:10:00'),(34,54,'Add','DesignationsController@add',1,'2023-12-28 10:12:11','2023-12-28 10:12:11'),(35,54,'Listing','DesignationsController@index',1,'2023-12-28 10:12:23','2023-12-28 10:12:23'),(36,54,'Change Status','DesignationsController@changeStatus',1,'2023-12-28 10:12:35','2023-12-28 10:12:35'),(37,54,'Delete','DesignationsController@delete',1,'2023-12-28 10:12:48','2023-12-28 10:12:48');
/*!40000 ALTER TABLE `acl_admin_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls`
--

DROP TABLE IF EXISTS `acls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `icon` text DEFAULT NULL,
  `module_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls`
--

LOCK TABLES `acls` WRITE;
/*!40000 ALTER TABLE `acls` DISABLE KEYS */;
INSERT INTO `acls` VALUES (1,0,'Dashboard','adminpnlx/dashboard','<span class=\"svg-icon menu-icon\">\r\n                        <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg--><svg\r\n                        xmlns=\"http://www.w3.org/2000/svg\"\r\n                        xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\"\r\n                        viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                        <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                            <polygon points=\"0 0 24 0 24 24 0 24\" />\r\n                            <path\r\n                            d=\"M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z\"\r\n                            fill=\"#000000\" fill-rule=\"nonzero\" />\r\n                            <path\r\n                            d=\"M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z\"\r\n                            fill=\"#000000\" opacity=\"0.3\" />\r\n                        </g>\r\n                    </svg>\r\n                    <!--end::Svg Icon-->\r\n                        </span>',1,1,'2023-09-19 09:06:49','2023-09-20 01:29:11'),(2,0,'Users','javascript::void();','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <polygon points=\"0 0 24 0 24 24 0 24\" />\r\n                                                <path d=\"M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z\" fill=\"#000000\" fill-rule=\"nonzero\" opacity=\"0.3\" />\r\n                                                <path d=\"M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z\" fill=\"#000000\" fill-rule=\"nonzero\" />\r\n                                            </g>\r\n                                        </svg>',2,1,'2023-09-19 09:10:21','2023-09-19 07:54:53'),(6,0,'System Management','javascript::void();','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" />\r\n                                                <path d=\"M5.5,2 L18.5,2 C19.3284271,2 20,2.67157288 20,3.5 L20,6.5 C20,7.32842712 19.3284271,8 18.5,8 L5.5,8 C4.67157288,8 4,7.32842712 4,6.5 L4,3.5 C4,2.67157288 4.67157288,2 5.5,2 Z M11,4 C10.4477153,4 10,4.44771525 10,5 C10,5.55228475 10.4477153,6 11,6 L13,6 C13.5522847,6 14,5.55228475 14,5 C14,4.44771525 13.5522847,4 13,4 L11,4 Z\" fill=\"#000000\" opacity=\"0.3\" />\r\n                                                <path d=\"M5.5,9 L18.5,9 C19.3284271,9 20,9.67157288 20,10.5 L20,13.5 C20,14.3284271 19.3284271,15 18.5,15 L5.5,15 C4.67157288,15 4,14.3284271 4,13.5 L4,10.5 C4,9.67157288 4.67157288,9 5.5,9 Z M11,11 C10.4477153,11 10,11.4477153 10,12 C10,12.5522847 10.4477153,13 11,13 L13,13 C13.5522847,13 14,12.5522847 14,12 C14,11.4477153 13.5522847,11 13,11 L11,11 Z M5.5,16 L18.5,16 C19.3284271,16 20,16.6715729 20,17.5 L20,20.5 C20,21.3284271 19.3284271,22 18.5,22 L5.5,22 C4.67157288,22 4,21.3284271 4,20.5 L4,17.5 C4,16.6715729 4.67157288,16 5.5,16 Z M11,18 C10.4477153,18 10,18.4477153 10,19 C10,19.5522847 10.4477153,20 11,20 L13,20 C13.5522847,20 14,19.5522847 14,19 C14,18.4477153 13.5522847,18 13,18 L11,18 Z\" fill=\"#000000\" />\r\n                                            </g>\r\n                                        </svg>',16,1,'2023-09-19 03:39:58','2023-09-19 03:39:58'),(7,6,'Cms Pages','adminpnlx/cms-manager',NULL,17,1,'2023-09-19 03:40:54','2023-09-19 03:45:21'),(8,6,'Faq\'s','adminpnlx/faqs',NULL,18,1,'2023-09-19 03:41:45','2023-09-19 05:30:28'),(9,6,'Email Templates','adminpnlx/email-templates',NULL,19,1,'2023-09-19 03:51:07','2023-09-19 04:31:23'),(10,6,'Email Logs','adminpnlx/email-logs',NULL,20,1,'2023-09-19 03:54:08','2023-09-19 04:31:01'),(11,0,'Settings','javascript::void()','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" />\r\n                                                <path d=\"M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z\" fill=\"#000000\" />\r\n                                            </g>\r\n                                        </svg>',22,1,'2023-09-19 03:55:55','2023-09-20 01:30:36'),(14,11,'Reading Setting','adminpnlx/settings/prefix/Reading',NULL,24,1,'2023-09-20 01:31:32','2023-09-19 09:41:18'),(15,11,'Site Setting','adminpnlx/settings/prefix/Site',NULL,23,1,'2023-09-20 01:32:46','2023-09-19 09:41:24'),(40,11,'Contact Us','adminpnlx/settings/prefix/Contact',NULL,25,1,'2023-09-19 09:37:55','2023-09-19 02:35:59'),(41,11,'Social Setting','adminpnlx/settings/prefix/Social',NULL,17,1,'2023-09-19 09:38:30','2023-09-19 09:38:30'),(44,2,'Customers','adminpnlx/customers',NULL,1,1,'2023-09-19 02:07:57','2023-12-05 00:23:11'),(52,0,'Staff Management','javascript::void();','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" />\r\n                                                <path d=\"M9,15 L7.5,15 C6.67157288,15 6,15.6715729 6,16.5 C6,17.3284271 6.67157288,18 7.5,18 C8.32842712,18 9,17.3284271 9,16.5 L9,15 Z M9,15 L9,9 L15,9 L15,15 L9,15 Z M15,16.5 C15,17.3284271 15.6715729,18 16.5,18 C17.3284271,18 18,17.3284271 18,16.5 C18,15.6715729 17.3284271,15 16.5,15 L15,15 L15,16.5 Z M16.5,9 C17.3284271,9 18,8.32842712 18,7.5 C18,6.67157288 17.3284271,6 16.5,6 C15.6715729,6 15,6.67157288 15,7.5 L15,9 L16.5,9 Z M9,7.5 C9,6.67157288 8.32842712,6 7.5,6 C6.67157288,6 6,6.67157288 6,7.5 C6,8.32842712 6.67157288,9 7.5,9 L9,9 L9,7.5 Z M11,13 L13,13 L13,11 L11,11 L11,13 Z M13,11 L13,7.5 C13,5.56700338 14.5670034,4 16.5,4 C18.4329966,4 20,5.56700338 20,7.5 C20,9.43299662 18.4329966,11 16.5,11 L13,11 Z M16.5,13 C18.4329966,13 20,14.5670034 20,16.5 C20,18.4329966 18.4329966,20 16.5,20 C14.5670034,20 13,18.4329966 13,16.5 L13,13 L16.5,13 Z M11,16.5 C11,18.4329966 9.43299662,20 7.5,20 C5.56700338,20 4,18.4329966 4,16.5 C4,14.5670034 5.56700338,13 7.5,13 L11,13 L11,16.5 Z M7.5,11 C5.56700338,11 4,9.43299662 4,7.5 C4,5.56700338 5.56700338,4 7.5,4 C9.43299662,4 11,5.56700338 11,7.5 L11,11 L7.5,11 Z\" fill=\"#000000\" fill-rule=\"nonzero\" />\r\n                                            </g>\r\n                                        </svg>',8,0,'2023-10-26 07:00:28','2025-12-19 15:51:01'),(53,52,'Staff','adminpnlx/staff',NULL,1,1,'2023-10-26 07:01:23','2023-10-26 11:03:22'),(54,52,'Roles','adminpnlx/designations',NULL,2,1,'2023-10-26 09:55:07','2023-10-26 09:55:07'),(56,0,'Temples','adminpnlx/temples','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" />\r\n                                                <path d=\"M9,15 L7.5,15 C6.67157288,15 6,15.6715729 6,16.5 C6,17.3284271 6.67157288,18 7.5,18 C8.32842712,18 9,17.3284271 9,16.5 L9,15 Z M9,15 L9,9 L15,9 L15,15 L9,15 Z M15,16.5 C15,17.3284271 15.6715729,18 16.5,18 C17.3284271,18 18,17.3284271 18,16.5 C18,15.6715729 17.3284271,15 16.5,15 L15,15 L15,16.5 Z M16.5,9 C17.3284271,9 18,8.32842712 18,7.5 C18,6.67157288 17.3284271,6 16.5,6 C15.6715729,6 15,6.67157288 15,7.5 L15,9 L16.5,9 Z M9,7.5 C9,6.67157288 8.32842712,6 7.5,6 C6.67157288,6 6,6.67157288 6,7.5 C6,8.32842712 6.67157288,9 7.5,9 L9,9 L9,7.5 Z M11,13 L13,13 L13,11 L11,11 L11,13 Z M13,11 L13,7.5 C13,5.56700338 14.5670034,4 16.5,4 C18.4329966,4 20,5.56700338 20,7.5 C20,9.43299662 18.4329966,11 16.5,11 L13,11 Z M16.5,13 C18.4329966,13 20,14.5670034 20,16.5 C20,18.4329966 18.4329966,20 16.5,20 C14.5670034,20 13,18.4329966 13,16.5 L13,13 L16.5,13 Z M11,16.5 C11,18.4329966 9.43299662,20 7.5,20 C5.56700338,20 4,18.4329966 4,16.5 C4,14.5670034 5.56700338,13 7.5,13 L11,13 L11,16.5 Z M7.5,11 C5.56700338,11 4,9.43299662 4,7.5 C4,5.56700338 5.56700338,4 7.5,4 C9.43299662,4 11,5.56700338 11,7.5 L11,11 L7.5,11 Z\" fill=\"#000000\" fill-rule=\"nonzero\" />\r\n                                            </g>\r\n                                        </svg>',3,1,'2025-08-30 09:46:14','2025-08-30 09:46:14'),(57,0,'Festivals','adminpnlx/festivals','<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"24px\" height=\"24px\" viewBox=\"0 0 24 24\" version=\"1.1\">\r\n                                            <g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\r\n                                                <rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" />\r\n                                                <path d=\"M9,15 L7.5,15 C6.67157288,15 6,15.6715729 6,16.5 C6,17.3284271 6.67157288,18 7.5,18 C8.32842712,18 9,17.3284271 9,16.5 L9,15 Z M9,15 L9,9 L15,9 L15,15 L9,15 Z M15,16.5 C15,17.3284271 15.6715729,18 16.5,18 C17.3284271,18 18,17.3284271 18,16.5 C18,15.6715729 17.3284271,15 16.5,15 L15,15 L15,16.5 Z M16.5,9 C17.3284271,9 18,8.32842712 18,7.5 C18,6.67157288 17.3284271,6 16.5,6 C15.6715729,6 15,6.67157288 15,7.5 L15,9 L16.5,9 Z M9,7.5 C9,6.67157288 8.32842712,6 7.5,6 C6.67157288,6 6,6.67157288 6,7.5 C6,8.32842712 6.67157288,9 7.5,9 L9,9 L9,7.5 Z M11,13 L13,13 L13,11 L11,11 L11,13 Z M13,11 L13,7.5 C13,5.56700338 14.5670034,4 16.5,4 C18.4329966,4 20,5.56700338 20,7.5 C20,9.43299662 18.4329966,11 16.5,11 L13,11 Z M16.5,13 C18.4329966,13 20,14.5670034 20,16.5 C20,18.4329966 18.4329966,20 16.5,20 C14.5670034,20 13,18.4329966 13,16.5 L13,13 L16.5,13 Z M11,16.5 C11,18.4329966 9.43299662,20 7.5,20 C5.56700338,20 4,18.4329966 4,16.5 C4,14.5670034 5.56700338,13 7.5,13 L11,13 L11,16.5 Z M7.5,11 C5.56700338,11 4,9.43299662 4,7.5 C4,5.56700338 5.56700338,4 7.5,4 C9.43299662,4 11,5.56700338 11,7.5 L11,11 L7.5,11 Z\" fill=\"#000000\" fill-rule=\"nonzero\" />\r\n                                            </g>\r\n                                        </svg>',4,1,'2025-08-30 10:12:20','2025-08-30 10:12:49'),(58,0,'Tip of the Day','adminpnlx/tiptaps','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"800px\" height=\"800px\" viewBox=\"0 0 1024 1024\" class=\"icon\" version=\"1.1\"><path d=\"M566 268.4v66.3H353.9v-66.3h-66.3v-79.5h357.9v79.5H566z\" fill=\"#FFFFFF\"/><path d=\"M558.5 319.2l98.7 86.4c72.6 50.6 115.8 133.5 115.8 222 0 88-63.7 163-150.5 177.4-55 9.1-110.1 13.6-165.1 13.6s-110.1-4.5-165.1-13.6c-86.8-14.3-150.5-89.4-150.5-177.4 0-88.5 43.3-171.3 115.8-221.9l113.7-86.4h187.2z\" fill=\"#FFFFFF\"/><path d=\"M457.4 845.1c-56.2 0-113.2-4.7-169.4-14C188 814.6 115.3 729 115.3 627.6c0-97.1 47.5-188.2 127.2-243.7l119.9-91.2h206l105.1 92c78.9 55.6 126 146.2 126 242.8 0 101.4-72.6 187-172.7 203.5-56.1 9.4-113.1 14.1-169.4 14.1z m-77.2-499.4l-106.5 81c-66.3 46.2-105.4 121.1-105.4 200.8 0 75.3 54 138.9 128.3 151.2 106.7 17.6 214.9 17.6 321.6 0 74.3-12.3 128.3-75.9 128.3-151.2 0-79.7-39.1-154.6-104.5-200.2l-2.3-1.8-91.2-79.8H380.2z\" fill=\"#333333\"/><path d=\"M354 305l-66.7-57.3c-13.8-8.9-21-22.7-20.7-36.7m395.1 0.1c0 14.7-8.3 28.4-22.1 36.5L561.9 308\" fill=\"#FFFFFF\"/><path d=\"M561.9 334.5c-7.9 0-15.7-3.5-21-10.3-9-11.6-6.9-28.2 4.7-37.2l80.5-62.2c5.7-3.3 9-8.5 9-13.7 0-14.6 11.9-26.5 26.5-26.5s26.5 11.9 26.5 26.5c0 23.6-12.5 45.3-33.6 58.4l-76.6 59.4c-4.6 3.8-10.3 5.6-16 5.6z m-208-3c-6.1 0-12.3-2.1-17.3-6.4l-65.4-56.3c-20-13.6-31.6-35.3-31.2-58.4 0.3-14.6 12.8-26.4 27-26 14.6 0.3 26.3 12.4 26 27-0.1 5.3 3 10.4 8.5 13.9l2.9 2.2 66.7 57.3c11.1 9.5 12.4 26.3 2.8 37.4-5.1 6.2-12.5 9.3-20 9.3z\" fill=\"#333333\"/><path d=\"M365.4 229.3c-14.6 0-26.5-11.9-26.5-26.5 0-6.6-9.8-13.9-22.9-13.9s-22.9 7.4-22.9 13.9c0 14.6-11.9 26.5-26.5 26.5s-26.5-11.9-26.5-26.5c0-36.9 34-67 75.9-67s75.9 30 75.9 67c0 14.7-11.9 26.5-26.5 26.5zM562.9 229.3c-14.6 0-26.5-11.9-26.5-26.5 0-6.6-9.8-13.9-22.9-13.9-13.1 0-22.9 7.4-22.9 13.9 0 14.6-11.9 26.5-26.5 26.5s-26.5-11.9-26.5-26.5c0-36.9 34.1-67 75.9-67s75.9 30 75.9 67c0.1 14.7-11.8 26.5-26.5 26.5z\" fill=\"#333333\"/><path d=\"M661.7 229.3c-14.6 0-26.5-11.9-26.5-26.5 0-6.6-9.8-13.9-22.9-13.9s-22.9 7.4-22.9 13.9c0 14.6-11.9 26.5-26.5 26.5s-26.5-11.8-26.5-26.5c0-36.9 34-67 75.9-67s75.9 30 75.9 67c0 14.7-11.8 26.5-26.5 26.5zM464.2 229.3c-14.6 0-26.5-11.9-26.5-26.5 0-6.6-9.8-13.9-22.9-13.9s-22.9 7.4-22.9 13.9c0 14.6-11.9 26.5-26.5 26.5s-26.5-11.9-26.5-26.5c0-36.9 34-67 75.9-67s75.9 30 75.9 67c0 14.7-11.9 26.5-26.5 26.5z\" fill=\"#333333\"/><path d=\"M679.1 621.5m-205.1 0a205.1 205.1 0 1 0 410.2 0 205.1 205.1 0 1 0-410.2 0Z\" fill=\"#FFDB5B\"/><path d=\"M679.1 853.1c-127.7 0-231.6-103.9-231.6-231.6 0-127.7 103.9-231.6 231.6-231.6s231.6 103.9 231.6 231.6c0 127.7-103.9 231.6-231.6 231.6z m0-410.2C580.6 442.9 500.4 523 500.4 621.5S580.5 800.1 679 800.1 857.7 720 857.7 621.5s-80.2-178.6-178.6-178.6z\" fill=\"#333333\"/><path d=\"M720.47 621.453l-41.436 41.436-41.437-41.436 41.436-41.437z\" fill=\"#FFFFFF\"/><path d=\"M679.079 737.919l-116.46-116.46 116.46-116.461 116.46 116.46-116.46 116.46z m-41.508-116.46l41.437 41.436 41.436-41.437-41.436-41.436-41.437 41.436z\" fill=\"#333333\"/><path d=\"M591.6 302.3l76-20.4c14.1-3.8 28.7 4.6 32.5 18.7 3.8 14.1-4.6 28.7-18.7 32.5l-76 20.4c-14.1 3.8-28.7-4.6-32.5-18.7-3.8-14.2 4.6-28.7 18.7-32.5z\" fill=\"#333333\"/></svg>',6,1,'2025-12-11 17:06:06','2025-12-16 17:29:32'),(59,0,'User Notification','adminpnlx/user-notifications','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#000000\" width=\"800px\" height=\"800px\" viewBox=\"0 0 24 24\"><path d=\"M10,20h4a2,2,0,0,1-4,0Zm8-4V10a6,6,0,0,0-5-5.91V3a1,1,0,0,0-2,0V4.09A6,6,0,0,0,6,10v6L4,18H20Z\"/></svg>',7,1,'2025-12-12 07:23:57','2025-12-12 07:23:57');
/*!40000 ALTER TABLE `acls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_descriptions`
--

DROP TABLE IF EXISTS `acls_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acls_descriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `acls_descriptions_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `acls_descriptions_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `acls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_descriptions`
--

LOCK TABLES `acls_descriptions` WRITE;
/*!40000 ALTER TABLE `acls_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_role_id` tinyint(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `forgot_password_validate_string` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `designation_id` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,1,'Admin','test123@mailinator.com','$2y$10$TiAyy.Xg4eIOTIliwaInfeJqOCVJoWlfIHAWf5Cx47Pe.ZJG7VZku',1,'77c6a3a0bf3f2f670b9f23e848e26c7d',0,NULL,NULL,NULL,'2023-10-24 11:23:56','2026-02-24 19:02:54'),(2,3,'Prakash godwani','prakash@mailinator.com','$2y$10$pcyVJqvkLaLc.VAyT0tqq.n8HRuII4CsbAexFyJF1i9QSGnHny5YW',1,NULL,1,1,NULL,NULL,'2023-12-28 11:06:27','2024-04-05 13:59:29');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_studies`
--

DROP TABLE IF EXISTS `case_studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_studies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case_study_category_id` (`category_id`),
  CONSTRAINT `case_study_category_id` FOREIGN KEY (`category_id`) REFERENCES `case_study_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_studies`
--

LOCK TABLES `case_studies` WRITE;
/*!40000 ALTER TABLE `case_studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_study_categories`
--

DROP TABLE IF EXISTS `case_study_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_study_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_study_categories`
--

LOCK TABLES `case_study_categories` WRITE;
/*!40000 ALTER TABLE `case_study_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_study_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms`
--

DROP TABLE IF EXISTS `cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms`
--

LOCK TABLES `cms` WRITE;
/*!40000 ALTER TABLE `cms` DISABLE KEYS */;
INSERT INTO `cms` VALUES (6,'privacy-policy','Privacy Policy','Privacy Policy','RemyndNow respects your privacy. We only collect limited personal information (such as name, email, phone number if provided) and usage data to improve the app. Festival and reminder data are used only for notification purposes. We never sell or misuse your data. You may request deletion anytime. For queries: support@remyndnow.com','2025-09-10 07:13:31','2025-09-10 07:13:31'),(7,'term-conditions','Terms & Conditions','Terms & Conditions','By using RemyndNow, you agree to these terms. Use the app responsibly and for lawful purposes only. All app content belongs to RemyndNow and cannot be copied. RemyndNow is not liable for incorrect or missed reminders. Continued use means you accept updated terms.','2025-09-10 07:26:08','2025-09-10 07:26:08'),(8,'about-us','About Us','About Us','RemyndNow is a simple and powerful app created by devoted believers to help you remember important religious festivals and auspicious days. It ensures you never miss spiritually significant occasions and stay connected with your faith. Choose your favorite festivals, get timely reminders, and learn their importance. Stay spiritually engaged wherever you are.','2025-09-10 07:28:17','2025-09-10 07:28:17');
/*!40000 ALTER TABLE `cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_descriptions`
--

DROP TABLE IF EXISTS `cms_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_descriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `cms_descriptions_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `cms` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cms_descriptions_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_descriptions`
--

LOCK TABLES `cms_descriptions` WRITE;
/*!40000 ALTER TABLE `cms_descriptions` DISABLE KEYS */;
INSERT INTO `cms_descriptions` VALUES (27,6,1,'Privacy Policy','Privacy Policy ΓÇô RemyndNow\r\nRemyndNow respects your privacy. We only collect limited personal information (such as name, email, phone number if provided) and usage data to improve the app. Festival and reminder data are used only for notification purposes. We never sell or misuse your data. You may request deletion anytime. For queries: support@remyndnow.com','2025-09-10 07:13:31','2025-09-10 07:13:31'),(28,6,5,'αñùαÑïαñ¬αñ¿αÑÇαñ»αññαñ╛ αñ¿αÑÇαññαñ┐','RemyndNow αñåαñ¬αñòαÑÇ αñùαÑïαñ¬αñ¿αÑÇαñ»αññαñ╛ αñòαñ╛ αñ╕αñ«αÑìαñ«αñ╛αñ¿ αñòαñ░αññαñ╛ αñ╣αÑêαÑñ αñ╣αñ« αñòαÑçαñ╡αñ▓ αñ╕αÑÇαñ«αñ┐αññ αñ╡αÑìαñ»αñòαÑìαññαñ┐αñùαññ αñ£αñ╛αñ¿αñòαñ╛αñ░αÑÇ (αñ£αÑêαñ╕αÑç αñ¿αñ╛αñ«, αñêαñ«αÑçαñ▓, αñ½αñ╝αÑïαñ¿ αñ¿αñéαñ¼αñ░ αñ»αñªαñ┐ αñåαñ¬ αñªαÑçαññαÑç αñ╣αÑêαñé) αñöαñ░ αñëαñ¬αñ»αÑïαñù αñíαÑçαñƒαñ╛ αñÅαñòαññαÑìαñ░ αñòαñ░αññαÑç αñ╣αÑêαñé αññαñ╛αñòαñ┐ αñÉαñ¬ αñòαÑï αñ¼αÑçαñ╣αññαñ░ αñ¼αñ¿αñ╛αñ»αñ╛ αñ£αñ╛ αñ╕αñòαÑçαÑñ αññαÑìαñ»αÑïαñ╣αñ╛αñ░ αñöαñ░ αñ░αñ┐αñ«αñ╛αñçαñéαñíαñ░ αñ╕αÑç αñ£αÑüαñíαñ╝αñ╛ αñíαÑçαñƒαñ╛ αñòαÑçαñ╡αñ▓ αñ¿αÑïαñƒαñ┐αñ½αñ┐αñòαÑçαñ╢αñ¿ αñªαÑçαñ¿αÑç αñòαÑç αñ▓αñ┐αñÅ αñëαñ¬αñ»αÑïαñù αñ╣αÑïαññαñ╛ αñ╣αÑêαÑñ αñ╣αñ« αñòαñ¡αÑÇ αñ¡αÑÇ αñåαñ¬αñòαñ╛ αñíαÑçαñƒαñ╛ αñ¼αÑçαñÜαññαÑç αñ»αñ╛ αñªαÑüαñ░αÑüαñ¬αñ»αÑïαñù αñ¿αñ╣αÑÇαñé αñòαñ░αññαÑçαÑñ αñåαñ¬ αñòαñ┐αñ╕αÑÇ αñ¡αÑÇ αñ╕αñ«αñ» αñíαÑçαñƒαñ╛ αñ╣αñƒαñ╛αñ¿αÑç αñòαñ╛ αñàαñ¿αÑüαñ░αÑïαñº αñòαñ░ αñ╕αñòαññαÑç αñ╣αÑêαñéαÑñ αñ╕αñ╡αñ╛αñ▓αÑïαñé αñòαÑç αñ▓αñ┐αñÅ: support@remyndnow.com','2025-09-10 07:13:31','2025-09-10 07:13:31'),(29,6,6,'α«ñα«⌐α«┐α«»α»üα«░α«┐α««α»êα«òα»ì α«òα»èα«│α»ìα«òα»ê','RemyndNow α«ëα«Öα»ìα«òα«│α»ì α«ñα«⌐α«┐α«»α»üα«░α«┐α««α»êα«»α»ê α««α«ñα«┐α«òα»ìα«òα«┐α«▒α«ñα»ü. α«¿α«╛α«Öα»ìα«òα«│α»ì α«╡α«░α»êα«»α«▒α»üα«òα»ìα«òα«¬α»ìα«¬α«ƒα»ìα«ƒ α«ñα«⌐α«┐α«¬α»ìα«¬α«ƒα»ìα«ƒ α«ñα«òα«╡α«▓α»ìα«òα«│α»ê (α«¬α»åα«»α«░α»ì, α««α«┐α«⌐α»ìα«⌐α«₧α»ìα«Üα«▓α»ì, α«ñα»èα«▓α»êα«¬α»çα«Üα«┐ α«Äα«úα»ì ΓÇô α«¿α»Çα«Öα»ìα«òα«│α»ì α«╡α«┤α«Öα»ìα«òα«┐α«⌐α«╛α«▓α»ì) α««α«▒α»ìα«▒α»üα««α»ì α«¬α«»α«⌐α»ìα«¬α«╛α«ƒα»ìα«ƒα»ü α«ñα«░α«╡α»üα«òα«│α»ê α««α«ƒα»ìα«ƒα»üα««α»ç α«Üα»çα«òα«░α«┐α«òα»ìα«òα«┐α«▒α»ïα««α»ì. α«¬α«úα»ìα«ƒα«┐α«òα»êα«òα«│α»ì α««α«▒α»ìα«▒α»üα««α»ì α«¿α«┐α«⌐α»êα«╡α»éα«ƒα»ìα«ƒα«▓α»ìα«òα«│α»ì α«ñα»èα«ƒα«░α»ìα«¬α«╛α«⌐ α«ñα«òα«╡α«▓α»ì α«àα«▒α«┐α«╡α«┐α«¬α»ìα«¬α»üα«òα«│α»üα«òα»ìα«òα«╛α«ò α««α«ƒα»ìα«ƒα»üα««α»ç α«¬α«»α«⌐α»ìα«¬α«ƒα»üα«ñα»ìα«ñα«¬α»ìα«¬α«ƒα»üα««α»ì. α«¿α«╛α«Öα»ìα«òα«│α»ì α«ëα«Öα»ìα«òα«│α»ì α«ñα«░α«╡α»ê α«Æα«░α»üα«¬α»ïα«ñα»üα««α»ì α«╡α«┐α«▒α»ìα«òα«╡α«┐α«▓α»ìα«▓α»ê α«àα«▓α»ìα«▓α«ñα»ü α«ñα«╡α«▒α«╛α«ò α«¬α«»α«⌐α»ìα«¬α«ƒα»üα«ñα»ìα«ñα«╡α«┐α«▓α»ìα«▓α»ê. α«¿α»Çα«Öα»ìα«òα«│α»ì α«Äα«¬α»ìα«¬α»ïα«ñα»ü α«╡α»çα«úα»ìα«ƒα»üα««α«╛α«⌐α«╛α«▓α»üα««α»ì α«ëα«Öα»ìα«òα«│α»ì α«ñα«░α«╡α»ê α«¿α»Çα«òα»ìα«òα«òα»ì α«òα»ïα«░α«▓α«╛α««α»ì. α«òα»çα«│α»ìα«╡α«┐α«òα«│α»üα«òα»ìα«òα»ü: support@remyndnow.com','2025-09-10 07:13:31','2025-09-10 07:13:31'),(30,6,7,'α░¬α▒ìα░░α▒êα░╡α░╕α▒Ç α░¬α░╛α░▓α░╕α▒Ç','RemyndNow α░«α▒Ç α░ùα▒ïα░¬α▒ìα░»α░ñα░¿α▒ü α░ùα▒îα░░α░╡α░┐α░╕α▒ìα░ñα▒üα░éα░ªα░┐. α░«α▒çα░«α▒ü α░¬α░░α░┐α░«α░┐α░ñ α░╡α▒ìα░»α░òα▒ìα░ñα░┐α░ùα░ñ α░╕α░«α░╛α░Üα░╛α░░α░é (α░¬α▒çα░░α▒ü, α░çα░«α▒åα░»α░┐α░▓α▒ì, α░½α▒ïα░¿α▒ì α░¿α░éα░¼α░░α▒ì ΓÇô α░«α▒Çα░░α▒ü α░çα░╕α▒ìα░ñα▒ç) α░«α░░α░┐α░»α▒ü α░╡α░┐α░¿α░┐α░»α▒ïα░ù α░íα▒çα░ƒα░╛α░¿α▒ü α░«α░╛α░ñα▒ìα░░α░«α▒ç α░╕α▒çα░òα░░α░┐α░╕α▒ìα░ñα░╛α░«α▒ü. α░¬α░éα░íα▒üα░ùα░▓α▒ü α░«α░░α░┐α░»α▒ü α░░α░┐α░«α▒êα░éα░íα░░α▒ìα░▓ α░╕α░«α░╛α░Üα░╛α░░α░é α░òα▒çα░╡α░▓α░é α░¿α▒ïα░ƒα░┐α░½α░┐α░òα▒çα░╖α░¿α▒ìα░▓ α░òα▒ïα░╕α░é α░«α░╛α░ñα▒ìα░░α░«α▒ç α░ëα░¬α░»α▒ïα░ùα░┐α░éα░Üα░¼α░íα▒üα░ñα▒üα░éα░ªα░┐. α░«α▒çα░«α▒ü α░Äα░¬α▒ìα░¬α░ƒα░┐α░òα▒Ç α░«α▒Ç α░íα▒çα░ƒα░╛α░¿α▒ü α░àα░«α▒ìα░«α░«α▒ü α░▓α▒çα░ªα░╛ α░ªα▒üα░░α▒ìα░╡α░┐α░¿α░┐α░»α▒ïα░ùα░é α░Üα▒çα░»α░«α▒ü. α░«α▒Çα░░α▒ü α░Äα░¬α▒ìα░¬α▒üα░íα▒êα░¿α░╛ α░«α▒Ç α░íα▒çα░ƒα░╛ α░ñα▒èα░▓α░ùα░┐α░éα░¬α▒üα░¿α▒ü α░àα░¡α▒ìα░»α░░α▒ìα░Ñα░┐α░éα░Üα░╡α░Üα▒ìα░Üα▒ü. α░¬α▒ìα░░α░╢α▒ìα░¿α░▓ α░òα▒ïα░╕α░é: support@remyndnow.com','2025-09-10 07:13:31','2025-09-10 07:13:31'),(31,7,1,'Terms & Conditions','By using RemyndNow, you agree to these terms. Use the app responsibly and for lawful purposes only. All app content belongs to RemyndNow and cannot be copied. RemyndNow is not liable for incorrect or missed reminders. Continued use means you accept updated terms.','2025-09-10 07:26:08','2025-09-10 07:26:08'),(32,7,5,'αñ¿αñ┐αñ»αñ« αñöαñ░ αñ╢αñ░αÑìαññαÑçαñé','RemyndNow αñòαñ╛ αñëαñ¬αñ»αÑïαñù αñòαñ░αñòαÑç αñåαñ¬ αñçαñ¿ αñ¿αñ┐αñ»αñ«αÑïαñé αñòαÑï αñ╕αÑìαñ╡αÑÇαñòαñ╛αñ░ αñòαñ░αññαÑç αñ╣αÑêαñéαÑñ αñÉαñ¬ αñòαñ╛ αñëαñ¬αñ»αÑïαñù αñòαÑçαñ╡αñ▓ αñ£αñ┐αñ«αÑìαñ«αÑçαñªαñ╛αñ░αÑÇ αñöαñ░ αñòαñ╛αñ¿αÑéαñ¿αÑÇ αñ░αÑéαñ¬ αñ╕αÑç αñòαñ░αÑçαñéαÑñ αñÉαñ¬ αñòαÑÇ αñ╕αñ¡αÑÇ αñ╕αñ╛αñ«αñùαÑìαñ░αÑÇ RemyndNow αñòαÑÇ αñ╕αñéαñ¬αññαÑìαññαñ┐ αñ╣αÑê αñöαñ░ αñòαÑëαñ¬αÑÇ αñ¿αñ╣αÑÇαñé αñòαÑÇ αñ£αñ╛ αñ╕αñòαññαÑÇαÑñ αñùαñ▓αññ αñ»αñ╛ αñ¢αÑéαñƒαÑÇ αñ╣αÑüαñê αñ░αñ┐αñ«αñ╛αñçαñéαñíαñ░ αñòαÑç αñ▓αñ┐αñÅ αñ╣αñ« αñ£αñ┐αñ«αÑìαñ«αÑçαñªαñ╛αñ░ αñ¿αñ╣αÑÇαñé αñ╣αÑêαñéαÑñ αñÉαñ¬ αñòαñ╛ αñ▓αñùαñ╛αññαñ╛αñ░ αñëαñ¬αñ»αÑïαñù αñòαñ░αñ¿αñ╛ αñàαñ¬αñíαÑçαñƒαÑçαñí αñ¿αñ┐αñ»αñ«αÑïαñé αñòαÑï αñ╕αÑìαñ╡αÑÇαñòαñ╛αñ░ αñòαñ░αñ¿αñ╛ αñ╣αÑêαÑñ','2025-09-10 07:26:08','2025-09-10 07:26:08'),(33,7,6,'α«╡α«┐α«ñα«┐α««α»üα«▒α»êα«òα«│α»ì & α«¿α«┐α«¬α«¿α»ìα«ñα«⌐α»êα«òα«│α»ì','RemyndNow α«É α«¬α«»α«⌐α»ìα«¬α«ƒα»üα«ñα»ìα«ñα»üα«╡α«ñα»ü α««α»éα«▓α««α»ì α«¿α»Çα«Öα»ìα«òα«│α»ì α«çα«¿α»ìα«ñ α«╡α«┐α«ñα«┐α««α»üα«▒α»êα«òα«│α»ê α«Åα«▒α»ìα«òα«┐α«⌐α»ìα«▒α»Çα«░α»ìα«òα«│α»ì. α«Üα»åα«»α«▓α«┐α«»α»ê α«¬α»èα«▒α»üα«¬α»ìα«¬α»üα«ƒα«⌐α»ì α««α«▒α»ìα«▒α»üα««α»ì α«Üα«ƒα»ìα«ƒα«¬α»ìα«¬α«ƒα«┐ α«¬α«»α«⌐α»ìα«¬α«ƒα»üα«ñα»ìα«ñα«╡α»üα««α»ì. α«Üα»åα«»α«▓α«┐α«»α«┐α«⌐α»ì α«àα«⌐α»êα«ñα»ìα«ñα»ü α«ëα«│α»ìα«│α«ƒα«òα»ìα«òα««α»üα««α»ì RemyndNow-α«òα»ìα«òα»ü α«Üα»èα«¿α»ìα«ñα««α»ì α««α«▒α»ìα«▒α»üα««α»ì α«¿α«òα«▓α»ì α«Äα«ƒα»üα«òα»ìα«ò α«òα»éα«ƒα«╛α«ñα»ü. α«ñα«╡α«▒α«╛α«⌐ α«àα«▓α»ìα«▓α«ñα»ü α«ñα«╡α«▒α«┐α«» α«¿α«┐α«⌐α»êα«╡α»éα«ƒα»ìα«ƒα«▓α»üα«òα»ìα«òα»ü α«¿α«╛α«Öα»ìα«òα«│α»ì α«¬α»èα«▒α»üα«¬α»ìα«¬α«▓α»ìα«▓. α«Üα»åα«»α«▓α«┐α«»α»ê α«ñα»èα«ƒα«░α»ìα«¿α»ìα«ñα»üα««α»ì α«¬α«»α«⌐α»ìα«¬α«ƒα»üα«ñα»ìα«ñα»üα«╡α«ñα»ü α«¬α»üα«ñα»üα«¬α»ìα«¬α«┐α«òα»ìα«òα«¬α»ìα«¬α«ƒα»ìα«ƒ α«╡α«┐α«ñα«┐α««α»üα«▒α»êα«òα«│α»ê α«Åα«▒α»ìα«òα»üα««α»ì α«¬α»èα«░α»üα«│α»ì.','2025-09-10 07:26:08','2025-09-10 07:26:08'),(34,7,7,'α░¿α░┐α░»α░«α░╛α░▓α▒ü & α░╖α░░α░ñα▒üα░▓α▒ü','RemyndNow α░ëα░¬α░»α▒ïα░ùα░┐α░éα░Üα░íα░é α░ªα▒ìα░╡α░╛α░░α░╛ α░«α▒Çα░░α▒ü α░ê α░╖α░░α░ñα▒üα░▓α░¿α▒ü α░àα░éα░ùα▒Çα░òα░░α░┐α░╕α▒ìα░ñα░╛α░░α▒ü. α░»α░╛α░¬α▒ìΓÇîα░¿α▒ü α░òα▒çα░╡α░▓α░é α░Üα░ƒα▒ìα░ƒα░¼α░ªα▒ìα░ºα░éα░ùα░╛ α░«α░░α░┐α░»α▒ü α░£α░╡α░╛α░¼α▒üα░ªα░╛α░░α▒Çα░ñα▒ìα░╡α░éα░ñα▒ï α░ëα░¬α░»α▒ïα░ùα░┐α░éα░Üα░éα░íα░┐. α░»α░╛α░¬α▒ìΓÇîα░▓α▒ïα░¿α░┐ α░«α▒èα░ñα▒ìα░ñα░é α░òα░éα░ƒα▒åα░éα░ƒα▒ì RemyndNow α░òα░┐ α░Üα▒åα░éα░ªα▒üα░ñα▒üα░éα░ªα░┐ α░«α░░α░┐α░»α▒ü α░òα░╛α░¬α▒Ç α░Üα▒çα░»α░░α░╛α░ªα▒ü. α░ñα░¬α▒ìα░¬α▒ü α░▓α▒çα░ªα░╛ α░«α░┐α░╕α▒ìα░╕α░»α░┐α░¿ α░░α░┐α░«α▒êα░éα░íα░░α▒ìα░▓α░òα▒ü α░«α▒çα░«α▒ü α░¼α░╛α░ºα▒ìα░»α▒üα░▓α▒ü α░òα░╛α░ªα▒ü. α░»α░╛α░¬α▒ìΓÇîα░¿α▒ü α░òα▒èα░¿α░╕α░╛α░ùα░┐α░éα░Üα░┐ α░ëα░¬α░»α▒ïα░ùα░┐α░éα░Üα░íα░é α░àα░¬α▒ìΓÇîα░íα▒çα░ƒα▒ì α░Üα▒çα░╕α░┐α░¿ α░╖α░░α░ñα▒üα░▓α░¿α▒ü α░àα░éα░ùα▒Çα░òα░░α░┐α░éα░Üα░íα░é.','2025-09-10 07:26:08','2025-09-10 07:26:08'),(35,8,1,'About Us','RemyndNow is a simple and powerful app created by devoted believers to help you remember important religious festivals and auspicious days. It ensures you never miss spiritually significant occasions and stay connected with your faith. Choose your favorite festivals, get timely reminders, and learn their importance. Stay spiritually engaged wherever you are.','2025-09-10 07:28:17','2025-09-10 07:28:17'),(36,8,5,'About Us','RemyndNow αñÅαñò αñ╕αñ░αñ▓ αñöαñ░ αñ╢αñòαÑìαññαñ┐αñ╢αñ╛αñ▓αÑÇ αñÉαñ¬ αñ╣αÑê, αñ£αñ┐αñ╕αÑç αñ╕αñ«αñ░αÑìαñ¬αñ┐αññ αñ¡αñòαÑìαññαÑïαñé αñ¿αÑç αñ¼αñ¿αñ╛αñ»αñ╛ αñ╣αÑêαÑñ αñ»αñ╣ αñ╕αÑüαñ¿αñ┐αñ╢αÑìαñÜαñ┐αññ αñòαñ░αññαñ╛ αñ╣αÑê αñòαñ┐ αñåαñ¬ αñ«αñ╣αññαÑìαñ╡αñ¬αÑéαñ░αÑìαñú αñºαñ╛αñ░αÑìαñ«αñ┐αñò αññαÑìαñ»αÑïαñ╣αñ╛αñ░αÑïαñé αñöαñ░ αñ╢αÑüαñ¡ αñªαñ┐αñ¿αÑïαñé αñòαÑï αñòαñ¡αÑÇ αñ¿ αñ¡αÑéαñ▓αÑçαñé αñöαñ░ αñàαñ¬αñ¿αÑç αñ╡αñ┐αñ╢αÑìαñ╡αñ╛αñ╕ αñ╕αÑç αñ£αÑüαñíαñ╝αÑç αñ░αñ╣αÑçαñéαÑñ αñàαñ¬αñ¿αÑç αñ¬αñ╕αñéαñªαÑÇαñªαñ╛ αññαÑìαñ»αÑïαñ╣αñ╛αñ░ αñÜαÑüαñ¿αÑçαñé, αñ╕αñ«αñ» αñ¬αñ░ αñ░αñ┐αñ«αñ╛αñçαñéαñíαñ░ αñ¬αñ╛αñÅαñé αñöαñ░ αñëαñ¿αñòαÑç αñ«αñ╣αññαÑìαñ╡ αñòαÑï αñ£αñ╛αñ¿αÑçαñéαÑñ αñ£αñ╣αñ╛αñü αñ¡αÑÇ αñ╣αÑïαñé, αñ¡αñòαÑìαññαñ┐ αñ╕αÑç αñ£αÑüαñíαñ╝αÑç αñ░αñ╣αÑçαñéαÑñ','2025-09-10 07:28:17','2025-09-10 07:28:17'),(37,8,6,'About Us','RemyndNow α«Äα«⌐α»ìα«¬α«ñα»ü α«Äα«│α«┐α««α»êα«»α«╛α«⌐ α««α«▒α»ìα«▒α»üα««α»ì α«Üα«òα»ìα«ñα«┐α«╡α«╛α«»α»ìα«¿α»ìα«ñ α«Üα»åα«»α«▓α«┐, α«¬α«òα»ìα«ñα«░α»ìα«òα«│α«╛α«▓α»ì α«ëα«░α»üα«╡α«╛α«òα»ìα«òα«¬α»ìα«¬α«ƒα»ìα«ƒα«ñα»ü, α«çα«ñα»ü α««α»üα«òα»ìα«òα«┐α«»α««α«╛α«⌐ α««α«ñ α«¬α«úα»ìα«ƒα«┐α«òα»êα«òα«│α»ì α««α«▒α»ìα«▒α»üα««α»ì α«Üα»üα«¬ α«¿α«┐α«òα«┤α»ìα«╡α»üα«òα«│α»ê α«¿α«┐α«⌐α»êα«╡α«┐α«▓α»ì α«╡α»êα«òα»ìα«ò α«ëα«ñα«╡α»üα«òα«┐α«▒α«ñα»ü. α«çα«ñα»ü α«¿α»Çα«Öα»ìα«òα«│α»ì α«åα«⌐α»ìα««α»Çα«ò α«░α»Çα«ñα«┐α«»α«╛α«ò α««α»üα«òα»ìα«òα«┐α«»α««α«╛α«⌐ α«¿α«┐α«òα«┤α»ìα«╡α»üα«òα«│α»ê α««α«┐α«╕α»ì α«Üα»åα«»α»ìα«»α«╛α««α«▓α»ì α«çα«░α»üα«òα»ìα«ò α«ëα«ñα«╡α»üα«òα«┐α«▒α«ñα»ü. α«ëα«Öα»ìα«òα«│α»ì α«╡α«┐α«░α»üα«¬α»ìα«¬α««α«╛α«⌐ α«¬α«úα»ìα«ƒα«┐α«òα»êα«òα«│α»ê α«ñα»çα«░α»ìα«╡α»ü α«Üα»åα«»α»ìα«»α«╡α»üα««α»ì, α«¿α»çα«░α«ñα»ìα«ñα«┐α«▒α»ìα«òα»ü α«¿α«┐α«⌐α»êα«╡α»éα«ƒα»ìα«ƒα«▓α»ìα«òα«│α»ê α«¬α»åα«▒α«╡α»üα««α»ì, α«àα«╡α«▒α»ìα«▒α«┐α«⌐α»ì α««α»üα«òα»ìα«òα«┐α«»α«ñα»ìα«ñα»üα«╡α«ñα»ìα«ñα»ê α«àα«▒α«┐α«»α«╡α»üα««α»ì. α«Äα«Öα»ìα«òα»ü α«çα«░α»üα«¿α»ìα«ñα«╛α«▓α»üα««α»ì α«¬α«òα»ìα«ñα«┐α«»α»üα«ƒα«⌐α»ì α«çα«úα»êα«¿α»ìα«ñα«┐α«░α»üα«Öα»ìα«òα«│α»ì.','2025-09-10 07:28:17','2025-09-10 07:28:17'),(38,8,7,'About Us','RemyndNow α░Æα░ò α░╕α▒üα░▓α░¡α░«α▒êα░¿ α░«α░░α░┐α░»α▒ü α░╢α░òα▒ìα░ñα░┐α░╡α░éα░ñα░«α▒êα░¿ α░»α░╛α░¬α▒ì, α░¡α░òα▒ìα░ñα▒üα░▓α░Üα▒ç α░░α▒éα░¬α▒èα░éα░ªα░┐α░éα░Üα░¼α░íα░┐α░éα░ªα░┐, α░çα░ªα░┐ α░«α▒üα░ûα▒ìα░»α░«α▒êα░¿ α░«α░ñ α░¬α░éα░íα▒üα░ùα░▓α▒ü α░«α░░α░┐α░»α▒ü α░╢α▒üα░¡ α░╕α░éα░ªα░░α▒ìα░¡α░╛α░▓α░¿α▒ü α░ùα▒üα░░α▒ìα░ñα▒üα░éα░Üα▒çα░éα░ªα▒üα░òα▒ü α░╕α░╣α░╛α░»α░¬α░íα▒üα░ñα▒üα░éα░ªα░┐. α░çα░ªα░┐ α░«α▒Çα░░α▒ü α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░òα░éα░ùα░╛ α░«α▒üα░ûα▒ìα░»α░«α▒êα░¿ α░╕α░éα░ªα░░α▒ìα░¡α░╛α░▓α░¿α▒ü α░«α░░α▒ìα░Üα░┐α░¬α▒ïα░òα▒üα░éα░íα░╛ α░¿α░┐α░░α▒ìα░ºα░╛α░░α░┐α░╕α▒ìα░ñα▒üα░éα░ªα░┐. α░«α▒Ç α░çα░╖α▒ìα░ƒα░«α▒êα░¿ α░¬α░éα░íα▒üα░ùα░▓α░¿α▒ü α░Äα░éα░Üα▒üα░òα▒ïα░éα░íα░┐, α░╕α░«α░»α░╛α░¿α░┐α░òα░┐ α░░α░┐α░«α▒êα░éα░íα░░α▒ìα░▓α▒ü α░¬α▒èα░éα░ªα░éα░íα░┐ α░«α░░α░┐α░»α▒ü α░╡α░╛α░ƒα░┐ α░¬α▒ìα░░α░╛α░«α▒üα░ûα▒ìα░»α░ñ α░ñα▒åα░▓α▒üα░╕α▒üα░òα▒ïα░éα░íα░┐. α░Äα░òα▒ìα░òα░í α░ëα░¿α▒ìα░¿α░╛ α░¡α░òα▒ìα░ñα░┐α░ñα▒ï α░òα░▓α░┐α░ùα░┐α░╡α▒üα░éα░íα░éα░íα░┐.','2025-09-10 07:28:17','2025-09-10 07:28:17');
/*!40000 ALTER TABLE `cms_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `two_char_country_code` char(2) NOT NULL,
  `three_char_country_code` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG'),(2,'Aland Islands','AX','ALA'),(3,'Albania','AL','ALB'),(4,'Algeria','DZ','DZA'),(5,'American Samoa','AS','ASM'),(6,'Andorra','AD','AND'),(7,'Angola','AO','AGO'),(8,'Anguilla','AI','AIA'),(9,'Antarctica','AQ','ATA'),(10,'Antigua and Barbuda','AG','ATG'),(11,'Argentina','AR','ARG'),(12,'Armenia','AM','ARM'),(13,'Aruba','AW','ABW'),(14,'Australia','AU','AUS'),(15,'Austria','AT','AUT'),(16,'Azerbaijan','AZ','AZE'),(17,'Bahamas','BS','BHS'),(18,'Bahrain','BH','BHR'),(19,'Bangladesh','BD','BGD'),(20,'Barbados','BB','BRB'),(21,'Belarus','BY','BLR'),(22,'Belgium','BE','BEL'),(23,'Belize','BZ','BLZ'),(24,'Benin','BJ','BEN'),(25,'Bermuda','BM','BMU'),(26,'Bhutan','BT','BTN'),(27,'Bolivia','BO','BOL'),(28,'Bonaire, Sint Eustatius and Saba','BQ','BES'),(29,'Bosnia and Herzegovina','BA','BIH'),(30,'Botswana','BW','BWA'),(31,'Bouvet Island','BV','BVT'),(32,'Brazil','BR','BRA'),(33,'British Indian Ocean Territory','IO','IOT'),(34,'Brunei','BN','BRN'),(35,'Bulgaria','BG','BGR'),(36,'Burkina Faso','BF','BFA'),(37,'Burundi','BI','BDI'),(38,'Cambodia','KH','KHM'),(39,'Cameroon','CM','CMR'),(40,'Canada','CA','CAN'),(41,'Cape Verde','CV','CPV'),(42,'Cayman Islands','KY','CYM'),(43,'Central African Republic','CF','CAF'),(44,'Chad','TD','TCD'),(45,'Chile','CL','CHL'),(46,'China','CN','CHN'),(47,'Christmas Island','CX','CXR'),(48,'Cocos (Keeling) Islands','CC','CCK'),(49,'Colombia','CO','COL'),(50,'Comoros','KM','COM'),(51,'Congo','CG','COG'),(52,'Cook Islands','CK','COK'),(53,'Costa Rica','CR','CRI'),(54,'Ivory Coast','CI','CIV'),(55,'Croatia','HR','HRV'),(56,'Cuba','CU','CUB'),(57,'Curacao','CW','CUW'),(58,'Cyprus','CY','CYP'),(59,'Czech Republic','CZ','CZE'),(60,'Democratic Republic of the Congo','CD','COD'),(61,'Denmark','DK','DNK'),(62,'Djibouti','DJ','DJI'),(63,'Dominica','DM','DMA'),(64,'Dominican Republic','DO','DOM'),(65,'Ecuador','EC','ECU'),(66,'Egypt','EG','EGY'),(67,'El Salvador','SV','SLV'),(68,'Equatorial Guinea','GQ','GNQ'),(69,'Eritrea','ER','ERI'),(70,'Estonia','EE','EST'),(71,'Ethiopia','ET','ETH'),(72,'Falkland Islands (Malvinas)','FK','FLK'),(73,'Faroe Islands','FO','FRO'),(74,'Fiji','FJ','FJI'),(75,'Finland','FI','FIN'),(76,'France','FR','FRA'),(77,'French Guiana','GF','GUF'),(78,'French Polynesia','PF','PYF'),(79,'French Southern Territories','TF','ATF'),(80,'Gabon','GA','GAB'),(81,'Gambia','GM','GMB'),(82,'Georgia','GE','GEO'),(83,'Germany','DE','DEU'),(84,'Ghana','GH','GHA'),(85,'Gibraltar','GI','GIB'),(86,'Greece','GR','GRC'),(87,'Greenland','GL','GRL'),(88,'Grenada','GD','GRD'),(89,'Guadaloupe','GP','GLP'),(90,'Guam','GU','GUM'),(91,'Guatemala','GT','GTM'),(92,'Guernsey','GG','GGY'),(93,'Guinea','GN','GIN'),(94,'Guinea-Bissau','GW','GNB'),(95,'Guyana','GY','GUY'),(96,'Haiti','HT','HTI'),(97,'Heard Island and McDonald Islands','HM','HMD'),(98,'Honduras','HN','HND'),(99,'Hong Kong','HK','HKG'),(100,'Hungary','HU','HUN'),(101,'Iceland','IS','ISL'),(102,'India','IN','IND'),(103,'Indonesia','ID','IDN'),(104,'Iran','IR','IRN'),(105,'Iraq','IQ','IRQ'),(106,'Ireland','IE','IRL'),(107,'Isle of Man','IM','IMN'),(108,'Israel','IL','ISR'),(109,'Italy','IT','ITA'),(110,'Jamaica','JM','JAM'),(111,'Japan','JP','JPN'),(112,'Jersey','JE','JEY'),(113,'Jordan','JO','JOR'),(114,'Kazakhstan','KZ','KAZ'),(115,'Kenya','KE','KEN'),(116,'Kiribati','KI','KIR'),(117,'Kosovo','XK','---'),(118,'Kuwait','KW','KWT'),(119,'Kyrgyzstan','KG','KGZ'),(120,'Laos','LA','LAO'),(121,'Latvia','LV','LVA'),(122,'Lebanon','LB','LBN'),(123,'Lesotho','LS','LSO'),(124,'Liberia','LR','LBR'),(125,'Libya','LY','LBY'),(126,'Liechtenstein','LI','LIE'),(127,'Lithuania','LT','LTU'),(128,'Luxembourg','LU','LUX'),(129,'Macao','MO','MAC'),(130,'Macedonia','MK','MKD'),(131,'Madagascar','MG','MDG'),(132,'Malawi','MW','MWI'),(133,'Malaysia','MY','MYS'),(134,'Maldives','MV','MDV'),(135,'Mali','ML','MLI'),(136,'Malta','MT','MLT'),(137,'Marshall Islands','MH','MHL'),(138,'Martinique','MQ','MTQ'),(139,'Mauritania','MR','MRT'),(140,'Mauritius','MU','MUS'),(141,'Mayotte','YT','MYT'),(142,'Mexico','MX','MEX'),(143,'Micronesia','FM','FSM'),(144,'Moldava','MD','MDA'),(145,'Monaco','MC','MCO'),(146,'Mongolia','MN','MNG'),(147,'Montenegro','ME','MNE'),(148,'Montserrat','MS','MSR'),(149,'Morocco','MA','MAR'),(150,'Mozambique','MZ','MOZ'),(151,'Myanmar (Burma)','MM','MMR'),(152,'Namibia','NA','NAM'),(153,'Nauru','NR','NRU'),(154,'Nepal','NP','NPL'),(155,'Netherlands','NL','NLD'),(156,'New Caledonia','NC','NCL'),(157,'New Zealand','NZ','NZL'),(158,'Nicaragua','NI','NIC'),(159,'Niger','NE','NER'),(160,'Nigeria','NG','NGA'),(161,'Niue','NU','NIU'),(162,'Norfolk Island','NF','NFK'),(163,'North Korea','KP','PRK'),(164,'Northern Mariana Islands','MP','MNP'),(165,'Norway','NO','NOR'),(166,'Oman','OM','OMN'),(167,'Pakistan','PK','PAK'),(168,'Palau','PW','PLW'),(169,'Palestine','PS','PSE'),(170,'Panama','PA','PAN'),(171,'Papua New Guinea','PG','PNG'),(172,'Paraguay','PY','PRY'),(173,'Peru','PE','PER'),(174,'Phillipines','PH','PHL'),(175,'Pitcairn','PN','PCN'),(176,'Poland','PL','POL'),(177,'Portugal','PT','PRT'),(178,'Puerto Rico','PR','PRI'),(179,'Qatar','QA','QAT'),(180,'Reunion','RE','REU'),(181,'Romania','RO','ROU'),(182,'Russia','RU','RUS'),(183,'Rwanda','RW','RWA'),(184,'Saint Barthelemy','BL','BLM'),(185,'Saint Helena','SH','SHN'),(186,'Saint Kitts and Nevis','KN','KNA'),(187,'Saint Lucia','LC','LCA'),(188,'Saint Martin','MF','MAF'),(189,'Saint Pierre and Miquelon','PM','SPM'),(190,'Saint Vincent and the Grenadines','VC','VCT'),(191,'Samoa','WS','WSM'),(192,'San Marino','SM','SMR'),(193,'Sao Tome and Principe','ST','STP'),(194,'Saudi Arabia','SA','SAU'),(195,'Senegal','SN','SEN'),(196,'Serbia','RS','SRB'),(197,'Seychelles','SC','SYC'),(198,'Sierra Leone','SL','SLE'),(199,'Singapore','SG','SGP'),(200,'Sint Maarten','SX','SXM'),(201,'Slovakia','SK','SVK'),(202,'Slovenia','SI','SVN'),(203,'Solomon Islands','SB','SLB'),(204,'Somalia','SO','SOM'),(205,'South Africa','ZA','ZAF'),(206,'South Georgia and the South Sandwich Islands','GS','SGS'),(207,'South Korea','KR','KOR'),(208,'South Sudan','SS','SSD'),(209,'Spain','ES','ESP'),(210,'Sri Lanka','LK','LKA'),(211,'Sudan','SD','SDN'),(212,'Suriname','SR','SUR'),(213,'Svalbard and Jan Mayen','SJ','SJM'),(214,'Swaziland','SZ','SWZ'),(215,'Sweden','SE','SWE'),(216,'Switzerland','CH','CHE'),(217,'Syria','SY','SYR'),(218,'Taiwan','TW','TWN'),(219,'Tajikistan','TJ','TJK'),(220,'Tanzania','TZ','TZA'),(221,'Thailand','TH','THA'),(222,'Timor-Leste (East Timor)','TL','TLS'),(223,'Togo','TG','TGO'),(224,'Tokelau','TK','TKL'),(225,'Tonga','TO','TON'),(226,'Trinidad and Tobago','TT','TTO'),(227,'Tunisia','TN','TUN'),(228,'Turkey','TR','TUR'),(229,'Turkmenistan','TM','TKM'),(230,'Turks and Caicos Islands','TC','TCA'),(231,'Tuvalu','TV','TUV'),(232,'Uganda','UG','UGA'),(233,'Ukraine','UA','UKR'),(234,'United Arab Emirates','AE','ARE'),(235,'United Kingdom','GB','GBR'),(236,'United States','US','USA'),(237,'United States Minor Outlying Islands','UM','UMI'),(238,'Uruguay','UY','URY'),(239,'Uzbekistan','UZ','UZB'),(240,'Vanuatu','VU','VUT'),(241,'Vatican City','VA','VAT'),(242,'Venezuela','VE','VEN'),(243,'Vietnam','VN','VNM'),(244,'Virgin Islands, British','VG','VGB'),(245,'Virgin Islands, US','VI','VIR'),(246,'Wallis and Futuna','WF','WLF'),(247,'Western Sahara','EH','ESH'),(248,'Yemen','YE','YEM'),(249,'Zambia','ZM','ZMB'),(250,'Zimbabwe','ZW','ZWE');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation_permission_actions`
--

DROP TABLE IF EXISTS `designation_permission_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation_permission_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designation_id` bigint(20) NOT NULL,
  `designation_permission_id` bigint(20) NOT NULL,
  `admin_module_id` bigint(20) NOT NULL,
  `admin_sub_module_id` binary(20) NOT NULL,
  `admin_module_action_id` bigint(2) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `admin_module_action_id` (`admin_module_action_id`),
  KEY `admin_module_id` (`admin_module_id`),
  KEY `designation_id` (`designation_id`),
  KEY `designation_permission_id` (`designation_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation_permission_actions`
--

LOCK TABLES `designation_permission_actions` WRITE;
/*!40000 ALTER TABLE `designation_permission_actions` DISABLE KEYS */;
INSERT INTO `designation_permission_actions` VALUES (1,1,1,1,'1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(2,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(3,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(4,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(5,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(6,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(7,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',13,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(8,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(9,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(10,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(11,1,3,6,'7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',15,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(12,1,3,6,'7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',14,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(13,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',16,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(14,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',19,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(15,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',18,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(16,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',17,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(17,1,3,6,'9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',20,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(18,1,3,6,'9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',21,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(19,1,3,6,'10\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',22,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(20,1,4,11,'14\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',24,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(21,1,4,11,'15\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',23,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(22,1,4,11,'40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(23,1,4,11,'41\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(24,1,4,11,'48\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',27,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(25,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',31,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(26,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',29,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(27,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',33,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(28,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(29,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',28,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(30,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',32,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(31,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',34,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(32,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',36,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(33,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',37,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(34,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',35,1,'2023-12-28 18:14:18','2023-12-28 18:14:18'),(35,1,1,1,'1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(36,1,6,0,'1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(37,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(38,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(39,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(40,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(41,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(42,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',13,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(43,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(44,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(45,1,2,2,'44\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(46,1,3,6,'7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',15,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(47,1,3,6,'7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',14,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(48,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',16,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(49,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',19,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(50,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',18,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(51,1,3,6,'8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',17,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(52,1,3,6,'9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',20,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(53,1,3,6,'9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',21,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(54,1,3,6,'10\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',22,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(55,1,4,11,'14\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',24,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(56,1,4,11,'15\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',23,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(57,1,4,11,'40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(58,1,4,11,'41\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(59,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',31,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(60,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',29,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(61,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',33,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(62,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(63,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',28,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(64,1,5,52,'53\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',32,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(65,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',34,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(66,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',36,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(67,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',37,1,'2024-04-05 13:59:34','2024-04-05 13:59:34'),(68,1,5,52,'54\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',35,1,'2024-04-05 13:59:34','2024-04-05 13:59:34');
/*!40000 ALTER TABLE `designation_permission_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation_permissions`
--

DROP TABLE IF EXISTS `designation_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designation_id` bigint(20) NOT NULL,
  `admin_module_id` bigint(20) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `designation_id` (`designation_id`),
  KEY `admin_module_id` (`admin_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation_permissions`
--

LOCK TABLES `designation_permissions` WRITE;
/*!40000 ALTER TABLE `designation_permissions` DISABLE KEYS */;
INSERT INTO `designation_permissions` VALUES (1,1,1,1,'2023-12-28 12:44:18','2024-04-05 13:59:34'),(2,1,2,1,'2023-12-28 12:44:18','2024-04-05 13:59:34'),(3,1,6,1,'2023-12-28 12:44:18','2024-04-05 13:59:34'),(4,1,11,1,'2023-12-28 12:44:18','2024-04-05 13:59:34'),(5,1,52,1,'2023-12-28 12:44:18','2024-04-05 13:59:34'),(6,1,0,0,'2024-04-05 13:59:34','2024-04-05 13:59:34');
/*!40000 ALTER TABLE `designation_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES (1,'Manager',1,0,'2024-04-05 12:44:18','2024-04-05 12:44:18');
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_actions`
--

DROP TABLE IF EXISTS `email_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_actions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_actions`
--

LOCK TABLES `email_actions` WRITE;
/*!40000 ALTER TABLE `email_actions` DISABLE KEYS */;
INSERT INTO `email_actions` VALUES (2,'forgot_password','EMAIL,FORGOT_PASSWORD_LINK','2023-11-18 01:00:00','2023-11-18 01:00:00'),(3,'reset_password','USER_NAME','2023-11-18 01:00:00','2023-11-18 01:00:00'),(4,'send_login_credentials','USER_NAME,EMAIL,PASSWORD','2023-11-18 01:00:00','2023-11-18 01:00:00');
/*!40000 ALTER TABLE `email_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_to` varchar(255) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_logs`
--

LOCK TABLES `email_logs` WRITE;
/*!40000 ALTER TABLE `email_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template_descriptions`
--

DROP TABLE IF EXISTS `email_template_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template_descriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `email_template_descriptions_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `email_templates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `email_template_descriptions_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_descriptions`
--

LOCK TABLES `email_template_descriptions` WRITE;
/*!40000 ALTER TABLE `email_template_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_template_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_descriptions`
--

DROP TABLE IF EXISTS `faq_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_descriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `faq_descriptions_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `faq_descriptions_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_descriptions`
--

LOCK TABLES `faq_descriptions` WRITE;
/*!40000 ALTER TABLE `faq_descriptions` DISABLE KEYS */;
INSERT INTO `faq_descriptions` VALUES (10,3,1,'How does the app work?','You can select the festivals you want reminders for, set your preferences, and RemyndNow will notify you in advance so you can prepare and celebrate without missing any occasion.','2025-08-31 16:00:47','2025-08-31 16:00:47'),(11,4,1,'Do I need to create an account to use RemyndNow?','Yes, you can log in easily with your Gmail , facebook or Apple account.  This ensures your preferences are saved securely across devices.','2025-08-31 16:01:45','2025-08-31 16:01:45'),(12,5,1,'Can I customize reminder timings?','Yes, you can choose how early you want to be reminded (e.g., one day before, on the day of the festival, or multiple reminders).','2025-08-31 16:03:19','2025-08-31 16:03:19'),(13,6,1,'Does RemyndNow cover festivals across India?','Yes, the app includes major Hindu festivals celebrated across India.','2025-08-31 16:03:57','2025-08-31 16:03:57'),(14,7,1,'Is the app free to use?','Yes, RemyndNow is free to use. Additional premium features may be introduced in the future.','2025-08-31 16:04:29','2025-08-31 16:04:29'),(15,8,1,'Can I share festival details with family and friends?','Yes, you can easily share festival reminders and details directly from the app. There is sharing option available in the app','2025-08-31 16:04:56','2025-08-31 16:04:56'),(16,9,1,'What if I miss a notification?','All upcoming festivals remain visible in the app calendar so you can check them anytime.','2025-08-31 16:05:22','2025-08-31 16:05:22'),(17,10,1,'How accurate are the festival dates?','Festival dates are based on the Hindu lunar calendar (Panchangam). We ensure accuracy by cross-verifying multiple authentic sources.','2025-08-31 16:05:56','2025-08-31 16:05:56'),(18,11,1,'I found incorrect information. How can I report it?','You can contact our team or email to info@ourtemples.info and weΓÇÖll verify and update the information quickly.','2025-08-31 16:06:21','2025-08-31 16:06:21'),(19,12,1,'What is ourtemples.info website','OurTemples.Info is website that has Hindu Temples information. We are updating the temple details on daily basis across India.','2025-08-31 16:07:05','2025-08-31 16:07:05'),(36,2,1,'What is RemyndNow?','RemyndNow is a devotional reminder app designed for Hindu devotees. It helps you remember important festivals, rituals, and auspicious days by sending timely reminders.','2025-09-08 17:40:51','2025-09-08 17:40:51'),(37,2,5,'RemyndNow αñòαÑìαñ»αñ╛ αñ╣αÑê?','RemyndNow αñ╣αñ┐αñéαñªαÑé αñ¡αñòαÑìαññαÑïαñé αñòαÑç αñ▓αñ┐αñÅ αñíαñ┐αñ£αñ╝αñ╛αñçαñ¿ αñòαñ┐αñ»αñ╛ αñùαñ»αñ╛ αñÅαñò αñ¡αñòαÑìαññαñ┐ αñàαñ¿αÑüαñ╕αÑìαñ«αñ╛αñ░αñò αñÉαñ¬ αñ╣αÑêαÑñ αñ»αñ╣ αñåαñ¬αñòαÑï αñ╕αñ«αñ» αñ¬αñ░ αñàαñ¿αÑüαñ╕αÑìαñ«αñ╛αñ░αñò αñ¡αÑçαñ£αñòαñ░ αñ«αñ╣αññαÑìαñ╡αñ¬αÑéαñ░αÑìαñú αññαÑìαñ»αÑïαñ╣αñ╛αñ░αÑïαñé, αñàαñ¿αÑüαñ╖αÑìαñáαñ╛αñ¿αÑïαñé αñöαñ░ αñ╢αÑüαñ¡ αñªαñ┐αñ¿αÑïαñé αñòαÑï αñ»αñ╛αñª αñ░αñûαñ¿αÑç αñ«αÑçαñé αñ«αñªαñª αñòαñ░αññαñ╛ αñ╣αÑêαÑñ','2025-09-08 17:40:51','2025-09-08 17:40:51'),(38,2,6,NULL,NULL,'2025-09-08 17:40:51','2025-09-08 17:40:51'),(39,2,7,NULL,NULL,'2025-09-08 17:40:51','2025-09-08 17:40:51'),(48,17,1,'What should we do first on Ekadashi?','Wake up early and take a holy bath to begin the day with purity.','2025-09-10 06:51:44','2025-09-10 06:51:44'),(49,17,5,'αñÅαñòαñ╛αñªαñ╢αÑÇ αñ¬αñ░ αñ╕αñ¼αñ╕αÑç αñ¬αñ╣αñ▓αÑç αñòαÑìαñ»αñ╛ αñòαñ░αñ¿αñ╛ αñÜαñ╛αñ╣αñ┐αñÅ?','αñ¬αÑìαñ░αñ╛αññαñâ αñ£αñ▓αÑìαñªαÑÇ αñëαñáαñòαñ░ αñ╕αÑìαñ¿αñ╛αñ¿ αñòαñ░αÑçαñé αñöαñ░ αñªαñ┐αñ¿ αñòαÑÇ αñ╢αÑüαñ░αÑüαñåαññ αñ¬αñ╡αñ┐αññαÑìαñ░αññαñ╛ αñ╕αÑç αñòαñ░αÑçαñéαÑñ','2025-09-10 06:51:44','2025-09-10 06:51:44'),(50,17,6,'α«Åα«òα«╛α«ñα«Üα«┐ α«¿α«╛α«│α«┐α«▓α»ì α««α»üα«ñα«▓α«┐α«▓α»ì α«Äα«⌐α»ìα«⌐ α«Üα»åα«»α»ìα«» α«╡α»çα«úα»ìα«ƒα»üα««α»ì?','α«àα«ñα«┐α«òα«╛α«▓α»êα«»α«┐α«▓α»ì α«Äα«┤α»üα«¿α»ìα«ñα»ü αñ╕αÑìαñ¿αñ╛αñ¿ α«Üα»åα«»α»ìα«ñα»ü α«¬α»üα«⌐α«┐α«ñα««α«╛α«ò α«¿α«╛α«│α»ê α«ñα»èα«ƒα«Öα»ìα«ò α«╡α»çα«úα»ìα«ƒα»üα««α»ì.','2025-09-10 06:51:44','2025-09-10 06:51:44'),(51,17,7,'α░Åα░òα░╛α░ªα░╢α░┐ α░░α▒ïα░£α▒üα░¿ α░«α▒èα░ªα░ƒ α░Åα░«α░┐ α░Üα▒çα░»α░╛α░▓α░┐?','α░ëα░ªα░»α░é α░ñα▒ìα░╡α░░α░ùα░╛ α░▓α▒çα░Üα░┐ α░╕α▒ìα░¿α░╛α░¿α░é α░Üα▒çα░╕α░┐ α░¬α░╡α░┐α░ñα▒ìα░░α░éα░ùα░╛ α░░α▒ïα░£α▒üα░¿α▒ü α░¬α▒ìα░░α░╛α░░α░éα░¡α░┐α░éα░Üα░╛α░▓α░┐.','2025-09-10 06:51:44','2025-09-10 06:51:44'),(76,20,1,'Why is Purnima considered important in Hinduism?','Purnima is associated with divine energy and spiritual purity. Many festivals like Guru Purnima, Sharad Purnima, Holi, and Kartik Purnima fall on this day. It is believed that observing vrat (fast) on Purnima helps cleanse sins, brings peace, and fulfills desires.','2025-09-10 18:41:47','2025-09-10 18:41:47'),(77,20,5,'αñ╣αñ┐αñéαñªαÑé αñºαñ░αÑìαñ« αñ«αÑçαñé αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαñ╛ αñ«αñ╣αññαÑìαñ╡ αñòαÑìαñ»αÑïαñé αñ╣αÑê?','αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñªαñ┐αñ╡αÑìαñ» αñèαñ░αÑìαñ£αñ╛ αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ¬αñ╡αñ┐αññαÑìαñ░αññαñ╛ αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ╣αÑêαÑñ αñùαÑüαñ░αÑü αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛, αñ╢αñ░αñª αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛, αñ╣αÑïαñ▓αÑÇ αñöαñ░ αñòαñ╛αñ░αÑìαññαñ┐αñò αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ£αÑêαñ╕αÑç αñàαñ¿αÑçαñò αñ¬αÑìαñ░αñ«αÑüαñû αññαÑìαñ»αÑîαñ╣αñ╛αñ░ αñçαñ╕αÑÇ αñªαñ┐αñ¿ αñ«αñ¿αñ╛αñÅ αñ£αñ╛αññαÑç αñ╣αÑêαñéαÑñ αñ«αñ╛αñ¿αÑìαñ»αññαñ╛ αñ╣αÑê αñòαñ┐ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαñ╛ αñ╡αÑìαñ░αññ αñ░αñûαñ¿αÑç αñ╕αÑç αñ¬αñ╛αñ¬αÑïαñé αñòαñ╛ αñ¿αñ╛αñ╢ αñ╣αÑïαññαñ╛ αñ╣αÑê, αñ╢αñ╛αñéαññαñ┐ αñöαñ░ αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñ«αñ┐αñ▓αññαÑÇ αñ╣αÑê αññαñÑαñ╛ αñ«αñ¿αÑïαñòαñ╛αñ«αñ¿αñ╛αñÅαñü αñ¬αÑéαñ░αÑìαñú αñ╣αÑïαññαÑÇ αñ╣αÑêαñéαÑñ\r\n\r\nαñ¬αÑìαñ░αñ╢αÑìαñ¿ 3: αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαÑï αñòαñ┐αñ╕ αñªαÑçαñ╡αññαñ╛ αñòαÑÇ αñ¬αÑéαñ£αñ╛ αñòαÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑê?\r\nαñëαññαÑìαññαñ░ 3: αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαÑç αñªαñ┐αñ¿ αñàαñºαñ┐αñòαññαñ░ αñ▓αÑïαñù αñ¡αñùαñ╡αñ╛αñ¿ αñ╡αñ┐αñ╖αÑìαñúαÑü αñòαÑï αñ╕αññαÑìαñ»αñ¿αñ╛αñ░αñ╛αñ»αñú αñ╕αÑìαñ╡αñ░αÑéαñ¬ αñ«αÑçαñé αñ¬αÑéαñ£αññαÑç αñ╣αÑêαñéαÑñ αñòαñê αñ¬αñ░αñéαñ¬αñ░αñ╛αñôαñé αñ«αÑçαñé αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αñ┐αñ╡, αñ«αñ╛αñé αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ»αñ╛ αñÜαñéαñªαÑìαñ░ αñªαÑçαñ╡ αñòαÑÇ αñ¡αÑÇ αñåαñ░αñ╛αñºαñ¿αñ╛ αñòαÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ\r\n\r\nαñ¬αÑìαñ░αñ╢αÑìαñ¿ 4: αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╡αÑìαñ░αññ αñòαÑêαñ╕αÑç αñòαñ┐αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê?\r\nαñëαññαÑìαññαñ░ 4: αñ¡αñòαÑìαññαñ£αñ¿ αñ╕αÑéαñ░αÑìαñ»αÑïαñªαñ» αñ╕αÑç αñ▓αÑçαñòαñ░ αñÜαñéαñªαÑìαñ░αñ«αñ╛ αñëαñªαñ» αññαñò αñëαñ¬αñ╡αñ╛αñ╕ αñ░αñûαññαÑç αñ╣αÑêαñéαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñ¬αÑéαñ£αñ╛, αñ«αñéαññαÑìαñ░αñ£αñ¬, αñ╕αññαÑìαñ»αñ¿αñ╛αñ░αñ╛αñ»αñú αñòαñÑαñ╛ αñòαñ╛ αñ¬αñ╛αñá αñòαñ┐αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê αñöαñ░ αñ£αñ░αÑéαñ░αññαñ«αñéαñªαÑïαñé αñòαÑï αñ¡αÑïαñ£αñ¿, αñ╡αñ╕αÑìαññαÑìαñ░ αñ»αñ╛ αñºαñ¿ αñòαñ╛ αñªαñ╛αñ¿ αñòαñ┐αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ\r\n\r\nαñ¬αÑìαñ░αñ╢αÑìαñ¿ 5: αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╡αÑìαñ░αññ αñ░αñûαñ¿αÑç αñòαÑç αñòαÑìαñ»αñ╛ αñ▓αñ╛αñ¡ αñ╣αÑêαñé?\r\nαñëαññαÑìαññαñ░ 5: αñçαñ╕ αñ╡αÑìαñ░αññ αñ╕αÑç αñ«αñ╛αñ¿αñ╕αñ┐αñò αñ╢αñ╛αñéαññαñ┐, αñ¬αñ╛αñ░αñ┐αñ╡αñ╛αñ░αñ┐αñò αñ╕αÑüαñû, αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ¬αÑìαñ░αñùαññαñ┐ αñ«αñ┐αñ▓αññαÑÇ αñ╣αÑêαÑñ αñ»αñ╣ αñ¬αñ╛αñ¬αÑïαñé αñòαÑï αñªαÑéαñ░ αñòαñ░αññαñ╛ αñ╣αÑê αñöαñ░ αñ£αÑÇαñ╡αñ¿ αñ«αÑçαñé αñ╕αñ╛αñ«αñéαñ£αñ╕αÑìαñ» αññαñÑαñ╛ αñ╕αñòαñ╛αñ░αñ╛αññαÑìαñ«αñòαññαñ╛ αñ▓αñ╛αññαñ╛ αñ╣αÑêαÑñ\r\n\r\nαñ¬αÑìαñ░αñ╢αÑìαñ¿ 6: αñòαÑìαñ»αñ╛ αñ╕αñ¡αÑÇ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╕αñ«αñ╛αñ¿ αñ╣αÑïαññαÑÇ αñ╣αÑêαñé?\r\nαñëαññαÑìαññαñ░ 6: αñ¬αÑìαñ░αññαÑìαñ»αÑçαñò αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╢αÑüαñ¡ αñ╣αÑïαññαÑÇ αñ╣αÑê, αñ▓αÑçαñòαñ┐αñ¿ αñ╣αñ░ αñ«αñ╛αñ╣ αñòαÑÇ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαñ╛ αñàαñ¬αñ¿αñ╛ αñ╡αñ┐αñ╢αÑçαñ╖ αñ«αñ╣αññαÑìαñ╡ αñ╣αÑïαññαñ╛ αñ╣αÑêαÑñ αñ£αÑêαñ╕αÑç αñùαÑüαñ░αÑü αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñùαÑüαñ░αÑü αñöαñ░ αñåαñÜαñ╛αñ░αÑìαñ»αÑïαñé αñòαÑï αñ╕αñ«αñ░αÑìαñ¬αñ┐αññ αñ╣αÑê, αñ╢αñ░αñª αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñÜαñéαñªαÑìαñ░αñ«αñ╛ αñöαñ░ αñ½αñ╕αñ▓ αñëαññαÑìαñ╕αñ╡ αñ╕αÑç αñ£αÑüαñíαñ╝αÑÇ αñ╣αÑê, αñöαñ░ αñòαñ╛αñ░αÑìαññαñ┐αñò αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñºαñ╛αñ░αÑìαñ«αñ┐αñò αñàαñ¿αÑüαñ╖αÑìαñáαñ╛αñ¿αÑïαñé αñòαÑç αñ▓αñ┐αñÅ αñàαññαÑìαñ»αñéαññ αñ¬αñ╡αñ┐αññαÑìαñ░ αñ«αñ╛αñ¿αÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ\r\n\r\nαñòαÑìαñ»αñ╛ αñåαñ¬ αñÜαñ╛αñ╣αÑçαñéαñùαÑç αñòαñ┐ αñ«αÑêαñé αñçαñ╕αñòαñ╛ αñ╕αñ░αñ▓ αñ¼αñÜαÑìαñÜαÑïαñé αñòαÑç αñ▓αñ┐αñÅ αñ¬αÑìαñ░αñ╢αÑìαñ¿αÑïαññαÑìαññαñ░ αñ░αÑéαñ¬ αñ¡αÑÇ αñ¼αñ¿αñ╛ αñªαÑéαñü αññαñ╛αñòαñ┐ αñ╡αÑç αñåαñ╕αñ╛αñ¿αÑÇ αñ╕αÑç αñ╕αñ«αñ¥ αñ╕αñòαÑçαñé?','2025-09-10 18:41:47','2025-09-10 18:41:47'),(78,20,6,'α«çα«¿α»ìα«ñα»ü α««α«ñα«ñα»ìα«ñα«┐α«▓α»ì α«¬α»îα«░α»ìα«úα««α«┐ α«Åα«⌐α»ì α««α»üα«òα»ìα«òα«┐α«»α««α«╛α«⌐α«ñα»ü?','α«¬α»îα«░α»ìα«úα««α«┐ α«ñα»åα«»α»ìα«╡α»Çα«ò α«Üα«òα»ìα«ñα«┐ α««α«▒α»ìα«▒α»üα««α»ì α«åα«⌐α»ìα««α»Çα«ò α«¬α«╡α«┐α«ñα»ìα«░α«ñα»ìα«ñα»êα«òα»ì α«òα»üα«▒α«┐α«òα»ìα«òα«┐α«▒α«ñα»ü. α«òα»üα«░α»ü α«¬α»îα«░α»ìα«úα««α«┐, α«Üα«░α«ñα»ì α«¬α»îα«░α»ìα«úα««α«┐, α«╣α»ïα«▓α«┐, α«òα«╛α«░α»ìα«ñα»ìα«ñα«┐α«òα»ê α«¬α»îα«░α»ìα«úα««α«┐ α«¬α»ïα«⌐α»ìα«▒ α«¬α«▓ α««α»üα«òα»ìα«òα«┐α«» α«¬α«úα»ìα«ƒα«┐α«òα»êα«òα«│α»ì α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«òα»èα«úα»ìα«ƒα«╛α«ƒα«¬α»ìα«¬α«ƒα»üα«òα«┐α«⌐α»ìα«▒α«⌐. α«¬α»îα«░α»ìα«úα««α«┐ α«╡α«┐α«░α«ñα««α»ì α«¿α»ïα«▒α»ìα«¬α«ñα«╛α«▓α»ì α«¬α«╛α«╡α«Öα»ìα«òα«│α»ì α«¿α»Çα«Öα»ìα«òα«┐, α«àα««α»êα«ñα«┐, α«Üα»åα«┤α«┐α«¬α»ìα«¬α»ü α««α«▒α»ìα«▒α»üα««α»ì α««α«⌐α»ïα«òα«╛α««α«⌐α»êα«òα«│α»ì α«¿α«┐α«▒α»êα«╡α»çα«▒α»üα««α»ì α«Äα«⌐α»ìα«▒α»ü α«¿α««α»ìα«¬α«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü.','2025-09-10 18:41:47','2025-09-10 18:41:47'),(79,20,7,'α░╣α░┐α░éα░ªα▒éα░«α░ñα░éα░▓α▒ï α░¬α▒îα░░α▒ìα░úα░«α░┐ α░Äα░éα░ªα▒üα░òα▒ü α░«α▒üα░ûα▒ìα░»α░«α▒êα░¿α░ªα░┐?','α░¬α▒îα░░α▒ìα░úα░«α░┐ α░ªα▒êα░╡α░┐α░ò α░╢α░òα▒ìα░ñα░┐, α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░¬α░╡α░┐α░ñα▒ìα░░α░ñα░òα▒ü α░╕α▒éα░Üα░òα░é. α░ùα▒üα░░α▒ü α░¬α▒îα░░α▒ìα░úα░«α░┐, α░╢α░░α░ªα▒ì α░¬α▒îα░░α▒ìα░úα░«α░┐, α░╣α▒ïα░▓α▒Ç, α░òα░╛α░░α▒ìα░ñα▒Çα░ò α░¬α▒îα░░α▒ìα░úα░«α░┐ α░╡α░éα░ƒα░┐ α░Äα░¿α▒ìα░¿α▒ï α░«α▒üα░ûα▒ìα░»α░«α▒êα░¿ α░¬α░éα░íα▒üα░ùα░▓α▒ü α░ê α░░α▒ïα░£α▒üα░¿ α░£α░░α▒üα░ùα▒üα░ñα░╛α░»α░┐. α░¬α▒îα░░α▒ìα░úα░«α░┐ α░╡α▒ìα░░α░ñα░é α░Üα▒çα░»α░íα░é α░╡α░▓α░¿ α░¬α░╛α░¬α░╛α░▓α▒ü α░ñα▒èα░▓α░ùα░┐, α░╢α░╛α░éα░ñα░┐, α░╕α░éα░¬α░ª, α░«α░¿α▒ïα░òα░╛α░«α░¿α░▓ α░╕α░╛α░ºα░¿α░é α░òα░▓α▒üα░ùα▒üα░ñα▒üα░éα░ªα░¿α░┐ α░¿α░«α▒ìα░«α░òα░é.','2025-09-10 18:41:47','2025-09-10 18:41:47'),(80,19,1,'What is Purnima?','Purnima is the full moon day that occurs once every month in the Hindu lunar calendar. It is considered an auspicious day for worship, fasting, and spiritual practices.','2025-09-10 18:42:31','2025-09-10 18:42:31'),(81,19,5,'αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαÑìαñ»αñ╛ αñ╣αÑê?','αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╣αñ░ αñ«αñ╛αñ╣ αñ╣αñ┐αñéαñªαÑé αñ¬αñéαñÜαñ╛αñéαñù αñòαÑç αñàαñ¿αÑüαñ╕αñ╛αñ░ αñåαñ¿αÑç αñ╡αñ╛αñ▓αÑÇ αñ¬αÑéαñ░αÑìαñú αñÜαñéαñªαÑìαñ░αñ«αñ╛ αñòαÑÇ αññαñ┐αñÑαñ┐ αñ╣αÑêαÑñ αñ»αñ╣ αñªαñ┐αñ¿ αñ¬αÑéαñ£αñ╛, αñëαñ¬αñ╡αñ╛αñ╕ αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ╕αñ╛αñºαñ¿αñ╛ αñòαÑç αñ▓αñ┐αñÅ αñàαññαÑìαñ»αñéαññ αñ╢αÑüαñ¡ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ','2025-09-10 18:42:31','2025-09-10 18:42:31'),(82,19,6,'α«¬α»îα«░α»ìα«úα««α«┐ α«Äα«⌐α»ìα«▒α«╛α«▓α»ì α«Äα«⌐α»ìα«⌐?','α«¬α»îα«░α»ìα«úα««α«┐ α«Äα«⌐α»ìα«¬α«ñα»ü α«Æα«╡α»ìα«╡α»èα«░α»ü α««α«╛α«ñα««α»üα««α»ì α«çα«¿α»ìα«ñα»ü α«¿α«╛α«ƒα»ìα«òα«╛α«ƒα»ìα«ƒα«┐ α«¬α«ƒα«┐ α«╡α«░α»üα««α»ì α«¬α»éα«░α«ú α«Üα«¿α»ìα«ñα«┐α«░α«⌐α»ì α«¿α«╛α«│α»ì. α«çα«¿α»ìα«ñ α«¿α«╛α«│α»ì α«¬α»éα«£α»ê, α«¿α»ïα«⌐α»ìα«¬α»ü α««α«▒α»ìα«▒α»üα««α»ì α«åα«⌐α»ìα««α»Çα«ò α«Üα«╛α«ñα«⌐α»êα«òα«│α»üα«òα»ìα«òα»ü α««α«┐α«òα»üα«¿α»ìα«ñ α«¬α«╡α«┐α«ñα»ìα«░α««α«╛α«⌐α«ñα«╛α«òα«òα»ì α«òα«░α»üα«ñα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü.','2025-09-10 18:42:31','2025-09-10 18:42:31'),(83,19,7,'α░¬α▒îα░░α▒ìα░úα░«α░┐ α░àα░éα░ƒα▒ç α░Åα░«α░┐α░ƒα░┐?','α░¬α▒îα░░α▒ìα░úα░«α░┐ α░àα░¿α▒çα░ªα░┐ α░¬α▒ìα░░α░ñα░┐ α░¿α▒åα░▓ α░╣α░┐α░éα░ªα▒é α░Üα░éα░ªα▒ìα░░α░«α░╛α░¿ α░òα▒ìα░»α░╛α░▓α▒åα░éα░íα░░α▒ì α░¬α▒ìα░░α░òα░╛α░░α░é α░╡α░Üα▒ìα░Üα▒ç α░¬α▒éα░░α▒ìα░ú α░Üα░éα░ªα▒ìα░░α▒üα░¿α░┐ α░ñα▒çα░ªα░┐. α░ê α░░α▒ïα░£α▒ü α░¬α▒éα░£α░▓α▒ü, α░ëα░¬α░╡α░╛α░╕α░é, α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░╕α░╛α░ºα░¿α░▓α░òα▒ü α░àα░ñα▒ìα░»α░éα░ñ α░╢α▒üα░¡α░¬α▒ìα░░α░ªα░éα░ùα░╛ α░¡α░╛α░╡α░┐α░éα░Üα░¼α░íα▒üα░ñα▒üα░éα░ªα░┐.','2025-09-10 18:42:31','2025-09-10 18:42:31'),(104,22,1,'What are common traditions during Diwali?','Lighting diyas, Lakshmi Puja, bursting firecrackers, preparing sweets, and exchanging gifts are common traditions.','2025-09-11 17:26:05','2025-09-11 17:26:05'),(105,22,5,'αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñ¬αñ░ αñòαÑìαñ»αñ╛ αñ¬αñ░αñéαñ¬αñ░αñ╛αñÅαñü αñ╣αÑïαññαÑÇ αñ╣αÑêαñé?','αñªαÑÇαñ¬ αñ£αñ▓αñ╛αñ¿αñ╛, αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ¬αÑéαñ£αñ╛, αñ¬αñƒαñ╛αñûαÑç αñ½αÑïαñíαñ╝αñ¿αñ╛, αñ«αñ┐αñáαñ╛αñê αñ¼αñ╛αñüαñƒαñ¿αñ╛ αñöαñ░ αñëαñ¬αñ╣αñ╛αñ░ αñªαÑçαñ¿αñ╛αÑñ','2025-09-11 17:26:05','2025-09-11 17:26:05'),(106,22,6,'α«ñα»Çα«¬α«╛α«╡α«│α«┐α«»α«┐α«▓α»ì α«Äα«⌐α»ìα«⌐ α«╡α«┤α«òα»ìα«òα«Öα»ìα«òα«│α»ì α«ëα«│α»ìα«│α«⌐?','α«ñα»Çα«¬α««α»ì α«Åα«▒α»ìα«▒α»üα«ñα«▓α»ì, α««α«òα«╛α«▓α«òα»ìα«╖α»ìα««α«┐ α«¬α»éα«£α»ê, α«¬α«ƒα»ìα«ƒα«╛α«Üα»ü α«╡α»åα«ƒα«┐α«ñα»ìα«ñα«▓α»ì, α«çα«⌐α«┐α«¬α»ìα«¬α»üα«òα«│α»ì α«¬α«òα«┐α«░α»ìα«ñα«▓α»ì, α«¬α«░α«┐α«Üα»üα«òα«│α»ì α«òα»èα«ƒα»üα«ñα»ìα«ñα«▓α»ì.','2025-09-11 17:26:05','2025-09-11 17:26:05'),(107,22,7,'α░ªα▒Çα░¬α░╛α░╡α░│α░┐α░▓α▒ï α░Åα░»α▒ç α░åα░Üα░╛α░░α░╛α░▓α▒ü α░ëα░éα░ƒα░╛α░»α░┐?','α░ªα▒Çα░¬α░╛α░▓α▒ü α░╡α▒åα░▓α░┐α░ùα░┐α░éα░Üα░íα░é, α░▓α░òα▒ìα░╖α▒ìα░«α▒Ç α░¬α▒éα░£, α░¬α░ƒα░╛α░òα▒üα░▓α▒ü α░òα░╛α░▓α▒ìα░Üα░íα░é, α░«α░┐α░áα░╛α░»α░┐α░▓α▒ü α░¬α░éα░Üα▒üα░òα▒ïα░╡α░íα░é, α░¼α░╣α▒üα░«α░ñα▒üα░▓α▒ü α░çα░Üα▒ìα░Üα░┐α░¬α▒üα░Üα▒ìα░Üα▒üα░òα▒ïα░╡α░íα░é.','2025-09-11 17:26:05','2025-09-11 17:26:05'),(108,21,1,'Why do we celebrate Diwali?s','Diwali celebrates the victory of good over evil, mainly Lord RamaΓÇÖs return to Ayodhya after defeating Ravana.','2025-09-11 17:26:15','2025-09-11 17:26:15'),(109,21,5,'αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαÑìαñ»αÑïαñé αñ«αñ¿αñ╛αñê αñ£αñ╛αññαÑÇ αñ╣αÑê?','αñ»αñ╣ αñ¡αñùαñ╡αñ╛αñ¿ αñ░αñ╛αñ« αñòαÑç αñàαñ»αÑïαñºαÑìαñ»αñ╛ αñ▓αÑîαñƒαñ¿αÑç αñöαñ░ αñ¼αÑüαñ░αñ╛αñê αñ¬αñ░ αñàαñÜαÑìαñ¢αñ╛αñê αñòαÑÇ αñ£αÑÇαññ αñòαÑÇ αñ»αñ╛αñª αñ«αÑçαñé αñ«αñ¿αñ╛αñê αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ','2025-09-11 17:26:15','2025-09-11 17:26:15'),(110,21,6,'α«ñα»Çα«¬α«╛α«╡α«│α«┐ α«Åα«⌐α»ì α«òα»èα«úα»ìα«ƒα«╛α«ƒα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü?','α«çα«░α«╛α««α«░α»ì α«çα«░α«╛α«╡α«úα«⌐α»ê α«╡α»åα«⌐α»ìα«▒α«¬α«┐α«⌐α»ì α«àα«»α»ïα«ñα»ìα«ñα«┐α«»α«╛α«╡α»üα«òα»ìα«òα»ü α«ñα«┐α«░α»üα««α»ìα«¬α«┐α«»α«ñα»êα«òα»ì α«òα»èα«úα»ìα«ƒα«╛α«ƒα»üα«╡α«ñα»ç α«ñα»Çα«¬α«╛α«╡α«│α«┐.','2025-09-11 17:26:15','2025-09-11 17:26:15'),(111,21,7,'α░ªα▒Çα░¬α░╛α░╡α░│α░┐ α░Äα░éα░ªα▒üα░òα▒ü α░£α░░α▒üα░¬α▒üα░òα▒üα░éα░ƒα░╛α░░α▒ü?','α░░α░╛α░╡α░úα▒üα░íα░┐α░¬α▒ê α░░α░╛α░«α▒üα░íα▒ü α░ùα▒åα░▓α░┐α░Üα░┐ α░àα░»α▒ïα░ºα▒ìα░»α░òα▒ü α░ñα░┐α░░α░┐α░ùα░┐ α░╡α░Üα▒ìα░Üα░┐α░¿ α░░α▒ïα░£α▒üα░¿α▒ü α░ùα▒üα░░α▒ìα░ñα▒üα░Üα▒çα░╕α▒üα░òα▒ïα░╡α░íα░╛α░¿α░┐α░òα▒ç α░ªα▒Çα░¬α░╛α░╡α░│α░┐ α░£α░░α▒üα░¬α▒üα░òα▒üα░éα░ƒα░╛α░░α▒ü.','2025-09-11 17:26:15','2025-09-11 17:26:15'),(116,24,1,'test','test','2025-12-15 13:27:48','2025-12-15 13:27:48'),(117,24,5,NULL,NULL,'2025-12-15 13:27:48','2025-12-15 13:27:48'),(118,24,6,NULL,NULL,'2025-12-15 13:27:48','2025-12-15 13:27:48'),(119,24,7,NULL,NULL,'2025-12-15 13:27:48','2025-12-15 13:27:48');
/*!40000 ALTER TABLE `faq_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `faq_order` int(11) NOT NULL DEFAULT 0,
  `is_festival` tinyint(2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (2,'What is RemyndNow?','RemyndNow is a devotional reminder app designed for Hindu devotees. It helps you remember important festivals, rituals, and auspicious days by sending timely reminders.',1,1,0,'2024-04-05 12:44:18','2025-08-31 16:00:08'),(3,'How does the app work?','You can select the festivals you want reminders for, set your preferences, and RemyndNow will notify you in advance so you can prepare and celebrate without missing any occasion.',1,2,0,'2024-04-05 12:44:18','2025-08-31 16:00:47'),(4,'Do I need to create an account to use RemyndNow?','Yes, you can log in easily with your Gmail , facebook or Apple account.  This ensures your preferences are saved securely across devices.',1,3,0,'2025-08-31 16:01:45','2025-08-31 16:01:45'),(5,'Can I customize reminder timings?','Yes, you can choose how early you want to be reminded (e.g., one day before, on the day of the festival, or multiple reminders).',1,4,0,'2025-08-31 16:03:19','2025-08-31 16:03:19'),(6,'Does RemyndNow cover festivals across India?','Yes, the app includes major Hindu festivals celebrated across India.',1,5,0,'2025-08-31 16:03:57','2025-08-31 16:03:57'),(7,'Is the app free to use?','Yes, RemyndNow is free to use. Additional premium features may be introduced in the future.',1,6,0,'2025-08-31 16:04:29','2025-08-31 16:04:29'),(8,'Can I share festival details with family and friends?','Yes, you can easily share festival reminders and details directly from the app. There is sharing option available in the app',1,7,0,'2025-08-31 16:04:56','2025-08-31 16:04:56'),(9,'What if I miss a notification?','All upcoming festivals remain visible in the app calendar so you can check them anytime.',1,8,0,'2025-08-31 16:05:22','2025-08-31 16:05:22'),(10,'How accurate are the festival dates?','Festival dates are based on the Hindu lunar calendar (Panchangam). We ensure accuracy by cross-verifying multiple authentic sources.',1,9,0,'2025-08-31 16:05:56','2025-08-31 16:05:56'),(11,'I found incorrect information. How can I report it?','You can contact our team or email to info@ourtemples.info and weΓÇÖll verify and update the information quickly.',1,10,0,'2025-08-31 16:06:21','2025-08-31 16:06:21'),(12,'What is ourtemples.info website','OurTemples.Info is website that has Hindu Temples information. We are updating the temple details on daily basis across India.',1,11,0,'2025-08-31 16:07:05','2025-08-31 16:07:05'),(17,'What should we do first on Ekadashi?','Wake up early and take a holy bath to begin the day with purity.',1,21,14,'2025-09-10 06:49:38','2025-09-10 06:49:38'),(19,'What is Purnima?','Purnima is the full moon day that occurs once every month in the Hindu lunar calendar. It is considered an auspicious day for worship, fasting, and spiritual practices.',1,23,15,'2025-09-10 18:31:49','2025-09-10 18:31:49'),(20,'Why is Purnima considered important in Hinduism?','Purnima is associated with divine energy and spiritual purity. Many festivals like Guru Purnima, Sharad Purnima, Holi, and Kartik Purnima fall on this day. It is believed that observing vrat (fast) on Purnima helps cleanse sins, brings peace, and fulfills desires.',1,24,15,'2025-09-10 18:33:24','2025-09-10 18:33:24'),(21,'Why do we celebrate Diwali?s','Diwali celebrates the victory of good over evil, mainly Lord RamaΓÇÖs return to Ayodhya after defeating Ravana.',1,27,16,'2025-09-10 18:52:19','2025-09-11 17:26:15'),(22,'What are common traditions during Diwali?','Lighting diyas, Lakshmi Puja, bursting firecrackers, preparing sweets, and exchanging gifts are common traditions.',1,1,16,'2025-09-10 18:54:05','2025-09-11 17:21:19'),(24,'test','test',1,11,23,'2025-12-15 13:27:48','2025-12-15 13:27:48');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival_description`
--

DROP TABLE IF EXISTS `festival_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festival_description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `regional_names` varchar(255) DEFAULT NULL,
  `states_celebrated` longtext DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `daily_significance` longtext DEFAULT NULL,
  `temples_to_visit` longtext DEFAULT NULL,
  `history` longtext DEFAULT NULL,
  `other_info` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival_description`
--

LOCK TABLES `festival_description` WRITE;
/*!40000 ALTER TABLE `festival_description` DISABLE KEYS */;
INSERT INTO `festival_description` VALUES (1,9,1,'sad','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:57:25','2025-09-09 15:57:25'),(2,9,5,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:57:25','2025-09-09 15:57:25'),(3,9,6,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:57:25','2025-09-09 15:57:25'),(4,9,7,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:57:25','2025-09-09 15:57:25'),(5,10,1,'1','','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:58:56','2025-09-09 15:58:56'),(6,10,5,'4','','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:58:56','2025-09-09 15:58:56'),(7,10,6,'7','','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:58:56','2025-09-09 15:58:56'),(8,10,7,'10','','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 15:58:56','2025-09-09 15:58:56'),(9,11,1,'1','2','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:34:42','2025-09-09 16:34:42'),(10,11,5,'4','5','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:34:42','2025-09-09 16:34:42'),(11,11,6,'7','8','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:34:42','2025-09-09 16:34:42'),(12,11,7,'10','11','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:34:42','2025-09-09 16:34:42'),(13,12,1,'1','2','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:38:23','2025-09-09 16:38:23'),(14,12,5,'4','5','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:38:23','2025-09-09 16:38:23'),(15,12,6,'7','8','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:38:23','2025-09-09 16:38:23'),(16,12,7,'10','11','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 16:38:23','2025-09-09 16:38:23'),(33,13,1,'1','dsa','asdsad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:00:09','2025-09-09 17:00:09'),(34,13,5,'4','dddd','ssss',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:00:09','2025-09-09 17:00:09'),(35,13,6,'7','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:00:09','2025-09-09 17:00:09'),(36,13,7,'10','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:00:09','2025-09-09 17:00:09'),(45,1,1,'Radha Ashtami','Ekadashi is a spiritually significant day in Hinduism that falls on the 11th day of each lunar fortnight. It is observed through fasting and prayer to attain mental clarity and spiritual growth.','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:07:16','2025-09-09 17:07:16'),(46,1,5,'Radha Ashtami','Ekadashi is a spiritually significant day in Hinduism that falls on the 11th day of each lunar fortnight. It is observed through fasting and prayer to attain mental clarity and spiritual growth.','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:07:16','2025-09-09 17:07:16'),(47,1,6,'Radha Ashtami','Ekadashi is a spiritually significant day in Hinduism that falls on the 11th day of each lunar fortnight. It is observed through fasting and prayer to attain mental clarity and spiritual growth.','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:07:16','2025-09-09 17:07:16'),(48,1,7,'Radha Ashtami','Ekadashi is a spiritually significant day in Hinduism that falls on the 11th day of each lunar fortnight. It is observed through fasting and prayer to attain mental clarity and spiritual growth.','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-09 17:07:16','2025-09-09 17:07:16'),(49,5,1,'Ekadashi','Ekadashi is a spiritually significant day in Hindu...','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 03:49:47','2025-09-10 03:49:47'),(50,5,5,'Ekadshmi','Ekadashi is a spiritually significant day in Hindu...','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 03:49:47','2025-09-10 03:49:47'),(51,5,6,'Ekadshmi','Ekadashi is a spiritually significant day in Hindu...','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 03:49:47','2025-09-10 03:49:47'),(52,5,7,'Ekadshmi','Ekadashi is a spiritually significant day in Hindu...','Ekadashi is a sacred day of fasting and devotion in Hinduism, observed twice a month. We created this platform to help you follow Ekadashi with ease, clarity, and devotion.<br />\r\n<br />\r\nWe provide accurate dates, fasting guidelines, parana timings, and the spiritual significance of each Ekadashi&mdash;customized to your region and tradition. Whether you&#39;re a regular observer or just beginning, we make it simple and meaningful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 03:49:47','2025-09-10 03:49:47'),(57,14,1,'Ekadashi','Ekadashi is a sacred fasting day dedicated to Lord Vishnu, observed twice a month.','Ekadashi is considered one of the most auspicious days in Hinduism, falling on the 11th day of each lunar fortnight. Devotees fast, chant mantras, and engage in spiritual practices to seek Lord Vishnu&rsquo;s blessings. It is believed that fasting on this day purifies the soul, removes sins, and brings prosperity.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 06:58:18','2025-09-10 06:58:18'),(58,14,5,'αñÅαñòαñ╛αñªαñ╢αÑÇ','αñÅαñòαñ╛αñªαñ╢αÑÇ αñ¡αñùαñ╡αñ╛αñ¿ αñ╡αñ┐αñ╖αÑìαñúαÑü αñòαÑï αñ╕αñ«αñ░αÑìαñ¬αñ┐αññ αñ¬αñ╡αñ┐αññαÑìαñ░ αñ╡αÑìαñ░αññ αñòαñ╛ αñªαñ┐αñ¿ αñ╣αÑê, αñ£αÑï αñ«αñ╣αÑÇαñ¿αÑç αñ«αÑçαñé αñªαÑï αñ¼αñ╛αñ░ αñåαññαñ╛ αñ╣αÑêαÑñ','αñÅαñòαñ╛αñªαñ╢αÑÇ αñ╣αñ┐αñéαñªαÑé αñºαñ░αÑìαñ« αñ«αÑçαñé αñàαññαÑìαñ»αñéαññ αñ╢αÑüαñ¡ αñªαñ┐αñ¿ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñ»αñ╣ αñ¬αÑìαñ░αññαÑìαñ»αÑçαñò αñ¬αñòαÑìαñ╖ αñòαÑÇ αñùαÑìαñ»αñ╛αñ░αñ╣αñ╡αÑÇαñé αññαñ┐αñÑαñ┐ αñòαÑï αñåαññαÑÇ αñ╣αÑêαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñëαñ¬αñ╡αñ╛αñ╕, αñ«αñéαññαÑìαñ░ αñ£αñ¬ αñöαñ░ αñ¡αñòαÑìαññαñ┐ αñ╕αÑç αñ¡αñùαñ╡αñ╛αñ¿ αñ╡αñ┐αñ╖αÑìαñúαÑü αñòαÑÇ αñåαñ░αñ╛αñºαñ¿αñ╛ αñòαÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê αñòαñ┐ αñçαñ╕ αñ╡αÑìαñ░αññ αñ╕αÑç αñ¬αñ╛αñ¬αÑïαñé αñòαñ╛ αñ¿αñ╛αñ╢ αñ╣αÑïαññαñ╛ αñ╣αÑê αñöαñ░ αñ£αÑÇαñ╡αñ¿ αñ«αÑçαñé αñ╕αÑüαñû-αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñåαññαÑÇ αñ╣αÑêαÑñ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 06:58:18','2025-09-10 06:58:18'),(59,14,6,'α░Åα░òα░╛α░ªα░╢α░┐','α░Åα░òα░╛α░ªα░╢α░┐ α░╡α░┐α░╖α▒ìα░úα▒üα░«α▒éα░░α▒ìα░ñα░┐α░òα░┐ α░àα░éα░òα░┐α░ñα░é α░Üα▒çα░╕α░┐α░¿ α░¬α░╡α░┐α░ñα▒ìα░░α░«α▒êα░¿ α░ëα░¬α░╡α░╛α░╕ α░ªα░┐α░¿α░é. α░çα░ªα░┐ α░¿α▒åα░▓α░▓α▒ï α░░α▒åα░éα░íα▒üα░╕α░╛α░░α▒ìα░▓α▒ü α░╡α░╕α▒ìα░ñα▒üα░éα░ªα░┐.','α░╣α░┐α░éα░ªα▒é α░ºα░░α▒ìα░«α░éα░▓α▒ï α░Åα░òα░╛α░ªα░╢α░┐ α░àα░ñα▒ìα░»α░éα░ñ α░¬α▒üα░úα▒ìα░»α░ªα░╛α░»α░òα░«α▒êα░¿ α░ªα░┐α░¿α░éα░ùα░╛ α░¬α░░α░┐α░ùα░úα░┐α░éα░Üα░¼α░íα▒üα░ñα▒üα░éα░ªα░┐. α░¬α▒ìα░░α░ñα░┐ α░¬α░òα▒ìα░╖α░éα░▓α▒ï α░¬α░ªα░òα▒èα░éα░íα░╡ α░ñα░┐α░Ñα░┐α░¿ α░£α░░α▒üα░ùα▒üα░ñα▒üα░éα░ªα░┐. α░ê α░░α▒ïα░£α▒ü α░¡α░òα▒ìα░ñα▒üα░▓α▒ü α░ëα░¬α░╡α░╛α░╕α░é α░ëα░éα░íα░┐, α░¡α░£α░¿α░▓α▒ü α░Üα▒çα░╕α░┐, α░╡α░┐α░╖α▒ìα░úα▒üα░╡α▒ü α░åα░╢α▒Çα░╕α▒ìα░╕α▒üα░▓α▒ü α░¬α▒èα░éα░ªα▒üα░ñα░╛α░░α▒ü. α░ê α░╡α▒ìα░░α░ñα░é α░¬α░╛α░¬α░╛α░▓α░¿α▒ü α░ñα▒èα░▓α░ùα░┐α░éα░Üα░┐, α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░╢α░╛α░éα░ñα░┐, α░Éα░╢α▒ìα░╡α░░α▒ìα░»α░╛α░¿α▒ìα░¿α░┐ α░çα░╕α▒ìα░ñα▒üα░éα░ªα░┐.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 06:58:18','2025-09-10 06:58:18'),(60,14,7,'α«Åα«òα«╛α«ñα«Üα«┐','α«Åα«òα«╛α«ñα«Üα«┐ α«Äα«⌐α»ìα«¬α«ñα»ü α«╡α«┐α«╖α»ìα«úα»üα«╡α»üα«òα»ìα«òα«╛α«ò α«àα«░α»ìα«¬α»ìα«¬α«úα«┐α«òα»ìα«òα«¬α»ìα«¬α«ƒα»ìα«ƒ α«¬α»üα«⌐α«┐α«ñ α«¿α»ïα«⌐α»ìα«¬α»ü α«¿α«╛α«│α»ì. α«çα«ñα»ü α««α«╛α«ñα«ñα»ìα«ñα«┐α«▒α»ìα«òα»ü α«çα«░α»üα«╡α»çα«│α»ê α«╡α«░α»üα«òα«┐α«▒α«ñα»ü.','α«Åα«òα«╛α«ñα«Üα«┐ α«╣α«┐α«¿α»ìα«ñα»ü α«Üα««α«»α«ñα»ìα«ñα«┐α«▓α»ì α««α«┐α«òα«¬α»ì α«¬α»üα«úα»ìα«úα«┐α«»α««α«╛α«⌐ α«¿α«╛α«│α«╛α«òα«òα»ì α«òα«░α»üα«ñα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü. α«Æα«╡α»ìα«╡α»èα«░α»ü α«¬α«òα»ìα«òα«ñα»ìα«ñα«┐α«⌐α»ì α«¬α«ñα«┐α«⌐α»èα«⌐α»ìα«▒α«╛α««α»ì α«ñα«┐α«ñα«┐α«»α«┐α«▓α»üα««α»ì α«╡α«░α»üα«òα«┐α«▒α«ñα»ü. α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«¬α«òα»ìα«ñα«░α»ìα«òα«│α»ì α«¿α»ïα«⌐α»ìα«¬α»ü α«çα«░α»üα«¿α»ìα«ñα»ü, α««α«¿α»ìα«ñα«┐α«░ α«£α«¬α««α»ì α«Üα»åα«»α»ìα«ñα»ü, α«╡α«┐α«╖α»ìα«úα»üα«╡α«┐α«⌐α»ì α«àα«░α»üα«│α»êα«¬α»ì α«¬α»åα«▒α»üα«òα«┐α«⌐α»ìα«▒α«⌐α«░α»ì. α«¿α»ïα«⌐α»ìα«¬α»ü α«åα«⌐α»ìα««α«╛α«╡α»ê α«Üα»üα«ñα»ìα«ñα«¬α»ìα«¬α«ƒα»üα«ñα»ìα«ñα«┐ α«¬α«╛α«╡α«Öα»ìα«òα«│α»ê α«¿α»Çα«òα»ìα«òα«┐ α«╡α«│α«ñα»ìα«ñα»ê α«ñα«░α»üα««α»ì.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 06:58:18','2025-09-10 06:58:18'),(81,16,1,'Diwali','Diwali, also known as the Festival of Lights, is one of the most important Hindu festivals. It symbolizes the victory of light over darkness, good over evil, and knowledge over ignorance.','Diwali, or Deepavali, is celebrated with great joy across India and many parts of the world. It marks the return of Lord Rama to Ayodhya after defeating Ravana, symbolizing the triumph of good over evil. People decorate their homes with diyas (oil lamps), candles, and colorful rangoli designs. Families perform Lakshmi Puja, seeking blessings for wealth and prosperity. Fireworks, sharing sweets, and exchanging gifts are integral parts of the celebration. Diwali also highlights togetherness, joy, and the importance of spreading positivity and light in life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 18:49:19','2025-09-10 18:49:19'),(82,16,5,'αñªαÑÇαñ╡αñ╛αñ▓αÑÇ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ, αñ£αñ┐αñ╕αÑç αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ αñ¡αÑÇ αñòαñ╣αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê, αñ¬αÑìαñ░αñòαñ╛αñ╢ αñòαñ╛ αñ¬αñ░αÑìαñ╡ αñ╣αÑêαÑñ αñ»αñ╣ αñàαñéαñºαñòαñ╛αñ░ αñ¬αñ░ αñ¬αÑìαñ░αñòαñ╛αñ╢, αñ¼αÑüαñ░αñ╛αñê αñ¬αñ░ αñàαñÜαÑìαñ¢αñ╛αñê αñöαñ░ αñàαñ£αÑìαñ₧αñ╛αñ¿ αñ¬αñ░ αñ£αÑìαñ₧αñ╛αñ¿ αñòαÑÇ αñ╡αñ┐αñ£αñ» αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñ»αñ╛ αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ αñ¡αñ╛αñ░αññ αñöαñ░ αñ╡αñ┐αñ╢αÑìαñ╡αñ¡αñ░ αñ«αÑçαñé αñ¼αñíαñ╝αÑç αñ╣αñ░αÑìαñ╖αÑïαñ▓αÑìαñ▓αñ╛αñ╕ αñ╕αÑç αñ«αñ¿αñ╛αñê αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ αñ»αñ╣ αñ¡αñùαñ╡αñ╛αñ¿ αñ░αñ╛αñ« αñòαÑç αñàαñ»αÑïαñºαÑìαñ»αñ╛ αñ▓αÑîαñƒαñ¿αÑç αñöαñ░ αñ░αñ╛αñ╡αñú αñ¬αñ░ αñ╡αñ┐αñ£αñ» αñ¬αÑìαñ░αñ╛αñ¬αÑìαññ αñòαñ░αñ¿αÑç αñòαÑÇ αñ»αñ╛αñª αñ«αÑçαñé αñ«αñ¿αñ╛αñê αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñÿαñ░αÑïαñé αñòαÑï αñªαÑÇαñ¬αñò, αñ«αÑïαñ«αñ¼αññαÑìαññαÑÇ αñöαñ░ αñ░αñéαñùαÑïαñ▓αÑÇ αñ╕αÑç αñ╕αñ£αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ¬αÑéαñ£αñ╛ αñòαñ░ αñºαñ¿-αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñòαÑÇ αñòαñ╛αñ«αñ¿αñ╛ αñòαÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ αñåαññαñ┐αñ╢αñ¼αñ╛αñ£αÑÇ, αñ«αñ┐αñáαñ╛αñçαñ»αñ╛αñü αñ¼αñ╛αñüαñƒαñ¿αñ╛ αñöαñ░ αñëαñ¬αñ╣αñ╛αñ░ αñªαÑçαñ¿αñ╛ αñçαñ╕ αñ¬αñ░αÑìαñ╡ αñòαñ╛ αñ¬αÑìαñ░αñ«αÑüαñû αñ╣αñ┐αñ╕αÑìαñ╕αñ╛ αñ╣αÑêαÑñ αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñ¬αñ░αñ┐αñ╡αñ╛αñ░ αñöαñ░ αñ╕αñ«αñ╛αñ£ αñ«αÑçαñé αñÅαñòαññαñ╛, αñåαñ¿αñéαñª αñöαñ░ αñ╕αñòαñ╛αñ░αñ╛αññαÑìαñ«αñòαññαñ╛ αñ½αÑêαñ▓αñ╛αñ¿αÑç αñòαñ╛ αñ╕αñéαñªαÑçαñ╢ αñªαÑçαññαÑÇ αñ╣αÑêαÑñ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 18:49:19','2025-09-10 18:49:19'),(83,16,6,'α«ñα»Çα«¬α«╛α«╡α«│α«┐','α«ñα»Çα«¬α«╛α«╡α«│α«┐, α«Æα«│α«┐α«»α«┐α«⌐α»ì α«ñα«┐α«░α»üα«╡α«┐α«┤α«╛ α«Äα«⌐α»ìα«▒α»ü α«àα«┤α»êα«òα»ìα«òα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü. α«çα«ñα»ü α«çα«░α»üα«│α»ìα««α»Çα«ñα»ü α«Æα«│α«┐α«»α«┐α«⌐α»ì α«╡α»åα«▒α»ìα«▒α«┐α«»α»ê, α«ñα»Çα««α»êα«»α«┐α«⌐α»ìα««α»Çα«ñα»ü α«¿α«⌐α»ìα««α»êα«»α«┐α«⌐α»ì α«╡α»åα«▒α»ìα«▒α«┐α«»α»ê α«òα»üα«▒α«┐α«òα»ìα«òα«┐α«▒α«ñα»ü.','α«ñα»Çα«¬α«╛α«╡α«│α«┐ α«çα«¿α»ìα«ñα«┐α«»α«╛ α««α»üα«┤α»üα«╡α«ñα»üα««α»ì α««α«òα«┐α«┤α»ìα«Üα»ìα«Üα«┐α«»α»ïα«ƒα»ü α«òα»èα«úα»ìα«ƒα«╛α«ƒα«¬α»ìα«¬α«ƒα»üα««α»ì α««α»üα«òα»ìα«òα«┐α«» α«ñα«┐α«░α»üα«╡α«┐α«┤α«╛α«╡α«╛α«òα»üα««α»ì. α«çα«ñα»ü α«çα«░α«╛α««α«░α»ì α«àα«»α»ïα«ñα»ìα«ñα«┐α«»α«╛α«╡α»üα«òα»ìα«òα»ü α«ñα«┐α«░α»üα««α»ìα«¬α«┐α«» α«¿α«╛α«│α»êα«»α»üα««α»ì, α«çα«░α«╛α«╡α«úα«⌐α»ê α«╡α»åα«⌐α»ìα«▒ α«╡α»åα«▒α»ìα«▒α«┐α«»α»êα«»α»üα««α»ì α«¿α«┐α«⌐α»êα«╡α»üα«¬α«ƒα»üα«ñα»ìα«ñα»üα«òα«┐α«▒α«ñα»ü. α««α«òα»ìα«òα«│α»ì α«╡α»Çα«ƒα»üα«òα«│α»ê α«ñα»Çα«¬α«Öα»ìα«òα«│α»ì, α««α»åα«┤α»üα«òα»üα«╡α«░α»ìα«ñα»ìα«ñα«┐α«òα«│α»ì, α«╡α«úα»ìα«úα««α«»α««α«╛α«⌐ α«òα»ïα«▓α«Öα»ìα«òα«│α«╛α«▓α»ì α«àα«▓α«Öα»ìα«òα«░α«┐α«òα»ìα«òα«┐α«⌐α»ìα«▒α«⌐α«░α»ì. α«Üα»åα«▓α»ìα«╡α«ñα»ìα«ñα»ê α«àα«░α»üα«│α»üα««α»ì α««α«òα«╛α«▓α«òα»ìα«╖α»ìα««α«┐α«òα»ìα«òα»ü α«¬α»éα«£α»ê α«Üα»åα«»α»ìα«»α«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü. α«¬α«ƒα»ìα«ƒα«╛α«Üα»üα«òα«│α»ì α«╡α»åα«ƒα«┐α«¬α»ìα«¬α«ñα»ü, α«çα«⌐α«┐α«¬α»ìα«¬α»üα«òα«│α»ê α«¬α«òα«┐α«░α»ìα«¿α»ìα«ñα»ü α«òα»èα«│α»ìα«╡α«ñα»ü, α«¬α«░α«┐α«Üα»üα«òα«│α»ê α«¬α«░α«┐α««α«╛α«▒α»üα«╡α«ñα»ü α«åα«òα«┐α«»α«╡α»ê α«╡α«┐α«┤α«╛α«╡α«┐α«⌐α»ì α«Üα«┐α«▒α«¬α»ìα«¬α»ü α«àα««α»ìα«Üα«Öα»ìα«òα«│α«╛α«òα»üα««α»ì. α«ñα»Çα«¬α«╛α«╡α«│α«┐ α««α«òα«┐α«┤α»ìα«Üα»ìα«Üα«┐, α«Æα«▒α»ìα«▒α»üα««α»ê α««α«▒α»ìα«▒α»üα««α»ì α«╡α«╛α«┤α»ìα«╡α«┐α«▓α»ì α«¿α»çα«░α»ìα««α«▒α»êα«»α«╛α«⌐ α«Üα«òα»ìα«ñα«┐α«»α»ê α«¬α«░α«¬α»ìα«¬α»üα««α»ì α«¿α«╛α«│α«╛α«òα»üα««α»ì.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 18:49:19','2025-09-10 18:49:19'),(84,16,7,'α░ªα▒Çα░¬α░╛α░╡α░│α░┐','α░ªα▒Çα░¬α░╛α░╡α░│α░┐ α░▓α▒çα░ªα░╛ α░ªα▒Çα░¬α░╛α░▓ α░¬α░éα░íα▒üα░ù, α░╡α▒åα░▓α▒üα░ùα▒üα░▓ α░¬α░éα░íα▒üα░ùα░ùα░╛ α░¬α▒ìα░░α░╕α░┐α░ªα▒ìα░ºα░┐. α░çα░ªα░┐ α░Üα▒Çα░òα░ƒα░┐ α░«α▒Çα░ª α░╡α▒åα░▓α▒üα░ùα▒ü, α░Üα▒åα░íα▒üα░¬α▒ê α░«α░éα░Üα░┐, α░àα░£α▒ìα░₧α░╛α░¿α░éα░¬α▒ê α░£α▒ìα░₧α░╛α░¿α░é α░ùα▒åα░▓α░┐α░Üα░┐α░¿α░ªα░╛α░¿α▒ìα░¿α░┐ α░╕α▒éα░Üα░┐α░╕α▒ìα░ñα▒üα░éα░ªα░┐.','α░ªα▒Çα░¬α░╛α░╡α░│α░┐ α░¡α░╛α░░α░ñα░ªα▒çα░╢α░éα░▓α▒ï α░«α░░α░┐α░»α▒ü α░¬α▒ìα░░α░¬α░éα░Üα░╡α▒ìα░»α░╛α░¬α▒ìα░ñα░éα░ùα░╛ α░Äα░éα░ñα▒ï α░åα░¿α░éα░ªα░éα░ùα░╛ α░£α░░α▒üα░¬α▒üα░òα▒üα░¿α▒ç α░¬α▒ìα░░α░ºα░╛α░¿ α░¬α░éα░íα▒üα░ù. α░çα░ªα░┐ α░░α░╛α░«α▒üα░íα▒ü α░░α░╛α░╡α░úα▒üα░íα░┐α░¬α▒ê α░╡α░┐α░£α░»α░╛α░¿α▒ìα░¿α░┐ α░╕α░╛α░ºα░┐α░éα░Üα░┐ α░àα░»α▒ïα░ºα▒ìα░»α░òα▒ü α░ñα░┐α░░α░┐α░ùα░┐ α░╡α░Üα▒ìα░Üα░┐α░¿ α░╕α░éα░ªα░░α▒ìα░¡α░éα░ùα░╛ α░£α░░α▒üα░¬α▒üα░òα▒üα░éα░ƒα░╛α░░α▒ü. α░¬α▒ìα░░α░£α░▓α▒ü α░çα░│α▒ìα░▓α░¿α▒ü α░ªα▒Çα░¬α░╛α░▓α▒ü, α░òα▒èα░╡α▒ìα░╡α▒èα░ñα▒ìα░ñα▒üα░▓α▒ü, α░░α░éα░ùα▒üα░░α░éα░ùα▒üα░▓ α░░α░éα░ùα▒ïα░▓α▒Çα░▓α░ñα▒ï α░àα░▓α░éα░òα░░α░┐α░╕α▒ìα░ñα░╛α░░α▒ü. α░▓α░òα▒ìα░╖α▒ìα░«α▒Çα░ªα▒çα░╡α░┐ α░¬α▒éα░£ α░Üα▒çα░╕α░┐ α░╕α░éα░¬α░ª α░òα▒ïα░╕α░é α░åα░╢α▒Çα░░α▒ìα░╡α░╛α░ªα░╛α░▓α▒ü α░òα▒ïα░░α▒üα░òα▒üα░éα░ƒα░╛α░░α▒ü. α░¬α░ƒα░╛α░òα▒üα░▓α▒ü α░òα░╛α░▓α▒ìα░Üα░íα░é, α░«α░┐α░áα░╛α░»α░┐α░▓α▒ü α░¬α░éα░Üα▒üα░òα▒ïα░╡α░íα░é, α░¼α░╣α▒üα░«α░ñα▒üα░▓α▒ü α░çα░Üα▒ìα░Üα░┐α░¬α▒üα░Üα▒ìα░Üα▒üα░òα▒ïα░╡α░íα░é α░ªα▒Çα░¬α░╛α░╡α░│α░┐ α░«α▒üα░ûα▒ìα░»α░«α▒êα░¿ α░╕α░éα░¬α▒ìα░░α░ªα░╛α░»α░╛α░▓α▒ü. α░ê α░¬α░éα░íα▒üα░ù α░åα░¿α░éα░ªα░é, α░Éα░òα░«α░ñα▒ìα░»α░é α░«α░░α░┐α░»α▒ü α░£α▒Çα░╡α░¿α░éα░▓α▒ï α░╕α░╛α░¿α▒üα░òα▒éα░▓α░ñα░¿α▒ü α░╡α░┐α░╕α▒ìα░ñα░░α░┐α░éα░Üα▒ç α░╕α░éα░òα▒çα░ñα░é.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-10 18:49:19','2025-09-10 18:49:19'),(85,17,1,'1','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:13:36','2025-09-14 09:13:36'),(86,17,5,'2','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:13:36','2025-09-14 09:13:36'),(87,17,6,'3','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:13:36','2025-09-14 09:13:36'),(88,17,7,'44','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:13:36','2025-09-14 09:13:36'),(89,18,1,'sa','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:14:15','2025-09-14 09:14:15'),(90,18,5,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:14:15','2025-09-14 09:14:15'),(91,18,6,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:14:15','2025-09-14 09:14:15'),(92,18,7,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 09:14:15','2025-09-14 09:14:15'),(101,15,1,'Purnima','Purnima Vrat is observed every month on the full moon day (Purnima). Devotees observe fasting and offer prayers to Lord Vishnu or Lord Shiva, seeking blessings for peace, prosperity, and spiritual growth. This sacred vrat is believed to cleanse sins, bring harmony in life, and enhance devotion.','Purnima Vrat is a sacred Hindu observance performed every month on the full moon day, known as Purnima. This day holds deep spiritual and religious significance, as the full moon is considered highly auspicious for worship, meditation, and spiritual practices. Devotees observe fasting from sunrise to moonrise or even for the entire day, depending on their faith and tradition. On this day, devotees worship Lord Vishnu, Lord Shiva, or the Satyanarayan form of Vishnu with devotion, chanting mantras, performing rituals, and reading the Satyanarayan Katha. Fasting and prayer on Purnima are believed to purify the mind and body, wash away past sins, and bring divine blessings of peace, prosperity, and happiness in family life. Many people also engage in charity by offering food, clothes, or donations to the poor and needy, which is considered especially meritorious on this day. Each Purnima also has its own special importance depending on the month, such as Guru Purnima, Sharad Purnima, or Kartik Purnima, which are celebrated with great devotion across India. Observing this vrat regularly is said to enhance one&rsquo;s spiritual growth, strengthen devotion, and bring harmony and positivity in life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 11:52:19','2025-09-14 11:52:19'),(102,15,5,'αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛','αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╡αÑìαñ░αññ αñ╣αñ░ αñ«αñ╛αñ╣ αñòαÑÇ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αññαñ┐αñÑαñ┐ αñòαÑï αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñ¡αñòαÑìαññ αñëαñ¬αñ╡αñ╛αñ╕ αñ░αñûαññαÑç αñ╣αÑêαñé αñöαñ░ αñ¡αñùαñ╡αñ╛αñ¿ αñ╡αñ┐αñ╖αÑìαñúαÑü αñàαñÑαñ╡αñ╛ αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αñ┐αñ╡ αñòαÑÇ αñ¬αÑéαñ£αñ╛-αñàαñ░αÑìαñÜαñ¿αñ╛ αñòαñ░αññαÑç αñ╣αÑêαñéαÑñ αñ»αñ╣ αñ¬αñ╡αñ┐αññαÑìαñ░ αñ╡αÑìαñ░αññ αñ¬αñ╛αñ¬αÑïαñé αñòαñ╛ αñ¿αñ╛αñ╢ αñòαñ░αññαñ╛ αñ╣αÑê, αñ£αÑÇαñ╡αñ¿ αñ«αÑçαñé αñ╢αñ╛αñéαññαñ┐ αñöαñ░ αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñ▓αñ╛αññαñ╛ αñ╣αÑê αññαñÑαñ╛ αñ¡αñòαÑìαññαñ┐ αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñëαññαÑìαñÑαñ╛αñ¿ αñòαÑï αñ¼αñóαñ╝αñ╛αññαñ╛ αñ╣αÑêαÑñ','αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ╡αÑìαñ░αññ αñ╣αñ░ αñ«αñ╛αñ╣ αñòαÑÇ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αññαñ┐αñÑαñ┐ αñòαÑï αñòαñ┐αñ»αñ╛ αñ£αñ╛αñ¿αÑç αñ╡αñ╛αñ▓αñ╛ αñÅαñò αñ¬αñ╡αñ┐αññαÑìαñ░ αñ╣αñ┐αñ¿αÑìαñªαÑé αñëαñ¬αñ╡αñ╛αñ╕ αñ╣αÑêαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñòαñ╛ αñºαñ╛αñ░αÑìαñ«αñ┐αñò αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ«αñ╣αññαÑìαñ╡ αñ¼αñ╣αÑüαññ αñùαñ╣αñ░αñ╛ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê, αñòαÑìαñ»αÑïαñéαñòαñ┐ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαñ╛ αñªαñ┐αñ¿ αñ¬αÑéαñ£αñ╛, αñºαÑìαñ»αñ╛αñ¿ αñöαñ░ αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ╕αñ╛αñºαñ¿αñ╛ αñòαÑç αñ▓αñ┐αñÅ αñàαññαÑìαñ»αñéαññ αñ╢αÑüαñ¡ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñ¡αñòαÑìαññαñ£αñ¿ αñçαñ╕ αñªαñ┐αñ¿ αñ╕αÑéαñ░αÑìαñ»αÑïαñªαñ» αñ╕αÑç αñ▓αÑçαñòαñ░ αñÜαñéαñªαÑìαñ░αñ«αñ╛ αñëαñªαñ» αññαñò αñàαñÑαñ╡αñ╛ αñ¬αÑéαñ░αÑç αñªαñ┐αñ¿ αñòαñ╛ αñëαñ¬αñ╡αñ╛αñ╕ αñ░αñûαññαÑç αñ╣αÑêαñé, αñ»αñ╣ αñëαñ¿αñòαÑÇ αñ╢αÑìαñ░αñªαÑìαñºαñ╛ αñöαñ░ αñ¬αñ░αñéαñ¬αñ░αñ╛ αñ¬αñ░ αñ¿αñ┐αñ░αÑìαñ¡αñ░ αñòαñ░αññαñ╛ αñ╣αÑêαÑñ\r\n\r\nαñçαñ╕ αñªαñ┐αñ¿ αñ¡αñòαÑìαññαñ£αñ¿ αñ¡αñùαñ╡αñ╛αñ¿ αñ╡αñ┐αñ╖αÑìαñúαÑü, αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αñ┐αñ╡ αñ»αñ╛ αñ╢αÑìαñ░αÑÇ αñ╕αññαÑìαñ»αñ¿αñ╛αñ░αñ╛αñ»αñú αñòαñ╛ αñ¬αÑéαñ£αñ¿ αñòαñ░αññαÑç αñ╣αÑêαñéαÑñ αñ«αñéαññαÑìαñ░αñ£αñ¬, αñ¬αÑéαñ£αñ╛-αñ╡αñ┐αñºαñ┐ αñöαñ░ αñ╕αññαÑìαñ»αñ¿αñ╛αñ░αñ╛αñ»αñú αñòαñÑαñ╛ αñòαñ╛ αñ¬αñ╛αñá αñçαñ╕ αñ╡αÑìαñ░αññ αñòαñ╛ αñ«αÑüαñûαÑìαñ» αñàαñéαñù αñ╣αÑêαÑñ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαÑç αñªαñ┐αñ¿ αñëαñ¬αñ╡αñ╛αñ╕ αñöαñ░ αñ¬αÑéαñ£αñ¿ αñòαñ░αñ¿αÑç αñ╕αÑç αñ«αñ¿ αñöαñ░ αñ╢αñ░αÑÇαñ░ αñ╢αÑüαñªαÑìαñº αñ╣αÑïαññαÑç αñ╣αÑêαñé, αñ¬αñ╛αñ¬αÑïαñé αñòαñ╛ αñ¿αñ╛αñ╢ αñ╣αÑïαññαñ╛ αñ╣αÑê αñöαñ░ αñ£αÑÇαñ╡αñ¿ αñ«αÑçαñé αñ╢αñ╛αñéαññαñ┐, αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αññαñÑαñ╛ αñ¬αñ╛αñ░αñ┐αñ╡αñ╛αñ░αñ┐αñò αñ╕αÑüαñû αñòαÑÇ αñ¬αÑìαñ░αñ╛αñ¬αÑìαññαñ┐ αñ╣αÑïαññαÑÇ αñ╣αÑêαÑñ αñ¼αñ╣αÑüαññ αñ╕αÑç αñ▓αÑïαñù αñçαñ╕ αñªαñ┐αñ¿ αñªαñ╛αñ¿-αñ¬αÑüαñúαÑìαñ» αñ¡αÑÇ αñòαñ░αññαÑç αñ╣αÑêαñé, αñ£αÑêαñ╕αÑç αñàαñ¿αÑìαñ¿, αñ╡αñ╕αÑìαññαÑìαñ░ αñ»αñ╛ αñºαñ¿ αñòαñ╛ αñªαñ╛αñ¿ αñùαñ░αÑÇαñ¼ αñöαñ░ αñ£αñ░αÑéαñ░αññαñ«αñéαñª αñ▓αÑïαñùαÑïαñé αñòαÑï αñªαÑçαñ¿αñ╛, αñ£αñ┐αñ╕αÑç αñàαññαÑìαñ»αñéαññ αñ½αñ▓αñªαñ╛αñ»αÑÇ αñ«αñ╛αñ¿αñ╛ αñùαñ»αñ╛ αñ╣αÑêαÑñ\r\n\r\nαñ╣αñ░ αñ«αñ╛αñ╣ αñòαÑÇ αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñòαñ╛ αñàαñ¬αñ¿αñ╛ αñ╡αñ┐αñ╢αÑçαñ╖ αñ«αñ╣αññαÑìαñ╡ αñ¡αÑÇ αñ╣αÑïαññαñ╛ αñ╣αÑê, αñ£αÑêαñ╕αÑç αñùαÑüαñ░αÑü αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛, αñ╢αñ░αñª αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛ αñ»αñ╛ αñòαñ╛αñ░αÑìαññαñ┐αñò αñ¬αÑéαñ░αÑìαñúαñ┐αñ«αñ╛, αñ£αñ┐αñ¿αÑìαñ╣αÑçαñé αñ¡αñ╛αñ░αññαñ¡αñ░ αñ«αÑçαñé αñ¼αñíαñ╝αÑÇ αñ╢αÑìαñ░αñªαÑìαñºαñ╛ αñöαñ░ αñ¡αñòαÑìαññαñ┐ αñ╕αÑç αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñ¿αñ┐αñ»αñ«αñ┐αññ αñ░αÑéαñ¬ αñ╕αÑç αñçαñ╕ αñ╡αÑìαñ░αññ αñòαñ╛ αñ¬αñ╛αñ▓αñ¿ αñòαñ░αñ¿αÑç αñ╕αÑç αñåαñºαÑìαñ»αñ╛αññαÑìαñ«αñ┐αñò αñ¬αÑìαñ░αñùαññαñ┐ αñ╣αÑïαññαÑÇ αñ╣αÑê, αñ¡αñòαÑìαññαñ┐ αñòαÑÇ αñ╢αñòαÑìαññαñ┐ αñ¼αñóαñ╝αññαÑÇ αñ╣αÑê αñöαñ░ αñ£αÑÇαñ╡αñ¿ αñ«αÑçαñé αñ╕αñ╛αñ«αñéαñ£αñ╕αÑìαñ» αñ╡ αñ╕αñòαñ╛αñ░αñ╛αññαÑìαñ«αñòαññαñ╛ αñåαññαÑÇ αñ╣αÑêαÑñ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 11:52:19','2025-09-14 11:52:19'),(103,15,6,'α«¬α»éα«░α»ìα«úα«┐α««α«╛','α«¬α»îα«░α»ìα«úα««α«┐ α«╡α«┐α«░α«ñα««α»ì α«Æα«╡α»ìα«╡α»èα«░α»ü α««α«╛α«ñα««α»üα««α»ì α«¬α»îα«░α»ìα«úα««α«┐ α«¿α«╛α«│α«┐α«▓α»ì α«àα«⌐α»üα«╖α»ìα«ƒα«┐α«òα»ìα«òα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü. α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«¬α«òα»ìα«ñα«░α»ìα«òα«│α»ì α«ëα«¬α«╡α«╛α«Üα««α»ì α«çα«░α»üα«¿α»ìα«ñα»ü, α«╡α«┐α«╖α»ìα«úα»ü α«¬α«òα«╡α«╛α«⌐α»ì α«àα«▓α»ìα«▓α«ñα»ü α«Üα«┐α«╡α«¬α»åα«░α»üα««α«╛α«⌐α»ê α«╡α«┤α«┐α«¬α«ƒα»üα«òα«┐α«⌐α»ìα«▒α«⌐α«░α»ì. α«çα«¿α»ìα«ñ α«¬α»üα«⌐α«┐α«ñ α«╡α«┐α«░α«ñα««α»ì α«¬α«╛α«¬α«Öα»ìα«òα«│α»ê α«¿α»Çα«òα»ìα«òα«┐, α«╡α«╛α«┤α»ìα«òα»ìα«òα»êα«»α«┐α«▓α»ì α«àα««α»êα«ñα«┐, α«Üα»åα«┤α«┐α«¬α»ìα«¬α»ü α«àα«│α«┐α«ñα»ìα«ñα»ü, α«¬α«òα»ìα«ñα«┐ α««α«▒α»ìα«▒α»üα««α»ì α«åα«⌐α»ìα««α«┐α«ò α««α»üα«⌐α»ìα«⌐α»çα«▒α»ìα«▒α«ñα»ìα«ñα»ê α«àα«ñα«┐α«òα«░α«┐α«òα»ìα«òα»üα««α»ì α«Äα«⌐α»ìα«▒α»ü α«¿α««α»ìα«¬α«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü.','α«¬α»îα«░α»ìα«úα««α«┐ α«╡α«┐α«░α«ñα««α»ì α«Æα«╡α»ìα«╡α»èα«░α»ü α««α«╛α«ñα««α»üα««α»ì α«¬α»îα«░α»ìα«úα««α«┐ α«¿α«╛α«│α«┐α«▓α»ì α«àα«⌐α»üα«╖α»ìα«ƒα«┐α«òα»ìα«òα«¬α»ìα«¬α«ƒα»üα««α»ì α«¬α»üα«⌐α«┐α«ñ α«çα«¿α»ìα«ñα»ü α«╡α«┐α«░α«ñα««α«╛α«òα»üα««α»ì. α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«⌐α»ì α«åα«⌐α»ìα««α»Çα«ò α««α«▒α»ìα«▒α»üα««α»ì α««α«ñα«¬α»ìα«¬α»èα«░α»üα«│α»ì α««α«┐α«òα«╡α»üα««α»ì α«åα«┤α««α«╛α«⌐α«ñα«╛α«òα«òα»ì α«òα«░α»üα«ñα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü, α«Åα«⌐α»åα«⌐α«┐α«▓α»ì α«¬α»îα«░α»ìα«úα««α«┐ α«ñα«┐α«ñα«┐ α«¬α»éα«£α»ê, α«ñα«┐α«»α«╛α«⌐α««α»ì α««α«▒α»ìα«▒α»üα««α»ì α«åα«⌐α»ìα««α»Çα«ò α«Üα«╛α«ñα«⌐α»êα«òα«│α»üα«òα»ìα«òα»ü α««α«┐α«òα«Üα»ì α«Üα«┐α«▒α«¿α»ìα«ñα«ñα«╛α«òα«òα»ì α«òα«░α»üα«ñα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü. α«¬α«òα»ìα«ñα«░α»ìα«òα«│α»ì α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«Üα»éα«░α«┐α«» α«ëα«ñα«»α«ñα»ìα«ñα«┐α«▓α«┐α«░α»üα«¿α»ìα«ñα»ü α«Üα«¿α»ìα«ñα«┐α«░α»ïα«ñα«»α««α»ì α«╡α«░α»ê α«àα«▓α»ìα«▓α«ñα»ü α«Üα«┐α«▓α«░α»ì α««α»üα«┤α»üα«¿α«╛α«│α»üα««α»ì α«¿α»ïα«⌐α»ìα«¬α»ü α«¿α»ïα«▒α»ìα«¬α«ñα»ü α«╡α«┤α«òα»ìα«òα««α»ì. α«çα«ñα»ü α«àα«╡α«░α»ìα«òα«│α«┐α«⌐α»ì α«¬α«╛α«░α««α»ìα«¬α«░α«┐α«»α««α»üα««α»ì, α«¿α««α»ìα«¬α«┐α«òα»ìα«òα»êα«»α»üα««α»ì α«Üα«╛α«░α»ìα«¿α»ìα«ñα«ñα«╛α«òα»üα««α»ì.\r\n\r\nα«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«¬α«òα»ìα«ñα«░α»ìα«òα«│α»ì α«╡α«┐α«╖α»ìα«úα»ü α«¬α«òα«╡α«╛α«⌐α»ì, α«Üα«┐α«╡α«¬α»åα«░α»üα««α«╛α«⌐α»ì α«àα«▓α»ìα«▓α«ñα»ü α«╕α»ìα«░α»Ç α«Üα«ñα»ìα«ñα«┐α«»α«¿α«╛α«░α«╛α«»α«úα«░α»ê α«¬α«òα»ìα«ñα«┐α«»α»üα«ƒα«⌐α»ì α«╡α«┤α«┐α«¬α«ƒα»üα«òα«┐α«⌐α»ìα«▒α«⌐α«░α»ì. α««α«¿α»ìα«ñα«┐α«░ α«£α«¬α««α»ì, α«¬α»éα«£α»ê α««α»üα«▒α»êα«òα«│α»ì α««α«▒α»ìα«▒α»üα««α»ì α«Üα«ñα»ìα«ñα«┐α«»α«¿α«╛α«░α«╛α«»α«ú α«òα«ñα»êα«»α«┐α«⌐α»ì α«¬α«╛α«░α«╛α«»α«úα««α»ì α«çα«¿α»ìα«ñ α«╡α«┐α«░α«ñα«ñα»ìα«ñα«┐α«⌐α»ì α««α»üα«òα»ìα«òα«┐α«» α«àα««α»ìα«Üα«Öα»ìα«òα«│α«╛α«òα»üα««α»ì. α«¬α»îα«░α»ìα«úα««α«┐ α«¿α«╛α«│α«┐α«▓α»ì α«╡α«┐α«░α«ñα««α»ì α«çα«░α»üα«¿α»ìα«ñα»ü, α«çα«▒α»ê α«╡α«┤α«┐α«¬α«╛α«ƒα»ü α«Üα»åα«»α»ìα«╡α«ñα»ü α««α«⌐α««α»üα««α»ì α«ëα«ƒα«▓α»üα««α»ì α«¬α»üα«⌐α«┐α«ñα««α«╛α«ò α«åα«òα»ìα«òα»üα««α»ì, α«¬α«╛α«¬α«Öα»ìα«òα«│α»ê α«¿α»Çα«òα»ìα«òα»üα««α»ì, α«òα»üα«ƒα»üα««α»ìα«¬α«ñα»ìα«ñα«┐α«▓α»ì α«àα««α»êα«ñα«┐, α«Üα»åα«┤α«┐α«¬α»ìα«¬α»ü, α«Üα«¿α»ìα«ñα»ïα«╖α««α»ì α«åα«òα«┐α«»α«╡α«▒α»ìα«▒α»ê α«àα«░α»üα«│α«¬α»ìα«¬α»åα«▒α«Üα»ì α«Üα»åα«»α»ìα«òα«┐α«▒α«ñα»ü. α«¬α«▓α«░α»ì α«çα«¿α»ìα«ñ α«¿α«╛α«│α«┐α«▓α»ì α«¬α«Üα«┐α«ñα»ìα«ñα«╡α«░α»ìα«òα«│α»üα«òα»ìα«òα»ü α«ëα«úα«╡α»ü, α«åα«ƒα»êα«òα«│α»ì α«àα«▓α»ìα«▓α«ñα»ü α«¬α»èα«░α»üα«│α«╛α«ñα«╛α«░ α«ëα«ñα«╡α«┐ α«╡α«┤α«Öα»ìα«òα»üα«╡α«ñα»êα«»α»üα««α»ì α«Üα«┐α«▒α«¬α»ìα«¬α«╛α«òα«Üα»ì α«Üα»åα«»α»ìα«òα«┐α«⌐α»ìα«▒α«⌐α«░α»ì. α«çα«ñα»ü α««α«┐α«òα«¬α»ì α«¬α»åα«░α«┐α«» α«¬α»üα«úα»ìα«úα«┐α«»α««α«╛α«òα«òα»ì α«òα«░α»üα«ñα«¬α»ìα«¬α«ƒα»üα«òα«┐α«▒α«ñα»ü.\r\n\r\nα«Æα«╡α»ìα«╡α»èα«░α»ü α««α«╛α«ñ α«¬α»îα«░α»ìα«úα««α«┐α«òα»ìα«òα»üα««α»ì α«ñα«⌐α«┐α«ñα»ìα«ñα«⌐α»ìα««α»êα«»α«╛α«⌐ α««α»üα«òα»ìα«òα«┐α«»α«ñα»ìα«ñα»üα«╡α««α»ì α«ëα«│α»ìα«│α«ñα»ü. α«ëα«ñα«╛α«░α«úα««α«╛α«ò, α«òα»üα«░α»ü α«¬α»îα«░α»ìα«úα««α«┐, α«Üα«░α«ñα»ìα«¬α»îα«░α»ìα«úα««α«┐, α«òα«╛α«░α»ìα«ñα»ìα«ñα«┐α«òα»ê α«¬α»îα«░α»ìα«úα««α«┐ α«¬α»ïα«⌐α»ìα«▒α«╡α»ê α«çα«¿α»ìα«ñα«┐α«»α«╛ α««α»üα«┤α»üα«╡α«ñα»üα««α»ì α««α«┐α«òα»üα«¿α»ìα«ñ α«¬α«òα»ìα«ñα«┐α«»α»üα«ƒα«⌐α»ì α«òα»èα«úα»ìα«ƒα«╛α«ƒα«¬α»ìα«¬α«ƒα»üα«òα«┐α«⌐α»ìα«▒α«⌐. α«çα«¿α»ìα«ñ α«╡α«┐α«░α«ñα«ñα»ìα«ñα»ê α«¿α«┐α«ñα»ìα«»α««α«╛α«òα«òα»ì α«òα«ƒα»êα«¬α»ìα«¬α«┐α«ƒα«┐α«¬α»ìα«¬α«ñα»ü α«åα«⌐α»ìα««α»Çα«ò α««α»üα«⌐α»ìα«⌐α»çα«▒α»ìα«▒α«ñα»ìα«ñα»ê α«àα«ñα«┐α«òα«░α«┐α«òα»ìα«òα«┐α«▒α«ñα»ü, α«¬α«òα»ìα«ñα«┐ α«¬α«▓α«ñα»ìα«ñα»ê α«╡α«▓α»üα«¬α»ìα«¬α«ƒα»üα«ñα»ìα«ñα»üα«òα«┐α«▒α«ñα»ü, α««α»çα«▓α»üα««α»ì α«╡α«╛α«┤α»ìα«òα»ìα«òα»êα«»α«┐α«▓α»ì α«Æα«▒α»ìα«▒α»üα««α»êα«»α»üα««α»ì α«¿α»çα«░α»ìα««α«▒α»êα«»α«╛α«⌐ α«Üα«òα»ìα«ñα«┐α«òα«│α»êα«»α»üα««α»ì α«àα«│α«┐α«òα»ìα«òα«┐α«▒α«ñα»ü.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 11:52:19','2025-09-14 11:52:19'),(104,15,7,'α░¬α▒éα░░α▒ìα░úα░┐α░«','α░¬α▒îα░░α▒ìα░úα░«α░┐ α░╡α▒ìα░░α░ñα░é α░¬α▒ìα░░α░ñα░┐ α░¿α▒åα░▓ α░¬α▒îα░░α▒ìα░úα░«α░┐ α░░α▒ïα░£α▒üα░¿ α░åα░Üα░░α░┐α░éα░Üα░¼α░íα▒üα░ñα▒üα░éα░ªα░┐. α░ê α░░α▒ïα░£α▒ü α░¡α░òα▒ìα░ñα▒üα░▓α▒ü α░ëα░¬α░╡α░╛α░╕α░é α░Üα▒çα░╕α░┐, α░╢α▒ìα░░α▒Çα░«α░╣α░╛α░╡α░┐α░╖α▒ìα░úα▒üα░╡α▒ü α░▓α▒çα░ªα░╛ α░╢α░┐α░╡α▒üα░íα░┐α░¿α░┐ α░¬α▒éα░£α░┐α░╕α▒ìα░ñα░╛α░░α▒ü. α░ê α░¬α░╡α░┐α░ñα▒ìα░░ α░╡α▒ìα░░α░ñα░é α░¬α░╛α░¬α░╛α░▓α░¿α▒ü α░ñα▒èα░▓α░ùα░┐α░éα░Üα░┐, α░£α▒Çα░╡α░┐α░ñα░éα░▓α▒ï α░╢α░╛α░éα░ñα░┐, α░╕α░éα░¬α░ªα░¿α▒ü α░¬α▒ìα░░α░╕α░╛α░ªα░┐α░éα░Üα░┐, α░¡α░òα▒ìα░ñα░┐ α░«α░░α░┐α░»α▒ü α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░¬α▒ìα░░α░ùα░ñα░┐α░¿α░┐ α░¬α▒åα░éα░¬α▒èα░éα░ªα░┐α░╕α▒ìα░ñα▒üα░éα░ªα░¿α░┐ α░¿α░«α▒ìα░«α░òα░é.','α░¬α▒îα░░α▒ìα░úα░«α░┐ α░╡α▒ìα░░α░ñα░é α░¬α▒ìα░░α░ñα░┐ α░¿α▒åα░▓ α░¬α▒îα░░α▒ìα░úα░«α░┐ α░░α▒ïα░£α▒üα░¿ α░åα░Üα░░α░┐α░éα░Üα░¼α░íα▒ç α░¬α░╡α░┐α░ñα▒ìα░░ α░╣α░┐α░éα░ªα▒é α░ëα░¬α░╡α░╛α░╕α░é. α░ê α░░α▒ïα░£α▒üα░òα▒ü α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░òα░éα░ùα░╛ α░«α░░α░┐α░»α▒ü α░«α░ñα░¬α░░α░éα░ùα░╛ α░ùα▒èα░¬α▒ìα░¬ α░¬α▒ìα░░α░╛α░«α▒üα░ûα▒ìα░»α░ñ α░ëα░éα░ªα░┐, α░Äα░éα░ªα▒üα░òα░éα░ƒα▒ç α░¬α▒îα░░α▒ìα░úα░«α░┐ α░ñα░┐α░Ñα░┐ α░¬α▒éα░£, α░ºα▒ìα░»α░╛α░¿α░é α░«α░░α░┐α░»α▒ü α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░╕α░╛α░ºα░¿α░▓α░òα▒ü α░àα░ñα▒ìα░»α░éα░ñ α░╢α▒üα░¡α░¬α▒ìα░░α░ªα░«α▒êα░¿α░ªα░┐α░ùα░╛ α░¡α░╛α░╡α░┐α░éα░Üα░¼α░íα▒üα░ñα▒üα░éα░ªα░┐. α░¡α░òα▒ìα░ñα▒üα░▓α▒ü α░ê α░░α▒ïα░£α▒ü α░╕α▒éα░░α▒ìα░»α▒ïα░ªα░»α░é α░¿α▒üα░éα░íα░┐ α░Üα░éα░ªα▒ìα░░α▒ïα░ªα░»α░é α░╡α░░α░òα▒ü α░▓α▒çα░ªα░╛ α░òα▒èα░éα░ªα░░α▒ü α░╕α░éα░¬α▒éα░░α▒ìα░úα░éα░ùα░╛ α░░α▒ïα░£α▒ü α░«α▒èα░ñα▒ìα░ñα░é α░ëα░¬α░╡α░╛α░╕α░é α░ëα░éα░ƒα░╛α░░α▒ü, α░çα░ªα░┐ α░╡α░╛α░░α░┐ α░╡α░┐α░╢α▒ìα░╡α░╛α░╕α░é α░«α░░α░┐α░»α▒ü α░åα░Üα░╛α░░α░éα░¬α▒ê α░åα░ºα░╛α░░α░¬α░íα░┐ α░ëα░éα░ƒα▒üα░éα░ªα░┐.\r\n\r\nα░ê α░░α▒ïα░£α▒üα░¿ α░¡α░òα▒ìα░ñα▒üα░▓α▒ü α░╢α▒ìα░░α▒Çα░«α░╣α░╛α░╡α░┐α░╖α▒ìα░úα▒üα░╡α▒ü, α░╢α░┐α░╡α░¬α░░α░«α▒çα░╢α▒ìα░╡α░░α▒üα░íα▒ü α░▓α▒çα░ªα░╛ α░╢α▒ìα░░α▒Ç α░╕α░ñα▒ìα░»α░¿α░╛α░░α░╛α░»α░ú α░╕α▒ìα░╡α░╛α░«α░┐α░¿α░┐ α░¡α░òα▒ìα░ñα░┐ α░¡α░╛α░╡α░éα░ñα▒ï α░åα░░α░╛α░ºα░┐α░╕α▒ìα░ñα░╛α░░α▒ü. α░«α░éα░ñα▒ìα░░α░£α░¬α░é, α░¬α▒éα░£α░╛α░╡α░┐α░ºα▒üα░▓α▒ü, α░╕α░ñα▒ìα░»α░¿α░╛α░░α░╛α░»α░ú α░òα░Ñα░╛ α░¬α░╛α░░α░╛α░»α░úα░é α░ê α░╡α▒ìα░░α░ñα░╛α░¿α░┐α░òα░┐ α░«α▒üα░ûα▒ìα░» α░¡α░╛α░ùα░╛α░▓α▒ü. α░¬α▒îα░░α▒ìα░úα░«α░┐ α░¿α░╛α░íα▒ü α░ëα░¬α░╡α░╛α░╕α░é α░ëα░éα░íα░ƒα░é α░«α░░α░┐α░»α▒ü α░¬α▒éα░£α░▓α▒ü α░Üα▒çα░»α░íα░é α░«α░¿α░╕α▒ü α░«α░░α░┐α░»α▒ü α░╢α░░α▒Çα░░α░╛α░¿α▒ìα░¿α░┐ α░¬α░╡α░┐α░ñα▒ìα░░α░é α░Üα▒çα░╕α▒ìα░ñα▒üα░éα░ªα░¿α░┐, α░¬α░╛α░¬α░╛α░▓α░¿α▒ü α░ñα▒èα░▓α░ùα░┐α░╕α▒ìα░ñα▒üα░éα░ªα░¿α░┐, α░òα▒üα░ƒα▒üα░éα░¼α░éα░▓α▒ï α░╢α░╛α░éα░ñα░┐, α░Éα░╢α▒ìα░╡α░░α▒ìα░»α░é, α░åα░¿α░éα░ªα░é α░òα░▓α▒üα░ùα▒üα░ñα▒üα░éα░ªα░¿α░┐ α░¿α░«α▒ìα░«α░òα░é. α░Üα░╛α░▓α░╛α░«α░éα░ªα░┐ α░ê α░░α▒ïα░£α▒üα░¿ α░àα░¿α▒ìα░¿α░ªα░╛α░¿α░é, α░╡α░╕α▒ìα░ñα▒ìα░░α░ªα░╛α░¿α░é α░▓α▒çα░ªα░╛ α░åα░░α▒ìα░Ñα░┐α░ò α░╕α░╣α░╛α░»α░é α░ªα▒ìα░╡α░╛α░░α░╛ α░¬α▒çα░ªα░▓α░òα▒ü, α░àα░╡α░╕α░░α░«α▒êα░¿ α░╡α░╛α░░α░┐α░òα░┐ α░╕α░╣α░╛α░»α░é α░Üα▒çα░╕α▒ìα░ñα░╛α░░α▒ü. α░çα░ªα░┐ α░àα░ñα▒ìα░»α░éα░ñ α░¬α▒üα░úα▒ìα░»α░¬α▒ìα░░α░ªα░«α░¿α░┐ α░¡α░╛α░╡α░┐α░╕α▒ìα░ñα░╛α░░α▒ü.\r\n\r\nα░¬α▒ìα░░α░ñα░┐ α░¿α▒åα░▓ α░¬α▒îα░░α▒ìα░úα░«α░┐α░òα░┐ α░¬α▒ìα░░α░ñα▒ìα░»α▒çα░òα░«α▒êα░¿ α░¬α▒ìα░░α░╛α░«α▒üα░ûα▒ìα░»α░ñ α░ëα░éα░ƒα▒üα░éα░ªα░┐. α░ëα░ªα░╛α░╣α░░α░úα░òα▒ü, α░ùα▒üα░░α▒ü α░¬α▒îα░░α▒ìα░úα░«α░┐, α░╢α░░α░ªα▒ì α░¬α▒îα░░α▒ìα░úα░«α░┐, α░òα░╛α░░α▒ìα░ñα▒Çα░ò α░¬α▒îα░░α▒ìα░úα░«α░┐ α░╡α░éα░ƒα░┐ α░¬α▒îα░░α▒ìα░úα░«α▒üα░▓α▒ü α░¡α░╛α░░α░ñα░ªα▒çα░╢α░«α░éα░ñα░ƒα░╛ α░ùα▒èα░¬α▒ìα░¬ α░¡α░òα▒ìα░ñα░┐α░ñα▒ï α░£α░░α▒üα░¬α░¼α░íα░ñα░╛α░»α░┐. α░ê α░╡α▒ìα░░α░ñα░╛α░¿α▒ìα░¿α░┐ α░¿α░┐α░░α░éα░ñα░░α░é α░åα░Üα░░α░┐α░éα░Üα░íα░é α░╡α░▓α░¿ α░åα░ºα▒ìα░»α░╛α░ñα▒ìα░«α░┐α░ò α░¬α▒ìα░░α░ùα░ñα░┐ α░òα░▓α▒üα░ùα▒üα░ñα▒üα░éα░ªα░┐, α░¡α░òα▒ìα░ñα░┐ α░╢α░òα▒ìα░ñα░┐ α░¬α▒åα░░α▒üα░ùα▒üα░ñα▒üα░éα░ªα░┐, α░àα░▓α░╛α░ùα▒ç α░£α▒Çα░╡α░┐α░ñα░éα░▓α▒ï α░Éα░òα░«α░ñα▒ìα░»α░é, α░╕α░╛α░¿α▒üα░òα▒éα░▓ α░╢α░òα▒ìα░ñα░┐ α░▓α░¡α░┐α░╕α▒ìα░ñα▒üα░éα░ªα░┐.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-14 11:52:19','2025-09-14 11:52:19'),(117,21,1,'nice','','','chicku',NULL,NULL,NULL,NULL,NULL,NULL,'2025-11-06 18:18:07','2025-11-06 18:18:07'),(121,22,1,'Diwali','Festival of Lights celebrated across India.','Diwali, also known as Deepavali, is one of the most important Hindu festivals celebrated across India and abroad. It symbolizes the victory of light over darkness and good over evil. People decorate their homes with diyas, burst fireworks, and exchange sweets.','Deepavali (Tamil Nadu), Dipawali (Bihar), Kali Puja (West Bengal)','Uttar Pradesh, Maharashtra, Tamil Nadu, Gujarat, West Bengal, Karnataka, Delhi, Rajasthan','5 Days','Day 1: Dhanteras - dedicated to wealth.\r\nDay 2: Naraka Chaturdashi - celebrates the victory of Krishna over Narakasura.\r\nDay 3: Lakshmi Puja - main day of Diwali, worship of Goddess Lakshmi.\r\nDay 4: Govardhan Puja - honors Krishna lifting Govardhan hill.\r\nDay 5: Bhai Dooj - celebrates the bond between brothers and sisters.','Ayodhya Ram Mandir, Siddhivinayak Temple (Mumbai), Meenakshi Temple (Madurai), Laxmi Narayan Temple (Delhi)','Diwali marks Lord RamaΓÇÖs return to Ayodhya after 14 years of exile and his victory over Ravana. It is also associated with Goddess LakshmiΓÇÖs birth from the ocean of milk and Lord KrishnaΓÇÖs defeat of Narakasura.','People light diyas, decorate homes, wear new clothes, and distribute sweets. The festival promotes unity and prosperity.','2025-11-09 10:32:15','2025-11-09 10:32:15'),(122,22,5,'','','','','','','','','','','2025-11-09 10:32:15','2025-11-09 10:32:15'),(123,22,6,'','','','','','','','','','','2025-11-09 10:32:15','2025-11-09 10:32:15'),(124,22,7,'','','','','','','','','','','2025-11-09 10:32:15','2025-11-09 10:32:15'),(129,19,1,'Dasara','','',NULL,NULL,NULL,NULL,'','','','2025-11-09 14:03:54','2025-11-09 14:03:54'),(130,19,5,'','','',NULL,NULL,NULL,NULL,'','','','2025-11-09 14:03:54','2025-11-09 14:03:54'),(131,19,6,'','','',NULL,NULL,NULL,NULL,'','','','2025-11-09 14:03:54','2025-11-09 14:03:54'),(132,19,7,'','','',NULL,NULL,NULL,NULL,'','','','2025-11-09 14:03:54','2025-11-09 14:03:54'),(133,20,1,'Sankranthi','','','','','','','','','hii','2025-11-09 14:06:23','2025-11-09 14:06:23'),(134,20,5,'','','','','','','','','','','2025-11-09 14:06:23','2025-11-09 14:06:23'),(135,20,6,'','','','','','','','','','','2025-11-09 14:06:23','2025-11-09 14:06:23'),(136,20,7,'','','','','','','','','','','2025-11-09 14:06:23','2025-11-09 14:06:23'),(209,24,1,'Test Name','Short Description__ Short Description__ Short Description__','Long Description--- Long Description--- Long Description---','Regional Names,Regional Names,Regional Names,Regional Names,Regional Names','States Celebrated,States Celebrated,States Celebrated,States Celebrated,States Celebrated,States Celebrated','5 days','Daily Significance Daily Significance. Daily','Temples to Visit Temples to VisitTemples to Visit','History of the Festival History of the Festival','Other Information Other Information Other Information','2025-12-11 18:57:40','2025-12-11 18:57:40'),(210,24,5,'','','','','','','','','','','2025-12-11 18:57:40','2025-12-11 18:57:40'),(211,24,6,'','','','','','','','','','','2025-12-11 18:57:40','2025-12-11 18:57:40'),(212,24,7,'','','','','','','','','','','2025-12-11 18:57:40','2025-12-11 18:57:40'),(221,23,1,'Diwali / Deepawali','The festival of lights symbolizing the victory of light over darkness.','Diwali, also known as Deepawali, is one of the most important and widely celebrated festivals in India. It marks the return of Lord Rama, Goddess Sita, and Lakshmana to Ayodhya after fourteen years of exile and the victory over the demon king Ravana. People celebrate this day by lighting diyas, decorating their homes with colorful rangolis, and worshipping Goddess Lakshmi, the goddess of wealth and prosperity. The entire atmosphere is filled with joy, devotion, and celebration as families gather together to share sweets, gifts, and happiness. The night sky glows with fireworks, and every home radiates light and warmth, symbolizing the triumph of light over darkness and good over evil. Diwali also marks the beginning of the Hindu New Year in many regions and is considered an auspicious time for starting new ventures, buying gold, and performing Lakshmi Puja. Beyond its religious significance, Diwali spreads a universal message of hope, peace, and togetherness, making it one of the most loved and unifying festivals in the country.','Diwali is known by different names across India such as Deepavali in South India and Dipawali in some northern and central states.','It is celebrated with great enthusiasm in Uttar Pradesh, Maharashtra, Gujarat, Tamil Nadu, Delhi, and many other parts of the country.','The festival is celebrated for five days, starting with Dhanteras, followed by Naraka Chaturdashi, Lakshmi Puja, Govardhan Puja, and concluding with Bhai Dooj.','Each day of Diwali carries its own importance. Dhanteras marks the beginning of the celebrations and is considered auspicious for buying gold and new utensils. The second day, Naraka Chaturdashi, celebrates Lord KrishnaΓÇÖs victory over Narakasura. The third day, Lakshmi Puja, is the main day when people worship Goddess Lakshmi for wealth and prosperity. The fourth day, Govardhan Puja, signifies Lord Krishna lifting the Govardhan Hill to protect the people of Vrindavan, and the fifth day, Bhai Dooj, celebrates the bond between brothers and sisters.','Some of the most sacred places to visit during Diwali include the Ayodhya Ram Mandir, Kashi Vishwanath Temple in Varanasi, Tirupati Balaji Temple in Andhra Pradesh, Meenakshi Temple in Madurai, and Siddhivinayak Temple in Mumbai. These temples witness grand celebrations, special prayers, and beautiful decorations throughout the festival.','The story behind Diwali dates back to the epic Ramayana when Lord Rama returned to Ayodhya after defeating Ravana. The people of Ayodhya illuminated the entire city with rows of lamps to welcome him back. This tradition continues today, symbolizing the spreading of light, happiness, and peace.','During Diwali, people exchange gifts, decorate their homes with diyas and lights, and prepare delicious sweets and snacks. Markets and streets are filled with festive energy, and the spirit of joy brings people together irrespective of their backgrounds. Many also perform charity and help the needy, making the festival not just about celebration but also compassion and gratitude. Diwali promotes the universal message of love, light, and harmony, reminding everyone that even in the darkest times, light will always prevail.','2025-12-15 13:17:43','2025-12-15 13:17:43'),(222,23,5,'αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ / αñªαñ┐αñ╡αñ╛αñ▓αÑÇ','αñ»αñ╣ αñ░αÑïαñ╢αñ¿αÑÇ αñòαñ╛ αñ¬αñ░αÑìαñ╡ αñ╣αÑê αñ£αÑï αñàαñéαñºαñòαñ╛αñ░ αñ¬αñ░ αñ¬αÑìαñ░αñòαñ╛αñ╢ αñòαÑÇ αñ╡αñ┐αñ£αñ» αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ, αñ£αñ┐αñ╕αÑç αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ αñ¡αÑÇ αñòαñ╣αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê, αñ¡αñ╛αñ░αññ αñòαÑç αñ╕αñ¼αñ╕αÑç αñ«αñ╣αññαÑìαñ╡αñ¬αÑéαñ░αÑìαñú αñöαñ░ αñ╡αÑìαñ»αñ╛αñ¬αñò αñ░αÑéαñ¬ αñ╕αÑç αñ«αñ¿αñ╛αñÅ αñ£αñ╛αñ¿αÑç αñ╡αñ╛αñ▓αÑç αññαÑìαñ»αÑïαñ╣αñ╛αñ░αÑïαñé αñ«αÑçαñé αñ╕αÑç αñÅαñò αñ╣αÑêαÑñ αñ»αñ╣ αññαÑìαñ»αÑïαñ╣αñ╛αñ░ αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αÑìαñ░αÑÇαñ░αñ╛αñ«, αñªαÑçαñ╡αÑÇ αñ╕αÑÇαññαñ╛ αñöαñ░ αñ▓αñòαÑìαñ╖αÑìαñ«αñú αñòαÑç αñÜαÑîαñªαñ╣ αñ╡αñ░αÑìαñ╖αÑïαñé αñòαÑç αñ╡αñ¿αñ╡αñ╛αñ╕ αñòαÑç αñ¼αñ╛αñª αñàαñ»αÑïαñºαÑìαñ»αñ╛ αñ▓αÑîαñƒαñ¿αÑç αñöαñ░ αñ░αñ╛αñ╡αñú αñ¬αñ░ αñ╡αñ┐αñ£αñ» αñ¬αÑìαñ░αñ╛αñ¬αÑìαññ αñòαñ░αñ¿αÑç αñòαÑÇ αñ╕αÑìαñ«αÑâαññαñ┐ αñ«αÑçαñé αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñçαñ╕ αñªαñ┐αñ¿ αñ▓αÑïαñù αñàαñ¬αñ¿αÑç αñÿαñ░αÑïαñé αñ«αÑçαñé αñªαÑÇαñ¬αñò αñ£αñ▓αñ╛αññαÑç αñ╣αÑêαñé, αñ░αñéαñùαÑïαñ▓αÑÇ αñ¼αñ¿αñ╛αññαÑç αñ╣αÑêαñé αñöαñ░ αñ«αñ╛αñü αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñòαÑÇ αñ¬αÑéαñ£αñ╛ αñòαñ░αññαÑç αñ╣αÑêαñé, αñ£αÑï αñºαñ¿ αñöαñ░ αñ╕αñ«αÑâαñªαÑìαñºαñ┐ αñòαÑÇ αñªαÑçαñ╡αÑÇ αñ«αñ╛αñ¿αÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑêαñéαÑñ αñ¬αÑéαñ░αñ╛ αñ╡αñ╛αññαñ╛αñ╡αñ░αñú αñåαñ¿αñéαñª, αñ¡αñòαÑìαññαñ┐ αñöαñ░ αñëαñ▓αÑìαñ▓αñ╛αñ╕ αñ╕αÑç αñ¡αñ░ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñ¬αñ░αñ┐αñ╡αñ╛αñ░ αñÅαñòαññαÑìαñ░ αñ╣αÑïαñòαñ░ αñ«αñ┐αñáαñ╛αñçαñ»αñ╛αñü, αñëαñ¬αñ╣αñ╛αñ░ αñöαñ░ αñûαÑüαñ╢αñ┐αñ»αñ╛αñü αñ¼αñ╛αñüαñƒαññαÑç αñ╣αÑêαñéαÑñ\r\n\r\nαñ░αñ╛αññ αñòαñ╛ αñåαñ╕αñ«αñ╛αñ¿ αñ¬αñƒαñ╛αñûαÑïαñé αñòαÑÇ αñ░αÑïαñ╢αñ¿αÑÇ αñ╕αÑç αñ£αñùαñ«αñùαñ╛ αñëαñáαññαñ╛ αñ╣αÑê αñöαñ░ αñ╣αñ░ αñÿαñ░ αñ«αÑçαñé αñªαÑÇαñ¬αÑïαñé αñòαÑÇ αñ▓αÑî αñÜαñ«αñòαññαÑÇ αñ╣αÑê, αñ£αÑï αñàαñÜαÑìαñ¢αñ╛αñê αñòαÑÇ αñ¼αÑüαñ░αñ╛αñê αñ¬αñ░ αñöαñ░ αñ¬αÑìαñ░αñòαñ╛αñ╢ αñòαÑÇ αñàαñéαñºαñòαñ╛αñ░ αñ¬αñ░ αñ╡αñ┐αñ£αñ» αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ╣αÑêαÑñ αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ αñòαñê αñòαÑìαñ╖αÑçαññαÑìαñ░αÑïαñé αñ«αÑçαñé αñ╣αñ┐αñéαñªαÑé αñ¿αñ╡αñ╡αñ░αÑìαñ╖ αñòαÑÇ αñ╢αÑüαñ░αÑüαñåαññ αñ¡αÑÇ αñ«αñ╛αñ¿αÑÇ αñ£αñ╛αññαÑÇ αñ╣αÑê αñöαñ░ αñçαñ╕αÑç αñ¿αñÅ αñòαñ╛αñ░αÑìαñ» αñåαñ░αñéαñ¡ αñòαñ░αñ¿αÑç, αñ╕αÑïαñ¿αñ╛ αñûαñ░αÑÇαñªαñ¿αÑç αñöαñ░ αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ¬αÑéαñ£αñ¿ αñòαñ░αñ¿αÑç αñòαÑç αñ▓αñ┐αñÅ αñàαññαÑìαñ»αñéαññ αñ╢αÑüαñ¡ αñ╕αñ«αñ» αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñºαñ╛αñ░αÑìαñ«αñ┐αñò αñ«αñ╣αññαÑìαñ╡ αñ╕αÑç αñ¬αñ░αÑç, αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñåαñ╢αñ╛, αñ╢αñ╛αñéαññαñ┐ αñöαñ░ αñÅαñòαññαñ╛ αñòαñ╛ αñ╕αñ╛αñ░αÑìαñ╡αñ¡αÑîαñ«αñ┐αñò αñ╕αñéαñªαÑçαñ╢ αñ½αÑêαñ▓αñ╛αññαÑÇ αñ╣αÑê, αñ£αÑï αñçαñ╕αÑç αñ¡αñ╛αñ░αññ αñòαÑç αñ╕αñ¼αñ╕αÑç αñ¬αÑìαñ░αñ┐αñ» αñöαñ░ αñÅαñòαñ£αÑüαñƒ αñòαñ░αñ¿αÑç αñ╡αñ╛αñ▓αÑç αññαÑìαñ»αÑïαñ╣αñ╛αñ░αÑïαñé αñ«αÑçαñé αñ╕αÑç αñÅαñò αñ¼αñ¿αñ╛αññαÑÇ αñ╣αÑêαÑñ','αñ¡αñ╛αñ░αññ αñòαÑç αñ╡αñ┐αñ¡αñ┐αñ¿αÑìαñ¿ αñ¡αñ╛αñùαÑïαñé αñ«αÑçαñé αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαÑï αñàαñ▓αñù-αñàαñ▓αñù αñ¿αñ╛αñ«αÑïαñé αñ╕αÑç αñ£αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê ΓÇö αñªαñòαÑìαñ╖αñ┐αñú αñ¡αñ╛αñ░αññ αñ«αÑçαñé αñªαÑÇαñ¬αñ╛αñ╡αñ▓αÑÇ αñöαñ░ αñëαññαÑìαññαñ░ αññαñÑαñ╛ αñ«αñºαÑìαñ» αñ¡αñ╛αñ░αññ αñ«αÑçαñé αñªαñ┐αñ¬αñ╛αñ╡αñ▓αÑÇ αñòαñ╣αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñëαññαÑìαññαñ░ αñ¬αÑìαñ░αñªαÑçαñ╢, αñ«αñ╣αñ╛αñ░αñ╛αñ╖αÑìαñƒαÑìαñ░, αñùαÑüαñ£αñ░αñ╛αññ, αññαñ«αñ┐αñ▓αñ¿αñ╛αñíαÑü, αñªαñ┐αñ▓αÑìαñ▓αÑÇ αñöαñ░ αñªαÑçαñ╢ αñòαÑç αñ▓αñùαñ¡αñù αñ╣αñ░ αñ░αñ╛αñ£αÑìαñ» αñ«αÑçαñé αñ¼αñíαñ╝αÑç αñ╣αñ░αÑìαñ╖αÑïαñ▓αÑìαñ▓αñ╛αñ╕ αñòαÑç αñ╕αñ╛αñÑ αñ«αñ¿αñ╛αñê αñ£αñ╛αññαÑÇ αñ╣αÑêαÑñ','αñ»αñ╣ αñ¬αñ░αÑìαñ╡ αñ¬αñ╛αñüαñÜ αñªαñ┐αñ¿αÑïαñé αññαñò αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑê ΓÇö αñºαñ¿αññαÑçαñ░αñ╕ αñ╕αÑç αñ╢αÑüαñ░αÑé αñ╣αÑïαñòαñ░ αñ¿αñ░αñò αñÜαññαÑüαñ░αÑìαñªαñ╢αÑÇ, αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ¬αÑéαñ£αñ¿, αñùαÑïαñ╡αñ░αÑìαñºαñ¿ αñ¬αÑéαñ£αñ╛ αñöαñ░ αñ¡αñ╛αñê αñªαÑéαñ£ αññαñò αñÜαñ▓αññαñ╛ αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαñ╛ αñ¬αÑìαñ░αññαÑìαñ»αÑçαñò αñªαñ┐αñ¿ αñ╡αñ┐αñ╢αÑçαñ╖ αñ«αñ╣αññαÑìαñ╡ αñ░αñûαññαñ╛ αñ╣αÑêαÑñ αñºαñ¿αññαÑçαñ░αñ╕ αñòαÑç αñªαñ┐αñ¿ αñ╕αÑïαñ¿αñ╛-αñÜαñ╛αñüαñªαÑÇ αñ»αñ╛ αñ¿αñÅ αñ¼αñ░αÑìαññαñ¿ αñûαñ░αÑÇαñªαñ¿αñ╛ αñ╢αÑüαñ¡ αñ«αñ╛αñ¿αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñªαÑéαñ╕αñ░αÑç αñªαñ┐αñ¿ αñ¿αñ░αñò αñÜαññαÑüαñ░αÑìαñªαñ╢αÑÇ αñ¬αñ░ αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αÑìαñ░αÑÇαñòαÑâαñ╖αÑìαñú αñªαÑìαñ╡αñ╛αñ░αñ╛ αñ¿αñ░αñòαñ╛αñ╕αÑüαñ░ αñ¬αñ░ αñ╡αñ┐αñ£αñ» αñòαñ╛ αñëαññαÑìαñ╕αñ╡ αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αññαÑÇαñ╕αñ░αñ╛ αñªαñ┐αñ¿ αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñ¬αÑéαñ£αñ¿ αñòαñ╛ αñ╣αÑïαññαñ╛ αñ╣αÑê αñ£αñ¼ αñ▓αÑïαñù αñ«αñ╛αñü αñ▓αñòαÑìαñ╖αÑìαñ«αÑÇ αñòαÑÇ αñåαñ░αñ╛αñºαñ¿αñ╛ αñòαñ░αññαÑç αñ╣αÑêαñéαÑñ αñÜαÑîαñÑαÑç αñªαñ┐αñ¿ αñùαÑïαñ╡αñ░αÑìαñºαñ¿ αñ¬αÑéαñ£αñ╛ αñ╣αÑïαññαÑÇ αñ╣αÑê αñ£αÑï αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αÑìαñ░αÑÇαñòαÑâαñ╖αÑìαñú αñªαÑìαñ╡αñ╛αñ░αñ╛ αñùαÑïαñ╡αñ░αÑìαñºαñ¿ αñ¬αñ░αÑìαñ╡αññ αñëαñáαñ╛αñ¿αÑç αñòαÑÇ αñòαñÑαñ╛ αñòαÑï αñªαñ░αÑìαñ╢αñ╛αññαÑÇ αñ╣αÑê, αñöαñ░ αñ¬αñ╛αñüαñÜαñ╡αÑçαñé αñªαñ┐αñ¿ αñ¡αñ╛αñê αñªαÑéαñ£ αñ¬αñ░ αñ¡αñ╛αñê-αñ¼αñ╣αñ¿ αñòαÑç αñ╕αÑìαñ¿αÑçαñ╣ αñòαñ╛ αñëαññαÑìαñ╕αñ╡ αñ«αñ¿αñ╛αñ»αñ╛ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαÑç αñªαÑîαñ░αñ╛αñ¿ αñªαÑçαñ╢αñ¡αñ░ αñòαÑç αñ¬αÑìαñ░αñ«αÑüαñû αñ«αñéαñªαñ┐αñ░αÑïαñé αñ«αÑçαñé αñ╡αñ┐αñ╢αÑçαñ╖ αñ¬αÑéαñ£αñ╛ αñöαñ░ αñ¡αñ╡αÑìαñ» αñ╕αñ£αñ╛αñ╡αñƒ αñ╣αÑïαññαÑÇ αñ╣αÑêαÑñ αñçαñ¿αñ«αÑçαñé αñàαñ»αÑïαñºαÑìαñ»αñ╛ αñ░αñ╛αñ« αñ«αñéαñªαñ┐αñ░, αñ╡αñ╛αñ░αñ╛αñúαñ╕αÑÇ αñòαñ╛ αñòαñ╛αñ╢αÑÇ αñ╡αñ┐αñ╢αÑìαñ╡αñ¿αñ╛αñÑ αñ«αñéαñªαñ┐αñ░, αñåαñéαñºαÑìαñ░ αñ¬αÑìαñ░αñªαÑçαñ╢ αñòαñ╛ αññαñ┐αñ░αÑüαñ¬αññαñ┐ αñ¼αñ╛αñ▓αñ╛αñ£αÑÇ αñ«αñéαñªαñ┐αñ░, αñ«αñªαÑüαñ░αÑê αñòαñ╛ αñ«αÑÇαñ¿αñ╛αñòαÑìαñ╖αÑÇ αñ«αñéαñªαñ┐αñ░ αñöαñ░ αñ«αÑüαñéαñ¼αñê αñòαñ╛ αñ╕αñ┐αñªαÑìαñºαñ┐αñ╡αñ┐αñ¿αñ╛αñ»αñò αñ«αñéαñªαñ┐αñ░ αñ¬αÑìαñ░αñ«αÑüαñû αñ╣αÑêαñéαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαñ╛ αñçαññαñ┐αñ╣αñ╛αñ╕ αñ░αñ╛αñ«αñ╛αñ»αñú αñòαñ╛αñ▓ αñ╕αÑç αñ£αÑüαñíαñ╝αñ╛ αñ╣αÑüαñå αñ╣αÑêαÑñ αñ£αñ¼ αñ¡αñùαñ╡αñ╛αñ¿ αñ╢αÑìαñ░αÑÇαñ░αñ╛αñ« αñ░αñ╛αñ╡αñú αñ¬αñ░ αñ╡αñ┐αñ£αñ» αñ¬αÑìαñ░αñ╛αñ¬αÑìαññ αñòαñ░ αñàαñ»αÑïαñºαÑìαñ»αñ╛ αñ▓αÑîαñƒαÑç, αññαñ¼ αñàαñ»αÑïαñºαÑìαñ»αñ╛αñ╡αñ╛αñ╕αñ┐αñ»αÑïαñé αñ¿αÑç αñëαñ¿αñòαÑç αñ╕αÑìαñ╡αñ╛αñùαññ αñ«αÑçαñé αñ¬αÑéαñ░αÑç αñ¿αñùαñ░ αñòαÑï αñªαÑÇαñ¬αÑïαñé αñòαÑÇ αñ¬αñéαñòαÑìαññαñ┐αñ»αÑïαñé αñ╕αÑç αñ╕αñ£αñ╛αñ»αñ╛ αñÑαñ╛αÑñ αñ»αñ╣αÑÇ αñ¬αñ░αñéαñ¬αñ░αñ╛ αñåαñ£ αññαñò αñÜαñ▓αÑÇ αñå αñ░αñ╣αÑÇ αñ╣αÑê, αñ£αÑï αñ¬αÑìαñ░αñòαñ╛αñ╢, αñûαÑüαñ╢αÑÇ αñöαñ░ αñ╢αñ╛αñéαññαñ┐ αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ╣αÑêαÑñ','αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñòαÑç αñàαñ╡αñ╕αñ░ αñ¬αñ░ αñ▓αÑïαñù αñëαñ¬αñ╣αñ╛αñ░αÑïαñé αñòαñ╛ αñåαñªαñ╛αñ¿-αñ¬αÑìαñ░αñªαñ╛αñ¿ αñòαñ░αññαÑç αñ╣αÑêαñé, αñÿαñ░αÑïαñé αñòαÑï αñªαÑÇαñ»αÑïαñé αñöαñ░ αñ▓αñ╛αñçαñƒαÑïαñé αñ╕αÑç αñ╕αñ£αñ╛αññαÑç αñ╣αÑêαñé, αñöαñ░ αñ╕αÑìαñ╡αñ╛αñªαñ┐αñ╖αÑìαñƒ αñ«αñ┐αñáαñ╛αñçαñ»αñ╛αñü αñ╡ αñ╡αÑìαñ»αñéαñ£αñ¿ αñ¼αñ¿αñ╛αññαÑç αñ╣αÑêαñéαÑñ αñ¼αñ╛αñ£αñ╛αñ░αÑïαñé αñöαñ░ αñùαñ▓αñ┐αñ»αÑïαñé αñ«αÑçαñé αñëαñ▓αÑìαñ▓αñ╛αñ╕ αñòαñ╛ αñ╡αñ╛αññαñ╛αñ╡αñ░αñú αñ╣αÑïαññαñ╛ αñ╣αÑêαÑñ αñ¼αñ╣αÑüαññ αñ╕αÑç αñ▓αÑïαñù αñçαñ╕ αñªαñ┐αñ¿ αñªαñ╛αñ¿-αñ¬αÑüαñúαÑìαñ» αñ¡αÑÇ αñòαñ░αññαÑç αñ╣αÑêαñé, αñ£αñ┐αñ╕αñ╕αÑç αñ»αñ╣ αññαÑìαñ»αÑïαñ╣αñ╛αñ░ αñòαÑçαñ╡αñ▓ αñëαññαÑìαñ╕αñ╡ αñ¿αñ╣αÑÇαñé αñ¼αñ▓αÑìαñòαñ┐ αñòαñ░αÑüαñúαñ╛ αñöαñ░ αñòαÑâαññαñ£αÑìαñ₧αññαñ╛ αñòαñ╛ αñ¬αÑìαñ░αññαÑÇαñò αñ¼αñ¿ αñ£αñ╛αññαñ╛ αñ╣αÑêαÑñ αñªαÑÇαñ╡αñ╛αñ▓αÑÇ αñ¬αÑìαñ░αÑçαñ«, αñ¬αÑìαñ░αñòαñ╛αñ╢ αñöαñ░ αñ╕αñªαÑìαñ¡αñ╛αñ╡ αñòαñ╛ αñ╕αñ╛αñ░αÑìαñ╡αñ¡αÑîαñ«αñ┐αñò αñ╕αñéαñªαÑçαñ╢ αñªαÑçαññαÑÇ αñ╣αÑê ΓÇö αñ»αñ╣ αñ»αñ╛αñª αñªαñ┐αñ▓αñ╛αññαÑÇ αñ╣αÑê αñòαñ┐ αñàαñéαñºαñòαñ╛αñ░ αñòαÑç αñ╕αñ«αñ» αñ«αÑçαñé αñ¡αÑÇ αñ¬αÑìαñ░αñòαñ╛αñ╢ αñàαñ╡αñ╢αÑìαñ» αñ¬αÑìαñ░αñ¼αñ▓ αñ╣αÑïαññαñ╛ αñ╣αÑêαÑñ','2025-12-15 13:17:43','2025-12-15 13:17:43'),(223,23,6,'','','','','','','','','','','2025-12-15 13:17:43','2025-12-15 13:17:43'),(224,23,7,'','','','','','','','','','','2025-12-15 13:17:43','2025-12-15 13:17:43'),(249,26,1,'test','test','test','test','test','test','test','','test','test','2025-12-16 17:40:39','2025-12-16 17:40:39'),(250,26,5,'','','','','','','','','','','2025-12-16 17:40:39','2025-12-16 17:40:39'),(251,26,6,'','','','','','','','','','','2025-12-16 17:40:39','2025-12-16 17:40:39'),(252,26,7,'','','','','','','','','','','2025-12-16 17:40:39','2025-12-16 17:40:39'),(265,25,1,'Purnima','Purnima literally means ΓÇ£full moon dayΓÇ¥ in the Hindu lunar calendar. It marks the day when the moon is fully illuminated, symbolizing completeness, abundance and spiritual energy, frequently observed with prayers, rituals, fasting, and social celebrations throughout India.','Purnima occurs once every lunar month. In Hindu belief systems, this day is considered highly auspicious because the moon is at its brightest ΓÇö believed to emit powerful spiritual energy. Each Purnima has specific religious, cultural, historical, or seasonal significance. For example:\r\n\r\nKartik Purnima is associated with holy river baths, lights, d─üna (charity) and widely celebrated across North India and Odisha. \r\nshriramtemple.org.in\r\n+1\r\n\r\nSharad Purnima is celebrated as a night when the moon is believed to radiate 16 divine qualities (kalas) and blessing prosperity. People prepare kheer (sweet rice pudding) and place it under moonlight. \r\nTV9 Bharatvarsh\r\n+1\r\n\r\nVat Purnima sees married women tying threads around banyan trees, praying for their husbandΓÇÖs long life. \r\nWikipedia\r\n\r\nSnana Yatra marks the ceremonial bathing of deities in OdishaΓÇÖs Jagannath tradition. \r\nWikipedia\r\n\r\nAcross India, Purnima days are often occasions for fasting (vrat), charity, temple visits, and religious gatherings.','Dev Deepawali,Kojagiri Purnima,Vat Savitri,Dola Purnima','Uttar Pradesh,Bihar,Odisha,West Bengal,Maharashtra,Gujarat,Goa','1 Day','Purnima is generally considered a day of spiritual completion and blessing:\r\n\r\n1. Acts like charity, holy bathing, fasting and worship are believed to yield spiritual merit. \r\npoojat.com\r\n\r\n2. In folklore, some full moons (like Sharad) are tied to lunar energy and healing. \r\nAmar Ujala\r\n\r\n3. Many Purnima days carry local mythological narratives and devotional practices.','Here are some famous places tied to Purnima celebrations:\r\n\r\n1. Jagannath Temple, Puri (Odisha) ΓÇô Snana Yatra & Dola Purnima celebrations. \r\n\r\n2. Brahma Temple, Pushkar (Rajasthan) ΓÇô Pilgrims gather on Kartik Purnima. \r\n\r\n3. Ganga & Yamuna Ghats (Prayagraj, Varanasi, etc.) ΓÇô Holy river dips on Kartik Purnima. \r\n\r\n4. Local Temples of Shiva, Vishnu, Lakshmi & Banyan Trees ΓÇô Across states during Vat & Sharad Purnima.','Each Purnima has its own story:\r\n\r\n1. Kartik Purnima is linked to Lord ShivaΓÇÖs victory over demons and divine lights (Dev Deepawali). \r\nWikipedia\r\n\r\n2. Sharad Purnima sees associations with Goddess Lakshmi and the moonΓÇÖs healing rays. \r\nAmar Ujala\r\n\r\n3. Vat Purnima celebrates SavitriΓÇÖs devotion to Satyavan as narrated in Mahabharata. \r\nWikipedia\r\n\r\nIn ancient Indian calendars, Purnima defined the cycle of months and guided agricultural rhythms, spiritual observances, and traditional festivals.','1. Purnima happens every month in the lunar calendar and is widely respected as a day for spiritual reflection. \r\nWikipedia\r\n\r\n2. Many people observe fasting and special prayers to align with lunar energy for prosperity and clarity. \r\npoojat.com\r\n\r\n3. In the modern era, Purnima festivals continue to reinforce cultural unity, community feasts, and devotional arts across India.','2025-12-16 18:49:39','2025-12-16 18:49:39'),(266,25,5,'','','','','','','','','','','2025-12-16 18:49:39','2025-12-16 18:49:39'),(267,25,6,'','','','','','','','','','','2025-12-16 18:49:39','2025-12-16 18:49:39'),(268,25,7,'','','','','','','','','','','2025-12-16 18:49:39','2025-12-16 18:49:39'),(269,27,1,'test','test','test','test','test','','','','','','2025-12-17 06:36:18','2025-12-17 06:36:18'),(270,27,5,'','','','','','','','','','','2025-12-17 06:36:18','2025-12-17 06:36:18'),(271,27,6,'','','','','','','','','','','2025-12-17 06:36:18','2025-12-17 06:36:18'),(272,27,7,'','','','','','','','','','','2025-12-17 06:36:18','2025-12-17 06:36:18'),(273,28,1,'test_Festival','testing','testing','test, test','test','test','test','test','test','test','2025-12-19 13:23:40','2025-12-19 13:23:40'),(274,28,5,'','','','','','','','','','','2025-12-19 13:23:40','2025-12-19 13:23:40'),(275,28,6,'','','','','','','','','','','2025-12-19 13:23:40','2025-12-19 13:23:40'),(276,28,7,'','','','','','','','','','','2025-12-19 13:23:40','2025-12-19 13:23:40');
/*!40000 ALTER TABLE `festival_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival_faqs`
--

DROP TABLE IF EXISTS `festival_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festival_faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `festival_id` int(11) DEFAULT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1=>active,0=>inactive',
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival_faqs`
--

LOCK TABLES `festival_faqs` WRITE;
/*!40000 ALTER TABLE `festival_faqs` DISABLE KEYS */;
INSERT INTO `festival_faqs` VALUES (4,5,'POOJA SAMAGRI','For Ekadashi Pooja, you will need a photo or idol of Lord Vishnu or Shri Krishna placed on a clean chowki with an asan. Keep Gangajal or clean water, a kalash filled with water and decorated with mango leaves and a coconut. For offerings, prepare Panchamrit made with milk, curd, honey, sugar and ghee. Have chandan, haldi, kumkum, sindoor and akshat ready for tilak and puja rituals. Light dhoop, agarbatti and a diya of ghee or oil. Keep camphor for aarti. Tulsi leaves are considered the most important offering for Lord Vishnu, along with flowers, garlands, coconut, fruits, dry fruits and sweets made without grains.',1,'2025-09-06 13:46:43.000000','2025-09-06 13:46:43.000000'),(5,5,'GANESH POOJA VIDHI','First, clean the puja place and take a bath. Place a chowki and spread a clean red or yellow cloth. On this, keep Lord GaneshaΓÇÖs idol or photo. Set a kalash filled with water, mango leaves and a coconut beside the idol. Light a diya with ghee or oil and place incense sticks and dhoop nearby.',1,'2025-09-06 13:48:25.000000','2025-09-06 13:48:25.000000'),(6,5,'GANESH CHATURTHI VRAT','Ganesh Chaturthi Vrat is observed to honor Lord Ganesha, the remover of obstacles and the giver of wisdom and prosperity. The vrat usually begins on Ganesh Chaturthi tithi and can continue for one and a half, five, seven, or ten days, depending on tradition, and it is concluded with Ganesh Visarjan.',1,'2025-09-06 13:50:24.000000','2025-09-06 13:50:24.000000');
/*!40000 ALTER TABLE `festival_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festivals`
--

DROP TABLE IF EXISTS `festivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festivals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `temple_id` varchar(255) DEFAULT NULL,
  `short_dec` longtext DEFAULT NULL,
  `long_dec` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `regional_names` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `daily_significance` longtext DEFAULT NULL,
  `history` longtext DEFAULT NULL,
  `temples_to_visit` longtext DEFAULT NULL,
  `other_info` longtext DEFAULT NULL,
  `states_celebrated` longtext DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_popular` text DEFAULT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `states` longtext DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festivals`
--

LOCK TABLES `festivals` WRITE;
/*!40000 ALTER TABLE `festivals` DISABLE KEYS */;
INSERT INTO `festivals` VALUES (14,'Ekadashi','2025-09-13, 2025-09-14, 2025-09-15, 2025-09-16, 2025-09-17, 2025-09-18, 2025-09-19','',NULL,NULL,'','','SEP2025/1757486314-image.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2025-09-10 06:38:34.000000','2025-12-13 16:34:44.000000'),(15,'Purnima','2025-09-07, 2025-10-07, 2025-11-05, 2025-12-04','',NULL,NULL,'','','SEP2025/1757528489-image.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2025-09-10 18:21:29.000000','2025-12-13 16:34:39.000000'),(16,'Diwali','2025-10-20','Diwali, or Deepavali, is celebrated with great joy across India and many parts of the world. It marks the return of Lord Rama to Ayodhya after defeating Ravana, symbolizing the triumph of good over evil. People decorate their homes with diyas (oil lamps), candles, and colorful rangoli designs. Families perform Lakshmi Puja, seeking blessings for wealth and prosperity. Fireworks, sharing sweets, and exchanging gifts are integral parts of the celebration. Diwali also highlights togetherness, joy, and the importance of spreading positivity and light in life.',NULL,NULL,'Diwali, also known as the Festival of Lights, is one of the most important Hindu festivals. It symbolizes the victory of light over darkness, good over evil, and knowledge over ignorance.','Diwali, or Deepavali, is celebrated with great joy across India and many parts of the world. It marks the return of Lord Rama to Ayodhya after defeating Ravana, symbolizing the triumph of good over evil. People decorate their homes with diyas (oil lamps), candles, and colorful rangoli designs. Families perform Lakshmi Puja, seeking blessings for wealth and prosperity. Fireworks, sharing sweets, and exchanging gifts are integral parts of the celebration. Diwali also highlights togetherness, joy, and the importance of spreading positivity and light in life.','SEP2025/1757530159-image.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'[\"2\"]','2025-09-10 18:49:19.000000','2025-12-13 16:34:35.000000'),(17,'1',NULL,'',NULL,NULL,'','','SEP2025/1757841216-image.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2025-09-14 09:13:36.000000','2025-09-14 09:14:25.000000'),(18,'sa',NULL,'',NULL,NULL,'','','SEP2025/1757841255-image.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2025-09-14 09:14:15.000000','2025-09-14 09:14:19.000000'),(19,'Dasara','2025-10-02','',NULL,NULL,'','','OCT2025/1759342265-image.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,'','','',NULL,1,NULL,1,NULL,'2025-09-29 16:16:53.000000','2025-11-09 14:03:54.000000'),(20,'Sankranthi','2025-09-30, 2025-09-23, 2025-09-24','',NULL,NULL,'','',NULL,NULL,NULL,NULL,'','','','','','hii','',1,NULL,1,NULL,'2025-09-29 16:18:05.000000','2025-12-13 16:34:30.000000'),(21,'nice',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,'chicku',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,'2025-11-06 18:18:07.000000','2025-11-09 10:41:26.000000'),(22,'Diwali','2025-11-11','Diwali, also known as Deepavali, is one of the most important Hindu festivals celebrated across India and abroad. It symbolizes the victory of light over darkness and good over evil. People decorate their homes with diyas, burst fireworks, and exchange sweets.',NULL,NULL,'Festival of Lights celebrated across India.','Diwali, also known as Deepavali, is one of the most important Hindu festivals celebrated across India and abroad. It symbolizes the victory of light over darkness and good over evil. People decorate their homes with diyas, burst fireworks, and exchange sweets.','NOV2025/1762684335-image.jpeg',NULL,NULL,NULL,'Deepavali (Tamil Nadu), Dipawali (Bihar), Kali Puja (West Bengal)','5 Days','Day 1: Dhanteras - dedicated to wealth.\r\nDay 2: Naraka Chaturdashi - celebrates the victory of Krishna over Narakasura.\r\nDay 3: Lakshmi Puja - main day of Diwali, worship of Goddess Lakshmi.\r\nDay 4: Govardhan Puja - honors Krishna lifting Govardhan hill.\r\nDay 5: Bhai Dooj - celebrates the bond between brothers and sisters.','Diwali marks Lord RamaΓÇÖs return to Ayodhya after 14 years of exile and his victory over Ravana. It is also associated with Goddess LakshmiΓÇÖs birth from the ocean of milk and Lord KrishnaΓÇÖs defeat of Narakasura.','Ayodhya Ram Mandir, Siddhivinayak Temple (Mumbai), Meenakshi Temple (Madurai), Laxmi Narayan Temple (Delhi)','People light diyas, decorate homes, wear new clothes, and distribute sweets. The festival promotes unity and prosperity.','Uttar Pradesh, Maharashtra, Tamil Nadu, Gujarat, West Bengal, Karnataka, Delhi, Rajasthan',1,NULL,1,NULL,'2025-11-09 10:32:15.000000','2025-11-09 10:41:21.000000'),(23,'Diwali / Deepawali','2025-12-16','',NULL,NULL,'','','NOV2025/1762796002-image.jpg',NULL,NULL,NULL,'Diwali is known by different names across India such as Deepavali in South India and Dipawali in some northern and central states.','The festival is celebrated for five days, starting with Dhanteras, followed by Naraka Chaturdashi, Lakshmi Puja, Govardhan Puja, and concluding with Bhai Dooj.','Each day of Diwali carries its own importance. Dhanteras marks the beginning of the celebrations and is considered auspicious for buying gold and new utensils. The second day, Naraka Chaturdashi, celebrates Lord KrishnaΓÇÖs victory over Narakasura. The third day, Lakshmi Puja, is the main day when people worship Goddess Lakshmi for wealth and prosperity. The fourth day, Govardhan Puja, signifies Lord Krishna lifting the Govardhan Hill to protect the people of Vrindavan, and the fifth day, Bhai Dooj, celebrates the bond between brothers and sisters.','The story behind Diwali dates back to the epic Ramayana when Lord Rama returned to Ayodhya after defeating Ravana. The people of Ayodhya illuminated the entire city with rows of lamps to welcome him back. This tradition continues today, symbolizing the spreading of light, happiness, and peace.','Some of the most sacred places to visit during Diwali include the Ayodhya Ram Mandir, Kashi Vishwanath Temple in Varanasi, Tirupati Balaji Temple in Andhra Pradesh, Meenakshi Temple in Madurai, and Siddhivinayak Temple in Mumbai. These temples witness grand celebrations, special prayers, and beautiful decorations throughout the festival.','During Diwali, people exchange gifts, decorate their homes with diyas and lights, and prepare delicious sweets and snacks. Markets and streets are filled with festive energy, and the spirit of joy brings people together irrespective of their backgrounds. Many also perform charity and help the needy, making the festival not just about celebration but also compassion and gratitude. Diwali promotes the universal message of love, light, and harmony, reminding everyone that even in the darkest times, light will always prevail.','It is celebrated with great enthusiasm in Uttar Pradesh, Maharashtra, Gujarat, Tamil Nadu, Delhi, and many other parts of the country.',1,'1',0,'[\"5\",\"13\",\"14\"]','2025-11-09 14:07:31.000000','2025-12-15 13:17:43.000000'),(24,'Test Name','2026-02-13','',NULL,NULL,'','','DEC2025/1765474188-image.jpg',NULL,NULL,NULL,'Regional Names,Regional Names,Regional Names,Regional Names,Regional Names','5 days','Daily Significance Daily Significance. Daily','History of the Festival History of the Festival','Temples to Visit Temples to VisitTemples to Visit','Other Information Other Information Other Information','States Celebrated,States Celebrated,States Celebrated,States Celebrated,States Celebrated,States Celebrated',1,'0',1,'[\"2\",\"3\",\"5\"]','2025-12-11 17:29:48.000000','2025-12-11 18:57:40.000000'),(25,'Purnima','2025-12-18, 2025-12-25, 2025-12-24, 2025-12-19, 2025-12-26','',NULL,NULL,'','','DEC2025/1765820799-image.jpg',NULL,NULL,NULL,'Dev Deepawali,Kojagiri Purnima,Vat Savitri,Dola Purnima','1 Day','Purnima is generally considered a day of spiritual completion and blessing:\r\n\r\n1. Acts like charity, holy bathing, fasting and worship are believed to yield spiritual merit. \r\npoojat.com\r\n\r\n2. In folklore, some full moons (like Sharad) are tied to lunar energy and healing. \r\nAmar Ujala\r\n\r\n3. Many Purnima days carry local mythological narratives and devotional practices.','Each Purnima has its own story:\r\n\r\n1. Kartik Purnima is linked to Lord ShivaΓÇÖs victory over demons and divine lights (Dev Deepawali). \r\nWikipedia\r\n\r\n2. Sharad Purnima sees associations with Goddess Lakshmi and the moonΓÇÖs healing rays. \r\nAmar Ujala\r\n\r\n3. Vat Purnima celebrates SavitriΓÇÖs devotion to Satyavan as narrated in Mahabharata. \r\nWikipedia\r\n\r\nIn ancient Indian calendars, Purnima defined the cycle of months and guided agricultural rhythms, spiritual observances, and traditional festivals.','Here are some famous places tied to Purnima celebrations:\r\n\r\n1. Jagannath Temple, Puri (Odisha) ΓÇô Snana Yatra & Dola Purnima celebrations. \r\n\r\n2. Brahma Temple, Pushkar (Rajasthan) ΓÇô Pilgrims gather on Kartik Purnima. \r\n\r\n3. Ganga & Yamuna Ghats (Prayagraj, Varanasi, etc.) ΓÇô Holy river dips on Kartik Purnima. \r\n\r\n4. Local Temples of Shiva, Vishnu, Lakshmi & Banyan Trees ΓÇô Across states during Vat & Sharad Purnima.','1. Purnima happens every month in the lunar calendar and is widely respected as a day for spiritual reflection. \r\nWikipedia\r\n\r\n2. Many people observe fasting and special prayers to align with lunar energy for prosperity and clarity. \r\npoojat.com\r\n\r\n3. In the modern era, Purnima festivals continue to reinforce cultural unity, community feasts, and devotional arts across India.','Uttar Pradesh,Bihar,Odisha,West Bengal,Maharashtra,Gujarat,Goa',1,NULL,0,'[\"3\",\"4\",\"13\",\"14\",\"19\",\"23\",\"26\",\"28\"]','2025-12-15 17:46:39.000000','2025-12-16 18:49:39.000000'),(26,'test','2025-12-25','',NULL,NULL,'','','DEC2025/1765906822-image.jpg',NULL,NULL,NULL,'test','test','test','test','','test','test',1,NULL,1,'[\"1\",\"2\"]','2025-12-16 17:40:22.000000','2025-12-16 17:41:38.000000'),(27,'test','2025-12-18, 2025-12-19, 2025-12-26, 2025-12-27','',NULL,NULL,'','','DEC2025/1765906937-image.jpg',NULL,NULL,NULL,'test','','','','','','test',1,NULL,1,NULL,'2025-12-16 17:42:17.000000','2025-12-19 13:22:32.000000'),(28,'test_Festival','2025-12-21','testing',NULL,NULL,'testing','testing','DEC2025/1766150620-image.jpg',NULL,NULL,NULL,'test, test','test','test','test','test','test','test',1,NULL,0,'[\"2\"]','2025-12-19 13:23:40.000000','2025-12-19 13:23:40.000000');
/*!40000 ALTER TABLE `festivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festivals_temple`
--

DROP TABLE IF EXISTS `festivals_temple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festivals_temple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `temple_id` bigint(20) NOT NULL,
  `festival_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festivals_temple`
--

LOCK TABLES `festivals_temple` WRITE;
/*!40000 ALTER TABLE `festivals_temple` DISABLE KEYS */;
INSERT INTO `festivals_temple` VALUES (1,1,15,'2025-09-11 17:44:14','2025-09-11 17:44:14'),(2,2,15,'2025-09-11 17:45:08','2025-09-11 17:45:08'),(4,2,16,'2025-09-11 18:28:39','2025-09-11 18:28:39'),(5,1,16,'2025-09-13 13:13:45','2025-09-13 13:13:45'),(6,1,14,'2025-09-14 09:30:27','2025-09-14 09:30:27');
/*!40000 ALTER TABLE `festivals_temple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_settings`
--

DROP TABLE IF EXISTS `language_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msgid` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `msgstr` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_settings`
--

LOCK TABLES `language_settings` WRITE;
/*!40000 ALTER TABLE `language_settings` DISABLE KEYS */;
INSERT INTO `language_settings` VALUES (1,'website_signup','en','Signup','2023-09-19 10:43:34','2023-09-19 10:43:34'),(2,'website_signup','es','Inscribirse','2023-09-19 10:43:34','2023-09-19 10:43:34');
/*!40000 ALTER TABLE `language_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `listing_title` varchar(50) NOT NULL,
  `lang_code` varchar(50) NOT NULL,
  `folder_code` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','English','en','en','usa_flag.jpg',1,'2023-01-11 19:30:00','2023-09-19 20:30:00'),(5,'Hindi','Hindi','hi','hi','indian_flag.png',1,'2025-09-01 16:22:39','2025-09-01 16:22:39'),(6,'Tamil','Tamil','ta','ta','indian_flag.png',1,'2025-09-01 16:24:32','2025-09-01 16:24:32'),(7,'Telugu','Telugu','te','te','indian_flag.png',1,'2025-09-01 16:24:32','2025-09-01 16:24:32');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_discriptions`
--

DROP TABLE IF EXISTS `lookup_discriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_discriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `lookup_discriptions_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_discriptions`
--

LOCK TABLES `lookup_discriptions` WRITE;
/*!40000 ALTER TABLE `lookup_discriptions` DISABLE KEYS */;
INSERT INTO `lookup_discriptions` VALUES (3,1,1,'test','2023-10-26 08:57:32','2023-10-26 08:57:32');
/*!40000 ALTER TABLE `lookup_discriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookups`
--

DROP TABLE IF EXISTS `lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `lookup_type` varchar(50) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookups`
--

LOCK TABLES `lookups` WRITE;
/*!40000 ALTER TABLE `lookups` DISABLE KEYS */;
INSERT INTO `lookups` VALUES (1,'test','test',1,'2023-10-26 08:57:26','2023-10-26 08:57:43');
/*!40000 ALTER TABLE `lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `daily_panchang` tinyint(1) NOT NULL DEFAULT 1,
  `festival_notification` tinyint(1) NOT NULL DEFAULT 1,
  `push_notification` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_settings_user_id_foreign` (`user_id`),
  CONSTRAINT `notification_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
INSERT INTO `notification_settings` VALUES (1,22,1,1,'0','2025-12-09 11:13:51','2025-12-09 11:59:04'),(2,17,1,1,'0','2025-12-10 14:19:49','2025-12-23 17:35:02'),(3,12,1,1,'0','2025-12-10 16:36:02','2025-12-10 16:36:09'),(4,27,1,1,'1','2025-12-12 21:21:25','2025-12-23 17:35:20'),(5,30,1,1,'0','2025-12-19 18:27:54','2025-12-19 18:27:55');
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_read` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_settings_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,22,'suus','jsk',0,'2025-12-23 17:45:03','2025-12-23 17:45:03'),(2,30,'suus','jsk',0,'2025-12-23 17:45:03','2025-12-23 17:45:03'),(3,32,'suus','jsk',0,'2025-12-23 17:45:03','2025-12-23 17:45:03'),(4,22,'suus','jsk',0,'2025-12-23 17:45:04','2025-12-23 17:45:04'),(5,22,'suus','jsk',0,'2025-12-23 17:45:04','2025-12-23 17:45:04'),(6,17,'suus','jsk',0,'2025-12-23 17:45:04','2025-12-23 17:45:04'),(7,27,'suus','jsk',0,'2025-12-23 17:45:05','2025-12-23 17:45:05'),(8,27,'suus','jsk',0,'2025-12-23 17:45:05','2025-12-23 17:45:05'),(9,22,'suus','jsk',0,'2025-12-23 17:45:05','2025-12-23 17:45:05');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('005f9631f29fa99adb62f826ccc427756f8b00dd3adb5e0274bb67c6465c61eec5d463c85e1f1227',5,1,'Reymend Personal Access Client','[]',0,'2025-08-30 06:58:22','2025-08-30 06:58:22','2026-08-30 06:58:22'),('03f14971f7174c98876db0e29efe184bed63016974f0818545cff1912ceae518960faa6b492fa2b8',22,1,'DirectLoginToken','[]',0,'2025-12-23 16:28:27','2025-12-23 16:28:27','2026-12-23 16:28:27'),('06b00349fde6e14255dc0123f19233c7b784882bee231a6c8a92f6cf3caa712643f39aba63875fc6',9,1,'DirectLoginToken','[]',0,'2025-09-14 09:54:12','2025-09-14 09:54:12','2026-09-14 09:54:12'),('073951d877e7e237735316025683f3845bb703e2faa5c8c0babbf22a1538dc3129734bd797d87dd5',22,1,'DirectLoginToken','[]',0,'2025-12-08 12:16:05','2025-12-08 12:16:05','2026-12-08 12:16:05'),('07bde2c18bf8ccacbb4bdbfa05b9b1a526f70bdb3f31df2a76c8f97f59fb043b48a21200b8b37f18',15,1,'DirectLoginToken','[]',0,'2025-11-13 08:01:40','2025-11-13 08:01:40','2026-11-13 08:01:40'),('0c474cf25f1ed8f79dcfb0427fcab6f4f1c332a863f20c3930ca59a27841c1e0f0953324da9be5fa',22,1,'DirectLoginToken','[]',0,'2025-12-19 17:24:10','2025-12-19 17:24:10','2026-12-19 17:24:10'),('0edbecba3d58450bb279f932b1629fef24b87d6d9facf2f600ed821fbf6f69e25f2ecfa3af66bceb',15,1,'API Token','[]',0,'2025-09-29 16:27:34','2025-09-29 16:27:34','2026-09-29 16:27:34'),('145c31b84dcb9850a1a586fb9791ec21787840f49e5f1f1f113cd63aae868f7398de1ca02df186c9',10,1,'DirectLoginToken','[]',0,'2025-09-06 15:32:40','2025-09-06 15:32:40','2026-09-06 15:32:40'),('18fcdba8fd270bc25bdee147d902ed62766efd06f98e32a2e61fbaa16941d353945c41eb4fb4d856',22,1,'DirectLoginToken','[]',0,'2025-12-23 16:31:07','2025-12-23 16:31:07','2026-12-23 16:31:07'),('27c4bfbbea9eee37a90b53ca8a30e7412b663559602fbf85dd3b6aa63037c8f70af1de4009d74297',9,1,'DirectLoginToken','[]',0,'2025-10-01 17:28:20','2025-10-01 17:28:20','2026-10-01 17:28:20'),('28fb893f52910b39dfa75aa02fbea166be550f19add18349b5107b5605c4e033149289f257e3cb40',22,1,'DirectLoginToken','[]',0,'2025-12-08 10:36:33','2025-12-08 10:36:33','2026-12-08 10:36:33'),('2b5dda1a409b75b1ee87f92f86212320093b9d431f1b6f7069b0cb5aee82fdd6ffae3e8d9882cdbb',22,1,'DirectLoginToken','[]',0,'2025-12-10 10:33:56','2025-12-10 10:33:56','2026-12-10 10:33:56'),('2c917157f334ab180ab3a314c1bd6230f1b8c695618a6412114205e0a63c665fcbde5c7b6cca2e02',26,1,'DirectLoginToken','[]',0,'2025-12-22 14:32:31','2025-12-22 14:32:31','2026-12-22 14:32:31'),('2cae9db0f1d3f1a5465efe66be5b0ecbbf96a36230f82bedcc2fa6e547ec44a0c4f61a962d6bf16b',17,1,'DirectLoginToken','[]',0,'2025-12-11 18:43:54','2025-12-11 18:43:54','2026-12-11 18:43:54'),('2e4b2bb347079654bf5c99eadc33f515ecb4e494a92db138848da5428d123fc0cd71c607981231bc',22,1,'DirectLoginToken','[]',0,'2025-12-19 17:36:18','2025-12-19 17:36:18','2026-12-19 17:36:18'),('30faefa211da8d8e0a07144f00f2bc11b075082061db961cbc860e12acb6182b76dd11016ffa7adc',15,1,'DirectLoginToken','[]',0,'2025-10-06 05:18:31','2025-10-06 05:18:31','2026-10-06 05:18:31'),('31aeb02781a6fc3e91ad6ce4e0c815d248300e43b461b11f6a3ab9077984a72cf1c822ef3737c39a',28,1,'DirectLoginToken','[]',0,'2025-12-09 12:15:37','2025-12-09 12:15:37','2026-12-09 12:15:37'),('3760d79c1f4fa1677366145b04216a23a036fbe27f25ef2c39c40311260e8baeea4eca94fa993b54',9,1,'DirectLoginToken','[]',0,'2025-08-31 12:23:13','2025-08-31 12:23:13','2026-08-31 12:23:13'),('387d9faa8347d37b50e40bff862afee99f52ad6b7750b31f81c4942ad8f7f8b945bffa58296806e4',15,1,'DirectLoginToken','[]',0,'2025-11-17 14:41:25','2025-11-17 14:41:25','2026-11-17 14:41:25'),('3902f425ee0e5b3dd2b8bce1de6e525368074aa35abe625e8a7a222d70bfb0efb72cf78ba65ed22a',26,1,'API Token','[]',0,'2025-12-07 15:50:12','2025-12-07 15:50:12','2026-12-07 15:50:12'),('3971ba4ae7934301bbe69624d9732ed1a51f13dac35b0a766957f94e8cbd6443cb3c8961b6e59942',8,1,'API Token','[]',0,'2025-08-31 06:13:15','2025-08-31 06:13:15','2026-08-31 06:13:15'),('3991056e10c1f50fe11539bbcb3ca67e8216abdafaa64cdf914245b653f29d2b744d45eef8d2dd6a',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:20:46','2025-12-12 07:20:46','2026-12-12 07:20:46'),('3cd32e6b7dfaa4713dffc8123cf59f0ce6189f3dbb2a3056009cac60d00615ce916059351d688424',12,1,'DirectLoginToken','[]',0,'2025-12-10 14:56:55','2025-12-10 14:56:55','2026-12-10 14:56:55'),('407108687c3fe1d6680cc59f7879a3f5003fb53b04f7590812aae89bbb38c99b5c705d83a48cb29c',23,1,'API Token','[]',0,'2025-11-17 08:58:06','2025-11-17 08:58:06','2026-11-17 08:58:06'),('41e5162e9ae7c86e17e8f52fbc8565acf96d9a4d79081d010d283e51bcd5cd93e6b20d5e2d9763eb',22,1,'DirectLoginToken','[]',0,'2025-12-09 10:14:26','2025-12-09 10:14:26','2026-12-09 10:14:26'),('4352c8b0253adc8b8a5d97100c42f099af33185e795fdca58780cd039418a548a9515ef4f7177407',9,1,'DirectLoginToken','[]',0,'2025-08-31 06:47:53','2025-08-31 06:47:53','2026-08-31 06:47:53'),('4464529cdddb2b33bb782b5a9529e200f8064836f6c28d50daacf1f2437a43cba0a85a460176615a',22,1,'DirectLoginToken','[]',0,'2025-12-11 21:32:28','2025-12-11 21:32:28','2026-12-11 21:32:28'),('448d83ee8d4632610d403ceec8764d1e390a205fc3b5151f3c50e1528756c34812c27074868395c8',17,1,'API Token','[]',0,'2025-10-01 18:03:49','2025-10-01 18:03:49','2026-10-01 18:03:49'),('449e8e623e4545aef564853855c0ecf52f53f7d09d6a131b67819b0e44c9b6bc9ce6bb17a24ab012',9,1,'DirectLoginToken','[]',0,'2025-09-01 18:33:09','2025-09-01 18:33:09','2026-09-01 18:33:09'),('4636215321e4050c9307ed65741b82f06059a549148bb402fd9e07f642d738938d57b50b96d8c73b',15,1,'DirectLoginToken','[]',0,'2025-11-10 18:08:19','2025-11-10 18:08:19','2026-11-10 18:08:19'),('46cc3a8a73ffc3b8782a274937cf58ee458cee89687e96766ab92065fa106c5e84cdc0994f22ed72',12,1,'DirectLoginToken','[]',0,'2025-09-10 10:00:09','2025-09-10 10:00:09','2026-09-10 10:00:09'),('4701baabf1fb4a2287a55641561d29e40a580984814165046a351a507eb1d4f659eceb1acd3d34a0',9,1,'DirectLoginToken','[]',0,'2025-08-31 08:24:25','2025-08-31 08:24:25','2026-08-31 08:24:25'),('4757651f0ca549e7857c46e0a16690f17ef69ec5436c6cee9672dcf84371e60769cb5fe5dee9bcba',12,1,'DirectLoginToken','[]',0,'2025-12-19 12:07:37','2025-12-19 12:07:37','2026-12-19 12:07:37'),('477a12708e64f7db7e05de2b16f8c17c8d1d7bac5d2b77ca1b5498bdfec9ed21663d7b0a167c91ca',22,1,'DirectLoginToken','[]',0,'2025-12-08 09:58:48','2025-12-08 09:58:48','2026-12-08 09:58:48'),('4a40e62e088c9a295d7c0a003a5d9d75a2a16678d97acf9f926b48c8b38c46e1f4e1b099c7f3778e',22,1,'DirectLoginToken','[]',0,'2025-12-08 10:52:56','2025-12-08 10:52:56','2026-12-08 10:52:56'),('4b54caac56bab749bdfa2c0b57fbeac77131a7d8e44fc116cb76079a1c58f1d6e61328ace738ece0',17,1,'DirectLoginToken','[]',0,'2025-12-03 19:19:49','2025-12-03 19:19:49','2026-12-03 19:19:49'),('4e9de6e46c69b5137902694b51842d2851ce80cff4e8c5f5919134ebd5a4adef3f9d217b7a62cf68',31,1,'API Token','[]',0,'2025-12-22 14:34:39','2025-12-22 14:34:39','2026-12-22 14:34:39'),('4ffc80bde2b587b90d6fddde65341a383bd9ed4c8d8514cb71346680402a1cdda0772bf580fbe645',22,1,'DirectLoginToken','[]',0,'2025-12-10 11:04:13','2025-12-10 11:04:13','2026-12-10 11:04:13'),('5000bb8a81e83347bb104b29923547e00b80969b343a3215a60f88fa1b4a737bded68cc72609f59a',6,1,'API Token','[]',0,'2025-08-31 04:14:05','2025-08-31 04:14:05','2026-08-31 04:14:05'),('5179ecbf57740bef7d8549499106907815f2c2ea0b3a784bbfdec74c1b5bdd0187e73e0a748d2708',9,1,'DirectLoginToken','[]',0,'2025-09-14 18:27:58','2025-09-14 18:27:58','2026-09-14 18:27:58'),('5246c82bae70f595dcad3cbee1ff2d57a08a5e419001dc1f7fcff279fb5173ea115bb74665743785',22,1,'DirectLoginToken','[]',0,'2025-12-12 20:24:16','2025-12-12 20:24:16','2026-12-12 20:24:16'),('5338274f8b0b80e4f6a5ca3401d341c2674c19f0c7e4bd6704eb5442dfab6c4936fce13df5a1e63c',9,1,'DirectLoginToken','[]',0,'2025-09-14 09:57:34','2025-09-14 09:57:34','2026-09-14 09:57:34'),('57b1473508d9b6dd83a73355e609151ce169f42e6a67316d0de83a0f3d8e4456b1f7cc1caffce875',30,1,'API Token','[]',0,'2025-12-19 18:18:53','2025-12-19 18:18:53','2026-12-19 18:18:53'),('58a5966be3a0d23c9fdba214bb01554d4a65fc128624d3d47d81746a8fac2e2488ccc37f7ead7d3c',23,1,'DirectLoginToken','[]',0,'2025-11-17 11:28:39','2025-11-17 11:28:39','2026-11-17 11:28:39'),('5a9e6bf465c6fb953849edfa5fe72a5752e2cfcec4e416af814709391ac5f16cbddbce59351a2bab',17,1,'DirectLoginToken','[]',0,'2025-12-05 03:37:28','2025-12-05 03:37:28','2026-12-05 03:37:28'),('5bc7b8ef2f6c30ec47de0f7ed6c887fec4a30989f89d0fba707f5b99d18b1a3381dafdae3801af3c',9,1,'DirectLoginToken','[]',0,'2025-08-31 12:26:55','2025-08-31 12:26:55','2026-08-31 12:26:55'),('5d279e0a5378425ac5bb77aff0100374a9c334fe5fed0ab82b2e7697652dde7e6a15e23e86d52c75',12,1,'DirectLoginToken','[]',0,'2025-09-09 07:05:33','2025-09-09 07:05:33','2026-09-09 07:05:33'),('5d75494e32c104eb69dcdfe868f941787b7e0e2cf8325cd235e11f700cb32da23c8a035f13be872d',12,1,'DirectLoginToken','[]',0,'2025-12-12 17:43:49','2025-12-12 17:43:49','2026-12-12 17:43:49'),('618dbace4eed0efc9714b08978c8ec0bad424fa0f4887204f3c4bad3f813bb7c45e341dba1e80052',22,1,'DirectLoginToken','[]',0,'2025-12-23 16:30:09','2025-12-23 16:30:09','2026-12-23 16:30:09'),('65640523908cb5ad9d3702e35d58bd57a5fe5f778baf952d0863ea76565af2592848b6f16c8eda5d',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:13:33','2025-12-12 07:13:33','2026-12-12 07:13:33'),('657a2f16a7d90382f482392a349e7aa0889ae1662e7a8fdd3ab2ce39647924121aaa760adbbf9f20',12,1,'DirectLoginToken','[]',0,'2025-09-28 09:25:42','2025-09-28 09:25:42','2026-09-28 09:25:42'),('662d1ae096d54fbf553af3099b31e786c606e712438527294bf65fec8785c0ab9585efd27c9a2f4c',12,1,'DirectLoginToken','[]',0,'2025-12-13 02:58:01','2025-12-13 02:58:01','2026-12-13 02:58:01'),('69122221a229c3e88cd54e89d66bfd7e86fc3925757ad272b7f523612e9c2bdee22b3edd29c65f59',12,1,'DirectLoginToken','[]',0,'2025-12-10 15:00:21','2025-12-10 15:00:21','2026-12-10 15:00:21'),('6934fc610218ca72be5adb2ac310bb8d8f545ec0bf7112f1fe5533948e84e8c887d69779f374ffb3',17,1,'DirectLoginToken','[]',0,'2025-12-23 17:15:59','2025-12-23 17:15:59','2026-12-23 17:15:59'),('6d40732ee1da112b57da6a9d37655dc9e75d8eb15d2cb4c744a0f70bb235d7b7deaf2cd45b516a4e',11,1,'API Token','[]',0,'2025-09-01 17:16:51','2025-09-01 17:16:51','2026-09-01 17:16:51'),('6dc05d2a8df40d8a4a47f06c04b8c5631476b710dfb47f56f7109465ff1124dc06c788b98ff5cf9a',5,1,'DirectLoginToken','[]',0,'2025-08-31 08:11:08','2025-08-31 08:11:08','2026-08-31 08:11:08'),('6e202e0ab9611188897c64a0a26f2a9c7c93350522574dcaadcbc2c5647aaf5a555c9d86bb65a64a',9,1,'DirectLoginToken','[]',0,'2025-08-31 12:25:28','2025-08-31 12:25:28','2026-08-31 12:25:28'),('6ea16c1028c12ebcb9b4ecde92d1062c6bf8711ddd060dc81f5296a7861d92e256e75a1912011dd0',5,1,'DirectLoginToken','[]',0,'2025-08-31 04:30:58','2025-08-31 04:30:58','2026-08-31 04:30:58'),('6f5de90d588766ed82ac72c06288af38711199604243b41fdc8ccdfc25810c3cc209c8b59b9a5024',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:13:08','2025-12-12 07:13:08','2026-12-12 07:13:08'),('7195b241c93d809ec583c57853e64f2f47aaabe24e82e94b25e799ca29c659c1c506a5289b52f5b2',29,1,'API Token','[]',0,'2025-12-10 16:43:29','2025-12-10 16:43:29','2026-12-10 16:43:29'),('71cec1f4b564a3fc0e57d23499662f5b9bbe0ef6dc9d55df8093fcd65ee5b84d0c04055c5d410c36',15,1,'DirectLoginToken','[]',0,'2025-11-11 06:49:19','2025-11-11 06:49:19','2026-11-11 06:49:19'),('71d05ab21c0b21ba09e624e15b45e86cc669633d523f1894fc53603cd8c932d75608630410a3b4a7',22,1,'DirectLoginToken','[]',0,'2025-12-12 17:09:31','2025-12-12 17:09:31','2026-12-12 17:09:31'),('72748eba1dcfa48bd4a7b775101f28e67e0fda28bc98a9347c8b2d0f864c784ddab58e98d9bf6c06',22,1,'DirectLoginToken','[]',0,'2025-12-18 04:08:09','2025-12-18 04:08:09','2026-12-18 04:08:09'),('72d4e1a89ce1e1268ebdb05b094e0c11a03a20cabf16cdb4e088ac346b793554139fd2504170675f',22,1,'API Token','[]',0,'2025-11-14 10:04:08','2025-11-14 10:04:08','2026-11-14 10:04:08'),('732b33b716c3e45dd6a262b7250d10bfbd2ad11d45e3a41a04c9ba496d07f151eb60ecd739eb8c51',9,1,'DirectLoginToken','[]',0,'2025-08-31 15:46:07','2025-08-31 15:46:07','2026-08-31 15:46:07'),('75b79f2b423fcd779b2da217e6ef06be84c235337b976cd6782ea2440a2722729ea4f185ced29f2d',15,1,'DirectLoginToken','[]',0,'2025-11-24 17:20:55','2025-11-24 17:20:55','2026-11-24 17:20:55'),('78299d694fa3a4492327d41533b1d47fdc923b9210ecf7f63b020c4a89f0ec357ba3e75f5d7d4bfd',12,1,'API Token','[]',0,'2025-09-06 18:52:31','2025-09-06 18:52:31','2026-09-06 18:52:31'),('78461ff3475f2da3320c559473bcd14c16123787bab2f91748f9a0c44128230256873c5db557028a',5,1,'DirectLoginToken','[]',0,'2025-08-31 04:27:55','2025-08-31 04:27:55','2026-08-31 04:27:55'),('7e3563f5eecc346775be57048c3a7e1052159de2f7bc8c6e0b20b46f7a11a7ebfc08398206df108e',22,1,'DirectLoginToken','[]',0,'2025-12-23 17:12:57','2025-12-23 17:12:57','2026-12-23 17:12:57'),('7eca43f311184902bd2f1194e6a7f2e07d3e075ec60dcfb7427d8af44c1049a34d7e5b1044b45d94',32,1,'API Token','[]',0,'2025-12-22 15:12:36','2025-12-22 15:12:36','2026-12-22 15:12:36'),('7f27d766e373b8adf3c9b83e3b8e88129ba87d4fa9fee2a5fba7e72f4e77b9bffe0925db4b110c8b',22,1,'DirectLoginToken','[]',0,'2025-12-23 17:26:47','2025-12-23 17:26:47','2026-12-23 17:26:47'),('7f57ab1e435fba26faaa59f69bf2cdc538433b9ee0ef1b6e26789fbb15d8d65e488954e65cbd9178',18,1,'DirectLoginToken','[]',0,'2025-11-15 13:34:48','2025-11-15 13:34:48','2026-11-15 13:34:48'),('80be4f5013cbf9d5b53c6cdcb073c6a6f63b67a2525a77d7d57724d9a36a4361e8b98248fa8ed789',22,1,'DirectLoginToken','[]',0,'2025-12-23 16:27:40','2025-12-23 16:27:40','2026-12-23 16:27:40'),('81210537b3c7e2e524449cc600328de126867b6263ca6405a75462fb676c076e5821200ea3a7ad48',9,1,'DirectLoginToken','[]',0,'2025-08-31 08:15:43','2025-08-31 08:15:43','2026-08-31 08:15:43'),('82a71295fea311a6ac8b14b49be3eabcf51528a40fd841ace0a2f36b1cfa95c7eb9e55866a8b8c07',21,1,'API Token','[]',0,'2025-10-02 15:34:56','2025-10-02 15:34:56','2026-10-02 15:34:56'),('84fcb2d49e90da5aeaa2342a4b384d5215f22405b03f3719b8056e4fc5a5d11308e28f3c299cea35',11,1,'DirectLoginToken','[]',0,'2025-09-01 17:35:24','2025-09-01 17:35:24','2026-09-01 17:35:24'),('875484fc1ddb4bbd5f6cfc790e1f63c52c5c1646090f160f4941979a402bf19b558743ba16cf17ba',15,1,'DirectLoginToken','[]',0,'2025-12-06 11:02:55','2025-12-06 11:02:55','2026-12-06 11:02:55'),('8a11ede5b86900d140c0c1d59a39aad475e473c3cf14de6d321ffcddbcc41691e9c490295bd77423',27,1,'DirectLoginToken','[]',0,'2025-12-19 06:52:36','2025-12-19 06:52:36','2026-12-19 06:52:36'),('8ad619eaa51f4540d4e549b5f8370d468cd47f0a72fed05cc086caca34afaca9330ddaf090572c01',14,1,'API Token','[]',0,'2025-09-14 17:28:14','2025-09-14 17:28:14','2026-09-14 17:28:14'),('8caae4ed604b4d108594119e316eb5ddfa0ad8270a12b3aed073f01d6059f497b99eb588b6d3b2d6',13,1,'API Token','[]',0,'2025-09-13 13:40:51','2025-09-13 13:40:51','2026-09-13 13:40:51'),('978c97b103e24396e2003c5981166ab076ae964554dad3ba360198f4c079bfd4da0128bfae66f1c0',22,1,'DirectLoginToken','[]',0,'2025-12-12 20:44:11','2025-12-12 20:44:11','2026-12-12 20:44:11'),('985a305927a6cacaf0ea8e4976faae20a5785f7824f2e5ebb86c282d0f12de98b945db21b33de7de',9,1,'DirectLoginToken','[]',0,'2025-09-11 08:41:12','2025-09-11 08:41:12','2026-09-11 08:41:12'),('99f8454c55cb992dfb92866864f6b1555cc600ff00ea049a79e0496dc8444e6fed6c3b5e651ee47b',22,1,'DirectLoginToken','[]',0,'2025-12-19 17:33:56','2025-12-19 17:33:56','2026-12-19 17:33:56'),('9a5deb602784d462af48fc36ccb7af653eed6b5c1e603b0c8f34362774ad3e02fec092c2784d2e2b',9,1,'DirectLoginToken','[]',0,'2025-08-31 12:25:20','2025-08-31 12:25:20','2026-08-31 12:25:20'),('9acf168d4a1718ac5cf7af2c54bafcf7fecf0d4098605c6ea3c4390ce93b71652561f36e8b5b1a0e',12,1,'DirectLoginToken','[]',0,'2025-12-12 19:17:50','2025-12-12 19:17:50','2026-12-12 19:17:50'),('9ba5828a16527556a05bbe495c2d982fedf75b96ceaa110db661f2940ae1c99de8e00542d244bfa2',12,1,'DirectLoginToken','[]',0,'2025-12-10 14:54:25','2025-12-10 14:54:25','2026-12-10 14:54:25'),('9d61a487af3982c7fbea4df118ef461f92799ce0bf7e1040f432efb40a0c9287ab28d60d672424e3',20,1,'API Token','[]',0,'2025-10-02 14:21:17','2025-10-02 14:21:17','2026-10-02 14:21:17'),('9fe5302c085e4f511d7f1e3e8d7fbe575c72801224faac7e6270749b92bea03a65b468d6fad03220',17,1,'DirectLoginToken','[]',0,'2025-12-01 16:42:10','2025-12-01 16:42:10','2026-12-01 16:42:10'),('a0544f0afe952c636e60abede771ad33c7373e54e1911d23dd6f6bc600d738bbf5902e2452f7aec3',10,1,'API Token','[]',0,'2025-09-01 07:03:19','2025-09-01 07:03:19','2026-09-01 07:03:19'),('a278ea1db1127f67bb8a46d8ea7a5c8a25101977b28445ad1e6b9fe68206f29c8466a132143f48f2',9,1,'DirectLoginToken','[]',0,'2025-09-14 09:41:28','2025-09-14 09:41:28','2026-09-14 09:41:28'),('a45094d213680ca266e1aebe42df588506a46514f835799bca1da5cb6d87a4b2277a964ab7ea20ff',18,1,'API Token','[]',0,'2025-10-02 07:10:06','2025-10-02 07:10:06','2026-10-02 07:10:06'),('a51346564af5effb3abfcb37bb411fba9846bdb5f21d308e88de34974a362ca7147fea2a0e1c008c',22,1,'DirectLoginToken','[]',0,'2025-12-10 11:11:15','2025-12-10 11:11:15','2026-12-10 11:11:15'),('ab7a658c337ada5820bcedbf1615e79e38e454fa3cf4079fa82713490d58b1f3a47e65f9ce865575',9,1,'DirectLoginToken','[]',0,'2025-08-31 12:38:58','2025-08-31 12:38:58','2026-08-31 12:38:58'),('b0891187140293e90548b1359756e6796ce66cffa6a77c5b7b9761a17c639afec44a4ffa74b318fa',22,1,'DirectLoginToken','[]',0,'2025-12-12 20:41:59','2025-12-12 20:41:59','2026-12-12 20:41:59'),('b0d9266095ac0d50a2bbab06348b7a796c5d7ad47cc041661821c22f17966153f4136e4580bf14e8',12,1,'DirectLoginToken','[]',0,'2025-09-17 17:02:55','2025-09-17 17:02:55','2026-09-17 17:02:55'),('b33ae436468b041794a49b4c8c2af9abd9a94508798a47694e6941a1dd373d92afc4efcf08b19475',16,1,'API Token','[]',0,'2025-10-01 17:35:13','2025-10-01 17:35:13','2026-10-01 17:35:13'),('b86503a7ec666d555aa19e7e1784f8e403f21968fcd6531a5860c82a058913520bf7e0cfc06858b6',22,1,'DirectLoginToken','[]',0,'2025-12-23 17:37:04','2025-12-23 17:37:04','2026-12-23 17:37:04'),('b89b0b73f6d2b414b15ddf9695b9b252c7a65cd9ee79cb2f5a6022cff0fed50e76e2911800855292',22,1,'DirectLoginToken','[]',0,'2025-12-12 20:42:44','2025-12-12 20:42:44','2026-12-12 20:42:44'),('bc9f3b2064f9db5fba5be1b281c1bdfe5269dd5c57c944516609e578c3d0fb27cdaa22e519d2948a',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:22:09','2025-12-12 07:22:09','2026-12-12 07:22:09'),('be5b900956a4db768ffe85f48d87b8bcab0a538aa678ab5f024a811eae032aba09ec9a82e6279c19',27,1,'DirectLoginToken','[]',0,'2025-12-12 21:20:28','2025-12-12 21:20:28','2026-12-12 21:20:28'),('beb1249a3466eb98957bb1b3f56bb2bd99d4254a7e033aa9f93b1fa62e74f356d0a31faded6c632e',15,1,'DirectLoginToken','[]',0,'2025-12-15 17:58:26','2025-12-15 17:58:26','2026-12-15 17:58:26'),('bf134fef03e258ff31afb659f7acaa30015e1d122e975531d7e0387dbe7fe00a91d09aa1aa1cbdff',15,1,'DirectLoginToken','[]',0,'2025-12-06 11:22:32','2025-12-06 11:22:32','2026-12-06 11:22:32'),('c17cc264dc3b67dda7e0b3c2c81dad7df09f3dad468365698cb6f7e1e5b6dc35c369ffd68c32cab0',5,1,'Reymend Personal Access Client','[]',0,'2025-08-30 07:01:05','2025-08-30 07:01:05','2026-08-30 07:01:05'),('c1c1d363c38ad9c08696e560721e22d8a82bc99704d21cf35e6b001017a346a412be718be1683825',24,1,'API Token','[]',0,'2025-11-27 17:14:34','2025-11-27 17:14:34','2026-11-27 17:14:34'),('c2cb443b1e121e8daebe9ef36710afd2427acc81e500e79797fe1923bcaeac3b183b68772b90ed1a',9,1,'DirectLoginToken','[]',0,'2025-08-31 18:31:32','2025-08-31 18:31:32','2026-08-31 18:31:32'),('c38c7f50900de031fa467052fa27441d7ccd2e1c4c15a0b28efa778b1592039cc26303532214d4de',12,1,'DirectLoginToken','[]',0,'2025-12-18 13:29:07','2025-12-18 13:29:07','2026-12-18 13:29:07'),('c3c2d91229f017e8fd2c41f4da5b5e9bfbf4a97ee79f80528bdab397c0e039f01b1234f58f17d00d',11,1,'DirectLoginToken','[]',0,'2025-09-26 02:46:23','2025-09-26 02:46:23','2026-09-26 02:46:23'),('c8f804c31557fb93026bf79c721e0356b151238db3ea2ff07eedf713429e3b3c23eb3af289494b89',27,1,'DirectLoginToken','[]',0,'2025-12-23 17:34:16','2025-12-23 17:34:16','2026-12-23 17:34:16'),('c99f0deb4591834e0a6f80a3effb42a1d8a0b8ea39ac46bdd3e44ec70835f94fcfd43b8971099b09',22,1,'DirectLoginToken','[]',0,'2025-12-23 16:30:30','2025-12-23 16:30:30','2026-12-23 16:30:30'),('cd02e75da995b58dd7562d814d2efec0e9f9ef268a96495e7dcdcafc7c48eef271d8fa08363108d0',12,1,'DirectLoginToken','[]',0,'2025-09-10 09:46:44','2025-09-10 09:46:44','2026-09-10 09:46:44'),('d086c94302abc62215b97fffe8c1d86cd3603d4ca44bfad1a3513e42eab8aeab405a939ad6d669bf',22,1,'DirectLoginToken','[]',0,'2025-12-12 20:44:46','2025-12-12 20:44:46','2026-12-12 20:44:46'),('d125a6dc77205b41f3f1fa31c40f3dbf3dc743b9808f57d787577f62641f76ed4db2401dd95d27af',17,1,'DirectLoginToken','[]',0,'2025-10-06 08:21:25','2025-10-06 08:21:25','2026-10-06 08:21:25'),('d1489a813877cdab33c1ac19cf32294778265e822b7c960f71624d97c3de63f7211599fb53d57ac3',27,1,'API Token','[]',0,'2025-12-07 18:58:38','2025-12-07 18:58:38','2026-12-07 18:58:38'),('d252076ddebecdf372883447f3c002c5ed28e5c464477150f099e4eec37f65b2b20f5e75ba761e6b',22,1,'DirectLoginToken','[]',0,'2025-12-12 08:05:40','2025-12-12 08:05:40','2026-12-12 08:05:40'),('d5d3fae92dcb174a82c846415007cdd3392b6b63ebe332ed702bf33bc69ed95b146104046386b3ac',17,1,'DirectLoginToken','[]',0,'2025-11-10 16:04:16','2025-11-10 16:04:16','2026-11-10 16:04:16'),('d88fedc7b87f2aabb4ba7a18464d145ee70b9b6c62cccb3e1cb1f43825219f6ecdada08c76e84e38',7,1,'API Token','[]',0,'2025-08-31 04:16:10','2025-08-31 04:16:10','2026-08-31 04:16:10'),('dc33311a53440207b3c119b381034e5a387c7c5a8579fe0458e0f5995e3c930da5b3dea6a77a657d',9,1,'API Token','[]',0,'2025-08-31 06:26:20','2025-08-31 06:26:20','2026-08-31 06:26:20'),('df3f06529881c798f528fe33f7c0d543196c483f32a0513810b831f60dad4724f28fa61038b1a3df',25,1,'API Token','[]',0,'2025-12-06 11:09:16','2025-12-06 11:09:16','2026-12-06 11:09:16'),('e042b9136c98b7d0d212708b5bdc9f5203479dc58e3a80fcd504a2ada2a8af99d8ee49b6e82ec288',17,1,'DirectLoginToken','[]',0,'2025-10-06 08:20:49','2025-10-06 08:20:49','2026-10-06 08:20:49'),('e05be3b0912dadb5976ebc74f368eb66d4a9accba9d269d7567d95a6cd3d55b9782cd3363f5939e2',19,1,'API Token','[]',0,'2025-10-02 11:10:51','2025-10-02 11:10:51','2026-10-02 11:10:51'),('e2997af0a915d5ac0b917bff19540b54f3ff557fefd0154585f03ca9442fa747142de9be862d6362',15,1,'DirectLoginToken','[]',0,'2025-11-17 01:45:25','2025-11-17 01:45:25','2026-11-17 01:45:25'),('e314ae45fc08920d82c304c6f8887e257f01473508f0686a266686cba1d74079db7f5b1414edaa43',22,1,'DirectLoginToken','[]',0,'2025-12-08 08:40:55','2025-12-08 08:40:55','2026-12-08 08:40:55'),('e458a3a2edbde5b1bca5a1ff6db4cbb258ecdb76d5dd7b28c4c472fb210becd2ebc3b8154dd56a4c',19,1,'DirectLoginToken','[]',0,'2025-10-02 11:14:30','2025-10-02 11:14:30','2026-10-02 11:14:30'),('e86ff90f99c29935c3e32edb2a3dc2a3931a99a51a1d5f21552c1607f6b7965758413edef058269c',22,1,'DirectLoginToken','[]',0,'2025-12-10 08:37:10','2025-12-10 08:37:10','2026-12-10 08:37:10'),('e910d3273742ad23eb7e9a11f954e0d83f612c181bac3e1fa3ca544925ca3c2064416a1fcf27f653',27,1,'DirectLoginToken','[]',0,'2025-12-23 17:34:52','2025-12-23 17:34:52','2026-12-23 17:34:52'),('ea2d20b09a982621b425379997b95e83a5be2c62324402fa12abaaa32df81f6ef96b4fa6396880a2',12,1,'DirectLoginToken','[]',0,'2025-12-15 09:45:03','2025-12-15 09:45:03','2026-12-15 09:45:03'),('eb6bc1523017db3a8e9a56af834389b9843fb9b21d0a57809e16692abf02885abacabe5fc8bea647',28,1,'API Token','[]',0,'2025-12-09 07:51:29','2025-12-09 07:51:29','2026-12-09 07:51:29'),('eda83831ed6dbb25c545b8682d773e47aa4eafbbba03ec9076a774c88885e8dedc2fb16194ed22cf',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:13:59','2025-12-12 07:13:59','2026-12-12 07:13:59'),('ede656660e22807efe8e6a7e95feee6fb7d79216aff438f18803b5bc47d5e8ab6be93489d1ea7ebb',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:14:38','2025-12-12 07:14:38','2026-12-12 07:14:38'),('ef5b655d87b02f5f76dceac2908d67f6d1d4e8698a351085b45d041cda6894cc40943703ed57fe12',22,1,'DirectLoginToken','[]',0,'2025-12-12 07:19:22','2025-12-12 07:19:22','2026-12-12 07:19:22'),('f167c5bfb3a474c12fdb4694932e095814923aec05c1991dc024cff03eacf3d9658978ee211f09fa',11,1,'DirectLoginToken','[]',0,'2025-09-11 06:29:16','2025-09-11 06:29:16','2026-09-11 06:29:16'),('f5afa3f071451652ad1d6af21e1a83933ccd45b497c1114fd16dd1a0e510b74cd0effd3cf727ddd8',9,1,'DirectLoginToken','[]',0,'2025-08-31 18:36:43','2025-08-31 18:36:43','2026-08-31 18:36:43'),('f99378f8c3a9b11f308558427efeefb69a60399b88ae0174e9ab7b72f92c600670dbcc1ccac240e7',12,1,'DirectLoginToken','[]',0,'2025-12-06 11:45:58','2025-12-06 11:45:58','2026-12-06 11:45:58');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','c8hbJqH2nudt1d0igx328uJJ0bMZ9PTcrYuAcRl3',NULL,'http://localhost',1,0,0,'2025-08-30 06:57:03','2025-08-30 06:57:03'),(2,NULL,'Laravel Password Grant Client','P0D5EhQp2Mm44IUcMLo46avF0Vt83Uz9QqDb1092','webs','http://localhost',0,1,0,'2025-08-30 06:57:09','2025-08-30 06:57:09');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2025-08-30 06:57:03','2025-08-30 06:57:03');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `festival_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
INSERT INTO `reminders` VALUES (7,25,23,'2025-11-10','00:00:00',0,0,'2025-12-06 11:27:15','2025-12-06 11:27:15'),(9,25,16,'2025-10-20','00:00:00',0,0,'2025-12-06 11:27:36','2025-12-06 11:27:36'),(57,17,23,'2025-11-10','00:00:00',0,0,'2025-12-13 16:36:07','2025-12-13 16:36:07'),(58,17,23,'2025-11-10','00:00:00',0,0,'2025-12-13 16:36:36','2025-12-13 16:36:36'),(59,17,23,'2025-11-11','00:00:00',0,0,'2025-12-13 16:36:36','2025-12-13 16:36:36'),(60,17,23,'2025-11-12','00:00:00',0,0,'2025-12-13 16:36:36','2025-12-13 16:36:36'),(61,17,23,'2025-11-13','00:00:00',0,0,'2025-12-13 16:36:36','2025-12-13 16:36:36'),(64,12,25,'2025-12-19','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(65,12,25,'2026-01-08','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(66,12,25,'2026-02-19','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(67,12,25,'2026-03-13','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(68,12,25,'2026-04-24','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(69,12,25,'2026-05-07','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(70,12,25,'2026-06-18','00:00:00',0,0,'2025-12-15 17:52:05','2025-12-15 17:52:05'),(71,15,23,'2025-12-16','00:00:00',0,0,'2025-12-15 17:58:59','2025-12-15 17:58:59'),(73,22,25,'2025-12-18','00:00:00',0,0,'2025-12-18 04:09:23','2025-12-18 04:09:23'),(74,27,25,'2025-12-18','00:00:00',0,0,'2025-12-19 06:59:29','2025-12-19 06:59:29'),(75,12,28,'2025-12-21','00:00:00',0,0,'2025-12-19 13:24:27','2025-12-19 13:24:27'),(76,17,25,'2025-12-18','00:00:00',0,0,'2025-12-23 17:12:53','2025-12-23 17:12:53');
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_pages`
--

DROP TABLE IF EXISTS `seo_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(50) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `twitter_card` tinytext DEFAULT NULL,
  `twitter_site` tinytext DEFAULT NULL,
  `og_url` varchar(255) DEFAULT NULL,
  `og_type` varchar(255) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` longtext DEFAULT NULL,
  `meta_chronological` longtext DEFAULT NULL,
  `og_image` longtext DEFAULT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_pages`
--

LOCK TABLES `seo_pages` WRITE;
/*!40000 ALTER TABLE `seo_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_category_id` (`category_id`),
  CONSTRAINT `service_category_id` FOREIGN KEY (`category_id`) REFERENCES `services_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_categories`
--

DROP TABLE IF EXISTS `services_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_categories`
--

LOCK TABLES `services_categories` WRITE;
/*!40000 ALTER TABLE `services_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Site.title','Admin Panel','Site Title',NULL,'text','2023-09-19 13:06:01','2025-08-28 16:30:33'),(2,'Site.from_email','test@mailinator.com','From Email',NULL,'text','2023-09-19 14:11:22','2025-08-28 16:30:33'),(3,'Reading.records_per_page','10','Records Per Page',NULL,'text','2023-09-19 14:11:50','2025-08-28 16:30:44'),(4,'Reading.date_time_format','m-d-Y h:i A','Date Time Format',NULL,'text','2023-09-19 14:12:16','2025-08-28 16:30:44'),(5,'Reading.date_format','m-d-Y','Date Format',NULL,'text','2023-09-19 14:13:22','2025-08-28 16:30:44'),(6,'Contact.email_address','dummy@mailinator.com','Contact Email',NULL,'text','2023-09-19 15:09:46','2025-08-28 16:30:51'),(7,'Contact.admin_email','admin@gmail.com','Enquiry Will Received On',NULL,'text','2023-09-19 15:10:24','2025-08-28 16:30:51'),(9,'Contact.phone','00 (123) 456 78 90','Contact Phone',NULL,'text','2023-09-19 08:16:14','2025-08-28 16:30:51'),(10,'contact.address','Calle 123, Madrid - Espa├▒a','Contact Address',NULL,'text','2023-09-19 08:16:56','2025-08-28 16:30:51'),(11,'Social.facebook','https://www.facebook.com','Facebook Url',NULL,'text','2023-09-19 08:17:58','2025-08-28 16:30:39'),(12,'Social.twitter','https://twitter.com/','Twitter Url',NULL,'text','2023-09-19 08:18:36','2025-08-28 16:30:39'),(13,'Social.linkedin','https://www.linkedin.com','Linkedin Url',NULL,'text','2023-09-19 08:19:24','2025-08-28 16:30:39'),(16,'Site.right','Copyright 2025 . All Rights Reserved.','Copy Right Text',NULL,'text','2023-11-25 06:38:43','2025-08-28 16:30:33');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Andhra Pradesh'),(2,'Arunachal Pradesh'),(3,'Assam'),(4,'Bihar'),(5,'Chhattisgarh'),(6,'Goa'),(7,'Gujarat'),(8,'Haryana'),(9,'Himachal Pradesh'),(10,'Jharkhand'),(11,'Karnataka'),(12,'Kerala'),(13,'Madhya Pradesh'),(14,'Maharashtra'),(15,'Manipur'),(16,'Meghalaya'),(17,'Mizoram'),(18,'Nagaland'),(19,'Odisha'),(20,'Punjab'),(21,'Rajasthan'),(22,'Sikkim'),(23,'Tamil Nadu'),(24,'Telangana'),(25,'Tripura'),(26,'Uttar Pradesh'),(27,'Uttarakhand'),(28,'West Bengal');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temple_description`
--

DROP TABLE IF EXISTS `temple_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temple_description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temple_description`
--

LOCK TABLES `temple_description` WRITE;
/*!40000 ALTER TABLE `temple_description` DISABLE KEYS */;
INSERT INTO `temple_description` VALUES (1,5,1,'1','2025-09-14 09:17:10','2025-09-14 09:17:10'),(2,5,5,'2','2025-09-14 09:17:10','2025-09-14 09:17:10'),(3,5,6,'3','2025-09-14 09:17:10','2025-09-14 09:17:10'),(4,5,7,'4','2025-09-14 09:17:10','2025-09-14 09:17:10'),(9,6,1,'11','2025-09-14 09:22:17','2025-09-14 09:22:17'),(10,6,5,'2','2025-09-14 09:22:17','2025-09-14 09:22:17'),(11,6,6,'3','2025-09-14 09:22:17','2025-09-14 09:22:17'),(12,6,7,'5','2025-09-14 09:22:17','2025-09-14 09:22:17'),(13,1,1,'Ganesh Temple','2025-09-14 09:29:30','2025-09-14 09:29:30'),(14,1,5,'Ganesh Temple','2025-09-14 09:29:30','2025-09-14 09:29:30'),(15,1,6,'Ganesh Temple','2025-09-14 09:29:30','2025-09-14 09:29:30'),(16,1,7,'Ganesh Temple','2025-09-14 09:29:30','2025-09-14 09:29:30'),(17,2,1,'Shiv Temple','2025-09-14 09:29:46','2025-09-14 09:29:46'),(18,2,5,'Shiv Temple','2025-09-14 09:29:46','2025-09-14 09:29:46'),(19,2,6,'Shiv Temple','2025-09-14 09:29:46','2025-09-14 09:29:46'),(20,2,7,'Shiv Temple','2025-09-14 09:29:46','2025-09-14 09:29:46');
/*!40000 ALTER TABLE `temple_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temples`
--

DROP TABLE IF EXISTS `temples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temples` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temples`
--

LOCK TABLES `temples` WRITE;
/*!40000 ALTER TABLE `temples` DISABLE KEYS */;
INSERT INTO `temples` VALUES (1,'Ganesh Temple','https://ourtemples.info/temple/sri-lakshmi-ganapati-temple-jayalaxmi-nagar-ramachandrapuram-hyderabad-telangana-502032/','AUG2025/1756655036-image.jpg',NULL,NULL,NULL,1,0,'2025-08-30 09:43:54','2025-08-31 15:44:15'),(2,'Shiv Temple','https://admin.drajaysaini.in','SEP2025/1757142694-image.png',NULL,NULL,NULL,1,0,'2025-09-06 07:11:34','2025-09-14 09:29:46'),(3,'1','https://admin.drajaysaini.in/adminpnlx/temples/create','SEP2025/1757841395-image.png',NULL,NULL,NULL,1,1,'2025-09-14 09:16:35','2025-09-14 09:17:13'),(4,'1','https://admin.drajaysaini.in/adminpnlx/temples/create','SEP2025/1757841413-image.png',NULL,NULL,NULL,1,1,'2025-09-14 09:16:53','2025-09-14 09:17:16'),(5,'1','https://admin.drajaysaini.in/adminpnlx/temples/create','SEP2025/1757841430-image.png',NULL,NULL,NULL,1,1,'2025-09-14 09:17:10','2025-09-14 09:17:18'),(6,'11','https://admin.drajaysaini.in/adminpnlx/temples/creats','SEP2025/1757841459-image.png',NULL,NULL,NULL,1,1,'2025-09-14 09:17:39','2025-09-14 09:30:32');
/*!40000 ALTER TABLE `temples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiptaps`
--

DROP TABLE IF EXISTS `tiptaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiptaps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` text DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiptaps`
--

LOCK TABLES `tiptaps` WRITE;
/*!40000 ALTER TABLE `tiptaps` DISABLE KEYS */;
INSERT INTO `tiptaps` VALUES (1,'Demo','1765472925_693afa9d1d079.png',1,'2025-12-11 17:08:45','2025-12-11 17:09:33','2025-12-11 17:09:33','0'),(2,'demo 2','DEC2025/1765643195-image.png',1,'2025-12-11 17:41:57','2025-12-13 17:04:09',NULL,'1'),(3,'demo3','DEC2025/1765646978-image.jpg',1,'2025-12-13 17:02:56','2025-12-13 17:29:38',NULL,'0'),(4,'test','DEC2025/1766150828-image.jpg',1,'2025-12-19 13:27:08','2025-12-19 13:27:08',NULL,'0');
/*!40000 ALTER TABLE `tiptaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_device_token`
--

DROP TABLE IF EXISTS `user_device_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_device_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `device_type` varchar(50) DEFAULT NULL,
  `device_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_device_token`
--

LOCK TABLES `user_device_token` WRITE;
/*!40000 ALTER TABLE `user_device_token` DISABLE KEYS */;
INSERT INTO `user_device_token` VALUES (1,22,'android','c3aikjAERWOICldCYXh51i:APA91bFbpxz0dHeMBPYg6uuflVcAx86934vQIjBX6PhPDgnLrAuMw0FjPKGKFPGYMmY37F7PLTBBRzI21tOqyAbHFq5EsjLgEOcJEzQEEnbbotHglB3914w','2025-12-19 17:36:18','2025-12-19 17:36:18'),(2,30,'android','enmwGd-iS-KjsaKFeVjtBx:APA91bEuJLAshiNMggD3KzHkp7lKfjRBL5wIYQKuzhc__A63ZqjwwCDsdIc738-M5gBQUG5mvzntnA96Q_yZiD--adb9eFNseqF2LGPnGuoMmAFTb3fIAu8','2025-12-19 18:18:52','2025-12-19 18:18:52'),(4,32,'android','eWnAUNyuSpyuEske-Aq766:APA91bG2IajfIRciclkSmWLYlHjrHPpRm7OsT4woXZ37yUb1XWUXq0mDuEn7mB6HTB14EqyyrkCKAZBbgTys3jCs8phcAXnGXwOsEVevGWEm_y5-tRpWFbY','2025-12-22 15:12:36','2025-12-22 15:12:36'),(5,22,'android','d6vXPCBMTGyCtb3DboTYBA:APA91bFscNGFZljuYZSJDRByIVMmSIDR0dNnIWJ7RUHbhFh1fVqk8b8No3k5A64YZAkdn0ZpUOZmmL6SK0UKErvi7luO_Yt8B9zHT8iQdUj_SxIFcUPfQY4','2025-12-23 16:27:40','2025-12-23 16:27:40'),(6,22,'android','d6vXPCBMTGyCtb3DboTYBA:APA91bFscNGFZljuYZSJDRByIVMmSIDR0dNnIWJ7RUHbhFh1fVqk8b8No3k5A64YZAkdn0ZpUOZmmL6SK0UKErvi7luO_Yt8B9zHT8iQdUj_SxIFcUPfQY4','2025-12-23 17:12:57','2025-12-23 17:12:57'),(7,17,'android','dq8Px9V9TRWnGSkA47DwWo:APA91bEaFgfg9PKbkLkQtpJe_8ASlPexyuS3L2WXkSaVO-cUBB1tnFhQoYAAIpZ5cxjwsxKAtC_0_M63HzrrpOkdDYi6hFCTTR2D9MUz19IRku_KZZrS2CE','2025-12-23 17:15:59','2025-12-23 17:15:59'),(8,27,'android','dpw0F2QUQB6JPgPS7orkZA:APA91bH889rx0m5fCgCVFtQPri2bcdsl7mDzMkl65V7bSXzA2KmenPX6oxhhGg8quuD1RYy91qdOiUJTzA-DD4mNpXWxeaUPjp_lTcozEzx4k4hODyHj0gk','2025-12-23 17:34:16','2025-12-23 17:34:16'),(9,27,'android','cXYYAJMsQTOJkfPOU6TsVb:APA91bEUVvQ4wG8AQGv16QEmYdTFe2k1swUVsRfv76OqdzlJ_bvQsIM86Q-TQq0LMW8SIEhPs5SGQrEeiP9jSRyPDkZheThwWtSfWZGwfUeaA5TK3zcAyKU','2025-12-23 17:34:52','2025-12-23 17:34:52'),(10,22,'android','ct_dz0T5RGqBRig5Y9Qe1z:APA91bGYZqmf3Mo3hE313lN2TogVe1JxgYLJNDF-BnwE-IMHqAvQbKassw4jJQ6aHP25NLrjFmyRVpqvXwcFdXuoth1ZNwo7pbUhVFQSE6z3M3fTnWp3lQM','2025-12-23 17:37:04','2025-12-23 17:37:04');
/*!40000 ALTER TABLE `user_device_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `device_ids` longtext DEFAULT NULL,
  `user_ids` longtext DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `sent_count` text DEFAULT '0',
  `total_recipients` text DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_all_users` text DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_notifications_user_id_is_sent_index` (`user_id`,`is_sent`),
  KEY `user_notifications_device_id_is_sent_index` (`device_id`,`is_sent`),
  CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (3,'suus','jsk',NULL,NULL,NULL,'c3aikjAERWOICldCYXh51i:APA91bFbpxz0dHeMBPYg6uuflVcAx86934vQIjBX6PhPDgnLrAuMw0FjPKGKFPGYMmY37F7PLTBBRzI21tOqyAbHFq5EsjLgEOcJEzQEEnbbotHglB3914w,enmwGd-iS-KjsaKFeVjtBx:APA91bEuJLAshiNMggD3KzHkp7lKfjRBL5wIYQKuzhc__A63ZqjwwCDsdIc738-M5gBQUG5mvzntnA96Q_yZiD--adb9eFNseqF2LGPnGuoMmAFTb3fIAu8,eWnAUNyuSpyuEske-Aq766:APA91bG2IajfIRciclkSmWLYlHjrHPpRm7OsT4woXZ37yUb1XWUXq0mDuEn7mB6HTB14EqyyrkCKAZBbgTys3jCs8phcAXnGXwOsEVevGWEm_y5-tRpWFbY,d6vXPCBMTGyCtb3DboTYBA:APA91bFscNGFZljuYZSJDRByIVMmSIDR0dNnIWJ7RUHbhFh1fVqk8b8No3k5A64YZAkdn0ZpUOZmmL6SK0UKErvi7luO_Yt8B9zHT8iQdUj_SxIFcUPfQY4,d6vXPCBMTGyCtb3DboTYBA:APA91bFscNGFZljuYZSJDRByIVMmSIDR0dNnIWJ7RUHbhFh1fVqk8b8No3k5A64YZAkdn0ZpUOZmmL6SK0UKErvi7luO_Yt8B9zHT8iQdUj_SxIFcUPfQY4,dq8Px9V9TRWnGSkA47DwWo:APA91bEaFgfg9PKbkLkQtpJe_8ASlPexyuS3L2WXkSaVO-cUBB1tnFhQoYAAIpZ5cxjwsxKAtC_0_M63HzrrpOkdDYi6hFCTTR2D9MUz19IRku_KZZrS2CE,dpw0F2QUQB6JPgPS7orkZA:APA91bH889rx0m5fCgCVFtQPri2bcdsl7mDzMkl65V7bSXzA2KmenPX6oxhhGg8quuD1RYy91qdOiUJTzA-DD4mNpXWxeaUPjp_lTcozEzx4k4hODyHj0gk,cXYYAJMsQTOJkfPOU6TsVb:APA91bEUVvQ4wG8AQGv16QEmYdTFe2k1swUVsRfv76OqdzlJ_bvQsIM86Q-TQq0LMW8SIEhPs5SGQrEeiP9jSRyPDkZheThwWtSfWZGwfUeaA5TK3zcAyKU,ct_dz0T5RGqBRig5Y9Qe1z:APA91bGYZqmf3Mo3hE313lN2TogVe1JxgYLJNDF-BnwE-IMHqAvQbKassw4jJQ6aHP25NLrjFmyRVpqvXwcFdXuoth1ZNwo7pbUhVFQSE6z3M3fTnWp3lQM','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,27,28,29,30,32',1,0,'0','0',NULL,0,'2025-12-23 17:43:20','2025-12-23 17:45:05','1');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission_actions`
--

DROP TABLE IF EXISTS `user_permission_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission_actions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_permission_id` int(11) DEFAULT NULL,
  `admin_module_id` int(11) DEFAULT NULL,
  `admin_sub_module_id` int(11) DEFAULT NULL,
  `admin_module_action_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission_actions`
--

LOCK TABLES `user_permission_actions` WRITE;
/*!40000 ALTER TABLE `user_permission_actions` DISABLE KEYS */;
INSERT INTO `user_permission_actions` VALUES (351,2,109,1,1,3,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(352,2,110,0,1,2,0,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(353,2,111,2,44,10,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(354,2,111,2,44,11,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(355,2,111,2,44,9,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(356,2,111,2,44,5,0,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(357,2,111,2,44,8,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(358,2,111,2,44,13,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(359,2,111,2,44,12,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(360,2,111,2,44,4,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(361,2,111,2,44,7,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(362,2,112,6,7,15,0,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(363,2,112,6,7,14,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(364,2,112,6,8,16,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(365,2,112,6,8,19,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(366,2,112,6,8,18,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(367,2,112,6,8,17,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(368,2,112,6,9,20,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(369,2,112,6,9,21,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(370,2,112,6,10,22,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(371,2,113,11,14,24,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(372,2,113,11,15,23,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(373,2,113,11,40,25,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(374,2,113,11,41,26,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(375,2,113,11,48,27,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(376,2,114,52,53,31,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(377,2,114,52,53,29,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(378,2,114,52,53,33,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(379,2,114,52,53,30,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(380,2,114,52,53,28,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(381,2,114,52,53,32,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(382,2,114,52,54,34,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(383,2,114,52,54,36,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(384,2,114,52,54,37,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(385,2,114,52,54,35,1,'2023-12-28 12:44:55','2023-12-28 12:44:55');
/*!40000 ALTER TABLE `user_permission_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_module_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (33,19,1,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(34,19,2,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(35,19,6,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(36,19,11,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(37,19,46,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(38,19,49,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(39,19,50,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(40,19,52,1,'2023-10-26 10:21:11','2023-10-26 10:21:11'),(41,18,1,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(42,18,2,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(43,18,6,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(44,18,11,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(45,18,46,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(46,18,49,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(47,18,50,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(48,18,52,1,'2023-10-26 10:22:55','2023-10-26 10:22:55'),(109,2,1,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(110,2,0,0,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(111,2,2,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(112,2,6,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(113,2,11,1,'2023-12-28 12:44:55','2023-12-28 12:44:55'),(114,2,52,1,'2023-12-28 12:44:55','2023-12-28 12:44:55');
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_role_id` tinyint(2) NOT NULL DEFAULT 2 COMMENT '"1"=>"Vendor","2"=>"Customer"',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_prefix` varchar(100) DEFAULT NULL,
  `phone_country_code` varchar(100) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `notify` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `social_id` varchar(250) DEFAULT NULL,
  `forgot_password_validate_string` text DEFAULT NULL,
  `verification_code` varchar(50) DEFAULT NULL,
  `is_verified` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Prakash godwani','delete_1_1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$x5XYlsnWDwC5tdJGEk23ZuaILESoYELuY6byrRzuOiwLt07XEilOK',1,1,NULL,NULL,NULL,NULL,0,'2023-12-28 11:16:15','2024-04-05 13:59:23'),(2,2,'Abel Armstrong','delete_2_1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$5RY5kUxePaE9NwWJwCjiH.ZwoBaRbYJoaQUPG6U2trbZPFzqLyNMG',1,1,NULL,NULL,NULL,NULL,0,'2023-12-28 11:19:50','2023-12-28 11:20:23'),(3,2,'Karen Bernard','delete_3_1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$7TwbQeHf7dOPYNV5DHQd2.MvAh9lz24SiRvfoNDaYWvBYw/7/4FP.',1,1,NULL,NULL,NULL,NULL,0,'2023-12-28 11:20:29','2023-12-28 11:20:31'),(4,2,'Victoria Fisher','delete_4_1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$DN9utbf6DNKR4M4wtqUmxO2qCYNxCX3B4hr9KXwZNHvfHuy3gutQ6',1,1,NULL,NULL,NULL,NULL,0,'2024-04-05 14:03:15','2025-08-28 16:34:24'),(5,2,'test','delete_5_1','+91','in','6945782211','india','rajasthan','english','15 days','$2y$10$AZDq5HRyaVTNfvo.nYFJq.gAUDPi6TPwNcKy6oep.7od5jEnqcaG2',1,1,NULL,NULL,'',NULL,1,'2025-08-30 06:32:41','2025-08-31 15:30:46'),(6,2,'test','delete_6_1','+91','in','6945782211','india','rajasthan','english','15 days',NULL,1,1,NULL,NULL,NULL,NULL,0,'2025-08-31 04:14:05','2025-08-31 15:30:31'),(7,2,'test','delete_7_1','+91','in','6945782211','india','rajasthan','english','15 days',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-08-31 04:16:10','2025-08-31 15:30:25'),(8,2,'Rahul Kumar Sharma','delete_8_1','+91','in','87445848888',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-08-31 06:13:15','2025-08-31 06:24:32'),(9,2,'tes','delete_9_1','+91','in','9854465155','India','mp','eng','daily',NULL,1,1,'SEP2025/1757869362-image.png',NULL,NULL,NULL,1,'2025-08-31 06:26:20','2025-10-01 17:33:47'),(10,2,'Cretamax Infotech','delete_10_1','+91','in','8109362429','india','madhya_pradesh','en','weekly',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-09-01 07:03:19','2025-09-06 18:38:58'),(11,2,'Venkat B','venkat2022two@gmail.com','+91','in','9129124917','india','telangana','en','daily',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-09-01 17:16:51','2025-09-01 17:16:51'),(12,2,'Creatamax infotech','cretamaxinfotech@gmail.com','+91','in','8109362429','india','madhya_pradesh','en','before_1_day',NULL,1,0,'DEC2025/1766149831-image.jpg',NULL,NULL,NULL,1,'2025-09-06 18:52:31','2025-12-19 13:10:31'),(13,2,'chandra sekhar','delete_13_1','+91','in','7893234488','india','telangana','en','daily',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-09-13 13:40:51','2025-09-29 16:18:55'),(14,2,'Gayathri Polavarapu','delete_14_1','+91','in','9502158899','india','telangana','en','daily',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-09-14 17:28:14','2025-09-29 16:18:47'),(15,2,'Our Temples Info','delete_15_1','+91','in','9129124917','india','telangana','en','daily',NULL,0,1,NULL,NULL,NULL,NULL,1,'2025-09-29 16:27:33','2025-12-19 18:43:40'),(16,2,'Rahul Kumar Sharma','delete_16_1','+91','in','8741840013','us','andhra_pradesh','en','before_2_days',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-10-01 17:35:13','2025-10-01 17:53:51'),(17,2,'Rahul Kumar sharma','rahulkumarsharmasharma6694@gmail.com','+91','in','8741840013','us','alaska','en','before_2_days',NULL,1,0,'DEC2025/1765384559-image.jpg',NULL,NULL,NULL,1,'2025-10-01 18:03:49','2025-12-10 16:35:59'),(18,2,'chandra sekhar','sekharpolavarapu@gmail.com','+91','in','7893234488','india','telangana','en','daily',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-10-02 07:10:06','2025-10-02 07:10:06'),(19,2,'Janardhan Rao','pjanardhanrao@gmail.com','+91','in','9866665917','india','andhra_pradesh','en','before_2_days',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-10-02 11:10:50','2025-10-02 11:10:50'),(20,2,'Venkat A','venkat2022one@gmail.com','+91','in','9129124917','india','andhra_pradesh','te','before_2_days',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-10-02 14:21:17','2025-10-02 14:21:17'),(21,2,'lakshmi sri','lsriaim1208@gmail.com','+91','in','9866347883','india','telangana','en','before_2_days',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-10-02 15:34:56','2025-10-02 15:34:56'),(22,2,'Mohit pareek','mohitpc212@gmail.com','+91','in','9828433832','india','sikkim','en','before_3_days',NULL,1,0,'DEC2025/1765616640-image.jpg',NULL,NULL,NULL,1,'2025-11-14 10:04:08','2025-12-13 09:04:00'),(23,2,'Rohtash Verma','rohtashverma2580@gmail.com','+91','in','6283721954','india','punjab','en','before_1_day',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-11-17 08:58:05','2025-11-17 08:58:05'),(24,2,'test','test123@mailinator.com','+91','in','6945782211','india','rajasthan','english','15 days',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-11-27 17:14:34','2025-11-27 17:14:34'),(25,2,'Archana','gangradearchana0211@gmail.com','+91','in','8109362429','india','madhya_pradesh','en','before_1_day',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-12-06 11:09:16','2025-12-06 11:09:16'),(27,2,'Mohit pareek','mohitpp212@gmail.com','+91','in','9828433832','india','sikkim','en','before_2_days',NULL,1,0,'DEC2025/1765574539-image.jpg',NULL,NULL,NULL,1,'2025-12-07 18:58:38','2025-12-12 21:22:19'),(28,2,'Dinesh Saini','sainidinesh92773@gmail.com','+91','in','9828433830','india','arunachal_pradesh','en','before_1_day',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-12-09 07:51:29','2025-12-09 07:51:29'),(29,2,'Shivam Gangrade','delete_29_1','+91','in','1472580963','india','madhya_pradesh','en','before_2_days',NULL,1,1,NULL,NULL,NULL,NULL,1,'2025-12-10 16:43:29','2025-12-19 18:41:55'),(30,2,'abhishek kumar','ak4076047@gmail.com','+91','in','366666555555','india','andhra_pradesh','en','before_1_day',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-12-19 18:18:52','2025-12-19 18:18:52'),(32,2,'lakshya sharma','sharmalakshya777@gmail.com','+91','in','9782488408','india','rajasthan','en','before_1_day',NULL,1,0,NULL,NULL,NULL,NULL,1,'2025-12-22 15:12:36','2025-12-22 15:12:36');
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

-- Dump completed on 2026-03-03  5:50:46

