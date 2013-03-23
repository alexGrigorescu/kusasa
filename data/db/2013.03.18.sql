-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.16-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-18 07:16:18
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table kusasa.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- Dumping data for table kusasa.menu: 57 rows
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`) VALUES
	(1, 0, 'Home', '/', '', 1, 1),
	(2, 0, 'About', '/about.html', '', 2, 1),
	(3, 2, 'Company Profile', '/company-profile.html', '', 1, 1),
	(19, 0, 'Affiliate', '/affiliate.html', '', 3, 2),
	(18, 0, 'Forum', '/forum', '', 4, 2),
	(17, 0, 'Make Money', '/make-money.html', '', 5, 2),
	(7, 0, 'Contact Us', '/contact-us.html', '', 6, 1),
	(8, 7, 'Blog', '/blog', '', 1, 1),
	(9, 0, 'Products', '/products', '', 7, 1),
	(10, 9, 'Handicraft', '/products/handicraft', '', 1, 1),
	(11, 9, 'Furniture', '/products/furniture', '', 2, 1),
	(12, 10, 'Tissue Box', '/products/handicraft/tissue', '', 1, 1),
	(13, 9, 'Frame', '/products/handicraft/frame', '', 3, 1),
	(14, 11, 'Cabinet', '/products/furniture/cabinet', '', 1, 1),
	(15, 11, 'Chair', '/products/furniture/chair', '', 2, 1),
	(16, 11, 'Table', '/products/furniture/table', '', 3, 1),
	(20, 0, 'Help', '/help', '', 8, 2),
	(21, 20, 'Support Center', '/support-center.html', '', 1, 2),
	(22, 20, 'Sitemap', '/sitemap.html', '', 2, 2),
	(23, 0, 'Author Dashboard', '/author-dashboard', '', 9, 3),
	(24, 0, 'My Profile', '/member/profile', '', 10, 3),
	(25, 0, 'Settings', '/member/settings', '', 11, 3),
	(26, 0, 'Downloads', '/member/downloads', '', 12, 3),
	(27, 0, 'Bookmarks', '/member/bookmarks', '', 13, 3),
	(28, 0, 'Logout', '/logout.php', '', 14, 3),
	(29, 25, 'Profile', '/member/settings/profile', '', 1, 3),
	(30, 25, 'Change Password', '/member/settings/password', '', 2, 3),
	(32, 31, 'Menu 1.1', '', '', 1, 4),
	(33, 31, 'Menu 1.2', '', '', 2, 4),
	(35, 34, 'Menu 2.1', '', '', 1, 4),
	(36, 35, 'Menu 2.1.1', '', '', 1, 4),
	(37, 35, 'Menu 2.1.2', '', '', 2, 4),
	(38, 34, 'Menu 2.2', '', '', 2, 4),
	(39, 21, 'Popular Files', '/popular', '', 1, 2),
	(40, 21, 'Top Authors', '/top', '', 2, 2),
	(41, 21, 'Wordpress', '/wp', '', 3, 2),
	(42, 0, 'TEST', 'TEST', 'wsdfdsf', 17, 1),
	(43, 0, 'merge', 'ytes', '', 18, 1),
	(46, 45, 'test delete 2', 'test delete 2', '', 1, 1),
	(47, 0, 'bbbb', 'bbbbb', '', 20, 1),
	(48, 0, 'asdasd', 'asdasdas', '', 21, 1),
	(49, 0, 'dfsdf', 'asdfsads', '', 22, 1),
	(51, 0, 'asdfsdf', 'sdfsd', '', 24, 1),
	(52, 51, 'asdfsdfa', 'sdfsd', '', 1, 1),
	(53, 0, 'asdfsdfa', 'sdfsd', '', 25, 1),
	(54, 0, 'asdfsdfa', 'sdfsd', '', 26, 1),
	(56, 0, 'ultimul test', 'asta e', ';)', 28, 1),
	(57, 0, 'sadasdf', 'afssdfd', 'asa', 29, 1),
	(60, 0, 'a sdasd', 'ads sd', 'asdas', 32, 1),
	(61, 0, 'a sdasd', 'asf asdf', 'test', 33, 1),
	(64, 0, 'testf', 'test', '', 36, 1),
	(66, 65, 'a sdfsdf', 'sdf sd', '', 1, 1),
	(68, 67, 'a sdfsdf', 'sdf sd', '', 1, 1),
	(70, 0, 'xxxx', 'xxxx', '', 38, 1),
	(71, 0, 'asdas', 'afssd', '', 39, 1),
	(72, 0, 'asdas', 'asdsa', 'asd', 40, 1),
	(73, 0, 'afdssdf', 'sdfsd', '', 41, 1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for table kusasa.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `added` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table kusasa.pages: ~10 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `category_id`, `title`, `content`, `status`, `added`, `modified`) VALUES
	(1, 1, 'Development facilitation', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 02:13:48', '2013-03-05 05:59:43'),
	(2, 1, 'Project & Grant Funding', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 02:14:19', '2013-03-05 05:59:43'),
	(3, 1, 'Project Feasibilities', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 02:14:39', '2013-03-05 05:59:43'),
	(4, 1, 'Design Management', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 02:14:57', '2013-03-05 05:59:43'),
	(5, 1, 'Project Management', '<p>\r\n	Under construction</p>', 1, '2013-02-13 02:15:17', '2013-03-05 05:59:43'),
	(6, 1, 'Site Management', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 02:15:31', '2013-03-05 05:59:43'),
	(7, 0, 'About us', '<p>\r\n	Under construction.</p>', 1, '2013-02-13 03:04:54', '2013-03-05 05:59:43'),
	(8, 0, 'Meet the team', '<p>\r\n	Under construction</p>', 1, '2013-02-13 03:05:09', '2013-03-05 05:59:43'),
	(9, 0, 'Contact us', '<h3>\r\n	<span style="font-size:16px;">Kusasa Limited</span><br />\r\n	<img alt="" src="/upload/images/contact.png" style="width: 276px; height: 233px; float: right; border: none;" /></h3>\r\n<p>\r\n	Discovery Court Business centre</p>\r\n<p>\r\n	551-553 Walisdown Road</p>\r\n<p>\r\n	Poole, BH12 5AG</p>\r\n<p>\r\n	<strong>Tel</strong>: +44 (0)1202 853 301</p>\r\n<p>\r\n	<strong>Website</strong>: www.kusasa.eu</p>\r\n<p>\r\n	<span style="font-size: 12px;"><strong>Email</strong>: info@kusasa.eu</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<div>\r\n	Vat no. 109 358 802 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>\r\n<div>\r\n	Registered in England No.7541350.</div>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>', 1, '2013-02-13 07:57:24', '2013-03-05 05:59:43'),
	(10, 0, 'Services', '<p>\r\n	<span style="font-size:16px;">Our services include:</span></p>\r\n<p>\r\n	<span style="color: rgb(0, 0, 0); font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif;">Development facilitation</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project &amp; Grant Funding</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project Feasibilities</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Design Management</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Project Management</span></p>\r\n<p style="color: rgb(0, 0, 0); font-size: 13px;">\r\n	<span style="font-size: 11pt; font-family: Symbol;">&middot;<span style="font-size: 7pt; font-family: \'Times New Roman\';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Site Management</span></p>\r\n<p>\r\n	&nbsp;</p>', 1, '2013-02-13 03:24:23', '2013-03-05 05:59:43');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Dumping structure for table kusasa.page_categories
DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE IF NOT EXISTS `page_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table kusasa.page_categories: ~1 rows (approximately)
/*!40000 ALTER TABLE `page_categories` DISABLE KEYS */;
INSERT INTO `page_categories` (`id`, `name`, `status`, `added`) VALUES
	(1, 'Services', 1, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `page_categories` ENABLE KEYS */;


-- Dumping structure for table kusasa.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `gallery` text NOT NULL,
  `featured` text NOT NULL,
  `category_id` varchar(64) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `added` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table kusasa.projects: ~5 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `title`, `description`, `gallery`, `featured`, `category_id`, `status`, `added`, `modified`) VALUES
	(1, 'RotaDock', '<div>\r\n	<img alt="" src="/upload/images/RotaDock/rotadock_logo.jpg" style="font-size: 12px; width: 234px; height: 97px; float: right;" />\r\n	<div>\r\n		<span style="font-size: 12px;">ROTADOCK is a new, innovative and highly efficient multi level boat storage facility. Not only is it significantly different to traditional &ldquo;dry stack&rdquo; facilities, it is also very different to the more recent variants that have begun to appear in that they all follow a common thread; - they have rectangular footprints. In a significantly different configuration, the ROTADOCK has a circular footprint, and is therefore a round building.</span></div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		Kusasa has been appointed by RotaDock to be the Project and Design Managers for all the installations of RotaDock worldwide. Kusasa is also been tasked to Manage the Development Facilitation with various clients and countries.</div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>', 'RotaDock/Dorset_Yachts_Marina_View.jpg|RotaDock/Isoview%20from%20Front.jpg|RotaDock/Isoview%20from%20Rear.jpg|RotaDock/Port%20Control%20after%20Rotadock.jpg|RotaDock/Rotadock%203.jpg|RotaDock/salterns_render_Front_.jpg', 'RotaDock/Dorset_Yachts_Marina_View.jpg', '', 1, '2013-02-13 06:23:04', '2013-03-05 05:59:55'),
	(2, 'Intelligent Parking', '<p>\r\n	Each of the two towers can hold 400 vehicles, which are parked or retrieved at lifting speeds of up to 2m/s.</p>', 'IntelligentParking/IPL%20Marketing%20page%201.jpg|IntelligentParking/Palis%201.jpg|IntelligentParking/palis%202.jpg|IntelligentParking/Palis%203.jpg|IntelligentParking/Palis%204.jpg|IntelligentParking/Palis%205.jpg|IntelligentParking/Palis%206.jpg|IntelligentParking/Palis%207.jpg|IntelligentParking/Palis%208.jpg|IntelligentParking/Palis%209.jpg', 'IntelligentParking/Palis%207.jpg', '', 1, '2013-02-13 06:31:44', '2013-03-05 05:59:55'),
	(3, 'Boris Bikes in London', '<p>\r\n	<span style="font-size: 12px;">Transport for London (TFL) appointed Serco to deliver the Barclays Bike scheme in London. This scheme quickly became known as Boris Bikes named after the Mayor of London Boris Johnson.</span></p>\r\n<div>\r\n	Kusasa was appointed to manage the very complicated installation of the Boris bikes at the Southward Station site. The scope was to design a new roof to the Southwark Station that will cope with the loads of the bikes and people and then to manage EWL International during the installation process.</div>\r\n<div>\r\n	This was a very high profile project and the management was very delicate as London&nbsp;<span style="font-size: 12px;">Underground manages the station and it is also one of London&rsquo;s busies underground&nbsp;</span><span style="font-size: 12px;">Stations.</span></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<h3>\r\n		Key Facts:</h3>\r\n	<div>\r\n		<strong>Client:&nbsp;</strong><span style="font-size: 12px;">SERCO</span></div>\r\n	<div>\r\n		<strong>Architect:&nbsp;</strong><span style="font-size: 12px;">Stride Treglown</span></div>\r\n	<div>\r\n		<strong>Project Managers:&nbsp;</strong><span style="font-size: 12px;">Kusasa Limited</span></div>\r\n	<div>\r\n		<strong>Engineers:&nbsp;</strong><span style="font-size: 12px;">Hill Cannon</span></div>\r\n	<div>\r\n		<strong>Contractor:&nbsp;</strong><span style="font-size: 12px;">EWL International</span></div>\r\n	<div>\r\n		<strong>Value:&nbsp;</strong><span style="font-size: 12px;">&pound; 250K</span></div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>', 'BorisBikes/IMG_0639.JPG|BorisBikes/IMG_0640.JPG|BorisBikes/IMG_0646.JPG|BorisBikes/IMG_0648.JPG|BorisBikes/IMG_0657.JPG|BorisBikes/IMG_0662.JPG|BorisBikes/IMG_0664.JPG|BorisBikes/IMG_0666.JPG', 'BorisBikes/boris_featured.jpg', '', 1, '2013-02-13 06:36:18', '2013-03-05 05:59:55'),
	(4, 'Arora International Hotel, Gatwick Multi Storey Car Park', '<p>\r\n	EWL International appointed Kusasa Limited to manage the Project from design to delivery. The design was managed by the Kusasa team following numerous meetings with the client Sofitel Hotel. The scope was to design a MSCP that would cater for all the parking needs of the hotel as well as an additional income stream from people that would leave their cars there while on holiday.<br />\r\n	Kusasa designed a 3 deck car park with each providing over 90 spaces per deck and there was also an additional 150 surface spaces. Kusasa also supplied the site management team during this project.</p>\r\n<p>\r\n	The project was programmed to be 18 weeks but the client required the project to be&nbsp;completed 4 weeks earlier and EWL achieved handover of 3 levels 4 weeks early and the&nbsp;last level was handed over 2 weeks later. This meant the client could receive revenue&nbsp;from the car parks after only 12 weeks.</p>', 'GatwickMSCP/DSCF5575.JPG|GatwickMSCP/DSCF9361.JPG|GatwickMSCP/DSCF9366.JPG|GatwickMSCP/DSCF9368.JPG|GatwickMSCP/DSCF9373.JPG|GatwickMSCP/IMG_0715.JPG', 'GatwickMSCP/DSCF9361.JPG', '', 1, '2013-02-13 06:39:53', '2013-03-05 05:59:55'),
	(5, 'Retail Projects', '<p>\r\n	Kusasa was appointed to manage the transformation of an old run down shop&nbsp;to a new upmarket sales office and showroom for Granite Transformations&nbsp;who specialises in selling granite tops and new kitchens. The project required&nbsp;liason with the various specialist supplies as well as the design of the new unit.<br />\r\n	Kusasa then managed the entire fit out process which included several specialist&nbsp;sub-contractors and installers. The biggest challenge was internal liaison with&nbsp;their own factory to produce the show room stock whilst maintaining customer&nbsp;production.<br />\r\n	The opening was on time and a great success and has proven to be a valuable&nbsp;asset to Granite in showing of their unique products and securing future sales.</p>', 'Retail/P5220093.JPG|Retail/P5220095.JPG|Retail/P5220096.JPG|Retail/P5220097.JPG|Retail/P5220099.JPG', 'Retail/P5220099.JPG', '0', 1, '2013-02-25 05:46:01', '2013-03-05 05:59:55');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;


-- Dumping structure for table kusasa.project_categories
DROP TABLE IF EXISTS `project_categories`;
CREATE TABLE IF NOT EXISTS `project_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table kusasa.project_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `project_categories` DISABLE KEYS */;
INSERT INTO `project_categories` (`id`, `name`, `status`, `added`) VALUES
	(1, 'test3', 1, '2013-02-25 04:04:45'),
	(2, 'Domestic Projects', 1, '2013-02-25 04:16:18');
/*!40000 ALTER TABLE `project_categories` ENABLE KEYS */;


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
