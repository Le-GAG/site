# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.2.30-MariaDB-1:10.2.30+maria~bionic-log)
# Database: db
# Generation Time: 2020-03-18 23:24:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table _commandes_produits_variantes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_commandes_produits_variantes`;

CREATE TABLE `_commandes_produits_variantes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produits_variantes_id` int(11) DEFAULT NULL,
  `commandes_id` int(11) DEFAULT NULL,
  `quantite` int(11) unsigned DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL COMMENT 'Prix du produit au moment de la commande',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table _producteurs_activites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_producteurs_activites`;

CREATE TABLE `_producteurs_activites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `producteur_id` int(10) DEFAULT NULL,
  `activite_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table _produits_photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_produits_photos`;

CREATE TABLE `_produits_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) unsigned NOT NULL,
  `produit` int(10) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table _produits_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_produits_tags`;

CREATE TABLE `_produits_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produit_id` int(10) DEFAULT NULL,
  `tag_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table activites_des_producteurs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activites_des_producteurs`;

CREATE TABLE `activites_des_producteurs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories_de_produits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories_de_produits`;

CREATE TABLE `categories_de_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` varchar(20) DEFAULT 'draft',
  `nom` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL COMMENT 'Court texte utilisé dans l''URL (pas d''espaces ou caractères spéciaux autres que les tirets)',
  `seo_titre` varchar(200) DEFAULT NULL COMMENT 'Titre de la page pour les moteurs de recherche',
  `seo_description` varchar(2000) DEFAULT '' COMMENT 'Courte description pour les moteurs de recherche. 160 caractères max.',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'Mots-clés pour les moteurs de recherche. Séparés par des virgules.',
  `categorie_parente` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table commandes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commandes`;

CREATE TABLE `commandes` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `vente` int(10) unsigned DEFAULT NULL,
  `statut` varchar(255) DEFAULT '',
  `modified_by` int(10) unsigned DEFAULT NULL COMMENT 'L''utilisateur ayant modifié la commande pour la dernière fois',
  `created_by` int(10) unsigned DEFAULT NULL COMMENT 'L''utilisateur ayant créé la commande',
  `created_on` datetime DEFAULT NULL COMMENT 'La date et l''heure de création de la commande',
  `modified_on` datetime DEFAULT NULL COMMENT 'La date et l''heure de modification de la commande',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table conditionnements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conditionnements`;

CREATE TABLE `conditionnements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL COMMENT 'Ex : bouteille, sachet, pièce',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_activity`;

CREATE TABLE `directus_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `action_by` int(11) unsigned NOT NULL DEFAULT 0,
  `action_on` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_collection_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_collection_presets`;

