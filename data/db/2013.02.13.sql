
-- Dumping structure for table kusasa.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table kusasa.pages: ~10 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `category_id`, `title`, `content`, `status`, `added`, `modified`) VALUES
	(1, 1, 'Development facilitation', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 02:13:48', '2013-02-18 06:59:33'),
	(2, 1, 'Project & Grant Funding', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 02:14:19', '2013-02-18 06:59:34'),
	(3, 1, 'Project Feasibilities', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 02:14:39', '2013-02-18 06:59:36'),
	(4, 1, 'Design Management', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 02:14:57', '2013-02-18 06:59:37'),
	(5, 1, 'Project Management', '<p>\r\n	Under construction</p>', 0, '2013-02-13 02:15:17', '2013-02-18 06:59:38'),
	(6, 1, 'Site Management', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 02:15:31', '2013-02-18 06:59:39'),
	(7, 0, 'About us', '<p>\r\n	Under construction.</p>', 0, '2013-02-13 03:04:54', '2013-02-13 05:04:54'),
	(8, 0, 'Meet the team', '<p>\r\n	Under construction</p>', 0, '2013-02-13 03:05:09', '2013-02-13 05:05:09'),
	(9, 0, 'Contact us', '<h3>\r\n	<span style="font-size:16px;">Kusasa Limited</span><br />\r\n	<img alt="" src="/kusasa/trunk/public/upload/images/contact.png" style="width: 276px; height: 233px; float: right; border: none;" /></h3>\r\n<p>\r\n	Discovery Court Business centre</p>\r\n<p>\r\n	551-553 Walisdown Road</p>\r\n<p>\r\n	Poole, BH12 5AG</p>\r\n<p>\r\n	<strong>Tel</strong>: +44 (0)1202 853 301</p>\r\n<p>\r\n	<strong>Website</strong>: www.kusasa.eu</p>\r\n<p>\r\n	<span style="font-size: 12px;"><strong>Email</strong>: info@kusasa.eu</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<div>\r\n	Vat no. 109 358 802 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>\r\n<div>\r\n	Registered in England No.7541350.</div>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>', 0, '2013-02-13 07:57:24', '2013-02-13 09:57:24'),
	(10, 0, 'Services', '<p>\r\n	<span style="font-size:16px;">Our services include:</span></p>\r\n<p>\r\n	<span style="color: rgb(0, 0, 0); font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif;">Development facilitation</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project &amp; Grant Funding</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project Feasibilities</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Design Management</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project Management</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Site Management</span></p>\r\n<p>\r\n	&nbsp;</p>', 0, '2013-02-13 03:24:23', '2013-02-13 05:24:23');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Dumping structure for table kusasa.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `gallery` text NOT NULL,
  `featured` text NOT NULL,
  `category_id` varchar(64) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table kusasa.projects: ~5 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `title`, `description`, `gallery`, `featured`, `category_id`, `status`, `added`, `modified`) VALUES
	(1, 'RotaDock', '<div>\r\n	<img alt="" src="/kusasa/trunk/public/upload/images/RotaDock/rotadock_logo.jpg" style="font-size: 12px; width: 234px; height: 97px; float: right;" />\r\n	<div>\r\n		<span style="font-size: 12px;">ROTADOCK is a new, innovative and highly efficient multi level boat storage facility. Not only is it significantly different to traditional &ldquo;dry stack&rdquo; facilities, it is also very different to the more recent variants that have begun to appear in that they all follow a common thread; - they have rectangular footprints. In a significantly different configuration, the ROTADOCK has a circular footprint, and is therefore a round building.</span></div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		Kusasa has been appointed by RotaDock to be the Project and Design Managers for all the installations of RotaDock worldwide. Kusasa is also been tasked to Manage the Development Facilitation with various clients and countries.</div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>', 'RotaDock/Dorset_Yachts_Marina_View.jpg|RotaDock/Isoview%20from%20Front.jpg|RotaDock/Isoview%20from%20Rear.jpg|RotaDock/Port%20Control%20after%20Rotadock.jpg|RotaDock/Rotadock%203.jpg|RotaDock/salterns_render_Front_.jpg', 'RotaDock/Dorset_Yachts_Marina_View.jpg', '', 0, '2013-02-13 06:23:04', '2013-02-13 13:11:55'),
	(2, 'Intelligent Parking', '<p>\r\n	Each of the two towers can hold 400 vehicles, which are parked or retrieved at lifting speeds of up to 2m/s.</p>', 'IntelligentParking/IPL%20Marketing%20page%201.jpg|IntelligentParking/Palis%201.jpg|IntelligentParking/palis%202.jpg|IntelligentParking/Palis%203.jpg|IntelligentParking/Palis%204.jpg|IntelligentParking/Palis%205.jpg|IntelligentParking/Palis%206.jpg|IntelligentParking/Palis%207.jpg|IntelligentParking/Palis%208.jpg|IntelligentParking/Palis%209.jpg', 'IntelligentParking/Palis%207.jpg', '', 0, '2013-02-13 06:31:44', '2013-02-13 13:11:27'),
	(3, 'Boris Bikes in London', '<p>\r\n	<span style="font-size: 12px;">Transport for London (TFL) appointed Serco to deliver the Barclays Bike scheme in London. This scheme quickly became known as Boris Bikes named after the Mayor of London Boris Johnson.</span></p>\r\n<div>\r\n	Kusasa was appointed to manage the very complicated installation of the Boris bikes at the Southward Station site. The scope was to design a new roof to the Southwark Station that will cope with the loads of the bikes and people and then to manage EWL International during the installation process.</div>\r\n<div>\r\n	This was a very high profile project and the management was very delicate as London&nbsp;<span style="font-size: 12px;">Underground manages the station and it is also one of London&rsquo;s busies underground&nbsp;</span><span style="font-size: 12px;">Stations.</span></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<h3>\r\n		Key Facts:</h3>\r\n	<div>\r\n		<strong>Client:&nbsp;</strong><span style="font-size: 12px;">SERCO</span></div>\r\n	<div>\r\n		<strong>Architect:&nbsp;</strong><span style="font-size: 12px;">Stride Treglown</span></div>\r\n	<div>\r\n		<strong>Project Managers:&nbsp;</strong><span style="font-size: 12px;">Kusasa Limited</span></div>\r\n	<div>\r\n		<strong>Engineers:&nbsp;</strong><span style="font-size: 12px;">Hill Cannon</span></div>\r\n	<div>\r\n		<strong>Contractor:&nbsp;</strong><span style="font-size: 12px;">EWL International</span></div>\r\n	<div>\r\n		<strong>Value:&nbsp;</strong><span style="font-size: 12px;">&pound; 250K</span></div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>', 'BorisBikes/IMG_0639.JPG|BorisBikes/IMG_0640.JPG|BorisBikes/IMG_0646.JPG|BorisBikes/IMG_0648.JPG|BorisBikes/IMG_0657.JPG|BorisBikes/IMG_0662.JPG|BorisBikes/IMG_0664.JPG|BorisBikes/IMG_0666.JPG', 'BorisBikes/boris_featured.jpg', '', 0, '2013-02-13 06:36:18', '2013-02-13 13:10:01'),
	(4, 'Arora International Hotel, Gatwick Multi Storey Car Park', '<p>\r\n	EWL International appointed Kusasa Limited to manage the Project from design to delivery. The design was managed by the Kusasa team following numerous meetings with the client Sofitel Hotel. The scope was to design a MSCP that would cater for all the parking needs of the hotel as well as an additional income stream from people that would leave their cars there while on holiday.<br />\r\n	Kusasa designed a 3 deck car park with each providing over 90 spaces per deck and there was also an additional 150 surface spaces. Kusasa also supplied the site management team during this project.</p>\r\n<p>\r\n	The project was programmed to be 18 weeks but the client required the project to be&nbsp;completed 4 weeks earlier and EWL achieved handover of 3 levels 4 weeks early and the&nbsp;last level was handed over 2 weeks later. This meant the client could receive revenue&nbsp;from the car parks after only 12 weeks.</p>', 'GatwickMSCP/DSCF5575.JPG|GatwickMSCP/DSCF9361.JPG|GatwickMSCP/DSCF9366.JPG|GatwickMSCP/DSCF9368.JPG|GatwickMSCP/DSCF9373.JPG|GatwickMSCP/IMG_0715.JPG', 'GatwickMSCP/DSCF9361.JPG', '', 0, '2013-02-13 06:39:53', '2013-02-13 13:10:33'),
	(5, 'Retail Projects', '<p>\r\n	Kusasa was appointed to manage the transformation of an old run down shop&nbsp;to a new upmarket sales office and showroom for Granite Transformations&nbsp;who specialises in selling granite tops and new kitchens. The project required&nbsp;liason with the various specialist supplies as well as the design of the new unit.<br />\r\n	Kusasa then managed the entire fit out process which included several specialist&nbsp;sub-contractors and installers. The biggest challenge was internal liaison with&nbsp;their own factory to produce the show room stock whilst maintaining customer&nbsp;production.<br />\r\n	The opening was on time and a great success and has proven to be a valuable&nbsp;asset to Granite in showing of their unique products and securing future sales.</p>', 'Retail/P5220093.JPG|Retail/P5220095.JPG|Retail/P5220096.JPG|Retail/P5220097.JPG|Retail/P5220099.JPG', 'Retail/P5220099.JPG', '0', 0, '2013-02-25 05:46:01', '2013-02-25 07:46:01');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;








-- Dumping structure for table kusasa.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table kusasa.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `status`, `modified`) VALUES
	(1, 'alex_admin', 'd37bd95402ceee2305d4ec643426600b', 1, '2013-02-25 05:40:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table kusasa.page_categories
DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE IF NOT EXISTS `page_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table kusasa.page_categories: ~1 rows (approximately)
/*!40000 ALTER TABLE `page_categories` DISABLE KEYS */;
INSERT INTO `page_categories` (`id`, `name`, `added`) VALUES
	(1, 'Services', '2013-02-18 04:55:45');
/*!40000 ALTER TABLE `page_categories` ENABLE KEYS */;


-- Dumping structure for table kusasa.project_categories
DROP TABLE IF EXISTS `project_categories`;
CREATE TABLE IF NOT EXISTS `project_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table kusasa.project_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `project_categories` DISABLE KEYS */;
INSERT INTO `project_categories` (`id`, `name`, `added`) VALUES
	(1, 'test3', '2013-02-25 04:04:45'),
	(2, 'Domestic Projects', '2013-02-25 04:16:18');
/*!40000 ALTER TABLE `project_categories` ENABLE KEYS */;

