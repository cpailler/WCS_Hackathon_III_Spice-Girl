-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: GrandAsthme
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `atout`
--

DROP TABLE IF EXISTS `atout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `facteur_inflation` double NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atout`
--

LOCK TABLES `atout` WRITE;
/*!40000 ALTER TABLE `atout` DISABLE KEYS */;
INSERT INTO `atout` VALUES (1,'Rapport d\'Expertise Truqué','Soudoyez un agent gouvernemental pour obtenir un rapport d\'expertise en votre faveur (Effet pour un tour: annule les Taxes du prochain tour.)',100,1.1,0),(2,'Bar à Oxygène','Développez le commerce de l\'O2, vendez de l\'air pur à la population (Effet Permanent: -1% de malus de production par Bar à O2)',400,1.3,0);
/*!40000 ALTER TABLE `atout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banque`
--

DROP TABLE IF EXISTS `banque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banque`
--

LOCK TABLES `banque` WRITE;
/*!40000 ALTER TABLE `banque` DISABLE KEYS */;
INSERT INTO `banque` VALUES (1,0);
/*!40000 ALTER TABLE `banque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_camel_case` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_insee` int(11) NOT NULL,
  `niveau_pollution` double NOT NULL,
  `usine` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C1765B631649A761` (`code_insee`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departement`
--

LOCK TABLES `departement` WRITE;
/*!40000 ALTER TABLE `departement` DISABLE KEYS */;
INSERT INTO `departement` VALUES (1,'Bas-Rhin','basRhin',67,2,0),(2,'Haut-Rhin','hautRhin',68,4,0),(3,'Moselle','moselle',57,2,0),(4,'Ardennes','ardennes',8,4,1),(5,'Aube','aube',10,4,0),(6,'Meurthe-et-Moselle','meurtheEtMoselle',54,4,0),(7,'Vosges','vosges',88,5,0),(8,'Marne','marne',51,2,0),(9,'Haute-Marne','hauteMarne',52,4,0),(10,'Meuse','meuse',55,1,1);
/*!40000 ALTER TABLE `departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developpement`
--

DROP TABLE IF EXISTS `developpement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developpement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `facteur_pollution` double NOT NULL,
  `facteur_inflation` double NOT NULL,
  `facteur_gain` double NOT NULL,
  `type_id` int(11) NOT NULL,
  `effectif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7ED48ABFC54C8C93` (`type_id`),
  CONSTRAINT `FK_7ED48ABFC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_developpement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developpement`
--

LOCK TABLES `developpement` WRITE;
/*!40000 ALTER TABLE `developpement` DISABLE KEYS */;
INSERT INTO `developpement` VALUES (1,'Indemnisation des Frais Kilomètriques du Personnel','Encouragez vos employés à utiliser leur véhicule personnel et économisez sur l\'assurance et l\'entretien d\'une flotte automobile. (Effet Permanent: x2 de gains par tour)',5,0.05,1.2,1.2,1,0),(2,'Export International Routier','Faites des économies sur le transport de vos marchandises à l\'international. (Effet Permanent: x3 de gains par tour) ',250,1.5,5,3,1,0),(3,'Yet\'s Jet Loss','Achetez un Jet pour les déplacements de votre Conseil d\'Administration (Effet Permanent: x1,5 de gains par tour)',2000,0.5,1.5,1.5,1,0),(4,'Incinération','Pourquoi trier ses déchêts? Autant tout brûler! (Effet Permanent: x1,2 de gains par tour)',50,3,1.1,1.3,2,0),(5,'Pourquoi Filter?','Rejetez vos polluants dans l\'air directement depuis les cheminées. (Effet Permanent: x2 de gains par tour)',8,3,1.1,2,2,0),(6,'Climatisation/Chauffage des Installations','Offrez à vos employés confort et bien-être (Effet Permanent: x1.3 de gains par tour)',60,2,1.4,1.3,2,0),(7,'Agriculture Intensive','Un maximum de production dans un minimum d\'espace (Effet Permanent: x3 de gains par tour)',500,4,1.3,2,3,0),(8,'Pesticides et Engrais','Protégez vos récoltes et maximisez le rendement (Effet Permanent: x3 de gains par tour)',170,3,1.5,3,3,0),(9,'Elevage Industriel','Jouez à Tetris avec les animaux (Effet Permanent: x2 de gains par tour)',700,3.5,2,4,3,0);
/*!40000 ALTER TABLE `developpement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_aleatoire`
--

DROP TABLE IF EXISTS `event_aleatoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_aleatoire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pollution_apparition` double NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_aleatoire`
--

LOCK TABLES `event_aleatoire` WRITE;
/*!40000 ALTER TABLE `event_aleatoire` DISABLE KEYS */;
INSERT INTO `event_aleatoire` VALUES (1,'Grèves Massives','Vos Employés sont en colère. La grève générale est instaurée. (Effet pour 1 Tour: pas de revenus au prochain tour)',40,0),(2,'Contrôle Inopiné','Les services sanitaires vous ont à l\'oeil et ont organisé un contrôle surprise. (Effet pour 1 Tour: le niveau de pollution général de vos usines est déduit de vos revenus pour 1 tour)',15,0),(3,'Désastre Climatique','Votre usine est dévastée par une tornade (Effet pour 2 Tours: pas de revenu)',60,0);
/*!40000 ALTER TABLE `event_aleatoire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facteur_gain_total`
--

DROP TABLE IF EXISTS `facteur_gain_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facteur_gain_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facteur` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facteur_gain_total`
--

LOCK TABLES `facteur_gain_total` WRITE;
/*!40000 ALTER TABLE `facteur_gain_total` DISABLE KEYS */;
INSERT INTO `facteur_gain_total` VALUES (1,1);
/*!40000 ALTER TABLE `facteur_gain_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facteur_inflation_global`
--

DROP TABLE IF EXISTS `facteur_inflation_global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facteur_inflation_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facteur` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facteur_inflation_global`
--

LOCK TABLES `facteur_inflation_global` WRITE;
/*!40000 ALTER TABLE `facteur_inflation_global` DISABLE KEYS */;
INSERT INTO `facteur_inflation_global` VALUES (1,1.6);
/*!40000 ALTER TABLE `facteur_inflation_global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facteur_pollution_global`
--

DROP TABLE IF EXISTS `facteur_pollution_global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facteur_pollution_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facteur` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facteur_pollution_global`
--

LOCK TABLES `facteur_pollution_global` WRITE;
/*!40000 ALTER TABLE `facteur_pollution_global` DISABLE KEYS */;
INSERT INTO `facteur_pollution_global` VALUES (1,1);
/*!40000 ALTER TABLE `facteur_pollution_global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobulle`
--

DROP TABLE IF EXISTS `infobulle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobulle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobulle`
--

LOCK TABLES `infobulle` WRITE;
/*!40000 ALTER TABLE `infobulle` DISABLE KEYS */;
INSERT INTO `infobulle` VALUES (1,'Le saviez vous ?','La pollution atmosphérique est la 4e cause de mortalité, après le tabac et l\'alcool, et est responsable chaque année de 48 000 décès prématurés en France.et les dommages sanitaires de cette pollution auraient un coût annuel de 20 à 30 milliards d’euros.','https://www.ecologique-solidaire.gouv.fr/journee-nationale-qualite-lair-deposez-vos-projets','ecologique-solidaire.gouv.fr'),(2,'Le saviez vous ?','Les polluants dans l’air extérieur proviennent pour une part des activités humaines : \nles transports et surtout le trafic routier ; \nles bâtiments (chauffage au bois, au fioul) ;\nl’agriculture par l’utilisation d’engrais azotés, de pesticides et les émissions gazeuses d’origine animale ; \nle stockage, l’incinération et le brûlage à l’air libre des déchets ; \nles industries et la production d’énergie.','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(3,'Le saviez vous ?','La pollution se concentre majoritairement dans les villes, où vivent près de 70% des Français. Les polluants dans l’air extérieur peuvent affecter des zones éloignées de plusieurs centaines de kilomètres des lieux d’émissions.','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(4,'Le saviez vous ?','Concentration urbaine, période de chauffage, trafic routier dense, stabilité des couches d’air, ensoleillement: la conjugaison de ces conditions favorise l’apparition de pics de pollution.','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(5,'Le saviez vous ?','L’asthme est une maladie respiratoire de plus en plus fréquente : le nombre de cas a doublé en 10 ans et elle touche environ 10% des enfants','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(6,'Le saviez vous ?','En ville, l’exposition à un cocktail de polluants (notamment particules fines, dioxyde d’azote…) engendre des atteintes des voies respiratoires, une aggravation de l’asthme, mais aussi la dégradation des bâtiments et la mise en danger du patrimoine bâti.','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(7,'Le saviez vous ?','La ville de Strasbourg mène une politique d’amélioration de la qualité de l’air profitable : entre 2008 et 2012, le nombre d’habitants exposés aux particules fines est passé de 60 000 à 15 000, au dioxyde d’azote de 100000 à 60000 personnes. Pour y parvenir, l’accent a été mis sur les modes de déplacement alternatifs à la voiture. La ville est en particulier devenue la première agglomération cyclable de France (pistes et bandes cyclables, projet d’« autoroutes à vélo», arceaux de stationnement, stations de vélos en libre-service…).','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(8,'Le saviez vous ?','En 2012, le Centre international de recherche sur le cancer (CIRC) a classé les gaz d\'échappement des moteurs diesel comme cancérogènes pour l’Homme (groupe 1) et en 2013, il a classé la pollution atmosphérique et les particules de l’air ambiant également cancérogènes pour l’Homme (groupe 1).','https://www.anses.fr/fr/content/qualité-de-l’air-extérieur','ANSES'),(9,'Le saviez vous ?','Selon l’organisation mondiale de la santé (OMS), les habitants des villes où l’air est fortement pollué souffrent davantage de cardiopathies, de problèmes respiratoires et de cancer du poumon que ceux des villes où l’air est plus propre.','http://www.atmo-grandest.eu/ils-sont-dans-lair\n','Atmo Grand Est'),(10,'Info Pratique : ','Que faire en cas de pic de pollution ? \n-limitez les activités physiques et sportives intenses (dont les compétitions), autant en plein air qu’à l’intérieur ; \n-limitez les déplacements sur les grands axes routiers et à leurs abords, aux périodes de pointe (aux horaires éventuellement précisés au niveau local) ; \n-en cas de symptômes ou d’inquiétude, prenez conseil auprès de votre pharmacien ou consultez votre médecin ou contactez la permanence sanitaire locale lorsqu’elle est mise en place ; \n-en cas d’épisode de pollution à l’ozone : limitez les sorties durant l’après-midi et limitez les activités physiques et sportives intenses (dont les compétitions) en plein air ; celles à l’intérieur peuvent être maintenues.','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(11,'Info Pratique : ','La loi sur l’air et l’utilisation rationnelle de l’énergie (LAURE) de 1996 affirme le droit de chacun à respirer un air qui ne nuise pas à la santé.\n','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(12,'Le saviez vous ?','Au cours d’une journée, un adulte inhale 15 000 litres d’air en moyenne. Cet air est composé à près de 99 % d’oxygène et d’azote, mais il contient également des polluants qui peuvent avoir une incidence sur les écosystèmes, le bâti, le climat et notre santé.','http://www.atmo-grandest.eu/','Atmo Grand Est'),(13,'Scandale :','Le moteur Diesel à longtemps été soutenu et favorisé par l\'Etat Français malgré son impact environnementale.','https://www.publicsenat.fr/lcp/politique/pollution-l-air-un-scandale-meme-type-l-amiante-alertent-ecologistes-1206142','Public Senat'),(14,'Info Pratique : ','La pollution de l’air fragilise les écosystèmes\nPar les pluies acides : Les dépôts humides (pluies, neige, brouillard…) s’acidifient sous l’effet des oxydes d’azote et du dioxyde de soufre.En France, ce phénomène a été constaté surtout dans les Vosges à partir des années 90\nPar les dépôts azotés : On estime que l’excès de ces dépôts en France pourrait entraîner une perte de biodiversité de 10% à l’horizon 2 100. ','https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf','Ademe'),(15,'Le saviez-vous?','Le 19 septembre 2018 a lieu la 4e journée nationale de la qualité de l\'air','http://evenements.developpement-durable.gouv.fr/campagne/jnqa2018\n','Developpement-Durable.gouv.fr'),(16,'Scandale :','Des entreprises sont régulièrement prises à défaut pour leur rejets toxiques dans l\'atmosphère','https://francais.rt.com/france/52294-nouveau-scandale-depakine-sanofi-rejette-polluants-air-quantites-industrielles','Francais.rt'),(17,'Le saviez-vous','Les coûts annuels en dépense de santé et coûts associés (absentéisme, perte en qualité et espérance de vie) liés à la pollution atteindraient 30,5 milliards d’euros chaque année pour l’Europe.','http://www.encyclopedie-environnement.org/air/pollution-air-exterieur-informer-prevenir/','Encyclopédie-Environnement.gouv'),(18,'Le saviez-vous?','Quatorze personnes ont déposé un recours pour «carence fautive de l\'État» devant le tribunal administratif de Grenoble. D\'après l\'organisme Santé Publique France, la pollution serait à l\'origine de 85 décès prématurés chaque année dans la région.','http://www.lefigaro.fr/actualite-france/2018/04/30/01016-20180430ARTFIG00181-pollution-de-l-air-des-habitants-de-haute-savoie-veulent-attaquer-l-etat.php','Le Figaro'),(19,'Scandale','Le 18 septembre 2015, l\'agence environnementale américaine (EPA) accuse le constructeur Volkswagen d\'avoir enfreint des réglementations anti-pollution à l\'aide d\'un logiciel truqueur installé sur des centaines de milliers de véhicules diesel fabriqués à partir de 2009. Très vite, le \"dieselgate\" prend de l\'ampleur: Volkswagen reconnaît avoir équipé de ce logiciel 11 millions de véhicules dans le monde, dont 8,5 millions en Europe.\nLe logiciel incriminé enclenchait un mécanisme interne de limitation des gaz polluants pendant les contrôles anti-pollution.\n\nEn 2015, le groupe essuie une perte historique de 1,6 milliard d\'euros en raison de l\'argent mis de côté pour affronter les poursuites judiciaires dans le monde. \n\nLa marque a annoncé en novembre la suppression de 30.000 postes.','http://www.lepoint.fr/automobile/actualites/volkswagen-et-les-repercussions-du-scandale-des-moteurs-truques-30-07-2017-2146823_683.php','Le Point'),(20,'Le saviez-vous?','Il existe deux catégories de polluants atmosphériques :\nles polluants primaires, émis directement : monoxyde d’azote, dioxyde de soufre, monoxyde de carbone, particules (ou poussières), métaux lourds, composés organiques volatils, hydrocarbures aromatiques polycycliques...\nles polluants secondaires issus de transformations physico-chimiques entre polluants de l’air sous l’effet de conditions météorologiques particulières : ozone, dioxyde d’azote, particules)…','https://www.gouvernement.fr/risques/pollution-de-l-air','Gouvernement.fr'),(21,'Le saviez-vous?','La France va mesurer les pesticides dans l’air sur tout le territoire à partir de 2018','https://www.lemonde.fr/pollution/article/2017/11/28/pollution-la-france-va-mesurer-les-pesticides-dans-l-air-sur-tout-le-territoire-a-partir-de-2018_5221406_1652666.html','Le Monde'),(22,'Le saviez-vous?','QU’EST-CE QU’UN ÉPISODE DE POLLUTION ?\nOn définit un épisode de pollution par une quantité trop élevée d’un ou de plusieurs polluants dans l’air.','https://www.gouvernement.fr/risques/pollution-de-l-air','Gouvernement.fr'),(23,'Scandale :','Pollution : le « dieselgate » responsable de 5 000 morts par an en Europe','https://www.lemonde.fr/pollution/article/2017/09/18/pollution-le-dieselgate-responsable-de-5-000-morts-par-an-en-europe_5187124_1652666.html','Le Monde'),(24,'Scandale : ','Une Parisienne de 57 ans intente une action en justice contre l\'État, en févier 2017, pour ne pas avoir fait respecter les normes de qualité de l\'air.','https://www.francetvinfo.fr/meteo/particules-fines/info-franceinfo-victime-de-la-pollution-de-l-air-a-paris-elle-porte-plainte-contre-l-etat_2225067.html','FranceTVinfo.fr'),(25,'Le saviez-vous?','Rappel de l’interdiction du brûlage à l\'air libre des déchets verts des particuliers (Règlement sanitaire départemental, art. 84). Apportez-les en déchetterie. Pour vos travaux, privilégiez l\'emploi d\'outils manuels ou électriques plutôt qu\'avec des moteurs thermiques. Évitez de faire du feu dans des foyers ouverts et des poêles anciens sauf s\'il s\'agit de votre mode de chauffage principal.','http://www.atmo-grandest.eu/\n','Atmo Grand Est');
/*!40000 ALTER TABLE `infobulle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau_pollution_global`
--

DROP TABLE IF EXISTS `niveau_pollution_global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau_pollution_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau_global` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_pollution_global`
--

LOCK TABLES `niveau_pollution_global` WRITE;
/*!40000 ALTER TABLE `niveau_pollution_global` DISABLE KEYS */;
INSERT INTO `niveau_pollution_global` VALUES (1,3.2);
/*!40000 ALTER TABLE `niveau_pollution_global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnage`
--

DROP TABLE IF EXISTS `personnage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnage`
--

LOCK TABLES `personnage` WRITE;
/*!40000 ALTER TABLE `personnage` DISABLE KEYS */;
INSERT INTO `personnage` VALUES (1,'Germain','homme_ga.png',0),(2,'Germaine','femme_ga.png',1);
/*!40000 ALTER TABLE `personnage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_developpement`
--

DROP TABLE IF EXISTS `type_developpement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_developpement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_developpement`
--

LOCK TABLES `type_developpement` WRITE;
/*!40000 ALTER TABLE `type_developpement` DISABLE KEYS */;
INSERT INTO `type_developpement` VALUES (1,'Transport'),(2,'Industrie'),(3,'Agriculture');
/*!40000 ALTER TABLE `type_developpement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13  2:32:39
