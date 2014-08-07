-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema online_quiz
--

CREATE DATABASE IF NOT EXISTS online_quiz;
USE online_quiz;

--
-- Definition of table `student_question`
--

DROP TABLE IF EXISTS `student_question`;
CREATE TABLE `student_question` (
  `question` int(11) default NULL,
  `student` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_question`
--

/*!40000 ALTER TABLE `student_question` DISABLE KEYS */;
INSERT INTO `student_question` (`question`,`student`) VALUES 
 (1,'keith'),
 (2,'keith'),
 (1,'kt'),
 (2,'kt');
/*!40000 ALTER TABLE `student_question` ENABLE KEYS */;


--
-- Definition of table `tbl_question`
--

DROP TABLE IF EXISTS `tbl_question`;
CREATE TABLE `tbl_question` (
  `id` int(10) NOT NULL auto_increment,
  `question` text,
  `answer_correct` text,
  `answer_incorrect_1` text,
  `answer_incorrect_2` text,
  `answer_incorrect_3` text,
  `image` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_question`
--

/*!40000 ALTER TABLE `tbl_question` DISABLE KEYS */;
INSERT INTO `tbl_question` (`id`,`question`,`answer_correct`,`answer_incorrect_1`,`answer_incorrect_2`,`answer_incorrect_3`,`image`) VALUES 
 (1,'What is means by DBMS?','Database Management System','Database System','Database','Database Systems','1.jpg'),
 (2,'J2EE Stands for?','Java Enterprise Eddition','Java Eddition','Java Enterprise Beans','Java For Mobile',NULL),
 (5,'J2SE Stands for?','Java Standard Eddition','Java Eddition','Java Enterprise Beans','Java For Mobile',NULL);
/*!40000 ALTER TABLE `tbl_question` ENABLE KEYS */;


--
-- Definition of table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` text,
  `user_password` text,
  `user_type` text,
  `score` int(11) default NULL,
  `total_questions` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`id`,`user_name`,`user_password`,`user_type`,`score`,`total_questions`) VALUES 
 (1,'keith','keith','student',2,2),
 (2,'kt','12345','student',2,2),
 (3,'teacher1','12345','teacher',0,0);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
