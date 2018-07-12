-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 12 juil. 2018 à 15:16
-- Version du serveur :  5.6.38
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `grandasthme`
--

-- --------------------------------------------------------

-- Structure de la table `atout`
--

CREATE TABLE `atout` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `facteur_inflation` double NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `atout`
--

INSERT INTO `atout` (`id`, `nom`, `description`, `prix`, `facteur_inflation`, `quantite`) VALUES
(1, 'Rapport d\'Expertise Truqué', 'Soudoyez un agent gouvernemental pour obtenir un rapport d\'expertise en votre faveur (Effet pour un tour: annule les Taxes du prochain tour.)', 100, 0.1, 0),
(2, 'Bar à Oxygène', 'Développez le commerce de l\'O2, vendez de l\'air pur à la population (Effet Permanent: -1% de malus de production par Bar à O2)', 400, 0.3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `banque`
--

CREATE TABLE `banque` (
  `id` int(11) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `banque`
--

INSERT INTO `banque` (`id`, `money`) VALUES
(1, 500);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_camel_case` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_insee` int(11) NOT NULL,
  `niveau_pollution` double NOT NULL,
  `usine` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `nom`, `nom_camel_case`, `code_insee`, `niveau_pollution`, `usine`) VALUES
(1, 'Bas-Rhin', 'basRhin', 67, 0, 0),
(2, 'Haut-Rhin', 'hautRhin', 68, 0, 0),
(3, 'Moselle', 'moselle', 57, 0, 0),
(4, 'Ardennes', 'ardennes', 8, 0, 0),
(5, 'Aube', 'aube', 10, 0, 0),
(6, 'Meurthe-et-Moselle', 'meurtheEtMoselle', 54, 0, 0),
(7, 'Vosges', 'vosges', 88, 0, 0),
(8, 'Marne', 'marne', 51, 0, 0),
(9, 'Haute-Marne', 'hauteMarne', 52, 0, 0),
(10, 'Meuse', 'meuse', 55, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `developpement`
--

CREATE TABLE `developpement` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `facteur_pollution` double NOT NULL,
  `facteur_inflation` double NOT NULL,
  `facteur_gain` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `developpement`
--

INSERT INTO `developpement` (`id`, `type_id`, `nom`, `description`, `prix`, `facteur_pollution`, `facteur_inflation`, `facteur_gain`) VALUES
(1, 1, 'Indemnisation des Frais Kilomètriques du Personnel', 'Encouragez vos employés à utiliser leur véhicule personnel et économisez sur l\'assurance et l\'entretien d\'une flotte automobile. (Effet Permanent: x2 de gains par tour)', 5, 0.05, 1.2, 1.2),
(2, 1, 'Export International Routier', 'Faites des économies sur le transport de vos marchandises à l\'international. (Effet Permanent: x3 de gains par tour) ', 250, 1.5, 5, 3),
(3, 1, 'Yet\'s Jet Loss', 'Achetez un Jet pour les déplacements de votre Conseil d\'Administration (Effet Permanent: x1,5 de gains par tour)', 2000, 0.5, 1.5, 1.5),
(4, 2, 'Incinération', 'Pourquoi trier ses déchêts? Autant tout brûler! (Effet Permanent: x1,2 de gains par tour)', 50, 3, 1.1, 1.3),
(5, 2, 'Pourquoi Filter?', 'Rejetez vos polluants dans l\'air directement depuis les cheminées. (Effet Permanent: x2 de gains par tour)', 8, 3, 1.001, 2),
(6, 2, 'Climatisation/Chauffage des Installations', 'Offrez à vos employés confort et bien-être (Effet Permanent: x1.3 de gains par tour)', 60, 2, 1.4, 1.3),
(7, 3, 'Agriculture Intensive', 'Un maximum de production dans un minimum d\'espace (Effet Permanent: x3 de gains par tour)', 500, 4, 1.3, 2),
(8, 3, 'Pesticides et Engrais', 'Protégez vos récoltes et maximisez le rendement (Effet Permanent: x3 de gains par tour)', 170, 3, 1.5, 3),
(9, 3, 'Elevage Industriel', 'Jouez à Tetris avec les animaux (Effet Permanent: x2 de gains par tour)', 700, 3.5, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `event_aleatoire`
--

CREATE TABLE `event_aleatoire` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pollution_apparition` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `event_aleatoire`
--

INSERT INTO `event_aleatoire` (`id`, `nom`, `description`, `pollution_apparition`) VALUES
(1, 'Grèves Massives', 'Vos Employés sont en colère. La grève générale est instaurée. (Effet pour 1 Tour: pas de revenus au prochain tour)', 40),
(2, 'Contrôle Inopiné', 'Les services sanitaires vous ont à l\'oeil et ont organisé un contrôle surprise. (Effet pour 1 Tour: le niveau de pollution général de vos usines est déduit de vos revenus pour 1 tour)', 15),
(3, 'Désastre Climatique', 'Votre usine est dévastée par une tornade (Effet pour 2 Tours: pas de revenu)', 60);

-- --------------------------------------------------------

--
-- Structure de la table `facteur_gain_total`
--

CREATE TABLE `facteur_gain_total` (
  `id` int(11) NOT NULL,
  `facteur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `facteur_gain_total`
--

INSERT INTO `facteur_gain_total` (`id`, `facteur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `facteur_inflation_global`
--

CREATE TABLE `facteur_inflation_global` (
  `id` int(11) NOT NULL,
  `facteur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `facteur_inflation_global`
--

INSERT INTO `facteur_inflation_global` (`id`, `facteur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `facteur_pollution_global`
--

CREATE TABLE `facteur_pollution_global` (
  `id` int(11) NOT NULL,
  `facteur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `facteur_pollution_global`
--

INSERT INTO `facteur_pollution_global` (`id`, `facteur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `infobulle`
--

CREATE TABLE `infobulle` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `infobulle`
--

INSERT INTO `infobulle` (`id`, `titre`, `description`, `lien`) VALUES
(1, 'Le saviez vous ?', 'La pollution atmosphérique est la 4e cause de mortalité, après le tabac et l\'alcool, et est responsable chaque année de 48 000 décès prématurés en France.et les dommages sanitaires de cette pollution auraient un coût annuel de 20 à 30 milliards d’euros.', 'source : ministère de la transition écologique et solidaire'),
(2, 'Le saviez vous ?', 'Les polluants dans l’air extérieur proviennent pour une part des activités humaines : \nles transports et surtout le trafic routier ; \nles bâtiments (chauffage au bois, au fioul) ;\nl’agriculture par l’utilisation d’engrais azotés, de pesticides et les émissions gazeuses d’origine animale ; \nle stockage, l’incinération et le brûlage à l’air libre des déchets ; \nles industries et la production d’énergie.', 'souce : Ademe --https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(3, 'Le saviez vous ?', 'La pollution se concentre majoritairement dans les villes, où vivent près de 70% des Français. Les polluants dans l’air extérieur peuvent affecter des zones éloignées de plusieurs centaines de kilomètres des lieux d’émissions.', 'souce : Ademe --https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(4, 'Le saviez vous ?', 'Concentration urbaine, période de chauffage, trafic routier dense, stabilité des couches d’air, ensoleillement: la conjugaison de ces conditions favorise l’apparition de pics de pollution.', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(5, 'Le saviez vous ?', 'L’asthme est une maladie respiratoire de plus en plus fréquente : le nombre de cas a doublé en 10 ans et elle touche environ 10% des enfants', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(6, 'Le saviez vous ?', 'En ville, l’exposition à un cocktail de polluants (notamment particules fines, dioxyde d’azote…) engendre des atteintes des voies respiratoires, une aggravation de l’asthme, mais aussi la dégradation des bâtiments et la mise en danger du patrimoine bâti.', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(7, 'Le saviez vous ?', 'La ville de Strasbourg mène une politique d’amélioration de la qualité de l’air profitable : entre 2008 et 2012, le nombre d’habitants exposés aux particules fines est passé de 60 000 à 15 000, au dioxyde d’azote de 100000 à 60000 personnes. Pour y parvenir, l’accent a été mis sur les modes de déplacement alternatifs à la voiture. La ville est en particulier devenue la première agglomération cyclable de France (pistes et bandes cyclables, projet d’« autoroutes à vélo», arceaux de stationnement, stations de vélos en libre-service…).', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(8, 'Le saviez vous ?', 'En 2012, le Centre international de recherche sur le cancer (CIRC) a classé les gaz d\'échappement des moteurs diesel comme cancérogènes pour l’Homme (groupe 1) et en 2013, il a classé la pollution atmosphérique et les particules de l’air ambiant également cancérogènes pour l’Homme (groupe 1).', 'source : https://www.anses.fr/fr/content/qualité-de-l’air-extérieur'),
(9, 'Le saviez vous ?', 'Selon l’organisation mondiale de la santé (OMS), les habitants des villes où l’air est fortement pollué souffrent davantage de cardiopathies, de problèmes respiratoires et de cancer du poumon que ceux des villes où l’air est plus propre.', 'source : http://www.atmo-grandest.eu/ils-sont-dans-lair\n'),
(10, 'Info Pratique : ', 'Que faire en cas de pic de pollution ? \n-limitez les activités physiques et sportives intenses (dont les compétitions), autant en plein air qu’à l’intérieur ; \n-limitez les déplacements sur les grands axes routiers et à leurs abords, aux périodes de pointe (aux horaires éventuellement précisés au niveau local) ; \n-en cas de symptômes ou d’inquiétude, prenez conseil auprès de votre pharmacien ou consultez votre médecin ou contactez la permanence sanitaire locale lorsqu’elle est mise en place ; \n-en cas d’épisode de pollution à l’ozone : limitez les sorties durant l’après-midi et limitez les activités physiques et sportives intenses (dont les compétitions) en plein air ; celles à l’intérieur peuvent être maintenues.', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(11, 'Info Pratique : ', 'La loi sur l’air et l’utilisation rationnelle de l’énergie (LAURE) de 1996 affirme le droit de chacun à respirer un air qui ne nuise pas à la santé.\n', 'source Ademe--https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(12, 'Le saviez vous ?', 'Au cours d’une journée, un adulte inhale 15 000 litres d’air en moyenne. Cet air est composé à près de 99 % d’oxygène et d’azote, mais il contient également des polluants qui peuvent avoir une incidence sur les écosystèmes, le bâti, le climat et notre santé.', 'source : http://www.atmo-grandest.eu/'),
(13, 'Scandale :', 'Le moteur Diesel à longtemps été soutenu et favorisé par l\'Etat Français malgré son impact environnementale.', 'source : https://www.publicsenat.fr/lcp/politique/pollution-l-air-un-scandale-meme-type-l-amiante-alertent-ecologistes-1206142'),
(14, 'Info Pratique : ', 'La pollution de l’air fragilise les écosystèmes\nPar les pluies acides : Les dépôts humides (pluies, neige, brouillard…) s’acidifient sous l’effet des oxydes d’azote et du dioxyde de soufre.En France, ce phénomène a été constaté surtout dans les Vosges à partir des années 90\nPar les dépôts azotés : On estime que l’excès de ces dépôts en France pourrait entraîner une perte de biodiversité de 10% à l’horizon 2 100. ', 'source: https://www.ademe.fr/sites/default/files/assets/documents/guide-pratique-pollution-air-exterieur.pdf'),
(15, 'Le saviez-vous?', 'le 19 septembre 2018 a lieu la 4e journée nationale de la qualité de l\'air', 'source http://evenements.developpement-durable.gouv.fr/campagne/jnqa2018\n'),
(16, 'Scandale :', 'des entreprises sont régulièrement prises à défaut pour leur rejets toxiques dans l\'atmosphère', 'source : https://francais.rt.com/france/52294-nouveau-scandale-depakine-sanofi-rejette-polluants-air-quantites-industrielles'),
(17, 'Le saviez-vous', 'Les coûts annuels en dépense de santé et coûts associés (absentéisme, perte en qualité et espérance de vie) liés à la pollution atteindraient 30,5 milliards d’euros chaque année pour l’Europe.', 'source : http://www.encyclopedie-environnement.org/air/pollution-air-exterieur-informer-prevenir/'),
(18, 'Le saviez-vous?', 'Quatorze personnes ont déposé un recours pour «carence fautive de l\'État» devant le tribunal administratif de Grenoble. D\'après l\'organisme Santé Publique France, la pollution serait à l\'origine de 85 décès prématurés chaque année dans la région.', 'source : http://www.lefigaro.fr/actualite-france/2018/04/30/01016-20180430ARTFIG00181-pollution-de-l-air-des-habitants-de-haute-savoie-veulent-attaquer-l-etat.php'),
(19, 'Scandale', 'Le 18 septembre 2015, l\'agence environnementale américaine (EPA) accuse le constructeur Volkswagen d\'avoir enfreint des réglementations anti-pollution à l\'aide d\'un logiciel truqueur installé sur des centaines de milliers de véhicules diesel fabriqués à partir de 2009. Très vite, le \"dieselgate\" prend de l\'ampleur: Volkswagen reconnaît avoir équipé de ce logiciel 11 millions de véhicules dans le monde, dont 8,5 millions en Europe.\nLe logiciel incriminé enclenchait un mécanisme interne de limitation des gaz polluants pendant les contrôles anti-pollution.\n\nEn 2015, le groupe essuie une perte historique de 1,6 milliard d\'euros en raison de l\'argent mis de côté pour affronter les poursuites judiciaires dans le monde. \n\nLa marque a annoncé en novembre la suppression de 30.000 postes.', 'source : http://www.lepoint.fr/automobile/actualites/volkswagen-et-les-repercussions-du-scandale-des-moteurs-truques-30-07-2017-2146823_683.php'),
(20, 'Le saviez-vous?', 'Il existe deux catégories de polluants atmosphériques :\nles polluants primaires, émis directement : monoxyde d’azote, dioxyde de soufre, monoxyde de carbone, particules (ou poussières), métaux lourds, composés organiques volatils, hydrocarbures aromatiques polycycliques...\nles polluants secondaires issus de transformations physico-chimiques entre polluants de l’air sous l’effet de conditions météorologiques particulières : ozone, dioxyde d’azote, particules)…', 'source : https://www.gouvernement.fr/risques/pollution-de-l-air'),
(21, 'Le saviez-vous?', 'la France va mesurer les pesticides dans l’air sur tout le territoire à partir de 2018', 'source : https://www.lemonde.fr/pollution/article/2017/11/28/pollution-la-france-va-mesurer-les-pesticides-dans-l-air-sur-tout-le-territoire-a-partir-de-2018_5221406_1652666.html'),
(22, 'Le saviez-vous?', 'QU’EST-CE QU’UN ÉPISODE DE POLLUTION ?\nOn définit un épisode de pollution par une quantité trop élevée d’un ou de plusieurs polluants dans l’air.', 'source : https://www.gouvernement.fr/risques/pollution-de-l-air'),
(23, 'Scandale :', 'Pollution : le « dieselgate » responsable de 5 000 morts par an en Europe', 'source : https://www.lemonde.fr/pollution/article/2017/09/18/pollution-le-dieselgate-responsable-de-5-000-morts-par-an-en-europe_5187124_1652666.html'),
(24, 'Scandale : ', 'Une Parisienne de 57 ans intente une action en justice contre l\'État, en févier 2017, pour ne pas avoir fait respecter les normes de qualité de l\'air.', 'source : https://www.francetvinfo.fr/meteo/particules-fines/info-franceinfo-victime-de-la-pollution-de-l-air-a-paris-elle-porte-plainte-contre-l-etat_2225067.html'),
(25, 'Le saviez-vous?', 'Rappel de l’interdiction du brûlage à l\'air libre des déchets verts des particuliers (Règlement sanitaire départemental, art. 84). Apportez-les en déchetterie. Pour vos travaux, privilégiez l\'emploi d\'outils manuels ou électriques plutôt qu\'avec des moteurs thermiques. Évitez de faire du feu dans des foyers ouverts et des poêles anciens sauf s\'il s\'agit de votre mode de chauffage principal.', 'source : http://www.atmo-grandest.eu/\n');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_pollution_global`
--

CREATE TABLE `niveau_pollution_global` (
  `id` int(11) NOT NULL,
  `niveau_global` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `niveau_pollution_global`
--

INSERT INTO `niveau_pollution_global` (`id`, `niveau_global`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_developpement`
--

CREATE TABLE `type_developpement` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_developpement`
--

INSERT INTO `type_developpement` (`id`, `type`) VALUES
(1, 'Transport'),
(2, 'Industrie'),
(3, 'Agriculture');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `atout`
--
ALTER TABLE `atout`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banque`
--
ALTER TABLE `banque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C1765B631649A761` (`code_insee`);

--
-- Index pour la table `developpement`
--
ALTER TABLE `developpement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7ED48ABFC54C8C93` (`type_id`);

--
-- Index pour la table `event_aleatoire`
--
ALTER TABLE `event_aleatoire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facteur_gain_total`
--
ALTER TABLE `facteur_gain_total`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facteur_inflation_global`
--
ALTER TABLE `facteur_inflation_global`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facteur_pollution_global`
--
ALTER TABLE `facteur_pollution_global`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `infobulle`
--
ALTER TABLE `infobulle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `niveau_pollution_global`
--
ALTER TABLE `niveau_pollution_global`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_developpement`
--
ALTER TABLE `type_developpement`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `atout`
--
ALTER TABLE `atout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `banque`
--
ALTER TABLE `banque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `developpement`
--
ALTER TABLE `developpement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `event_aleatoire`
--
ALTER TABLE `event_aleatoire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `facteur_gain_total`
--
ALTER TABLE `facteur_gain_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `facteur_inflation_global`
--
ALTER TABLE `facteur_inflation_global`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `facteur_pollution_global`
--
ALTER TABLE `facteur_pollution_global`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `infobulle`
--
ALTER TABLE `infobulle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `niveau_pollution_global`
--
ALTER TABLE `niveau_pollution_global`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_developpement`
--
ALTER TABLE `type_developpement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `developpement`
--
ALTER TABLE `developpement`
  ADD CONSTRAINT `FK_7ED48ABFC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_developpement` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