CREATE TABLE `directus_collection_presets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `user` int(11) unsigned DEFAULT NULL,
  `role` int(11) unsigned DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `search_query` varchar(100) DEFAULT NULL,
  `filters` text DEFAULT NULL,
  `view_type` varchar(100) NOT NULL DEFAULT 'tabular',
  `view_query` text DEFAULT NULL,
  `view_options` text DEFAULT NULL,
  `translation` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_collection_title` (`user`,`collection`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_collections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_collections`;

CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `managed` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `single` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `icon` varchar(30) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `translation` text DEFAULT NULL,
  PRIMARY KEY (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_collections` WRITE;
/*!40000 ALTER TABLE `directus_collections` DISABLE KEYS */;

INSERT INTO `directus_collections` (`collection`, `managed`, `hidden`, `single`, `icon`, `note`, `translation`)
VALUES
	('activites_des_producteurs',1,0,0,NULL,NULL,NULL),
	('categories_de_produits',1,0,0,'category',NULL,NULL),
	('commandes',1,0,0,'shopping_basket',NULL,NULL),
	('conditionnements',1,0,0,'work',NULL,NULL),
	('producteurs',1,0,0,'nature_people',NULL,NULL),
	('produits',1,0,0,'restaurant',NULL,NULL),
	('produits_variantes',1,0,0,NULL,NULL,NULL),
	('tags_des_produits',1,0,0,'local_offer',NULL,NULL),
	('unites',1,0,0,'straighten',NULL,NULL),
	('ventes',1,0,0,'store',NULL,NULL),
	('ventes_produits_variantes',1,1,0,NULL,'Table de liaison',NULL),
	('_commandes_produits_variantes',1,0,0,NULL,'Table de liaison',NULL),
	('_producteurs_activites',1,1,0,NULL,'Table de liaison',NULL),
	('_produits_photos',1,1,0,'photo_library','Table de liaison',NULL),
	('_produits_tags',1,1,0,NULL,'Table de liaison',NULL);

/*!40000 ALTER TABLE `directus_collections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_fields`;

CREATE TABLE `directus_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `validation` varchar(500) DEFAULT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hidden_detail` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hidden_browse` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `sort` int(11) unsigned DEFAULT NULL,
  `width` varchar(30) DEFAULT NULL,
  `group` int(11) unsigned DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `translation` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_collection_field` (`collection`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_fields` WRITE;
/*!40000 ALTER TABLE `directus_fields` DISABLE KEYS */;

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `type`, `interface`, `options`, `locked`, `validation`, `required`, `readonly`, `hidden_detail`, `hidden_browse`, `sort`, `width`, `group`, `note`, `translation`)
VALUES
	(132,'producteurs','id','integer','primary-key',NULL,0,NULL,0,0,1,1,1,'full',NULL,NULL,NULL),
	(133,'producteurs','active','status','status','{\"simpleBadge\":true,\"status_mapping\":{\"published\":{\"name\":\"Published\",\"text_color\":\"white\",\"background_color\":\"accent\",\"browse_subdued\":false,\"browse_badge\":true,\"soft_delete\":false,\"published\":true},\"draft\":{\"name\":\"Draft\",\"text_color\":\"white\",\"background_color\":\"blue-grey-200\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":false,\"published\":false},\"deleted\":{\"name\":\"Deleted\",\"text_color\":\"white\",\"background_color\":\"red\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":true,\"published\":false}}}',0,NULL,0,0,0,0,2,'full',NULL,'',NULL),
	(134,'producteurs','raison_sociale','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"large\"}',0,NULL,1,0,0,0,3,'full',NULL,'Grésiv\'Ale, Viandes de Belledonne…',NULL),
	(135,'producteurs','adresse','json','map','{\"height\":400,\"mapLat\":\"45.4210664\",\"mapLng\":\"6.0098789\",\"defaultZoom\":\"10\",\"maxZoom\":17,\"theme\":\"https:\\/\\/{s}.basemaps.cartocdn.com\\/rastertiles\\/voyager\\/{z}\\/{x}\\/{y}.png\",\"address_to_code\":true}',0,NULL,0,0,0,0,14,'full',NULL,'',NULL),
	(136,'producteurs','siret','string','siret','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"small\",\"performValidation\":true,\"type\":\"SIRET\"}',0,'/^[0-9a-zA-Z]{14}$/',0,0,0,0,5,'full',NULL,'',NULL),
	(137,'producteurs','presentation','string','wysiwyg','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\",\"rows\":12,\"buttons\":[\"bold\",\"italic\",\"underline\",\"anchor\",\"h2\",\"h3\",\"quote\",\"unorderedlist\",\"orderedlist\",\"subscript\",\"superscript\",\"removeFormat\"]}',0,NULL,0,0,0,0,7,'full',NULL,'',NULL),
	(138,'producteurs','code_postal','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,12,'full',NULL,'',NULL),
	(139,'producteurs','site_internet','string','text-input','{\"iconLeft\":\"link\",\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,16,'full',NULL,'',NULL),
	(140,'producteurs','email','string','text-input','{\"iconLeft\":\"alternate_email\",\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,'',0,0,0,0,17,'full',NULL,'',NULL),
	(141,'producteurs','numero_de_telephone','string','text-input','{\"iconLeft\":\"phone\",\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,18,'full',NULL,'',NULL),
	(142,'producteurs','photo_de_presentation','file','file','{\"edit\":[\"\",\"\",\"image_editor\",\"\"]}',0,NULL,0,0,0,0,8,'full',NULL,'Photo de présentation du producteur (format 16:9 montrant de préférence l\'enseigne ou l\'exploitation)',NULL),
	(143,'producteurs','slug','slug','slug','{\"placeholder\":\"Ex : groupement-achats-gresivaudan\",\"forceLowercase\":true,\"mirroredField\":\"raison_sociale\"}',0,NULL,1,0,0,1,4,'full',NULL,'Court texte utilisé dans l\'URL (pas d\'espaces ou caractères spéciaux autres que les tirets)',NULL),
	(144,'producteurs','rue','string','text-input','[]',0,NULL,0,0,0,0,11,'full',NULL,'',NULL),
	(145,'producteurs','numero','string','text-input','[]',0,NULL,0,0,0,0,10,'full',NULL,'',NULL),
	(146,'producteurs','ville','string','text-input','[]',0,NULL,0,0,0,0,13,'full',NULL,'',NULL),
	(149,'produits','id','integer','primary-key','[]',0,NULL,1,1,1,0,1,'full',NULL,'',NULL),
	(150,'produits','active','status','status','{\"simpleBadge\":true,\"status_mapping\":{\"published\":{\"name\":\"Published\",\"text_color\":\"white\",\"background_color\":\"accent\",\"browse_subdued\":false,\"browse_badge\":true,\"soft_delete\":false,\"published\":true},\"draft\":{\"name\":\"Draft\",\"text_color\":\"white\",\"background_color\":\"blue-grey-200\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":false,\"published\":false},\"deleted\":{\"name\":\"Deleted\",\"text_color\":\"white\",\"background_color\":\"red\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":true,\"published\":false}}}',0,NULL,0,0,0,0,2,'full',NULL,'',NULL),
	(151,'produits','nom','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,1,0,0,0,3,'full',NULL,'',NULL),
	(152,'produits','description','string','wysiwyg','{\"buttons\":[\"bold\",\"italic\",\"underline\",\"anchor\",\"quote\",\"unorderedlist\",\"orderedlist\",\"removeFormat\",\"superscript\",\"subscript\"]}',0,NULL,0,0,0,0,6,'full',NULL,'',NULL),
	(153,'produits','producteur','m2o','many-to-one','{\"icon\":\"spa\",\"template\":\"{{raison_sociale}}\",\"placeholder\":\"Choisir un producteur\"}',0,NULL,1,0,0,0,5,'full',NULL,'',NULL),
	(154,'produits','slug','slug','slug','{\"placeholder\":\"Ex : pain-complet-bio\",\"forceLowercase\":true,\"mirroredField\":\"nom\"}',0,NULL,1,0,0,0,4,'full',NULL,'Court texte utilisé dans l\'URL (pas d\'espaces ou caractères spéciaux autres que les tirets)',NULL),
	(156,'categories_de_produits','id','integer','primary-key','[]',0,NULL,1,1,0,0,NULL,'full',NULL,'',NULL),
	(157,'categories_de_produits','active','status','status','{\"simpleBadge\":true,\"status_mapping\":{\"published\":{\"name\":\"Published\",\"text_color\":\"white\",\"background_color\":\"accent\",\"browse_subdued\":false,\"browse_badge\":true,\"soft_delete\":false,\"published\":true},\"draft\":{\"name\":\"Draft\",\"text_color\":\"white\",\"background_color\":\"blue-grey-200\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":false,\"published\":false},\"deleted\":{\"name\":\"Deleted\",\"text_color\":\"white\",\"background_color\":\"red\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":true,\"published\":false}}}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(158,'categories_de_produits','nom','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(159,'categories_de_produits','slug','slug','slug','{\"placeholder\":\"Ex : jus-de-fruit\",\"forceLowercase\":true,\"mirroredField\":\"nom\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'Court texte utilisé dans l\'URL (pas d\'espaces ou caractères spéciaux autres que les tirets)',NULL),
	(160,'categories_de_produits','seo_titre','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'Titre de la page pour les moteurs de recherche',NULL),
	(161,'categories_de_produits','seo_description','string','textarea','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\",\"rows\":4}',0,NULL,0,0,0,0,NULL,'full',NULL,'Courte description pour les moteurs de recherche. 160 caractères max.',NULL),
	(162,'categories_de_produits','seo_keywords','string','textarea','{\"rows\":4}',0,NULL,0,0,0,0,NULL,'full',NULL,'Mots-clés pour les moteurs de recherche. Séparés par des virgules.',NULL),
	(166,'categories_de_produits','categorie_parente','m2o','many-to-one','{\"template\":\"{{nom}}\",\"placeholder\":\"Choisir une cat\\u00e9gorie parente\"}',0,NULL,0,0,0,0,NULL,'full',NULL,NULL,NULL),
	(167,'produits','categorie','m2o','many-to-one','{\"icon\":\"category\",\"template\":\"{{nom}}\",\"placeholder\":\"Choisir une cat\\u00e9gorie\"}',0,NULL,1,0,0,0,8,'full',NULL,NULL,NULL),
	(168,'_producteurs_activites','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(169,'activites_des_producteurs','id','integer','primary-key','[]',0,NULL,1,0,1,0,NULL,'full',NULL,'',NULL),
	(170,'activites_des_producteurs','nom','string','text-input','{\"placeholder\":\"Ex : Mara\\u00eecher\",\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(172,'producteurs','activites','o2m','many-to-many','{\"fields\":\"id,nom\",\"template\":\"{{nom}}\",\"allow_select\":true}',0,NULL,0,0,0,0,6,'full',NULL,NULL,NULL),
	(173,'producteurs','sparateur_adresse','alias','divider','{\"style\":\"large\",\"title\":\"Adresse\",\"description\":\" \",\"hr\":true}',0,NULL,0,0,0,0,9,'full',NULL,NULL,NULL),
	(174,'producteurs','separateur_coordonnees','alias','divider','{\"style\":\"large\",\"title\":\"Coordonn\\u00e9es\",\"description\":\"\",\"hr\":true}',0,NULL,0,0,0,0,15,'full',NULL,NULL,NULL),
	(175,'tags_des_produits','id','integer','primary-key','[]',0,NULL,1,1,1,0,NULL,'full',NULL,'',NULL),
	(176,'tags_des_produits','nom','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(177,'unites','id','integer','primary-key','[]',0,NULL,1,1,0,0,NULL,'full',NULL,'',NULL),
	(178,'unites','nom','string','text-input','{\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'Litre, kilo, pièce…',NULL),
	(179,'unites','sans_quantite','boolean','toggle-icon','{\"textInactive\":\"Sans quantit\\u00e9\",\"iconInactive\":\"check_box_outline_blank\",\"colorInactive\":\"blue-grey\",\"textActive\":\"Avec quantit\\u00e9\",\"iconActive\":\"check_box\",\"colorActive\":\"teal\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(180,'produits','tags','o2m','many-to-many','{\"fields\":\"nom\",\"preferences\":\"\",\"template\":\"{{nom}}\"}',0,NULL,0,0,0,0,9,'full',NULL,NULL,NULL),
	(182,'_producteurs_activites','producteur_id','m2o','many-to-one','{\"template\":\"{{raison_sociale}}\",\"placeholder\":\"Choisir un producteur\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(183,'_producteurs_activites','activite_id','m2o','many-to-one','{\"template\":\"{{nom}}\",\"placeholder\":\"Choisir une activit\\u00e9\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(184,'conditionnements','nom','string','text-input','{\"iconLeft\":\"work\",\"trim\":true,\"showCharacterCount\":true,\"formatValue\":false,\"width\":\"auto\"}',0,NULL,0,0,0,0,2,'full',NULL,'Ex : bouteille, sachet, pièce',NULL),
	(185,'conditionnements','id','integer','primary-key','[]',0,NULL,1,0,0,0,1,'full',NULL,'',NULL),
	(186,'_produits_tags','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(187,'_produits_tags','produit_id','m2o','many-to-one','{\"template\":\"{{nom}}\",\"placeholder\":\"Choisir un produit\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(188,'_produits_tags','tag_id','m2o','many-to-one','{\"template\":\"{{nom}}\",\"placeholder\":\"Choisir un tag\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(196,'_produits_photos','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(197,'_produits_photos','sort','sort','sort','[]',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(198,'_produits_photos','produit','m2o','many-to-one','{\"icon\":\"restaurant\",\"template\":\"{{nom}}\",\"placeholder\":\"Choisir un produit\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(199,'_produits_photos','photo','string','file-preview','{\"edit\":[\"image_editor\"]}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(201,'ventes','id','integer','primary-key',NULL,0,NULL,0,0,1,1,0,'full',NULL,NULL,NULL),
	(202,'ventes','date_ouverture','datetime','datetime','{\"iconLeft\":\"access_time\",\"utc\":false,\"localized\":true,\"defaultToCurrentDatetime\":true,\"format\":\"dmy\",\"iconRight\":null}',0,NULL,0,0,0,0,NULL,'full',NULL,'Permet de différer l\'ouverture de la vente. Laisser vide pour une ouverture immédiate.',NULL),
	(203,'ventes','date_cloture','datetime','datetime','{\"localized\":true,\"iconLeft\":\"timer_off\",\"format\":\"dmy\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'La date et l\'heure limite pour la prise de commandes',NULL),
	(210,'commandes','id','integer','primary-key',NULL,0,NULL,0,0,1,1,1,'full',NULL,NULL,NULL),
	(220,'commandes','vente','m2o','many-to-one','{\"icon\":\"store\",\"template\":\"{{date_ouverture}} - {{date_cloture}}\",\"placeholder\":\"Choisir une vente\",\"preferences\":\"\",\"visible_fields\":\"id,date_ouverture,date_cloture\"}',0,NULL,1,0,0,0,2,'full',NULL,'',NULL),
	(221,'produits','photos','o2m','files','{\"viewType\":\"cards\",\"viewOptions\":{\"title\":\"title\",\"subtitle\":\"type\",\"content\":\"description\",\"src\":\"data\"},\"viewQuery\":[],\"filters\":[]}',0,NULL,0,0,0,0,10,'full',NULL,NULL,NULL),
	(230,'commandes','statut','status','status','{\"simpleBadge\":true,\"status_mapping\":{\"cart\":{\"name\":\"Panier\",\"text_color\":\"white\",\"background_color\":\"accent\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":false,\"published\":true,\"value\":\"cart\"},\"undefined\":{\"name\":\"Supprim\\u00e9e\",\"text_color\":\"white\",\"background_color\":\"blue-grey-400\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":true,\"published\":false}}}',0,NULL,1,0,0,0,3,'half',NULL,'',NULL),
	(246,'commandes','modified_by','user_updated','user-updated','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,6,'full',NULL,'L\'utilisateur ayant modifié la commande pour la dernière fois',NULL),
	(247,'commandes','created_by','owner','owner','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,5,'full',NULL,'L\'utilisateur ayant créé la commande',NULL),
	(248,'commandes','created_on','datetime_created','datetime-created','[]',0,NULL,0,0,0,0,7,'full',NULL,'La date et l\'heure de création de la commande',NULL),
	(249,'commandes','modified_on','datetime_updated','datetime-updated','[]',0,NULL,0,0,0,0,8,'full',NULL,'La date et l\'heure de modification de la commande',NULL),
	(253,'producteurs','produits','o2m','one-to-many','{\"fields\":\"id,raison_sociale,siret\",\"template\":\"{{ raison_sociale }} (#{{ siret }})\",\"preferences\":{\"viewType\":\"tabular\",\"viewQuery\":{\"fields\":[\"raison_sociale\",\"siret\"]}},\"delete_mode\":\"relation\",\"allow_select\":true}',0,NULL,0,0,0,0,NULL,'full',NULL,NULL,NULL),
	(273,'produits_variantes','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(274,'produits_variantes','produit','m2o','many-to-one','{\"placeholder\":\"Select one\",\"threshold\":20,\"template\":\"#{{ id }} - {{ nom }}\",\"icon\":\"restaurant_menu\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(275,'produits_variantes','prix','decimal','numeric','{\"localized\":true,\"iconLeft\":\"euro_symbol\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(276,'produits_variantes','conditionnement','m2o','many-to-one','{\"icon\":null,\"template\":\"#{{ id }} - {{ nom }}\",\"placeholder\":\"Select one\",\"threshold\":20,\"visible_fields\":\"id,nom\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(277,'produits_variantes','contenance','string','text-input','{\"trim\":true}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(278,'produits_variantes','prix_de_base','decimal','numeric','{\"localized\":true,\"iconLeft\":\"euro_symbol\"}',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(279,'produits_variantes','unite_de_mesure','m2o','many-to-one','{\"icon\":\"straighten\",\"template\":\"#{{ id }} - {{ nom }}\",\"placeholder\":\"Select one\",\"threshold\":20}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(280,'produits_variantes','date_created','datetime_created','datetime-created','{\"showRelative\":false}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(281,'produits_variantes','created_by','owner','owner','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(282,'produits_variantes','date_updated','datetime_updated','datetime-updated','[]',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(283,'produits_variantes','updated_by','user_updated','user-updated','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(284,'produits','created_by','owner','owner','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,12,'full',NULL,'',NULL),
	(285,'produits','date_updated','datetime_updated','datetime-updated','[]',0,NULL,0,0,0,0,13,'full',NULL,'',NULL),
	(286,'produits','update_by','user_updated','user-updated','{\"template\":\"{{first_name}} {{last_name}}\",\"display\":\"both\"}',0,NULL,0,0,0,0,14,'full',NULL,'',NULL),
	(287,'produits','date_created','datetime_created','datetime-created','[]',0,NULL,0,0,0,0,11,'full',NULL,'',NULL),
	(288,'produits','variantes','o2m','one-to-many','{\"fields\":\"prix,conditionnement.nom,contenance,prix_de_base,unite_de_mesure.nom\",\"template\":\"#{{ id }} {{ prix }}\\u20ac - {{ conditionnement.nom}} {{ contenance }}\"}',0,NULL,0,0,0,0,NULL,'full',NULL,NULL,NULL),
	(302,'_ventes_produits_variantes','id','integer','primary-key',NULL,0,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL),
	(303,'_ventes_produits_variantes','ventes_id','m2o','many-to-one','{\"template\":\"{{ date_ouverture }} - {{ date_fermeture }}\",\"visible_fields\":\"id,date_ouverture,date_fermeture\",\"placeholder\":\"Select one\",\"threshold\":20}',0,NULL,1,0,0,0,0,'full',NULL,'',NULL),
	(305,'_ventes_produits_variantes','produits_variantes_id','m2o','many-to-one','{\"template\":\"#{{ id }} - {{ produit.nom }} ({{ conditionnement.nom }} {{ contenance }}) - {{ prix }}\",\"visible_fields\":\"id,produit.nom,conditionnement.nom,contenance,prix\",\"placeholder\":\"Select one\",\"threshold\":20}',0,NULL,1,0,0,0,0,'full',NULL,'',NULL),
	(306,'ventes','produits','o2m','many-to-many','{\"template\":\"\",\"allow_create\":false,\"allow_select\":true,\"fields\":\"id,contenance,prix,produit\"}',0,NULL,0,0,0,0,NULL,'full',NULL,NULL,NULL),
	(311,'produits_variantes','ventes','o2m','many-to-many','{\"fields\":\"date_ouverture,date_cloture\",\"template\":\"{{ date_ouverture }} - {{ date_cloture }}\",\"allow_create\":true,\"allow_select\":true}',0,NULL,0,0,0,0,NULL,'full',NULL,NULL,NULL),
	(312,'ventes_produits_variantes','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(317,'ventes_produits_variantes','ventes_id','integer','numeric',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(318,'ventes_produits_variantes','produits_variantes_id','integer','numeric',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(329,'commandes','produits_variantes','o2m','many-to-many','{\"fields\":\"id,contenance\",\"allow_create\":true,\"allow_select\":true,\"template\":\"#{{ id }} - {{ contenance }}\"}',0,NULL,1,0,0,0,NULL,'full',NULL,NULL,NULL),
	(330,'_commandes_produits_variantes','id','integer','primary-key','[]',0,NULL,1,0,0,0,NULL,'full',NULL,'',NULL),
	(334,'_commandes_produits_variantes','produits_variantes_id','m2o','many-to-one','{\"placeholder\":\"Select one\",\"threshold\":20,\"template\":\"#{{ id }} - {{ produit.nom }} ({{ conditionnement.nom }} {{ contenance }})\"}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(335,'_commandes_produits_variantes','commandes_id','m2o','many-to-one','{\"template\":\"#{{ id }} - {{ vente.date_ouverture }}-{{ vente.date_cloture }}\",\"placeholder\":\"Select one\",\"threshold\":20}',0,NULL,0,0,0,0,NULL,'full',NULL,'',NULL),
	(338,'_commandes_produits_variantes','quantite','integer','numeric','{\"localized\":true}',0,NULL,1,0,0,0,NULL,'full',NULL,NULL,NULL),
	(339,'_commandes_produits_variantes','prix','decimal','numeric','{\"localized\":true}',0,NULL,0,0,0,0,NULL,'full',NULL,'Prix du produit au moment de la commande',NULL),
	(341,'directus_fields','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(342,'directus_fields','collection','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(343,'directus_fields','field','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(344,'directus_fields','type','string','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(345,'directus_fields','interface','string','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(346,'directus_fields','options','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(347,'directus_fields','locked','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(348,'directus_fields','translation','json','repeater','{\n                \"fields\": [\n                    {\n                        \"field\": \"locale\",\n                        \"type\": \"string\",\n                        \"interface\": \"language\",\n                        \"options\": {\n                            \"limit\": true\n                        },\n                        \"width\": \"half\"\n                    },\n                    {\n                        \"field\": \"translation\",\n                        \"type\": \"string\",\n                        \"interface\": \"text-input\",\n                        \"width\": \"half\"\n                    }\n                ]\n            }',1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(349,'directus_fields','readonly','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(350,'directus_fields','validation','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(351,'directus_fields','required','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(352,'directus_fields','sort','sort','sort',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(353,'directus_fields','note','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(354,'directus_fields','hidden_detail','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(355,'directus_fields','hidden_browse','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(356,'directus_fields','width','integer','numeric',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(357,'directus_fields','group','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(358,'directus_activity','id','integer','primary-key',NULL,1,NULL,1,1,1,0,NULL,NULL,NULL,NULL,NULL),
	(359,'directus_activity','action','string','text-input','{\"iconRight\":\"change_history\"}',1,NULL,0,1,0,0,1,'full',NULL,NULL,NULL),
	(360,'directus_activity','collection','string','collections','{\"iconRight\":\"list_alt\",\"include_system\":true}',1,NULL,0,1,0,0,2,'half',NULL,NULL,NULL),
	(361,'directus_activity','item','string','text-input','{\"iconRight\":\"link\"}',1,NULL,0,1,0,0,3,'half',NULL,NULL,NULL),
	(362,'directus_activity','action_by','integer','user','{\"iconRight\":\"account_circle\"}',1,NULL,0,1,0,0,4,'half',NULL,NULL,NULL),
	(363,'directus_activity','action_on','datetime','datetime','{\"showRelative\":true,\"iconRight\":\"calendar_today\"}',1,NULL,0,1,0,0,5,'half',NULL,NULL,NULL),
	(364,'directus_activity','edited_on','datetime','datetime','{\"showRelative\":true,\"iconRight\":\"edit\"}',1,NULL,0,1,0,0,6,'half',NULL,NULL,NULL),
	(365,'directus_activity','comment_deleted_on','datetime','datetime','{\"showRelative\":true,\"iconRight\":\"delete_outline\"}',1,NULL,0,1,0,0,7,'half',NULL,NULL,NULL),
	(366,'directus_activity','ip','string','text-input','{\"iconRight\":\"my_location\"}',1,NULL,0,1,0,0,8,'half',NULL,NULL,NULL),
	(367,'directus_activity','user_agent','string','text-input','{\"iconRight\":\"devices_other\"}',1,NULL,0,1,0,0,9,'half',NULL,NULL,NULL),
	(368,'directus_activity','comment','string','textarea',NULL,1,NULL,0,1,0,0,10,'full',NULL,NULL,NULL),
	(369,'directus_collection_presets','id','integer','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(370,'directus_collection_presets','title','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(371,'directus_collection_presets','user','integer','user',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(372,'directus_collection_presets','role','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(373,'directus_collection_presets','collection','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(374,'directus_collection_presets','search_query','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(375,'directus_collection_presets','filters','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(376,'directus_collection_presets','view_options','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(377,'directus_collection_presets','view_type','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(378,'directus_collection_presets','view_query','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(379,'directus_collections','fields','o2m','one-to-many',NULL,1,NULL,0,0,1,1,1,NULL,NULL,NULL,NULL),
	(380,'directus_collections','collection','string','primary-key',NULL,1,NULL,1,1,0,0,2,'half',NULL,NULL,NULL),
	(381,'directus_collections','note','string','text-input',NULL,1,NULL,0,0,0,0,3,'half',NULL,'An internal description.',NULL),
	(382,'directus_collections','managed','boolean','switch',NULL,1,NULL,0,0,1,0,4,'half',NULL,'[Learn More](https://docs.directus.io/guides/collections.html#managing-collections).',NULL),
	(383,'directus_collections','hidden','boolean','switch',NULL,1,NULL,0,0,0,0,5,'half',NULL,'[Learn More](https://docs.directus.io/guides/collections.html#hidden).',NULL),
	(384,'directus_collections','single','boolean','switch',NULL,1,NULL,0,0,0,0,6,'half',NULL,'[Learn More](https://docs.directus.io/guides/collections.html#single).',NULL),
	(385,'directus_collections','translation','json','repeater','{\n                \"fields\": [\n                    {\n                        \"field\": \"locale\",\n                        \"type\": \"string\",\n                        \"interface\": \"language\",\n                        \"options\": {\n                            \"limit\": true\n                        },\n                        \"width\": \"half\"\n                    },\n                    {\n                        \"field\": \"translation\",\n                        \"type\": \"string\",\n                        \"interface\": \"text-input\",\n                        \"width\": \"half\"\n                    }\n                ]\n            }',1,NULL,0,0,0,0,7,NULL,NULL,NULL,NULL),
	(386,'directus_collections','icon','string','icon',NULL,1,NULL,0,0,0,0,8,NULL,NULL,'The icon shown in the App\'s navigation sidebar.',NULL),
	(387,'directus_files','preview','alias','file-preview',NULL,1,NULL,0,0,0,0,1,'full',NULL,NULL,NULL),
	(388,'directus_files','title','string','text-input','{\"placeholder\":\"Enter a descriptive title...\",\"iconRight\":\"title\"}',1,NULL,0,0,0,0,2,'full',NULL,NULL,NULL),
	(389,'directus_files','tags','array','tags','{\"placeholder\":\"Enter a keyword then hit enter...\"}',1,NULL,0,0,0,0,3,'half',NULL,NULL,NULL),
	(390,'directus_files','location','string','text-input','{\"placeholder\":\"Enter a location...\",\"iconRight\":\"place\"}',1,NULL,0,0,0,0,4,'half',NULL,NULL,NULL),
	(391,'directus_files','description','string','wysiwyg','{\"toolbar\":[\"bold\",\"italic\",\"underline\",\"link\",\"code\"]}',1,NULL,0,0,0,0,5,'full',NULL,NULL,NULL),
	(392,'directus_files','filename_download','string','text-input','{\"monospace\":true,\"iconRight\":\"get_app\"}',1,NULL,0,0,0,0,6,'full',NULL,NULL,NULL),
	(393,'directus_files','filename_disk','string','text-input','{\"placeholder\":\"Enter a unique file name...\",\"iconRight\":\"insert_drive_file\"}',1,NULL,0,0,0,0,7,'full',NULL,NULL,NULL),
	(394,'directus_files','private_hash','slug','slug','{\"iconRight\":\"lock\"}',1,NULL,0,0,0,0,8,'half',NULL,NULL,NULL),
	(395,'directus_files','checksum','string','text-input','{\"iconRight\":\"check\",\"monospace\":true}',1,NULL,0,1,0,0,9,'half',NULL,NULL,NULL),
	(396,'directus_files','uploaded_on','datetime','datetime','{\"iconRight\":\"today\"}',1,NULL,1,1,0,0,10,'half',NULL,NULL,NULL),
	(397,'directus_files','uploaded_by','owner','owner',NULL,1,NULL,1,1,0,0,11,'half',NULL,NULL,NULL),
	(398,'directus_files','width','integer','numeric','{\"iconRight\":\"straighten\"}',1,NULL,0,1,0,0,12,'half',NULL,NULL,NULL),
	(399,'directus_files','height','integer','numeric','{\"iconRight\":\"straighten\"}',1,NULL,0,1,0,0,13,'half',NULL,NULL,NULL),
	(400,'directus_files','duration','integer','numeric','{\"iconRight\":\"timer\"}',1,NULL,0,1,0,0,14,'half',NULL,NULL,NULL),
	(401,'directus_files','filesize','integer','file-size','{\"iconRight\":\"storage\"}',1,NULL,0,1,0,0,15,'half',NULL,NULL,NULL),
	(402,'directus_files','metadata','json','key-value','{\"keyInterface\":\"text-input\",\"keyDataType\":\"string\",\"keyOptions\":{\"monospace\":true,\"placeholder\":\"Key\"},\"valueInterface\":\"text-input\",\"valueDataType\":\"string\",\"valueOptions\":{\"monospace\":true,\"placeholder\":\"Value\"}}',1,NULL,0,0,0,0,15,'full',NULL,NULL,NULL),
	(403,'directus_files','data','alias','file',NULL,1,NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(404,'directus_files','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(405,'directus_files','type','string','text-input',NULL,1,NULL,0,1,1,0,NULL,NULL,NULL,NULL,NULL),
	(406,'directus_files','charset','string','text-input',NULL,1,NULL,0,1,1,1,NULL,NULL,NULL,NULL,NULL),
	(407,'directus_files','embed','string','text-input',NULL,1,NULL,0,1,1,0,NULL,NULL,NULL,NULL,NULL),
	(408,'directus_files','folder','m2o','many-to-one',NULL,1,NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(409,'directus_files','storage','string','text-input',NULL,1,NULL,0,0,1,1,NULL,NULL,NULL,NULL,NULL),
	(410,'directus_folders','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(411,'directus_folders','name','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(412,'directus_folders','parent_folder','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(413,'directus_roles','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(414,'directus_roles','external_id','string','text-input',NULL,1,NULL,0,1,1,1,NULL,NULL,NULL,NULL,NULL),
	(415,'directus_roles','name','string','text-input',NULL,1,NULL,1,0,0,0,1,'half',NULL,NULL,NULL),
	(416,'directus_roles','description','string','text-input',NULL,1,NULL,0,0,0,0,2,'half',NULL,NULL,NULL),
	(417,'directus_roles','ip_whitelist','array','tags','{\"\":\"Add an IP address...\"}',1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(418,'directus_roles','enforce_2fa','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(419,'directus_roles','users','o2m','one-to-many','{\"fields\":\"first_name,last_name\"}',1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(420,'directus_roles','module_listing','json','repeater','{\"template\":\"{{ name }}\",\"createItemText\":\"Add Module\",\"fields\":[{\"field\":\"name\",\"interface\":\"text-input\",\"type\":\"string\",\"width\":\"half\"},{\"field\":\"link\",\"interface\":\"text-input\",\"type\":\"string\",\"width\":\"half\"},{\"field\":\"icon\",\"interface\":\"icon\",\"type\":\"string\",\"width\":\"full\"}]}',1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(421,'directus_roles','collection_listing','json','repeater','{\"template\":\"{{ group_name }}\",\"createItemText\":\"Add Group\",\"fields\":[{\"field\":\"group_name\",\"width\":\"full\",\"interface\":\"text-input\",\"type\":\"string\"},{\"field\":\"collections\",\"interface\":\"repeater\",\"type\":\"JSON\",\"options\":{\"createItemText\":\"Add Collection\",\"fields\":[{\"field\":\"collection\",\"type\":\"string\",\"interface\":\"collections\",\"width\":\"full\"}]}}]}',1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(422,'directus_permissions','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(423,'directus_permissions','collection','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(424,'directus_permissions','role','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(425,'directus_permissions','status','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(426,'directus_permissions','create','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(427,'directus_permissions','read','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(428,'directus_permissions','update','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(429,'directus_permissions','delete','string','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(430,'directus_permissions','comment','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(431,'directus_permissions','explain','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(432,'directus_permissions','status_blacklist','array','tags',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(433,'directus_permissions','read_field_blacklist','array','tags',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(434,'directus_permissions','write_field_blacklist','array','tags',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(435,'directus_relations','id','integer','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(436,'directus_relations','collection_many','string','collections',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(437,'directus_relations','field_many','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(438,'directus_relations','collection_one','string','collections',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(439,'directus_relations','field_one','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(440,'directus_relations','junction_field','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(441,'directus_revisions','id','integer','primary-key',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(442,'directus_revisions','activity','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(443,'directus_revisions','collection','m2o','many-to-one',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(444,'directus_revisions','item','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(445,'directus_revisions','data','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(446,'directus_revisions','delta','json','json',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(447,'directus_revisions','parent_item','string','text-input',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(448,'directus_revisions','parent_collection','string','collections',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(449,'directus_revisions','parent_changed','boolean','switch',NULL,1,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(450,'directus_settings','project_name','string','text-input','{\"iconRight\":\"title\"}',1,NULL,1,0,0,0,1,'half',NULL,'Logo in the top-left of the App (40x40)',NULL),
	(451,'directus_settings','project_url','string','text-input','{\"iconRight\":\"link\"}',1,NULL,0,0,0,0,2,'half',NULL,'External link for the App\'s top-left logo',NULL),
	(452,'directus_settings','project_logo','file','file',NULL,1,NULL,0,0,0,0,3,'half',NULL,'A 40x40 brand logo, ideally a white SVG/PNG',NULL),
	(453,'directus_settings','project_color','string','color',NULL,1,NULL,0,0,0,0,4,'half',NULL,'Color for login background and App\'s logo',NULL),
	(454,'directus_settings','project_foreground','file','file',NULL,1,NULL,0,0,0,0,5,'half',NULL,'Centered image (eg: logo) for the login page',NULL),
	(455,'directus_settings','project_background','file','file',NULL,1,NULL,0,0,0,0,6,'half',NULL,'Full-screen background for the login page',NULL),
	(456,'directus_settings','default_locale','string','language','{\"limit\":true}',1,NULL,0,0,0,0,8,'half',NULL,'Default locale for Directus Users',NULL),
	(457,'directus_settings','telemetry','boolean','switch',NULL,1,NULL,0,0,0,0,9,'half',NULL,'<a href=\"https://docs.directus.io/getting-started/concepts.html#telemetry\" target=\"_blank\">Learn More</a>',NULL),
	(458,'directus_settings','data_divider','alias','divider','{\"style\":\"large\",\"title\":\"Data\",\"hr\":true}',1,NULL,0,0,0,1,10,'full',NULL,NULL,NULL),
	(459,'directus_settings','default_limit','integer','numeric','{\"iconRight\":\"keyboard_tab\"}',1,NULL,1,0,0,0,11,'half',NULL,'Default item count in API and App responses',NULL),
	(460,'directus_settings','sort_null_last','boolean','switch',NULL,1,NULL,0,0,0,0,12,'half',NULL,'NULL values are sorted last',NULL),
	(461,'directus_settings','security_divider','alias','divider','{\"style\":\"large\",\"title\":\"Security\",\"hr\":true}',1,NULL,0,0,0,1,20,'full',NULL,NULL,NULL),
	(462,'directus_settings','auto_sign_out','integer','numeric','{\"iconRight\":\"timer\"}',1,NULL,1,0,0,0,22,'half',NULL,'Minutes before idle users are signed out',NULL),
	(463,'directus_settings','login_attempts_allowed','integer','numeric','{\"iconRight\":\"lock\"}',1,NULL,0,0,0,0,23,'half',NULL,'Failed login attempts before suspending users',NULL),
	(464,'directus_settings','password_policy','string','dropdown','{\"choices\":{\"\":\"None\",\"\\/^.{8,}$\\/\":\"Weak\",\"\\/(?=^.{8,}$)(?=.*\\\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{\';\'?>.<,])(?!.*\\\\s).*$\\/\":\"Strong\"}}',1,NULL,0,0,0,0,24,'half',NULL,'Weak: Minimum length 8; Strong: 1 small-case letter, 1 capital letter, 1 digit, 1 special character and the length should be minimum 8',NULL),
	(465,'directus_settings','files_divider','alias','divider','{\"style\":\"large\",\"title\":\"Files & Thumbnails\",\"hr\":true}',1,NULL,0,0,0,1,30,'full',NULL,NULL,NULL),
	(466,'directus_settings','file_naming','string','dropdown','{\"choices\":{\"uuid\":\"UUID (Obfuscated)\",\"file_name\":\"File Name (Readable)\"}}',1,NULL,0,0,0,0,31,'half',NULL,'File-system naming convention for uploads',NULL),
	(467,'directus_settings','file_mimetype_whitelist','array','tags','{\"placeholder\":\"Enter a file mimetype then hit enter (eg: image\\/jpeg)\"}',1,NULL,0,0,0,0,33,'half',NULL,NULL,NULL),
	(468,'directus_settings','asset_whitelist','json','repeater','{\"template\":\"{{key}}\",\"fields\":[{\"field\":\"key\",\"interface\":\"slug\",\"width\":\"half\",\"type\":\"string\",\"required\":true,\"options\":{\"onlyOnCreate\":false}},{\"field\":\"fit\",\"interface\":\"dropdown\",\"width\":\"half\",\"type\":\"string\",\"options\":{\"choices\":{\"crop\":\"Crop (forces exact size)\",\"contain\":\"Contain (preserve aspect ratio)\"}},\"required\":true},{\"field\":\"width\",\"interface\":\"numeric\",\"width\":\"half\",\"type\":\"integer\",\"required\":true},{\"field\":\"height\",\"interface\":\"numeric\",\"width\":\"half\",\"type\":\"integer\",\"required\":true},{\"field\":\"quality\",\"interface\":\"slider\",\"width\":\"full\",\"type\":\"integer\",\"default\":80,\"options\":{\"min\":0,\"max\":100,\"step\":1},\"required\":true}]}',0,NULL,0,0,0,0,34,'full',NULL,'Defines how the thumbnail will be generated based on the requested params.',NULL),
	(469,'directus_settings','asset_whitelist_system','json','json',NULL,0,NULL,0,1,1,1,35,'half',NULL,NULL,NULL),
	(470,'directus_settings','youtube_api_key','string','text-input','{\"iconRight\":\"videocam\"}',1,NULL,0,0,0,0,36,'full',NULL,'Allows fetching more YouTube Embed info',NULL),
	(471,'directus_users','id','integer','primary-key',NULL,1,NULL,1,0,1,0,1,NULL,NULL,NULL,NULL),
	(472,'directus_users','status','status','status','{\"status_mapping\":{\"draft\":{\"name\":\"Draft\",\"text_color\":\"white\",\"background_color\":\"light-gray\",\"listing_subdued\":false,\"listing_badge\":true,\"soft_delete\":false},\"invited\":{\"name\":\"Invited\",\"text_color\":\"white\",\"background_color\":\"light-gray\",\"listing_subdued\":false,\"listing_badge\":true,\"soft_delete\":false},\"active\":{\"name\":\"Active\",\"text_color\":\"white\",\"background_color\":\"success\",\"listing_subdued\":false,\"listing_badge\":false,\"soft_delete\":false},\"suspended\":{\"name\":\"Suspended\",\"text_color\":\"white\",\"background_color\":\"light-gray\",\"listing_subdued\":false,\"listing_badge\":true,\"soft_delete\":false},\"deleted\":{\"name\":\"Deleted\",\"text_color\":\"white\",\"background_color\":\"danger\",\"listing_subdued\":false,\"listing_badge\":true,\"soft_delete\":true}}}',1,NULL,1,0,0,0,2,NULL,NULL,NULL,NULL),
	(473,'directus_users','first_name','string','text-input','{\"iconRight\":\"account_circle\"}',1,NULL,1,0,0,0,3,'half',NULL,NULL,NULL),
	(474,'directus_users','last_name','string','text-input','{\"iconRight\":\"account_circle\"}',1,NULL,1,0,0,0,4,'half',NULL,NULL,NULL),
	(475,'directus_users','email','string','text-input','{\"iconRight\":\"alternate_email\"}',1,'$email',1,0,0,0,5,'half',NULL,NULL,NULL),
	(476,'directus_users','email_notifications','boolean','switch',NULL,1,NULL,0,0,0,0,6,'half',NULL,NULL,NULL),
	(477,'directus_users','password','hash','password',NULL,1,NULL,1,0,0,0,7,'half',NULL,NULL,NULL),
	(478,'directus_users','role','m2o','user-roles',NULL,1,NULL,1,0,0,0,8,'half',NULL,NULL,NULL),
	(479,'directus_users','company','string','text-input','{\"iconRight\":\"location_city\"}',0,NULL,0,0,0,0,9,'half',NULL,NULL,NULL),
	(480,'directus_users','title','string','text-input','{\"iconRight\":\"text_fields\"}',0,NULL,0,0,0,0,10,'half',NULL,NULL,NULL),
	(481,'directus_users','timezone','string','dropdown','{\"choices\":{\"Pacific\\/Midway\":\"(UTC-11:00) Midway Island\",\"Pacific\\/Samoa\":\"(UTC-11:00) Samoa\",\"Pacific\\/Honolulu\":\"(UTC-10:00) Hawaii\",\"US\\/Alaska\":\"(UTC-09:00) Alaska\",\"America\\/Los_Angeles\":\"(UTC-08:00) Pacific Time (US & Canada)\",\"America\\/Tijuana\":\"(UTC-08:00) Tijuana\",\"US\\/Arizona\":\"(UTC-07:00) Arizona\",\"America\\/Chihuahua\":\"(UTC-07:00) Chihuahua\",\"America\\/Mexico\\/La_Paz\":\"(UTC-07:00) La Paz\",\"America\\/Mazatlan\":\"(UTC-07:00) Mazatlan\",\"US\\/Mountain\":\"(UTC-07:00) Mountain Time (US & Canada)\",\"America\\/Managua\":\"(UTC-06:00) Central America\",\"US\\/Central\":\"(UTC-06:00) Central Time (US & Canada)\",\"America\\/Guadalajara\":\"(UTC-06:00) Guadalajara\",\"America\\/Mexico_City\":\"(UTC-06:00) Mexico City\",\"America\\/Monterrey\":\"(UTC-06:00) Monterrey\",\"Canada\\/Saskatchewan\":\"(UTC-06:00) Saskatchewan\",\"America\\/Bogota\":\"(UTC-05:00) Bogota\",\"US\\/Eastern\":\"(UTC-05:00) Eastern Time (US & Canada)\",\"US\\/East-Indiana\":\"(UTC-05:00) Indiana (East)\",\"America\\/Lima\":\"(UTC-05:00) Lima\",\"America\\/Quito\":\"(UTC-05:00) Quito\",\"Canada\\/Atlantic\":\"(UTC-04:00) Atlantic Time (Canada)\",\"America\\/New_York\":\"(UTC-04:00) New York\",\"America\\/Caracas\":\"(UTC-04:30) Caracas\",\"America\\/La_Paz\":\"(UTC-04:00) La Paz\",\"America\\/Santiago\":\"(UTC-04:00) Santiago\",\"America\\/Santo_Domingo\":\"(UTC-04:00) Santo Domingo\",\"Canada\\/Newfoundland\":\"(UTC-03:30) Newfoundland\",\"America\\/Sao_Paulo\":\"(UTC-03:00) Brasilia\",\"America\\/Argentina\\/Buenos_Aires\":\"(UTC-03:00) Buenos Aires\",\"America\\/Argentina\\/GeorgeTown\":\"(UTC-03:00) Georgetown\",\"America\\/Godthab\":\"(UTC-03:00) Greenland\",\"America\\/Noronha\":\"(UTC-02:00) Mid-Atlantic\",\"Atlantic\\/Azores\":\"(UTC-01:00) Azores\",\"Atlantic\\/Cape_Verde\":\"(UTC-01:00) Cape Verde Is.\",\"Africa\\/Casablanca\":\"(UTC+00:00) Casablanca\",\"Europe\\/Edinburgh\":\"(UTC+00:00) Edinburgh\",\"Etc\\/Greenwich\":\"(UTC+00:00) Greenwich Mean Time : Dublin\",\"Europe\\/Lisbon\":\"(UTC+00:00) Lisbon\",\"Europe\\/London\":\"(UTC+00:00) London\",\"Africa\\/Monrovia\":\"(UTC+00:00) Monrovia\",\"UTC\":\"(UTC+00:00) UTC\",\"Europe\\/Amsterdam\":\"(UTC+01:00) Amsterdam\",\"Europe\\/Belgrade\":\"(UTC+01:00) Belgrade\",\"Europe\\/Berlin\":\"(UTC+01:00) Berlin\",\"Europe\\/Bern\":\"(UTC+01:00) Bern\",\"Europe\\/Bratislava\":\"(UTC+01:00) Bratislava\",\"Europe\\/Brussels\":\"(UTC+01:00) Brussels\",\"Europe\\/Budapest\":\"(UTC+01:00) Budapest\",\"Europe\\/Copenhagen\":\"(UTC+01:00) Copenhagen\",\"Europe\\/Ljubljana\":\"(UTC+01:00) Ljubljana\",\"Europe\\/Madrid\":\"(UTC+01:00) Madrid\",\"Europe\\/Paris\":\"(UTC+01:00) Paris\",\"Europe\\/Prague\":\"(UTC+01:00) Prague\",\"Europe\\/Rome\":\"(UTC+01:00) Rome\",\"Europe\\/Sarajevo\":\"(UTC+01:00) Sarajevo\",\"Europe\\/Skopje\":\"(UTC+01:00) Skopje\",\"Europe\\/Stockholm\":\"(UTC+01:00) Stockholm\",\"Europe\\/Vienna\":\"(UTC+01:00) Vienna\",\"Europe\\/Warsaw\":\"(UTC+01:00) Warsaw\",\"Africa\\/Lagos\":\"(UTC+01:00) West Central Africa\",\"Europe\\/Zagreb\":\"(UTC+01:00) Zagreb\",\"Europe\\/Athens\":\"(UTC+02:00) Athens\",\"Europe\\/Bucharest\":\"(UTC+02:00) Bucharest\",\"Africa\\/Cairo\":\"(UTC+02:00) Cairo\",\"Africa\\/Harare\":\"(UTC+02:00) Harare\",\"Europe\\/Helsinki\":\"(UTC+02:00) Helsinki\",\"Europe\\/Istanbul\":\"(UTC+02:00) Istanbul\",\"Asia\\/Jerusalem\":\"(UTC+02:00) Jerusalem\",\"Europe\\/Kyiv\":\"(UTC+02:00) Kyiv\",\"Africa\\/Johannesburg\":\"(UTC+02:00) Pretoria\",\"Europe\\/Riga\":\"(UTC+02:00) Riga\",\"Europe\\/Sofia\":\"(UTC+02:00) Sofia\",\"Europe\\/Tallinn\":\"(UTC+02:00) Tallinn\",\"Europe\\/Vilnius\":\"(UTC+02:00) Vilnius\",\"Asia\\/Baghdad\":\"(UTC+03:00) Baghdad\",\"Asia\\/Kuwait\":\"(UTC+03:00) Kuwait\",\"Europe\\/Minsk\":\"(UTC+03:00) Minsk\",\"Africa\\/Nairobi\":\"(UTC+03:00) Nairobi\",\"Asia\\/Riyadh\":\"(UTC+03:00) Riyadh\",\"Europe\\/Volgograd\":\"(UTC+03:00) Volgograd\",\"Asia\\/Tehran\":\"(UTC+03:30) Tehran\",\"Asia\\/Abu_Dhabi\":\"(UTC+04:00) Abu Dhabi\",\"Asia\\/Baku\":\"(UTC+04:00) Baku\",\"Europe\\/Moscow\":\"(UTC+04:00) Moscow\",\"Asia\\/Muscat\":\"(UTC+04:00) Muscat\",\"Europe\\/St_Petersburg\":\"(UTC+04:00) St. Petersburg\",\"Asia\\/Tbilisi\":\"(UTC+04:00) Tbilisi\",\"Asia\\/Yerevan\":\"(UTC+04:00) Yerevan\",\"Asia\\/Kabul\":\"(UTC+04:30) Kabul\",\"Asia\\/Islamabad\":\"(UTC+05:00) Islamabad\",\"Asia\\/Karachi\":\"(UTC+05:00) Karachi\",\"Asia\\/Tashkent\":\"(UTC+05:00) Tashkent\",\"Asia\\/Calcutta\":\"(UTC+05:30) Chennai\",\"Asia\\/Kolkata\":\"(UTC+05:30) Kolkata\",\"Asia\\/Mumbai\":\"(UTC+05:30) Mumbai\",\"Asia\\/New_Delhi\":\"(UTC+05:30) New Delhi\",\"Asia\\/Sri_Jayawardenepura\":\"(UTC+05:30) Sri Jayawardenepura\",\"Asia\\/Katmandu\":\"(UTC+05:45) Kathmandu\",\"Asia\\/Almaty\":\"(UTC+06:00) Almaty\",\"Asia\\/Astana\":\"(UTC+06:00) Astana\",\"Asia\\/Dhaka\":\"(UTC+06:00) Dhaka\",\"Asia\\/Yekaterinburg\":\"(UTC+06:00) Ekaterinburg\",\"Asia\\/Rangoon\":\"(UTC+06:30) Rangoon\",\"Asia\\/Bangkok\":\"(UTC+07:00) Bangkok\",\"Asia\\/Hanoi\":\"(UTC+07:00) Hanoi\",\"Asia\\/Jakarta\":\"(UTC+07:00) Jakarta\",\"Asia\\/Novosibirsk\":\"(UTC+07:00) Novosibirsk\",\"Asia\\/Beijing\":\"(UTC+08:00) Beijing\",\"Asia\\/Chongqing\":\"(UTC+08:00) Chongqing\",\"Asia\\/Hong_Kong\":\"(UTC+08:00) Hong Kong\",\"Asia\\/Krasnoyarsk\":\"(UTC+08:00) Krasnoyarsk\",\"Asia\\/Kuala_Lumpur\":\"(UTC+08:00) Kuala Lumpur\",\"Australia\\/Perth\":\"(UTC+08:00) Perth\",\"Asia\\/Singapore\":\"(UTC+08:00) Singapore\",\"Asia\\/Taipei\":\"(UTC+08:00) Taipei\",\"Asia\\/Ulan_Bator\":\"(UTC+08:00) Ulaan Bataar\",\"Asia\\/Urumqi\":\"(UTC+08:00) Urumqi\",\"Asia\\/Irkutsk\":\"(UTC+09:00) Irkutsk\",\"Asia\\/Osaka\":\"(UTC+09:00) Osaka\",\"Asia\\/Sapporo\":\"(UTC+09:00) Sapporo\",\"Asia\\/Seoul\":\"(UTC+09:00) Seoul\",\"Asia\\/Tokyo\":\"(UTC+09:00) Tokyo\",\"Australia\\/Adelaide\":\"(UTC+09:30) Adelaide\",\"Australia\\/Darwin\":\"(UTC+09:30) Darwin\",\"Australia\\/Brisbane\":\"(UTC+10:00) Brisbane\",\"Australia\\/Canberra\":\"(UTC+10:00) Canberra\",\"Pacific\\/Guam\":\"(UTC+10:00) Guam\",\"Australia\\/Hobart\":\"(UTC+10:00) Hobart\",\"Australia\\/Melbourne\":\"(UTC+10:00) Melbourne\",\"Pacific\\/Port_Moresby\":\"(UTC+10:00) Port Moresby\",\"Australia\\/Sydney\":\"(UTC+10:00) Sydney\",\"Asia\\/Yakutsk\":\"(UTC+10:00) Yakutsk\",\"Asia\\/Vladivostok\":\"(UTC+11:00) Vladivostok\",\"Pacific\\/Auckland\":\"(UTC+12:00) Auckland\",\"Pacific\\/Fiji\":\"(UTC+12:00) Fiji\",\"Pacific\\/Kwajalein\":\"(UTC+12:00) International Date Line West\",\"Asia\\/Kamchatka\":\"(UTC+12:00) Kamchatka\",\"Asia\\/Magadan\":\"(UTC+12:00) Magadan\",\"Pacific\\/Marshall_Is\":\"(UTC+12:00) Marshall Is.\",\"Asia\\/New_Caledonia\":\"(UTC+12:00) New Caledonia\",\"Asia\\/Solomon_Is\":\"(UTC+12:00) Solomon Is.\",\"Pacific\\/Wellington\":\"(UTC+12:00) Wellington\",\"Pacific\\/Tongatapu\":\"(UTC+13:00) Nuku\'alofa\"},\"placeholder\":\"Choose a timezone...\"}',1,NULL,1,0,0,0,11,'half',NULL,NULL,NULL),
	(482,'directus_users','locale','string','language','{\"limit\":true}',1,NULL,0,0,0,0,12,'half',NULL,NULL,NULL),
	(483,'directus_users','avatar','file','file',NULL,1,NULL,0,0,0,0,13,NULL,NULL,NULL,NULL),
	(484,'directus_users','theme','string','radio-buttons','{\"format\":true,\"choices\":{\"auto\":\"Auto\",\"light\":\"Light\",\"dark\":\"Dark\"}}',1,NULL,0,0,0,0,14,NULL,NULL,NULL,NULL),
	(485,'directus_users','2fa_secret','string','2fa-secret',NULL,1,NULL,0,1,0,0,15,NULL,NULL,NULL,NULL),
	(486,'directus_users','locale_options','json','json',NULL,1,NULL,0,0,1,1,16,NULL,NULL,NULL,NULL),
	(487,'directus_users','token','string','text-input',NULL,1,NULL,0,0,1,1,17,NULL,NULL,NULL,NULL),
	(488,'directus_users','last_access_on','datetime','datetime',NULL,1,NULL,0,1,1,0,18,NULL,NULL,NULL,NULL),
	(489,'directus_users','last_page','string','text-input',NULL,1,NULL,0,1,1,1,19,NULL,NULL,NULL,NULL),
	(490,'directus_users','external_id','string','text-input',NULL,1,NULL,0,1,1,1,NULL,NULL,NULL,NULL,NULL),
	(491,'directus_user_sessions','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(492,'directus_user_sessions','user','user','user',NULL,0,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(493,'directus_user_sessions','token_type','string','text-input',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(494,'directus_user_sessions','token','string','text-input',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(495,'directus_user_sessions','ip_address','string','text-input',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(496,'directus_user_sessions','user_agent','string','text-input',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(497,'directus_user_sessions','created_on','datetime','datetime',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(498,'directus_user_sessions','token_expired_at','datetime','datetime',NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
	(499,'directus_webhooks','id','integer','primary-key',NULL,1,NULL,1,0,1,0,NULL,NULL,NULL,NULL,NULL),
	(500,'directus_webhooks','status','status','status','{\"status_mapping\":{\"active\":{\"name\":\"Active\",\"value\":\"active\",\"text_color\":\"white\",\"background_color\":\"green\",\"browse_subdued\":false,\"browse_badge\":true,\"soft_delete\":false,\"published\":true},\"inactive\":{\"name\":\"Inactive\",\"value\":\"inactive\",\"text_color\":\"white\",\"background_color\":\"blue-grey\",\"browse_subdued\":true,\"browse_badge\":true,\"soft_delete\":false,\"published\":false}}}',1,NULL,0,0,0,0,1,'full',NULL,NULL,NULL),
	(501,'directus_webhooks','http_action','string','dropdown','{\"choices\":{\"get\":\"GET\",\"post\":\"POST\"}}',1,NULL,1,0,0,0,2,'half-space',NULL,NULL,NULL),
	(502,'directus_webhooks','url','string','text-input','{\"placeholder\":\"https:\\/\\/example.com\",\"iconRight\":\"link\"}',1,NULL,1,0,0,0,3,'full',NULL,'',NULL),
	(503,'directus_webhooks','collection','string','collections',NULL,1,NULL,1,0,0,0,4,'half',NULL,'',NULL),
	(504,'directus_webhooks','directus_action','string','dropdown','{\"choices\":{\"item.create:after\":\"Create\",\"item.update:after\":\"Update\",\"item.delete:after\":\"Delete\"}}',1,NULL,1,0,0,0,5,'half',NULL,'',NULL),
	(505,'directus_webhooks','info','alias','divider','{\"style\":\"medium\",\"title\":\"How Webhooks Work\",\"hr\":true,\"margin\":false,\"description\":\"When the selected action occurs for the selected collection, Directus will send an HTTP request to the above URL.\"}',1,NULL,0,0,0,1,6,'full',NULL,NULL,NULL),
	(506,'directus_settings','project_public_note','string','markdown',NULL,1,NULL,0,0,0,0,7,'full',NULL,'This value will be shown on the public pages of the app',NULL),
	(507,'directus_users','password_reset_token','string','text-input',NULL,1,NULL,0,1,1,0,NULL,NULL,NULL,NULL,NULL),
	(508,'directus_settings','asset_url_naming','string','dropdown','{\"choices\":{\"private_hash\":\"Private Hash (Obfuscated)\",\"filename_download\":\"File Name (Readable)\"}}',1,NULL,0,0,0,0,32,'half',NULL,'Thumbnail URL convention',NULL);

/*!40000 ALTER TABLE `directus_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_files`;

CREATE TABLE `directus_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storage` varchar(50) NOT NULL DEFAULT 'local',
  `filename_disk` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uploaded_by` int(11) unsigned NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `charset` varchar(50) DEFAULT NULL,
  `filesize` int(11) unsigned NOT NULL DEFAULT 0,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `folder` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `private_hash` varchar(16) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_folders`;

CREATE TABLE `directus_folders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 NOT NULL,
  `parent_folder` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_parent_folder` (`name`,`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_migrations`;

CREATE TABLE `directus_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_migrations` WRITE;
/*!40000 ALTER TABLE `directus_migrations` DISABLE KEYS */;

INSERT INTO `directus_migrations` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`)
VALUES
	(20180220023138,'CreateActivityTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023144,'CreateActivitySeenTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023152,'CreateCollectionsPresetsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023157,'CreateCollectionsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023202,'CreateFieldsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023208,'CreateFilesTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023213,'CreateFoldersTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023217,'CreateRolesTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023226,'CreatePermissionsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023232,'CreateRelationsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023238,'CreateRevisionsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023243,'CreateSettingsTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180220023248,'CreateUsersTable','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20180426173310,'CreateUserRoles','2018-12-10 19:34:20','2018-12-10 19:34:20',0),
	(20181022175715,'Upgrade070003','2018-12-10 14:36:52','2018-12-10 14:36:52',0),
	(20181102153600,'TimezoneChoices','2018-12-10 14:36:52','2018-12-10 14:36:52',0),
	(20181105165224,'Upgrade070006','2018-12-10 14:36:52','2018-12-10 14:36:52',0),
	(20181122195602,'LocaleInterface','2018-12-10 14:36:52','2018-12-10 14:36:52',0),
	(20181123171520,'RemoveScope','2019-01-03 19:52:44','2019-01-03 19:52:44',0),
	(20181210204720,'AddTrustedProxiesSettingField','2019-01-03 19:52:44','2019-01-03 19:52:44',0),
	(20181222023800,'AddProjectUrlSettingField','2019-01-03 19:52:44','2019-01-03 19:52:44',0),
	(20181227042755,'IncreaseUsersLastPageLength','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190104155309,'AddUsersEmailValidation','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190111193724,'AddAppUrlSettingField','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190111212736,'AddMissingSettingsField','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190118181424,'AddRolesUsersField','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190130215921,'AddFilesChecksumField','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190318173400,'AddNavOverride','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190412122400,'SetPasswordTypeToHash','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190412123000,'UseFileInterface','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190412145800,'SetO2MOptionsRoles','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190415125300,'SetWidth','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190419154400,'SettingsFields','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190419161200,'CollectionNotes','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190419173000,'MiscRequiredFields','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190422131600,'UseJson','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190426156200,'SetNullableValueFieldSettingsTable','2019-05-21 08:39:49','2019-05-21 08:39:49',0),
	(20190520094300,'UseTimeline','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190614103321,'AddUsers2FASecretField','2019-08-26 08:27:12','2019-08-26 08:27:12',0),
	(20190618190024,'AddEnforce2FARoleField','2019-08-26 08:27:12','2019-08-26 08:27:12',0),
	(20190626114228,'AddFileNamingInSetting','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190702092323,'AddLoginAttemptsAllowedSetting','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190704063752,'UpdateIstanbulTimezone','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190708095522,'AddFileExtensionSetting','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190709053719,'AddFileMaxSizeSetting','2019-07-19 01:09:03','2019-07-19 01:09:03',0),
	(20190722110232,'PasswordValidationSettingField','2019-08-07 13:55:41','2019-08-07 13:55:41',0),
	(20190726064001,'UpdateNoteForDefaultLimit','2019-08-07 13:55:41','2019-08-07 13:55:41',0),
	(20190819070856,'UpdateDirectusFieldsField','2019-08-26 08:27:12','2019-08-26 08:27:12',0),
	(20191123053252,'UpdateDirectusFilesField','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191129123300,'UseNewWysiwyg','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164200,'AddUserSessions','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164201,'AddWebhooks','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164202,'RemoveActivitySeen','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164203,'ConvertUserRoles','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164204,'UpdateDirectusUsers','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164205,'UpdateDirectusSettings','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164206,'UpdateDirectusFiles','2020-03-16 00:58:50','2020-03-16 00:58:50',0),
	(20191202164207,'UpdateDirectusRoles','2020-03-16 00:58:50','2020-03-16 00:58:51',0),
	(20191202164208,'ResetDirectusRelations','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191202164209,'ResetDirectusFields','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191203105400,'AddHashFiledownloadIfEmpty','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191204151300,'UseCorrectWysiwyg','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191205150000,'UpdateDirectusThumbnailSizes','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191209130300,'AddProjectPublicNote','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191209141700,'SetOptionsCollectionListing','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191211140300,'AllowNullInSettings','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191211141600,'HideExternalId','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191213160000,'NewTranslationsStructure','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191216134009,'AddUserLastPasswordUpdate','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191216175050,'RemoveFileMaxSize','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191220102232,'UpdateUserCreatedToOwner','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20191223121542,'UpdateSlugType','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200108122313,'AddAssetURLNamingSetting','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200120170859,'UpdateTypeOfCollectionListing','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200121134200,'RenameToggle','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200121134353,'UpdateUserCreatedInterface','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200123161848,'UpdateValidationSizeForDirectusField','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200129100037,'UpdateLoginAttemptValue','2020-03-16 00:58:51','2020-03-16 00:58:51',0),
	(20200207095101,'UpdateSlugOptionForAssetWhiteList','2020-03-16 00:58:51','2020-03-16 00:58:51',0);

/*!40000 ALTER TABLE `directus_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_permissions`;

CREATE TABLE `directus_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `role` int(11) unsigned NOT NULL,
  `status` varchar(64) DEFAULT NULL,
  `create` varchar(16) DEFAULT 'none',
  `read` varchar(16) DEFAULT 'none',
  `update` varchar(16) DEFAULT 'none',
  `delete` varchar(16) DEFAULT 'none',
  `comment` varchar(8) DEFAULT 'none',
  `explain` varchar(8) DEFAULT 'none',
  `read_field_blacklist` varchar(1000) DEFAULT NULL,
  `write_field_blacklist` varchar(1000) DEFAULT NULL,
  `status_blacklist` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_permissions` WRITE;
/*!40000 ALTER TABLE `directus_permissions` DISABLE KEYS */;

INSERT INTO `directus_permissions` (`id`, `collection`, `role`, `status`, `create`, `read`, `update`, `delete`, `comment`, `explain`, `read_field_blacklist`, `write_field_blacklist`, `status_blacklist`)
VALUES
	(1,'directus_activity',3,NULL,'full','mine','none','none','update','none',NULL,NULL,NULL),
	(2,'directus_activity_seen',3,NULL,'full','mine','mine','mine','none','none',NULL,NULL,NULL),
	(3,'directus_collection_presets',3,NULL,'full','full','mine','mine','none','none',NULL,NULL,NULL),
	(4,'directus_collections',3,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(5,'directus_fields',3,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(6,'directus_files',3,NULL,'full','full','full','full','none','none',NULL,NULL,NULL),
	(7,'directus_folders',3,NULL,'full','full','full','full','none','none',NULL,NULL,NULL),
	(8,'directus_permissions',3,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(9,'directus_relations',3,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(10,'directus_revisions',3,NULL,'full','full','none','none','none','none',NULL,NULL,NULL),
	(11,'directus_roles',3,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(12,'directus_settings',3,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(13,'directus_user_roles',3,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(14,'directus_users',3,'active','none','full','mine','mine','none','none',NULL,NULL,NULL),
	(15,'directus_users',3,'deleted','none','none','none','none','none','none',NULL,NULL,NULL),
	(16,'directus_users',3,'draft','none','none','none','none','none','none',NULL,NULL,NULL),
	(17,'directus_users',3,'invited','none','none','none','none','none','none',NULL,NULL,NULL),
	(18,'directus_users',3,'suspended','none','none','none','none','none','none',NULL,NULL,NULL),
	(19,'directus_activity',4,NULL,'full','mine','none','none','update','none',NULL,NULL,NULL),
	(20,'directus_activity_seen',4,NULL,'full','mine','mine','mine','none','none',NULL,NULL,NULL),
	(21,'directus_collection_presets',4,NULL,'full','full','mine','mine','none','none',NULL,NULL,NULL),
	(22,'directus_collections',4,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(23,'directus_fields',4,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(24,'directus_files',4,NULL,'full','full','full','full','none','none',NULL,NULL,NULL),
	(25,'directus_folders',4,NULL,'full','full','full','full','none','none',NULL,NULL,NULL),
	(26,'directus_permissions',4,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(27,'directus_relations',4,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(28,'directus_revisions',4,NULL,'full','full','none','none','none','none',NULL,NULL,NULL),
	(29,'directus_roles',4,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(30,'directus_settings',4,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(31,'directus_user_roles',4,NULL,'none','mine','none','none','none','none',NULL,NULL,NULL),
	(32,'directus_users',4,'active','none','full','mine','mine','none','none',NULL,NULL,NULL),
	(33,'directus_users',4,'deleted','none','none','none','none','none','none',NULL,NULL,NULL),
	(34,'directus_users',4,'draft','none','none','none','none','none','none',NULL,NULL,NULL),
	(35,'directus_users',4,'invited','none','none','none','none','none','none',NULL,NULL,NULL),
	(36,'directus_users',4,'suspended','none','none','none','none','none','none',NULL,NULL,NULL),
	(37,'commandes',4,'cart','none','none','none','none','none','none','','',''),
	(38,'commandes',4,'validated','none','none','none','none','none','none','','',''),
	(39,'commandes',4,'paid','none','none','none','none','none','none','','',''),
	(40,'commandes',4,'picked-up','none','none','none','none','none','none','','',''),
	(41,'commandes',4,'deleted','none','none','none','none','none','none','','',''),
	(42,'unites',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(43,'tags_des_produits',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(44,'produits',2,'published','none','full','none','none','none','none',NULL,NULL,NULL),
	(45,'produits',2,'draft','none','full','none','none','none','none',NULL,NULL,NULL),
	(46,'produits',2,'deleted','none','full','none','none','none','none',NULL,NULL,NULL),
	(47,'producteurs',2,'published','none','full','none','none','none','none',NULL,NULL,NULL),
	(48,'producteurs',2,'draft','none','full','none','none','none','none',NULL,NULL,NULL),
	(49,'producteurs',2,'deleted','none','full','none','none','none','none',NULL,NULL,NULL),
	(51,'activites_des_producteurs',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(52,'categories_de_produits',2,'published','none','full','none','none','none','none',NULL,NULL,NULL),
	(53,'categories_de_produits',2,'draft','none','full','none','none','none','none',NULL,NULL,NULL),
	(54,'categories_de_produits',2,'deleted','none','full','none','none','none','none',NULL,NULL,NULL),
	(55,'commandes',2,'cart','none','none','none','none','none','none','','',''),
	(56,'commandes',2,'validated','none','none','none','none','none','none','','',''),
	(57,'commandes',2,'paid','none','none','none','none','none','none','','',''),
	(58,'commandes',2,'picked-up','none','none','none','none','none','none','','',''),
	(59,'commandes',2,'deleted','none','none','none','none','none','none','','',''),
	(60,'conditionnements',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(64,'ventes',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(66,'_producteurs_activites',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(67,'_produits_photos',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(68,'_produits_tags',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(70,'directus_files',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(74,'produits_variantes',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL),
	(78,'ventes_produits_variantes',2,NULL,'none','full','none','none','none','none',NULL,NULL,NULL);

/*!40000 ALTER TABLE `directus_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_relations`;

CREATE TABLE `directus_relations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_many` varchar(64) NOT NULL,
  `field_many` varchar(45) NOT NULL,
  `collection_one` varchar(64) DEFAULT NULL,
  `field_one` varchar(64) DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_relations` WRITE;
/*!40000 ALTER TABLE `directus_relations` DISABLE KEYS */;

INSERT INTO `directus_relations` (`id`, `collection_many`, `field_many`, `collection_one`, `field_one`, `junction_field`)
VALUES
	(15,'produits','producteur','producteurs','produits',NULL),
	(18,'categories_de_produits','id','categories_de_produits','categorie_parente',NULL),
	(19,'categories_de_produits','categorie_parente','categories_de_produits',NULL,NULL),
	(20,'produits','categorie','categories_de_produits',NULL,NULL),
	(21,'_producteurs_activites','producteur_id','producteurs','categorie','activite_id'),
	(22,'_producteurs_activites','activite_id','activites_des_producteurs',NULL,'producteur_id'),
	(23,'_producteurs_activites','producteur_id','producteurs','activites','activite_id'),
	(24,'_producteurs_activites','activite_id','activites_des_producteurs',NULL,'producteur_id'),
	(25,'_produits_tags','tag_id','tags_des_produits',NULL,'produit_id'),
	(26,'_produits_tags','produit_id','produits','tags','tag_id'),
	(27,'prix_des_produits','produit','produits',NULL,NULL),
	(28,'prix_des_produits','unite_de_mesure','unites',NULL,NULL),
	(29,'prix_des_produits','conditionnement','conditionnements',NULL,NULL),
	(30,'_produits_photos','produit','produits','photos',NULL),
	(38,'commandes','vente','ventes',NULL,NULL),
	(39,'_produits_photos','produit','produits','photos','photo'),
	(40,'_produits_photos','photo','directus_files',NULL,'produit'),
	(41,'prix_des_produits','produit','produits',NULL,NULL),
	(42,'prix_des_produits','prix','conditionnements',NULL,NULL),
	(47,'prix_des_produits','produit','produits',NULL,'conditionnement'),
	(48,'prix_des_produits','conditionnement','conditionnements',NULL,'produit'),
	(49,'prix_des_produits','produit','produits',NULL,'conditionnement'),
	(50,'produits_variantes','produit','produits','variantes','id'),
	(51,'produits_variantes','conditionnement','conditionnements',NULL,NULL),
	(52,'produits_variantes','unite_de_mesure','unites',NULL,NULL),
	(59,'ventes_produits_variantes','ventes_id','ventes','produits','produits_variantes_id'),
	(63,'ventes_produits_variantes','produits_variantes_id','produits_variantes','ventes','ventes_id'),
	(64,'ventes_produits_variantes','ventes_id','ventes',NULL,'produits_variantes_id'),
	(69,'_commandes_produits_variantes','id','produits_variantes',NULL,'id'),
	(70,'_commandes_produits_variantes','commandes_id','commandes','produits_variantes','produits_variantes_id'),
	(71,'_commandes_produits_variantes','produits_variantes_id','produits_variantes',NULL,'commandes_id'),
	(72,'_commandes_produits_variantes','commandes_id','commandes',NULL,NULL),
	(73,'directus_activity','action_by','directus_users',NULL,NULL),
	(74,'directus_collections_presets','user','directus_users',NULL,NULL),
	(75,'directus_collections_presets','group','directus_groups',NULL,NULL),
	(76,'directus_fields','collection','directus_collections','fields',NULL),
	(77,'directus_files','uploaded_by','directus_users',NULL,NULL),
	(78,'directus_files','folder','directus_folders',NULL,NULL),
	(79,'directus_folders','parent_folder','directus_folders',NULL,NULL),
	(80,'directus_permissions','group','directus_groups',NULL,NULL),
	(81,'directus_revisions','activity','directus_activity',NULL,NULL),
	(82,'directus_users','role','directus_roles','users',NULL),
	(83,'directus_users','avatar','directus_files',NULL,NULL);

/*!40000 ALTER TABLE `directus_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_revisions`;

CREATE TABLE `directus_revisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(11) unsigned NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `delta` longtext DEFAULT NULL,
  `parent_collection` varchar(64) DEFAULT NULL,
  `parent_item` varchar(255) DEFAULT NULL,
  `parent_changed` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_roles`;

CREATE TABLE `directus_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `ip_whitelist` text DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `enforce_2fa` tinyint(1) DEFAULT NULL,
  `module_listing` text DEFAULT NULL,
  `collection_listing` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_group_name` (`name`),
  UNIQUE KEY `idx_roles_external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_roles` WRITE;
/*!40000 ALTER TABLE `directus_roles` DISABLE KEYS */;

INSERT INTO `directus_roles` (`id`, `name`, `description`, `ip_whitelist`, `external_id`, `enforce_2fa`, `module_listing`, `collection_listing`)
VALUES
	(1,'Administrator','Admins have access to all managed data within the system by default',NULL,NULL,0,NULL,NULL),
	(2,'Public','This sets the data that is publicly available through the API without a token',NULL,NULL,NULL,NULL,NULL),
	(3,'Producteurs',NULL,NULL,'ae46b8ec-43dd-4e6f-95c9-48a81a65147d',NULL,NULL,NULL),
	(4,'Adhérents',NULL,NULL,'9413f115-9dea-40b7-abc7-3f6861ea36fc',NULL,NULL,NULL);

/*!40000 ALTER TABLE `directus_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_settings`;

CREATE TABLE `directus_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_scope_name` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `directus_settings` WRITE;
/*!40000 ALTER TABLE `directus_settings` DISABLE KEYS */;

INSERT INTO `directus_settings` (`id`, `key`, `value`)
VALUES
	(1,'auto_sign_out','1440'),
	(2,'project_name','Groupement d\'achats du Grésivaudan '),
	(3,'default_limit','200'),
	(4,'project_logo',NULL),
	(5,'color',NULL),
	(6,'youtube_api_key',''),
	(7,'trusted_proxies',''),
	(8,'project_url',''),
	(9,'app_url','https://gag.preprod.yohann-bianchi.ovh'),
	(10,'thumbnail_dimensions','1200x400,200x130,200x200,480x270'),
	(11,'thumbnail_quality_tags','{\"best\":100,\"good\":75,\"medium\":50,\"bad\":25,\"worst\":0}'),
	(12,'thumbnail_cache_ttl','86400'),
	(13,'file_naming','file_name'),
	(14,'thumbnail_not_found_location','not-found.png'),
	(15,'project_color','#13181a'),
	(16,'project_foreground',''),
	(17,'project_background',''),
	(18,'default_locale',NULL),
	(19,'telemetry','1'),
	(20,'password_policy',''),
	(21,'login_attempts_allowed','25'),
	(22,'file_mimetype_whitelist',''),
	(23,'asset_whitelist_system','[{\"key\":\"directus-small-crop\",\"width\":64,\"height\":64,\"fit\":\"crop\",\"quality\":80},{\"key\":\"directus-small-contain\",\"width\":64,\"height\":64,\"fit\":\"contain\",\"quality\":80},{\"key\":\"directus-medium-crop\",\"width\":300,\"height\":300,\"fit\":\"crop\",\"quality\":80},{\"key\":\"directus-medium-contain\",\"width\":300,\"height\":300,\"fit\":\"contain\",\"quality\":80},{\"key\":\"directus-large-crop\",\"width\":800,\"height\":600,\"fit\":\"crop\",\"quality\":80},{\"key\":\"directus-large-contain\",\"width\":800,\"height\":600,\"fit\":\"contain\",\"quality\":80}]'),
	(24,'asset_whitelist','[{\"key\":\"thumbnail\",\"width\":200,\"height\":200,\"fit\":\"contain\",\"quality\":80}]'),
	(25,'project_public_note',''),
	(26,'asset_url_naming','private_hash');

/*!40000 ALTER TABLE `directus_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directus_user_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_user_sessions`;

CREATE TABLE `directus_user_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `token` varchar(520) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `token_expired_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_users`;

CREATE TABLE `directus_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(16) NOT NULL DEFAULT 'draft',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `timezone` varchar(32) NOT NULL DEFAULT 'America/New_York',
  `locale` varchar(8) DEFAULT 'en-US',
  `locale_options` text DEFAULT NULL,
  `avatar` int(11) unsigned DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `email_notifications` int(1) NOT NULL DEFAULT 1,
  `last_access_on` datetime DEFAULT NULL,
  `last_page` varchar(192) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `2fa_secret` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `theme` varchar(100) DEFAULT 'auto',
  `password_reset_token` varchar(520) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_email` (`email`),
  UNIQUE KEY `idx_users_token` (`token`),
  UNIQUE KEY `idx_users_external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table directus_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directus_webhooks`;

CREATE TABLE `directus_webhooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(16) NOT NULL DEFAULT 'inactive',
  `http_action` varchar(255) DEFAULT NULL,
  `url` varchar(510) DEFAULT NULL,
  `collection` varchar(255) DEFAULT NULL,
  `directus_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table producteurs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `producteurs`;

CREATE TABLE `producteurs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` varchar(20) DEFAULT 'draft',
  `raison_sociale` varchar(200) DEFAULT NULL COMMENT 'Grésiv''Ale, Viandes de Belledonne…',
  `adresse` mediumtext DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `presentation` mediumtext DEFAULT NULL,
  `code_postal` char(5) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `site_internet` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `numero_de_telephone` varchar(200) DEFAULT NULL,
  `photo_de_presentation` int(10) DEFAULT NULL COMMENT 'Photo de présentation du producteur (format 16:9 montrant de préférence l''enseigne ou l''exploitation)',
  `slug` varchar(200) DEFAULT NULL COMMENT 'Court texte utilisé dans l''URL (pas d''espaces ou caractères spéciaux autres que les tirets)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table produits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produits`;

CREATE TABLE `produits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `active` varchar(20) NOT NULL DEFAULT 'draft',
  `nom` varchar(200) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `producteur` int(10) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL COMMENT 'Court texte utilisé dans l''URL (pas d''espaces ou caractères spéciaux autres que les tirets)',
  `categorie` int(10) unsigned DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `update_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table produits_variantes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produits_variantes`;

CREATE TABLE `produits_variantes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produit` int(10) unsigned NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `conditionnement` int(10) unsigned NOT NULL,
  `contenance` varchar(255) NOT NULL DEFAULT '',
  `prix_de_base` decimal(10,5) NOT NULL,
  `unite_de_mesure` int(10) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produit` (`produit`),
  KEY `conditionnement` (`conditionnement`),
  KEY `unite_de_mesure` (`unite_de_mesure`),
  CONSTRAINT `produits_variantes_ibfk_1` FOREIGN KEY (`produit`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_variantes_ibfk_2` FOREIGN KEY (`conditionnement`) REFERENCES `conditionnements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_variantes_ibfk_3` FOREIGN KEY (`unite_de_mesure`) REFERENCES `unites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags_des_produits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags_des_produits`;

CREATE TABLE `tags_des_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table unites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unites`;

CREATE TABLE `unites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL COMMENT 'Litre, kilo, pièce…',
  `sans_quantite` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ventes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ventes`;

CREATE TABLE `ventes` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `date_ouverture` datetime DEFAULT NULL COMMENT 'Permet de différer l''ouverture de la vente. Laisser vide pour une ouverture immédiate.',
  `date_cloture` datetime DEFAULT NULL COMMENT 'La date et l''heure limite pour la prise de commandes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ventes_produits_variantes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ventes_produits_variantes`;

CREATE TABLE `ventes_produits_variantes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produits_variantes_id` int(11) DEFAULT NULL,
  `ventes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
