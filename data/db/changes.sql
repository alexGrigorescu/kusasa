ALTER TABLE `pages`	CHANGE COLUMN `status` `status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `content`;
ALTER TABLE `page_categories`	ADD COLUMN `status` TINYINT NOT NULL DEFAULT '1' AFTER `name`;
ALTER TABLE `projects`	CHANGE COLUMN `status` `status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `category_id`;
ALTER TABLE `project_categories`	ADD COLUMN `status` TINYINT NOT NULL DEFAULT '1' AFTER `name`;
