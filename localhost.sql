-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2009 at 05:31 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.6-2ubuntu4.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `habari`
--
CREATE DATABASE `habari` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `habari`;

-- --------------------------------------------------------

--
-- Table structure for table `habari__commentinfo`
--

CREATE TABLE IF NOT EXISTS `habari__commentinfo` (
  `comment_id` int(10) unsigned NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `type` smallint(5) unsigned NOT NULL default '0',
  `value` text collate utf8_unicode_ci,
  PRIMARY KEY  (`comment_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__commentinfo`
--

INSERT INTO `habari__commentinfo` (`comment_id`, `name`, `type`, `value`) VALUES
(1, 'spamcheck', 1, 'a:0:{}'),
(2, 'spamcheck', 1, 'a:0:{}'),
(3, 'spamcheck', 1, 'a:0:{}'),
(6, 'spamcheck', 1, 'a:0:{}'),
(7, 'spamcheck', 1, 'a:0:{}'),
(8, 'spamcheck', 1, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `habari__comments`
--

CREATE TABLE IF NOT EXISTS `habari__comments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `post_id` int(10) unsigned NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `ip` int(10) unsigned NOT NULL,
  `content` text collate utf8_unicode_ci,
  `status` smallint(5) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `habari__comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__commentstatus`
--

CREATE TABLE IF NOT EXISTS `habari__commentstatus` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `internal` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `habari__commentstatus`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__commenttype`
--

CREATE TABLE IF NOT EXISTS `habari__commenttype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `active` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `habari__commenttype`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__crontab`
--

CREATE TABLE IF NOT EXISTS `habari__crontab` (
  `cron_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `callback` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_run` int(10) unsigned default NULL,
  `next_run` int(10) unsigned NOT NULL,
  `increment` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned default NULL,
  `result` varchar(255) collate utf8_unicode_ci NOT NULL,
  `notify` varchar(255) collate utf8_unicode_ci NOT NULL,
  `cron_class` tinyint(3) unsigned NOT NULL default '0',
  `description` text collate utf8_unicode_ci,
  PRIMARY KEY  (`cron_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `habari__crontab`
--

INSERT INTO `habari__crontab` (`cron_id`, `name`, `callback`, `last_run`, `next_run`, `increment`, `start_time`, `end_time`, `result`, `notify`, `cron_class`, `description`) VALUES
(1, 'truncate_log', 'a:2:{i:0;s:5:"Utils";i:1;s:12:"truncate_log";}', 1243632594, 1243718994, 86400, 1243546194, NULL, 'executed', '', 8, 'Truncate the log table'),
(2, 'incoming_links', 'incoming_links', 1243638589, 1243642189, 3600, 1243595196, NULL, 'executed', '', 8, 'Find links to this blog.');

-- --------------------------------------------------------

--
-- Table structure for table `habari__group_token_permissions`
--

CREATE TABLE IF NOT EXISTS `habari__group_token_permissions` (
  `group_id` int(10) unsigned NOT NULL,
  `token_id` int(10) unsigned NOT NULL,
  `access_mask` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__group_token_permissions`
--

INSERT INTO `habari__group_token_permissions` (`group_id`, `token_id`, `access_mask`) VALUES
(1, 3, 15),
(1, 4, 15),
(1, 5, 15),
(1, 6, 15),
(1, 7, 15),
(1, 8, 15),
(1, 9, 15),
(1, 10, 15),
(1, 11, 15),
(1, 12, 15),
(1, 13, 15),
(1, 14, 15),
(1, 15, 15),
(1, 16, 15),
(1, 17, 15),
(1, 18, 15),
(1, 19, 15),
(1, 20, 15),
(2, 18, 1),
(2, 19, 1),
(2, 20, 15),
(3, 18, 1),
(3, 19, 1),
(3, 20, 15);

-- --------------------------------------------------------

--
-- Table structure for table `habari__groups`
--

CREATE TABLE IF NOT EXISTS `habari__groups` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `habari__groups`
--

INSERT INTO `habari__groups` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'anonymous'),
(3, 'authenticated');

-- --------------------------------------------------------

--
-- Table structure for table `habari__log`
--

CREATE TABLE IF NOT EXISTS `habari__log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `type_id` int(11) NOT NULL,
  `severity_id` tinyint(4) NOT NULL,
  `message` varchar(255) collate utf8_unicode_ci NOT NULL,
  `data` blob,
  `timestamp` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=576 ;

--
-- Dumping data for table `habari__log`
--

INSERT INTO `habari__log` (`id`, `user_id`, `type_id`, `severity_id`, `message`, `data`, `timestamp`, `ip`) VALUES
(1, 0, 1, 3, 'New permission token created: post_entry', NULL, 1243546194, 2130706433),
(2, 0, 1, 3, 'New permission token created: post_page', NULL, 1243546194, 2130706433),
(3, 0, 1, 3, 'New user created: admin', NULL, 1243546194, 2130706433),
(4, 0, 2, 4, 'User Group admin: Member list reset', NULL, 1243546194, 2130706433),
(5, 0, 1, 3, 'New group created: admin', NULL, 1243546194, 2130706433),
(6, 0, 2, 4, 'User Group admin: Member list reset', NULL, 1243546194, 2130706433),
(7, 0, 1, 3, 'User Group updated: admin', NULL, 1243546194, 2130706433),
(8, 0, 2, 4, 'User Group admin: Users were added to the group.', NULL, 1243546194, 2130706433),
(9, 0, 2, 4, 'User Group anonymous: Member list reset', NULL, 1243546194, 2130706433),
(10, 0, 1, 3, 'New group created: anonymous', NULL, 1243546194, 2130706433),
(11, 0, 2, 4, 'User Group admin: Member list reset', NULL, 1243546194, 2130706433),
(12, 0, 1, 3, 'User Group updated: admin', NULL, 1243546194, 2130706433),
(13, 0, 2, 4, 'User Group admin: Users were added to the group.', NULL, 1243546194, 2130706433),
(14, 0, 2, 4, 'Group admin: Access to super_user changed to full', NULL, 1243546194, 2130706433),
(15, 0, 1, 3, 'New permission token created: super_user', NULL, 1243546194, 2130706433),
(16, 0, 2, 4, 'Group admin: Access to manage_all_comments changed to full', NULL, 1243546194, 2130706433),
(17, 0, 1, 3, 'New permission token created: manage_all_comments', NULL, 1243546194, 2130706433),
(18, 0, 2, 4, 'Group admin: Access to manage_own_post_comments changed to full', NULL, 1243546194, 2130706433),
(19, 0, 1, 3, 'New permission token created: manage_own_post_comments', NULL, 1243546194, 2130706433),
(20, 0, 2, 4, 'Group admin: Access to manage_tags changed to full', NULL, 1243546194, 2130706433),
(21, 0, 1, 3, 'New permission token created: manage_tags', NULL, 1243546194, 2130706433),
(22, 0, 2, 4, 'Group admin: Access to manage_options changed to full', NULL, 1243546194, 2130706433),
(23, 0, 1, 3, 'New permission token created: manage_options', NULL, 1243546194, 2130706433),
(24, 0, 2, 4, 'Group admin: Access to manage_theme changed to full', NULL, 1243546194, 2130706433),
(25, 0, 1, 3, 'New permission token created: manage_theme', NULL, 1243546194, 2130706433),
(26, 0, 2, 4, 'Group admin: Access to manage_theme_config changed to full', NULL, 1243546194, 2130706433),
(27, 0, 1, 3, 'New permission token created: manage_theme_config', NULL, 1243546194, 2130706433),
(28, 0, 2, 4, 'Group admin: Access to manage_plugins changed to full', NULL, 1243546194, 2130706433),
(29, 0, 1, 3, 'New permission token created: manage_plugins', NULL, 1243546194, 2130706433),
(30, 0, 2, 4, 'Group admin: Access to manage_plugins_config changed to full', NULL, 1243546194, 2130706433),
(31, 0, 1, 3, 'New permission token created: manage_plugins_config', NULL, 1243546194, 2130706433),
(32, 0, 2, 4, 'Group admin: Access to manage_import changed to full', NULL, 1243546194, 2130706433),
(33, 0, 1, 3, 'New permission token created: manage_import', NULL, 1243546194, 2130706433),
(34, 0, 2, 4, 'Group admin: Access to manage_users changed to full', NULL, 1243546194, 2130706433),
(35, 0, 1, 3, 'New permission token created: manage_users', NULL, 1243546194, 2130706433),
(36, 0, 2, 4, 'Group admin: Access to manage_groups changed to full', NULL, 1243546194, 2130706433),
(37, 0, 1, 3, 'New permission token created: manage_groups', NULL, 1243546194, 2130706433),
(38, 0, 2, 4, 'Group admin: Access to manage_logs changed to full', NULL, 1243546194, 2130706433),
(39, 0, 1, 3, 'New permission token created: manage_logs', NULL, 1243546194, 2130706433),
(40, 0, 2, 4, 'Group admin: Access to own_posts changed to full', NULL, 1243546194, 2130706433),
(41, 0, 1, 3, 'New permission token created: own_posts', NULL, 1243546194, 2130706433),
(42, 0, 2, 4, 'Group admin: Access to post_any changed to full', NULL, 1243546194, 2130706433),
(43, 0, 1, 3, 'New permission token created: post_any', NULL, 1243546194, 2130706433),
(44, 0, 2, 4, 'Group admin: Access to post_entry changed to full', NULL, 1243546194, 2130706433),
(45, 0, 1, 3, 'New permission token created: post_entry', NULL, 1243546194, 2130706433),
(46, 0, 2, 4, 'Group admin: Access to post_page changed to full', NULL, 1243546194, 2130706433),
(47, 0, 1, 3, 'New permission token created: post_page', NULL, 1243546194, 2130706433),
(48, 0, 2, 4, 'Group admin: Access to comment changed to full', NULL, 1243546194, 2130706433),
(49, 0, 1, 3, 'New permission token created: comment', NULL, 1243546194, 2130706433),
(50, 0, 2, 4, 'Group anonymous: Access to post_entry changed to read', NULL, 1243546194, 2130706433),
(51, 0, 2, 4, 'Group anonymous: Access to post_page changed to read', NULL, 1243546194, 2130706433),
(52, 0, 2, 4, 'Group anonymous: Access to comment changed to full', NULL, 1243546194, 2130706433),
(53, 0, 2, 4, 'User Group anonymous: Member list reset', NULL, 1243546194, 2130706433),
(54, 0, 1, 3, 'User Group updated: anonymous', NULL, 1243546194, 2130706433),
(55, 0, 2, 4, 'User Group anonymous: Users were added to the group.', NULL, 1243546194, 2130706433),
(56, 0, 2, 4, 'User Group authenticated: Member list reset', NULL, 1243546194, 2130706433),
(57, 0, 1, 3, 'New group created: authenticated', NULL, 1243546194, 2130706433),
(58, 0, 2, 4, 'Group authenticated: Access to post_entry changed to read', NULL, 1243546194, 2130706433),
(59, 0, 2, 4, 'Group authenticated: Access to post_page changed to read', NULL, 1243546194, 2130706433),
(60, 0, 2, 4, 'Group authenticated: Access to comment changed to full', NULL, 1243546194, 2130706433),
(61, 0, 4, 3, 'New tag 1 (habari);  Slug: habari', NULL, 1243546194, 2130706433),
(62, 0, 4, 3, 'New post 1 (habari);  Type: entry; Status: published', NULL, 1243546194, 2130706433),
(63, 1, 6, 4, 'Activated Plugin: Core Dash Modules', NULL, 1243546194, 2130706433),
(64, 1, 6, 4, 'Activated Plugin: Habari Media Silo', NULL, 1243546194, 2130706433),
(65, 1, 6, 4, 'Activated Plugin: Pingback', NULL, 1243546194, 2130706433),
(66, 1, 6, 4, 'Activated Plugin: Spam Checker', NULL, 1243546194, 2130706433),
(67, 1, 6, 4, 'Activated Plugin: ThemeHelper', NULL, 1243546194, 2130706433),
(68, 1, 6, 4, 'Activated Plugin: Undelete', NULL, 1243546194, 2130706433),
(69, 1, 1, 3, 'Habari successfully installed.', NULL, 1243546194, 2130706433),
(70, 0, 6, 4, 'Deactivated Plugin: Habari Media Silo', NULL, 1243546194, 2130706433),
(71, 1, 3, 3, 'Successful login for admin', NULL, 1243546272, 2130706433),
(72, 1, 6, 4, 'Activated Plugin: Twitter', NULL, 1243546301, 2130706433),
(73, 1, 8, 4, 'Activated Theme: FadeIn', NULL, 1243546368, 2130706433),
(74, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243546379, 2130706433),
(75, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243546379, 2130706433),
(76, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243546382, 2130706433),
(77, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243546382, 2130706433),
(78, 1, 6, 4, 'Activated Plugin: Twitter Avatar', NULL, 1243546511, 2130706433),
(79, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243546519, 2130706433),
(80, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243546519, 2130706433),
(81, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243546521, 2130706433),
(82, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243546521, 2130706433),
(83, 1, 6, 4, 'Deactivated Plugin: Twitter', NULL, 1243546583, 2130706433),
(84, 1, 6, 4, 'Activated Plugin: FlickrFeed', NULL, 1243546602, 2130706433),
(85, 1, 9, 6, 'unserialize() [<a href=''function.unserialize''>function.unserialize</a>]: Error at offset 0 of 232 bytes in user/plugins/flickrfeed/flickrfeed.plugin.php:184', NULL, 1243546755, 2130706433),
(86, 1, 9, 6, 'array_slice() expects parameter 1 to be array, null given in user/plugins/flickrfeed/flickrfeed.plugin.php:185', NULL, 1243546755, 2130706433),
(87, 1, 9, 6, 'Invalid argument supplied for foreach() in user/plugins/flickrfeed/flickrfeed.plugin.php:188', NULL, 1243546755, 2130706433),
(88, 1, 6, 4, 'Activated Plugin: Colophon Plugin', NULL, 1243546928, 2130706433),
(89, 1, 6, 4, 'Activated Plugin: RN Tag Cloud', NULL, 1243547066, 2130706433),
(90, 1, 6, 4, 'Activated Plugin: Monthly Archives', NULL, 1243547108, 2130706433),
(91, 1, 6, 4, 'Activated Plugin: Gravatar', NULL, 1243547122, 2130706433),
(92, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547160, 2130706433),
(93, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547185, 2130706433),
(94, 1, 6, 4, 'Activated Plugin: Recent Comments', NULL, 1243547226, 2130706433),
(95, 1, 6, 4, 'Activated Plugin: Twitter', NULL, 1243547251, 2130706433),
(96, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547551, 2130706433),
(97, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547551, 2130706433),
(98, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547552, 2130706433),
(99, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547552, 2130706433),
(100, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547557, 2130706433),
(101, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547557, 2130706433),
(102, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547558, 2130706433),
(103, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547558, 2130706433),
(104, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547563, 2130706433),
(105, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547563, 2130706433),
(106, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547564, 2130706433),
(107, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547564, 2130706433),
(108, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547567, 2130706433),
(109, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547567, 2130706433),
(110, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547569, 2130706433),
(111, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547569, 2130706433),
(112, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547587, 2130706433),
(113, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547718, 2130706433),
(114, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547740, 2130706433),
(115, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547794, 2130706433),
(116, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547794, 2130706433),
(117, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243547796, 2130706433),
(118, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243547796, 2130706433),
(119, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547907, 2130706433),
(120, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547949, 2130706433),
(121, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243547949, 2130706433),
(122, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547949, 2130706433),
(123, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243547949, 2130706433),
(124, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243547949, 2130706433),
(125, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243548107, 2130706433),
(126, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548107, 2130706433),
(127, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243548107, 2130706433),
(128, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548107, 2130706433),
(129, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243548107, 2130706433),
(130, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243547142, 2130706433),
(131, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243547142, 2130706433),
(132, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548333, 2130706433),
(133, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548333, 2130706433),
(134, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548333, 2130706433),
(135, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548333, 2130706433),
(136, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Thursday, May 28th, 2009|at 9:45pm) at position 24 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548333, 2130706433),
(137, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548571, 2130706433),
(138, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548571, 2130706433),
(139, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548571, 2130706433),
(140, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548571, 2130706433),
(141, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548571, 2130706433),
(142, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548687, 2130706433),
(143, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548687, 2130706433),
(144, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548687, 2130706433),
(145, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243548687, 2130706433),
(146, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548687, 2130706433),
(147, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243548807, 2130706433),
(148, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549331, 2130706433),
(149, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549364, 2130706433),
(150, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549389, 2130706433),
(151, 1, 9, 6, 'Undefined variable: vallue in system/classes/comment.php:240', NULL, 1243549431, 2130706433),
(152, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549431, 2130706433),
(153, 1, 9, 6, 'Undefined variable: vallue in system/classes/comment.php:240', NULL, 1243549431, 2130706433),
(154, 1, 9, 6, 'Undefined variable: vallue in system/classes/comment.php:240', NULL, 1243549431, 2130706433),
(155, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549431, 2130706433),
(156, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549431, 2130706433),
(157, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549431, 2130706433),
(158, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549431, 2130706433),
(159, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549431, 2130706433),
(160, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549436, 2130706433),
(161, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549514, 2130706433),
(162, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549514, 2130706433),
(163, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549514, 2130706433),
(164, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549514, 2130706433),
(165, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549514, 2130706433),
(166, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549514, 2130706433),
(167, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549514, 2130706433),
(168, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243549514, 2130706433),
(169, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549514, 2130706433),
(170, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549527, 2130706433),
(171, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549541, 2130706433),
(172, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549551, 2130706433),
(173, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549561, 2130706433),
(174, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549563, 2130706433),
(175, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549566, 2130706433),
(176, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549567, 2130706433),
(177, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549567, 2130706433),
(178, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549567, 2130706433),
(179, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549568, 2130706433),
(180, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549568, 2130706433),
(181, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549568, 2130706433),
(182, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549569, 2130706433),
(183, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549569, 2130706433),
(184, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549569, 2130706433),
(185, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549570, 2130706433),
(186, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549570, 2130706433),
(187, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549570, 2130706433),
(188, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549571, 2130706433),
(189, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549571, 2130706433),
(190, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549572, 2130706433),
(191, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549572, 2130706433),
(192, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549572, 2130706433),
(193, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549573, 2130706433),
(194, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549573, 2130706433),
(195, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549573, 2130706433),
(196, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549574, 2130706433),
(197, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549574, 2130706433),
(198, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549574, 2130706433),
(199, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549575, 2130706433),
(200, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549575, 2130706433),
(201, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549575, 2130706433),
(202, 1, 9, 6, 'Undefined variable: time in system/classes/comment.php:239', NULL, 1243549576, 2130706433),
(203, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549584, 2130706433),
(204, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 4:26am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549612, 2130706433),
(205, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 4:27am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549622, 2130706433),
(206, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 4:27am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549623, 2130706433),
(207, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549637, 2130706433),
(208, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549651, 2130706433),
(209, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243549778, 2130706433),
(210, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549981, 2130706433),
(211, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243549999, 2130706433),
(212, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550001, 2130706433),
(213, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550002, 2130706433),
(214, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550003, 2130706433),
(215, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550004, 2130706433),
(216, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550005, 2130706433),
(217, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550006, 2130706433),
(218, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550007, 2130706433),
(219, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550008, 2130706433),
(220, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550009, 2130706433),
(221, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550010, 2130706433),
(222, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550019, 2130706433),
(223, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550020, 2130706433),
(224, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550021, 2130706433),
(225, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550023, 2130706433),
(226, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550023, 2130706433),
(227, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550024, 2130706433),
(228, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550025, 2130706433),
(229, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550025, 2130706433),
(230, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550026, 2130706433),
(231, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550027, 2130706433),
(232, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550027, 2130706433),
(233, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550028, 2130706433),
(234, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243550390, 2130706433),
(235, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:125', NULL, 1243550485, 2130706433),
(236, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:125', NULL, 1243550513, 2130706433),
(237, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:125', NULL, 1243550515, 2130706433),
(238, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:125', NULL, 1243550516, 2130706433),
(239, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:125', NULL, 1243550517, 2130706433),
(240, 0, 9, 6, 'Trying to get property of non-object in system/classes/session.php:94', NULL, 1243550534, 2130706433),
(241, 1, 9, 6, 'Trying to get property of non-object in system/classes/crontab.php:23', NULL, 1243550534, 2130706433),
(242, 0, 9, 6, 'Trying to get property of non-object in system/classes/crontab.php:23', NULL, 1243550534, 2130706433),
(243, 0, 9, 6, 'Trying to get property of non-object in system/classes/session.php:147', NULL, 1243550534, 2130706433),
(244, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550534, 2130706433),
(245, 1, 9, 6, 'Trying to get property of non-object in system/classes/session.php:147', NULL, 1243550534, 2130706433),
(246, 1, 3, 3, 'Successful login for admin', NULL, 1243550572, 2130706433),
(247, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550573, 2130706433),
(248, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550611, 2130706433),
(249, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550613, 2130706433),
(250, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550614, 2130706433),
(251, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550615, 2130706433),
(252, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550616, 2130706433),
(253, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550617, 2130706433),
(254, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243550618, 2130706433),
(255, 1, 3, 3, 'Successful login for admin', NULL, 1243550724, 2130706433),
(256, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243550780, 2130706433),
(257, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243550827, 2130706433),
(258, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243632594, 2130706433),
(259, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551095, 2130706433),
(260, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551133, 2130706433),
(261, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551231, 2130706433),
(262, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243551288, 2130706433),
(263, 0, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(264, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(265, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(266, 0, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(267, 0, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(268, 0, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(269, 0, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(270, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(271, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(272, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(273, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(274, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(275, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(276, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(277, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(278, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(279, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(280, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(281, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(282, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(283, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(284, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(285, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(286, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(287, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(288, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(289, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(290, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(291, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(292, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(293, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(294, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(295, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(296, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(297, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(298, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(299, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(300, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(301, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(302, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243551353, 2130706433),
(303, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243551353, 2130706433),
(304, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243551353, 2130706433),
(305, 1, 9, 6, 'Undefined index:   in system/classes/comments.php:589', NULL, 1243551353, 2130706433),
(306, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(307, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(308, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(309, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(310, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(311, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(312, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(313, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(314, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(315, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(316, 1, 9, 6, 'Use of undefined constant now - assumed ''now'' in system/classes/habaridatetime.php:124', NULL, 1243551353, 2130706433),
(317, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551774, 2130706433),
(318, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(319, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551821, 2130706433),
(320, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:124', NULL, 1243551841, 2130706433),
(321, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (1243637815) at position 8 (1): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(322, 0, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (1243637815) at position 8 (1): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(323, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 7142|at 12:43pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433);
INSERT INTO `habari__log` (`id`, `user_id`, `type_id`, `severity_id`, `message`, `data`, `timestamp`, `ip`) VALUES
(324, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (1243638258) at position 8 (5): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(325, 0, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (1243638258) at position 8 (5): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(326, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 7142|at 12:43pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 0, 2130706433),
(327, 0, 3, 5, 'Wrong password for user admin', NULL, 1243551916, 2130706433),
(328, 0, 3, 5, 'Wrong password for user admin', NULL, 1243551925, 2130706433),
(329, 1, 3, 3, 'Successful login for admin', NULL, 1243551933, 2130706433),
(330, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (@Friday, May 29th, 2009|at 3:45am) at position 0 (@): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243551933, 2130706433),
(331, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552021, 2130706433),
(332, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243552126, 2130706433),
(333, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243552196, 2130706433),
(334, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:126', NULL, 1243552206, 2130706433),
(335, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552245, 2130706433),
(336, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552340, 2130706433),
(337, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552344, 2130706433),
(338, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552345, 2130706433),
(339, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552345, 2130706433),
(340, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552346, 2130706433),
(341, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552347, 2130706433),
(342, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552347, 2130706433),
(343, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552360, 2130706433),
(344, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552368, 2130706433),
(345, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552554, 2130706433),
(346, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552555, 2130706433),
(347, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552556, 2130706433),
(348, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552645, 2130706433),
(349, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552657, 2130706433),
(350, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552716, 2130706433),
(351, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552877, 2130706433),
(352, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243552880, 2130706433),
(353, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243552880, 2130706433),
(354, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243552882, 2130706433),
(355, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243552882, 2130706433),
(356, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243552919, 2130706433),
(357, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243553161, 2130706433),
(358, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243553176, 2130706433),
(359, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 3:45am) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243553184, 2130706433),
(360, 1, 9, 6, 'Trying to get property of non-object in system/plugins/coredashmodules/dash_latestcomments.php:14', NULL, 1243553447, 2130706433),
(361, 1, 3, 3, 'Successful login for admin', NULL, 1243554387, 2130706433),
(362, 0, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry ''4678852cd0b04d61673010c22272c8e8'' for key 1 in system/classes/databaseconnection.php:290', NULL, 1243579322, 2130706433),
(363, 0, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243579324, 2130706433),
(364, 0, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243579324, 2130706433),
(365, 0, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243579326, 2130706433),
(366, 0, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243579326, 2130706433),
(367, 1, 3, 3, 'Successful login for admin', NULL, 1243580675, 2130706433),
(368, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580691, 2130706433),
(369, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580691, 2130706433),
(370, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580700, 2130706433),
(371, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580700, 2130706433),
(372, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580701, 2130706433),
(373, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580701, 2130706433),
(374, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580717, 2130706433),
(375, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580717, 2130706433),
(376, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580718, 2130706433),
(377, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580718, 2130706433),
(378, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:05pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243580726, 2130706433),
(379, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580748, 2130706433),
(380, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580748, 2130706433),
(381, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580749, 2130706433),
(382, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580749, 2130706433),
(383, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580803, 2130706433),
(384, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580803, 2130706433),
(385, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580804, 2130706433),
(386, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580804, 2130706433),
(387, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580814, 2130706433),
(388, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580814, 2130706433),
(389, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243580815, 2130706433),
(390, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243580815, 2130706433),
(391, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243580830, 2130706433),
(392, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243580830, 2130706433),
(393, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243580830, 2130706433),
(394, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243580830, 2130706433),
(395, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243580830, 2130706433),
(396, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243581193, 2130706433),
(397, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243581193, 2130706433),
(398, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243581194, 2130706433),
(399, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243581194, 2130706433),
(400, 0, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243583507, 2130706433),
(401, 0, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243583507, 2130706433),
(402, 0, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243583508, 2130706433),
(403, 0, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243583508, 2130706433),
(404, 1, 3, 3, 'Successful login for admin', NULL, 1243583607, 2130706433),
(405, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583615, 2130706433),
(406, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583615, 2130706433),
(407, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583615, 2130706433),
(408, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583615, 2130706433),
(409, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583615, 2130706433),
(410, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583819, 2130706433),
(411, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583819, 2130706433),
(412, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583819, 2130706433),
(413, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583819, 2130706433),
(414, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583819, 2130706433),
(415, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583920, 2130706433),
(416, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583920, 2130706433),
(417, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583920, 2130706433),
(418, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243583920, 2130706433),
(419, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243583920, 2130706433),
(420, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584026, 2130706433),
(421, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584026, 2130706433),
(422, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584026, 2130706433),
(423, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584026, 2130706433),
(424, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 1:06pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584026, 2130706433),
(425, 1, 5, 3, 'Comment 4 deleted from Habari', NULL, 1243584127, 2130706433),
(426, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243584129, 2130706433),
(427, 1, 8, 4, 'Activated Theme: Charcoal', NULL, 1243584144, 2130706433),
(428, 1, 5, 3, 'Comment 5 deleted from Habari', NULL, 1243584194, 2130706433),
(429, 1, 8, 4, 'Activated Theme: FadeIn', NULL, 1243584302, 2130706433),
(430, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243584305, 2130706433),
(431, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243584305, 2130706433),
(432, 1, 9, 6, 'Undefined variable: tweet_image_url in user/themes/fadein/tweets.php:10', NULL, 1243584305, 2130706433),
(433, 1, 9, 6, 'Undefined variable: tweet_text in user/themes/fadein/tweets.php:12', NULL, 1243584305, 2130706433),
(434, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584310, 2130706433),
(435, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584310, 2130706433),
(436, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584310, 2130706433),
(437, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584310, 2130706433),
(438, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584310, 2130706433),
(439, 1, 8, 4, 'Activated Theme: Charcoal', NULL, 1243584325, 2130706433),
(440, 1, 8, 4, 'Activated Theme: FadeIn', NULL, 1243584387, 2130706433),
(441, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584390, 2130706433),
(442, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584390, 2130706433),
(443, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584390, 2130706433),
(444, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584390, 2130706433),
(445, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584390, 2130706433),
(446, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584582, 2130706433),
(447, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584582, 2130706433),
(448, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584582, 2130706433),
(449, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584582, 2130706433),
(450, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584584, 2130706433),
(451, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584584, 2130706433),
(452, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584584, 2130706433),
(453, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584584, 2130706433),
(454, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584586, 2130706433),
(455, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584586, 2130706433),
(456, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584586, 2130706433),
(457, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584586, 2130706433),
(458, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584586, 2130706433),
(459, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584586, 2130706433),
(460, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584586, 2130706433),
(461, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584586, 2130706433),
(462, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584604, 2130706433),
(463, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584604, 2130706433),
(464, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584605, 2130706433),
(465, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584605, 2130706433),
(466, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584628, 2130706433),
(467, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584628, 2130706433),
(468, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584628, 2130706433),
(469, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584628, 2130706433),
(470, 1, 5, 3, 'Comment 6 moderated from Habari', NULL, 1243584636, 2130706433),
(471, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584640, 2130706433),
(472, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584640, 2130706433),
(473, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584640, 2130706433),
(474, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584640, 2130706433),
(475, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584710, 2130706433),
(476, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584710, 2130706433),
(477, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584711, 2130706433),
(478, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584711, 2130706433),
(479, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584719, 2130706433),
(480, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584719, 2130706433),
(481, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584719, 2130706433),
(482, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584719, 2130706433),
(483, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584724, 2130706433),
(484, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584724, 2130706433),
(485, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584724, 2130706433),
(486, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584724, 2130706433),
(487, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009|at 2:03pm) at position 22 (|): Unexpected character in system/classes/habaridatetime.php:123', NULL, 1243584724, 2130706433),
(488, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009 at 2:03pm) at position 23 (a): The timezone could not be found in the database in system/classes/habaridatetime.php:123', NULL, 1243584731, 2130706433),
(489, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584731, 2130706433),
(490, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009 at 2:03pm) at position 23 (a): The timezone could not be found in the database in system/classes/habaridatetime.php:123', NULL, 1243584731, 2130706433),
(491, 1, 9, 6, 'Trying to get property of non-object in system/admin/comments_items.php:17', NULL, 1243584731, 2130706433),
(492, 1, 9, 6, 'DateTime::__construct() [<a href=''datetime.--construct''>datetime.--construct</a>]: Failed to parse time string (Friday, May 29th, 2009 at 2:03pm) at position 23 (a): The timezone could not be found in the database in system/classes/habaridatetime.php:123', NULL, 1243584731, 2130706433),
(493, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584788, 2130706433),
(494, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584788, 2130706433),
(495, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:10', NULL, 1243584788, 2130706433),
(496, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:12', NULL, 1243584788, 2130706433),
(497, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:11', NULL, 1243585506, 2130706433),
(498, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:13', NULL, 1243585506, 2130706433),
(499, 1, 9, 6, 'Undefined variable: tweet_image_url in system/themes/fadein/tweets.php:11', NULL, 1243585507, 2130706433),
(500, 1, 9, 6, 'Undefined variable: tweet_text in system/themes/fadein/tweets.php:13', NULL, 1243585507, 2130706433),
(501, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:10', NULL, 1243586762, 2130706433),
(502, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:11', NULL, 1243586762, 2130706433),
(503, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:11', NULL, 1243586808, 2130706433),
(504, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:12', NULL, 1243586808, 2130706433),
(505, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:11', NULL, 1243586862, 2130706433),
(506, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:12', NULL, 1243586862, 2130706433),
(507, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:11', NULL, 1243586869, 2130706433),
(508, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:12', NULL, 1243586869, 2130706433),
(509, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:11', NULL, 1243587000, 2130706433),
(510, 1, 9, 6, 'Uninitialized string offset:  0 in system/themes/fadein/colophon.php:12', NULL, 1243587000, 2130706433),
(511, 1, 9, 6, 'Undefined variable: colophon in system/themes/fadein/colophon.php:11', NULL, 1243587064, 2130706433),
(512, 1, 9, 6, 'Undefined variable: colophon in system/themes/fadein/colophon.php:12', NULL, 1243587064, 2130706433),
(513, 1, 9, 6, 'Undefined variable: colophon in system/themes/fadein/colophon.php:10', NULL, 1243587422, 2130706433),
(514, 1, 9, 6, 'Undefined variable: colophon in system/themes/fadein/colophon.php:11', NULL, 1243587422, 2130706433),
(515, 1, 9, 6, 'Array to string conversion in system/themes/fadein/colophon.php:11', NULL, 1243587944, 2130706433),
(516, 1, 9, 6, 'Array to string conversion in system/themes/fadein/colophon.php:11', NULL, 1243587945, 2130706433),
(517, 1, 3, 3, 'Successful login for admin', NULL, 1243591468, 2130706433),
(518, 1, 9, 6, 'Undefined variable: latest in user/themes/fadein/latestposts.php:8', NULL, 1243592835, 2130706433),
(519, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593191, 2130706433),
(520, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593191, 2130706433),
(521, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593191, 2130706433),
(522, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593191, 2130706433),
(523, 1, 4, 3, 'New post 2 (archivesphp);  Type: page; Status: published', NULL, 1243593191, 2130706433),
(524, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593191, 2130706433),
(525, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593191, 2130706433),
(526, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593191, 2130706433),
(527, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593191, 2130706433),
(528, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593225, 2130706433),
(529, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593225, 2130706433),
(530, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593225, 2130706433),
(531, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593225, 2130706433),
(532, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593446, 2130706433),
(533, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593446, 2130706433),
(534, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593446, 2130706433),
(535, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593446, 2130706433),
(536, 1, 4, 3, 'Post 2 (archivesphp) deleted.', NULL, 1243593452, 2130706433),
(537, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593472, 2130706433),
(538, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593472, 2130706433),
(539, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593472, 2130706433),
(540, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593472, 2130706433),
(541, 1, 4, 3, 'New post 3 (archives);  Type: page; Status: published', NULL, 1243593472, 2130706433),
(542, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593472, 2130706433),
(543, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243593472, 2130706433),
(544, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243593472, 2130706433),
(545, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243593472, 2130706433),
(546, 1, 6, 4, 'Activated Plugin: Auto-Approve', NULL, 1243595001, 2130706433),
(547, 1, 6, 4, 'Activated Plugin: Comment Notifier', NULL, 1243595008, 2130706433),
(548, 1, 6, 4, 'Activated Plugin: DeliciousFeed', NULL, 1243595021, 2130706433),
(549, 1, 6, 4, 'Activated Plugin: Google Code Prettify', NULL, 1243595123, 2130706433),
(550, 1, 6, 4, 'Activated Plugin: markUp', NULL, 1243595159, 2130706433),
(551, 1, 6, 4, 'Activated Plugin: GoogleAnalytics', NULL, 1243595188, 2130706433),
(552, 1, 6, 4, 'Activated Plugin: GoogleAnalytics', NULL, 1243595188, 2130706433),
(553, 1, 6, 4, 'Activated Plugin: IncomingLinks', NULL, 1243595196, 2130706433),
(554, 1, 4, 3, 'New tag 2 (code);  Slug: code', NULL, 1243595285, 2130706433),
(555, 1, 4, 3, 'New tag 3 (test);  Slug: test', NULL, 1243595285, 2130706433),
(556, 1, 4, 3, 'New post 4 (post);  Type: entry; Status: published', NULL, 1243595285, 2130706433),
(557, 1, 10, 3, 'Comment by ahsanity automatically approved.', NULL, 1243595862, 2130706433),
(558, 1, 9, 6, 'file_get_contents(/var/www/syamantics/user/cache/71faaca8816255d60dc65efbb927f74c.891eb5d009f9ced1efcd227bc85209f9.cache) [<a href=''function.file-get-contents''>function.file-get-contents</a>]: failed to open stream: No such file or directory in system/c', NULL, 1243599222, 2130706433),
(559, 1, 6, 4, 'Deactivated Plugin: DeliciousFeed', NULL, 1243601001, 2130706433),
(560, 1, 3, 3, 'Successful login for admin', NULL, 1243612336, 2130706433),
(561, 1, 10, 3, 'Comment by admin automatically approved.', NULL, 1243612491, 2130706433),
(562, 1, 3, 3, 'Successful login for admin', NULL, 1243621265, 2130706433),
(563, 1, 3, 3, 'Successful login for admin', NULL, 1243631126, 2130706433),
(564, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243638864, 2130706433),
(565, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243638864, 2130706433),
(566, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243638864, 2130706433),
(567, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243638864, 2130706433),
(568, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243639673, 2130706433),
(569, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243639673, 2130706433),
(570, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243639673, 2130706433),
(571, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243639673, 2130706433),
(572, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243639673, 2130706433),
(573, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:477', NULL, 1243639673, 2130706433),
(574, 1, 9, 6, 'PDOStatement::execute() [<a href=''pdostatement.execute''>pdostatement.execute</a>]: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right s', NULL, 1243639673, 2130706433),
(575, 1, 9, 6, 'Invalid argument supplied for foreach() in system/classes/post.php:526', NULL, 1243639673, 2130706433);

-- --------------------------------------------------------

--
-- Table structure for table `habari__log_types`
--

CREATE TABLE IF NOT EXISTS `habari__log_types` (
  `id` int(11) NOT NULL auto_increment,
  `module` varchar(100) collate utf8_unicode_ci NOT NULL,
  `type` varchar(100) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `module_type` (`module`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `habari__log_types`
--

INSERT INTO `habari__log_types` (`id`, `module`, `type`) VALUES
(1, 'habari', 'default'),
(2, 'habari', 'user'),
(3, 'habari', 'authentication'),
(4, 'habari', 'content'),
(5, 'habari', 'comment'),
(6, 'habari', 'plugin'),
(7, 'Pingback', 'Pingback'),
(8, 'habari', 'theme'),
(9, 'Error', 'default'),
(10, 'autoapprove', 'autoapprove');

-- --------------------------------------------------------

--
-- Table structure for table `habari__object_terms`
--

CREATE TABLE IF NOT EXISTS `habari__object_terms` (
  `object_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `object_type_id` int(11) NOT NULL,
  PRIMARY KEY  (`object_id`,`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__object_terms`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__object_types`
--

CREATE TABLE IF NOT EXISTS `habari__object_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `habari__object_types`
--

INSERT INTO `habari__object_types` (`id`, `name`) VALUES
(1, 'post');

-- --------------------------------------------------------

--
-- Table structure for table `habari__options`
--

CREATE TABLE IF NOT EXISTS `habari__options` (
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `type` smallint(5) unsigned NOT NULL default '0',
  `value` text collate utf8_unicode_ci,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__options`
--

INSERT INTO `habari__options` (`name`, `type`, `value`) VALUES
('installed', 0, '1'),
('title', 0, 'syamantics dot com'),
('base_url', 0, '/'),
('pagination', 0, '5'),
('atom_entries', 0, '5'),
('theme_name', 0, 'FadeIn'),
('theme_dir', 0, 'fadein'),
('comments_require_id', 0, '1'),
('locale', 0, 'en-us'),
('timezone', 0, 'Asia/Dacca'),
('dateformat', 0, 'Y-m-d'),
('timeformat', 0, 'g:i a'),
('GUID', 0, 'f58e58b64c1b7d0119affb7fcc946b91373e92dd'),
('db_version', 0, '3249'),
('active_plugins', 1, 'a:19:{i:0;s:58:"/system/plugins/coredashmodules/coredashmodules.plugin.php";i:2;s:44:"/system/plugins/pingback/pingback.plugin.php";i:3;s:50:"/system/plugins/spamchecker/spamchecker.plugin.php";i:4;s:50:"/system/plugins/themehelper/themehelper.plugin.php";i:5;s:44:"/system/plugins/undelete/undelete.plugin.php";i:7;s:54:"/user/plugins/twitter_avatar/twitter_avatar.plugin.php";i:8;s:46:"/user/plugins/flickrfeed/flickrfeed.plugin.php";i:9;s:42:"/user/plugins/colophon/colophon.plugin.php";i:10;s:42:"/user/plugins/tagcloud/tagcloud.plugin.php";i:11;s:58:"/user/plugins/monthly_archives/monthly_archives.plugin.php";i:12;s:42:"/user/plugins/gravatar/gravatar.plugin.php";i:13;s:54:"/user/plugins/recentcomments/recentcomments.plugin.php";i:14;s:40:"/user/plugins/twitter/twitter.plugin.php";i:15;s:48:"/user/plugins/autoapprove/autoapprove.plugin.php";i:16;s:58:"/user/plugins/comment_notifier/comment_notifier.plugin.php";i:18;s:66:"/user/plugins/google-code-prettify/google-code-prettify.plugin.php";i:19;s:38:"/user/plugins/markup/markup.plugin.php";i:20;s:56:"/user/plugins/googleanalytics/googleanalytics.plugin.php";i:21;s:54:"/user/plugins/incoming_links/incoming_links.plugin.php";}'),
('cron_running', 0, ''),
('undelete__style', 0, '#primarycontent .deleted { background-color: #933; text-decoration: line-through; }'),
('next_cron', 0, '1243642189'),
('twitter__hide_replies', 0, '0'),
('twitter__linkify_urls', 0, '1'),
('twitter__hashtags_query', 0, 'http://hashtags.org/search?query='),
('twitter__limit', 0, '1'),
('twitter__username', 0, 'anupom'),
('twitter__password', 0, 'null'),
('twitter__post_status', 0, ''),
('twitter__prepend', 0, 'New Blog Post:'),
('twitter__show', 0, '1'),
('twitter__cache', 0, ''),
('twitter_avatar__cache_expire', 0, '24'),
('twitter_avatar__default_icon', 0, ''),
('twitter_avatar__fallback_gravatar', 0, '1'),
('flickrfeed__type', 0, 'public'),
('flickrfeed__user_id', 0, '24280218@N05'),
('flickrfeed__num_item', 0, '6'),
('flickrfeed__size', 0, 'square'),
('flickrfeed__tags', 0, 'monkey'),
('flickrfeed__cache_expiry', 0, '1800'),
('colophon__title', 0, 'about me'),
('colophon__text', 0, 'i live in a cave, i love monkeys, ruby, js, techy talks and clean code, i am an irregular blogger and a full-time hardcore coder. my name''s anupom syam - if that matters.'),
('tagcloud__num_tag', 0, ''),
('tagcloud__hide_tags', 0, ''),
('tagcloud__tag_by_color', 0, 'Y'),
('tagcloud__least_color', 0, '#444444'),
('tagcloud__most_color', 0, '#cccccc'),
('tagcloud__tag_by_size', 0, 'Y'),
('tagcloud__least_size', 0, '80'),
('tagcloud__most_size', 0, '250'),
('tagcloud__font_unit', 0, '%'),
('recentcomments__title', 0, 'Recent Comments'),
('recentcomments__format', 0, '[[user]] on [[post]]'),
('recentcomments__dateformat', 0, 'Mj n:ia'),
('recentcomments__count', 0, '5'),
('tagline', 0, '<span>puts</span> <strong>@anupom</strong><span>.</span>to_s'),
('pingback_send', 0, '1'),
('system_locale', 0, ''),
('dashboard__hide_spam_count', 0, ''),
('log_backtraces', 0, ''),
('archives__detail__view', 0, 'Y'),
('archives__num__month', 0, ''),
('archives__display__month', 0, 'F'),
('archives__show__count', 0, 'N'),
('archives__delimiter', 0, ''),
('deliciousfeed__user_id', 0, 'anupom'),
('deliciousfeed__tags', 0, ''),
('deliciousfeed__num_item', 0, '10'),
('deliciousfeed__cache_expiry', 0, '1800'),
('googlecodeprettify__color_scheme', 0, 'Twilight'),
('Markup__markup_type', 0, 'html'),
('Markup__skin', 0, 'simple'),
('googleanalytics__clientcode', 0, 'UA-6165855-1'),
('googleanalytics__loggedintoo', 0, ''),
('googleanalytics__trackoutgoing', 0, ''),
('googleanalytics__trackmailto', 0, ''),
('googleanalytics__trackfiles', 0, ''),
('googleanalytics__trackfiles_extensions', 0, ''),
('googleanalytics__cache', 0, ''),
('gravatar__default', 0, 'http://en.gravatar.com/userimage/298319/df81a10b42bc436576512565e2aa0abc.png'),
('gravatar__size', 0, '80'),
('gravatar__rating', 0, 'G');

-- --------------------------------------------------------

--
-- Table structure for table `habari__post_tokens`
--

CREATE TABLE IF NOT EXISTS `habari__post_tokens` (
  `post_id` int(10) unsigned NOT NULL,
  `token_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`post_id`,`token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__post_tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__postinfo`
--

CREATE TABLE IF NOT EXISTS `habari__postinfo` (
  `post_id` int(10) unsigned NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `type` smallint(5) unsigned NOT NULL default '0',
  `value` text collate utf8_unicode_ci,
  PRIMARY KEY  (`post_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__postinfo`
--

INSERT INTO `habari__postinfo` (`post_id`, `name`, `type`, `value`) VALUES
(4, 'comments_disabled', 0, ''),
(3, 'comments_disabled', 0, ''),
(4, 'prior_status', 0, '2'),
(1, 'prior_status', 0, '2');

-- --------------------------------------------------------

--
-- Table structure for table `habari__posts`
--

CREATE TABLE IF NOT EXISTS `habari__posts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `slug` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content_type` smallint(5) unsigned NOT NULL,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `guid` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content` longtext collate utf8_unicode_ci NOT NULL,
  `cached_content` longtext collate utf8_unicode_ci NOT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `pubdate` int(10) unsigned NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`(80))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `habari__posts`
--

INSERT INTO `habari__posts` (`id`, `slug`, `content_type`, `title`, `guid`, `content`, `cached_content`, `user_id`, `status`, `pubdate`, `updated`, `modified`) VALUES
(1, 'habari', 1, 'Habari', 'tag:localhost,2009:habari/1243546194', 'This site is running <a href="http://habariproject.org/">Habari</a>, a state-of-the-art publishing platform!  Habari is a community-driven project created and supported by people from all over the world.  Please visit <a href="http://habariproject.org/">http://habariproject.org/</a> to find out more!', '', 1, 4, 1243546194, 1243546194, 1243639673),
(3, 'archives', 2, 'archives', 'tag:localhost,2009:archives/1243593472', '<?php $theme->monthly_archives(); ?>', '', 1, 2, 1243593457, 1243593472, 1243638864),
(4, 'post', 1, 'Code Test', 'tag:localhost,2009:post/1243595285', 'this is a simple test\r\n<pre class="prettyprint">\r\na = ''ddd''\r\ndef b\r\n  puts ''hi''\r\nend\r\nputs @anupom.to_s\r\n</pre>\r\n\r\n<code>\r\na = ''ddd''\r\ndef b\r\n  puts ''hi''\r\nend\r\n</code>', '', 1, 4, 1243595235, 1243595285, 1243639673);

-- --------------------------------------------------------

--
-- Table structure for table `habari__poststatus`
--

CREATE TABLE IF NOT EXISTS `habari__poststatus` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `internal` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `habari__poststatus`
--

INSERT INTO `habari__poststatus` (`id`, `name`, `internal`) VALUES
(1, 'draft', 0),
(2, 'published', 0),
(3, 'scheduled', 1),
(4, 'deleted', 1);

-- --------------------------------------------------------

--
-- Table structure for table `habari__posttype`
--

CREATE TABLE IF NOT EXISTS `habari__posttype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `active` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `habari__posttype`
--

INSERT INTO `habari__posttype` (`id`, `name`, `active`) VALUES
(1, 'entry', 1),
(2, 'page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `habari__rewrite_rules`
--

CREATE TABLE IF NOT EXISTS `habari__rewrite_rules` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `parse_regex` varchar(255) collate utf8_unicode_ci NOT NULL,
  `build_str` varchar(255) collate utf8_unicode_ci NOT NULL,
  `handler` varchar(255) collate utf8_unicode_ci NOT NULL,
  `action` varchar(255) collate utf8_unicode_ci NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  `is_active` smallint(5) unsigned NOT NULL default '0',
  `rule_class` smallint(5) unsigned NOT NULL default '0',
  `description` text collate utf8_unicode_ci,
  `parameters` text collate utf8_unicode_ci,
  PRIMARY KEY  (`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `habari__rewrite_rules`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__sessions`
--

CREATE TABLE IF NOT EXISTS `habari__sessions` (
  `token` varchar(255) collate utf8_unicode_ci NOT NULL,
  `subnet` int(11) NOT NULL default '0',
  `expires` int(10) unsigned NOT NULL default '0',
  `ua` varchar(255) collate utf8_unicode_ci NOT NULL,
  `data` mediumtext collate utf8_unicode_ci,
  `user_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__sessions`
--

INSERT INTO `habari__sessions` (`token`, `subnet`, `expires`, `ua`, `data`, `user_id`) VALUES
('4e598e5b124be805444ddf0b7808ecbd', 127, 1243640031, 'Habari/0.6.2', '', NULL),
('4678852cd0b04d61673010c22272c8e8', 127, 1243641113, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.10) Gecko/2009042523 Ubuntu/8.10 (intrepid) Firefox/3.0.10', 'user_id|s:1:"1";comments_allowed|a:10:{i:0;s:10:"2cba25ca49";i:1;s:10:"2cba25ca49";i:2;s:10:"2cba25ca49";i:3;s:10:"2cba25ca49";i:4;s:10:"2cba25ca49";i:5;s:10:"2cba25ca49";i:6;s:10:"2cba25ca49";i:7;s:10:"2cba25ca49";i:8;s:10:"2cba25ca49";i:9;s:10:"2cba25ca49";}user_token_access|a:1:{i:1;a:5:{i:17;i:15;i:3;i:15;i:16;i:15;i:18;i:15;i:19;i:15;}}user_tokens|a:1:{i:1;a:2:{s:4:"read";a:0:{}s:4:"deny";a:0:{}}}', 1),
('17a9d9bc17ffbe8ab5c104c692169b5a', 127, 1243636389, 'Habari/0.6.2', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `habari__tag2post`
--

CREATE TABLE IF NOT EXISTS `habari__tag2post` (
  `tag_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`tag_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__tag2post`
--

INSERT INTO `habari__tag2post` (`tag_id`, `post_id`) VALUES
(1, 1),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `habari__tags`
--

CREATE TABLE IF NOT EXISTS `habari__tags` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tag_text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `tag_slug` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tag_slug` (`tag_slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `habari__tags`
--

INSERT INTO `habari__tags` (`id`, `tag_text`, `tag_slug`) VALUES
(1, 'habari', 'habari'),
(2, 'code', 'code'),
(3, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `habari__terms`
--

CREATE TABLE IF NOT EXISTS `habari__terms` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `term` varchar(255) collate utf8_unicode_ci NOT NULL,
  `term_display` varchar(255) collate utf8_unicode_ci NOT NULL,
  `vocabulary_id` int(10) unsigned NOT NULL,
  `mptt_left` int(10) unsigned NOT NULL,
  `mptt_right` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `habari__terms`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__tokens`
--

CREATE TABLE IF NOT EXISTS `habari__tokens` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `token_type` int(10) unsigned NOT NULL default '0',
  `token_group` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `habari__tokens`
--

INSERT INTO `habari__tokens` (`id`, `name`, `description`, `token_type`, `token_group`) VALUES
(3, 'super_user', 'Permissions for super users', 0, 'Super User'),
(4, 'manage_all_comments', 'Manage comments on all posts', 0, 'Administration'),
(5, 'manage_own_post_comments', 'Manage comments on one''s own posts', 0, 'Administration'),
(6, 'manage_tags', 'Manage tags', 0, 'Administration'),
(7, 'manage_options', 'Manage options', 0, 'Administration'),
(8, 'manage_theme', 'Change theme', 0, 'Administration'),
(9, 'manage_theme_config', 'Configure the active theme', 0, 'Administration'),
(10, 'manage_plugins', 'Activate/deactivate plugins', 0, 'Administration'),
(11, 'manage_plugins_config', 'Configure active plugins', 0, 'Administration'),
(12, 'manage_import', 'Use the importer', 0, 'Administration'),
(13, 'manage_users', 'Add, remove, and edit users', 0, 'Administration'),
(14, 'manage_groups', 'Manage groups and permissions', 0, 'Administration'),
(15, 'manage_logs', 'Manage logs', 0, 'Administration'),
(16, 'own_posts', 'Permissions on one''s own posts', 1, 'Content'),
(17, 'post_any', 'Permissions to all posts', 1, 'Content'),
(18, 'post_entry', 'Permissions to posts of type "entry"', 1, 'Content'),
(19, 'post_page', 'Permissions to posts of type "page"', 1, 'Content'),
(20, 'comment', 'Make comments on any post', 0, 'Comments');

-- --------------------------------------------------------

--
-- Table structure for table `habari__user_token_permissions`
--

CREATE TABLE IF NOT EXISTS `habari__user_token_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `token_id` int(10) unsigned NOT NULL,
  `access_mask` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`user_id`,`token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__user_token_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `habari__userinfo`
--

CREATE TABLE IF NOT EXISTS `habari__userinfo` (
  `user_id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `type` smallint(5) unsigned NOT NULL default '0',
  `value` text collate utf8_unicode_ci,
  PRIMARY KEY  (`user_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `habari__userinfo`
--

INSERT INTO `habari__userinfo` (`user_id`, `name`, `type`, `value`) VALUES
(1, 'locale_tz', 0, 'UTC'),
(1, 'locale_date_format', 0, 'Y-m-d'),
(1, 'locale_time_format', 0, 'g:i a'),
(1, 'dash_modules', 1, 'a:2:{i:1;s:15:"Latest Comments";i:2;s:14:"Incoming Links";}'),
(1, 'authenticate_time', 0, '2009-05-30 03:05:26'),
(1, 'experience_level', 0, 'user'),
(1, 'displayname', 0, 'anupom syam');

-- --------------------------------------------------------

--
-- Table structure for table `habari__users`
--

CREATE TABLE IF NOT EXISTS `habari__users` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `username` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `password` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `habari__users`
--

INSERT INTO `habari__users` (`id`, `username`, `email`, `password`) VALUES
(1, 'anupom', 'anupom.syam@gmail.com', '{SSHA512}ADKUYKaVMdKFiT0lZoQnd1GeCvJ2mzHDtrfmVXLrAhqUTRQe1t4zEtcbBVgZpfr84GI37NOoMKEVGQdvKmmCZg2j0CI=');

-- --------------------------------------------------------

--
-- Table structure for table `habari__users_groups`
--

CREATE TABLE IF NOT EXISTS `habari__users_groups` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_group` (`user_id`,`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `habari__users_groups`
--

INSERT INTO `habari__users_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 1, 1),
(3, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `habari__vocabularies`
--

CREATE TABLE IF NOT EXISTS `habari__vocabularies` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci,
  `hierarchical` tinyint(1) unsigned NOT NULL default '0',
  `required` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `habari__vocabularies`
--

