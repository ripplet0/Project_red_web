

CREATE DATABASE /*!32312 IF NOT EXISTS*/`red_app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `red_app`;

/*Table structure for table `blood_bank` */

DROP TABLE IF EXISTS `blood_bank`;

CREATE TABLE `blood_bank` (
  `bld_bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) DEFAULT NULL,
  `place` varchar(250) DEFAULT NULL,
  `pin_no` varchar(250) DEFAULT NULL,
  `Phoneno` varchar(250) DEFAULT NULL,
  `blood_group` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`bld_bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `blood_bank` */

insert  into `blood_bank`(`bld_bank_id`,`Name`,`place`,`pin_no`,`Phoneno`,`blood_group`) values (1,'wefs','cc','222','123','b+');

/*Table structure for table `camp` */

DROP TABLE IF EXISTS `camp`;

CREATE TABLE `camp` (
  `camp_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_bank_id` int(11) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`camp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `camp` */

/*Table structure for table `donor` */

DROP TABLE IF EXISTS `donor`;

CREATE TABLE `donor` (
  `donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `donor` */

insert  into `donor`(`donor_id`,`donor_name`,`blood_group`,`phone`,`address`,`email`) values (2,'rahul','b+',0,'gduasgdua','abc@gmail.com'),(3,'dd','a+',9349328,'wfsfsfs','dds@mail'),(4,'eewrw',NULL,543545,'ret','dasd@mail'),(5,'ewwe','b+',0,'ewqe','ww@mail');

/*Table structure for table `donor_request` */

DROP TABLE IF EXISTS `donor_request`;

CREATE TABLE `donor_request` (
  `donor_request_id` int(11) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `donor_request_details` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `donor_request` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) DEFAULT NULL,
  `feedbacks` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`feedbacks`,`user_id`,`feedback_date`) values (2,'Wow this  is awsome',3,'0002-02-22');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_Id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(2,'abc','123','donor'),(3,'djk','1','donor');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stock_id` int(11) DEFAULT NULL,
  `blood_bank_id` int(11) DEFAULT NULL,
  `stock_details` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`gender`,`phone`,`address`,`email`) values (1,'abc','male',6,'n','hf');

/*Table structure for table `user_request` */

DROP TABLE IF EXISTS `user_request`;

CREATE TABLE `user_request` (
  `user_request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_details` varchar(200) DEFAULT NULL,
  `blood_bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

