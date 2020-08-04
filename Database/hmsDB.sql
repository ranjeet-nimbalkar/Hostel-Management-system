/*
MySQL Backup
Database: hms
Backup Time: 2020-08-04 20:39:55
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `hms`.`application`;
DROP TABLE IF EXISTS `hms`.`hostel`;
DROP TABLE IF EXISTS `hms`.`message`;
DROP TABLE IF EXISTS `hms`.`roomdetails`;
DROP TABLE IF EXISTS `hms`.`rooms`;
DROP TABLE IF EXISTS `hms`.`staff`;
DROP TABLE IF EXISTS `hms`.`student`;
DROP PROCEDURE IF EXISTS `hms`.`Signup`;
DROP PROCEDURE IF EXISTS `hms`.`admin_login`;
DROP PROCEDURE IF EXISTS `hms`.`login_user`;
DROP PROCEDURE IF EXISTS `hms`.`submit_application`;
CREATE TABLE `application` (
  `ApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `HostelID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `Application_status` tinyint(1) NOT NULL DEFAULT '1',
  `Message` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StaffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApplicationID`) USING BTREE,
  KEY `fk_application_student_1` (`StudentID`) USING BTREE,
  KEY `fk_application_rooms_1` (`RoomID`) USING BTREE,
  CONSTRAINT `fk_application_rooms_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms` (`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_application_student_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9852 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `hostel` (
  `HostelID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelName` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HostelType` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ContactNo` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_of_vacantRooms` int(3) NOT NULL DEFAULT '5',
  `no_of_totalRooms` int(3) NOT NULL DEFAULT '5',
  `BookingStatus` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`HostelID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=222234 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `message` (
  `msgID` int(10) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `hostelID` int(10) DEFAULT NULL,
  `subject` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `msg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reciverID` int(11) DEFAULT NULL,
  PRIMARY KEY (`msgID`) USING BTREE,
  KEY `hostel_id` (`hostelID`) USING BTREE,
  KEY `fk_message_Rooms_1` (`RoomID`) USING BTREE,
  CONSTRAINT `fk_message_Rooms_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms` (`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `roomdetails` (
  `Allocation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `AllocatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Rental_Prtiod` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Allocation_ID`) USING BTREE,
  KEY `fk_RoomAllotment_Student_1` (`StudentID`) USING BTREE,
  KEY `fk_RoomAllotment_Rooms_1` (`RoomID`) USING BTREE,
  CONSTRAINT `fk_RoomAllotment_Rooms_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms` (`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_RoomAllotment_Student_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `rooms` (
  `RoomID` int(11) NOT NULL,
  `HostelID` int(11) NOT NULL,
  `RoomName` int(4) NOT NULL,
  `StudentCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoomID`) USING BTREE,
  KEY `fk_Rooms_Hostel_1` (`HostelID`) USING BTREE,
  CONSTRAINT `fk_Rooms_Hostel_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`HostelID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) NOT NULL,
  `FirstName` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MiddleName` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastName` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Username` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contactNo` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dob` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Gender` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Address` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Role` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`StaffID`) USING BTREE,
  KEY `fk_Staff_Hostel_1` (`HostelID`) USING BTREE,
  CONSTRAINT `fk_Staff_Hostel_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`HostelID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastName` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dob` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ContactNo` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Address` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ParentContact` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Gender` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111139 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Signup`(IN fname varchar(25), IN lname varchar(25),IN psword varchar(20),
IN dob varchar(20), IN cno varchar(15),IN address varchar(30),IN pcno varchar(15), IN gender varchar(15),IN email varchar(50),OUT op_id int(11))
BEGIN
INSERT INTO `student`( `FirstName`, `LastName`, `Password`, `dob`, `ContactNo`, `Address`, `ParentContact`, `Gender`, `Email`) 
VALUES(fname,lname,psword,dob,cno,address,pcno,gender,email);

select MAX(StudentID) into op_id from `student`;
select op_id;
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_login`(IN v_user VARCHAR(16),IN v_pass varchar(15))
begin


DECLARE op_id int;

SELECT StaffID INTO op_id FROM staff where  Username=v_user and `Password`=v_pass;

IF op_id >101 THEN
		SELECT
hostel.HostelID,hostel.HostelName,hostel.HostelType,hostel.ContactNo,hostel.no_of_vacantRooms,hostel.no_of_totalRooms,
 staff.StaffID,staff.FirstName,staff.MiddleName,staff.LastName,staff.contactNo,staff.dob,staff.Email,staff.Gender,
 staff.Address,staff.Role FROM staff
 INNER JOIN hostel ON staff.HostelID = hostel.HostelID WHERE staff.StaffID=op_id;
ELSE
		select 999;
END IF;


END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_user`(IN v_user int(11),IN v_pass varchar(15))
begin

DECLARE op_gender VARCHAR(10);
DECLARE op_id int;

SELECT StudentID INTO op_id FROM student where  StudentID=v_user and `Password`=v_pass;


        IF op_id >100  THEN
             SELECT student.StudentID, FirstName, LastName, Gender, Email, rooms.RoomID, rooms.HostelID, RoomName, HostelName 
			       FROM student 
             LEFT JOIN roomdetails ON roomdetails.StudentID = student.StudentID
             LEFT JOIN rooms ON roomdetails.RoomID = rooms.RoomID
					 	 LEFT JOIN hostel ON rooms.HostelID = hostel.HostelID WHERE student.StudentID=op_id;
                ELSE
          select 999;
    END IF;

END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_application`(IN stud_id int(11), IN hostel_id int(11),IN roomID varchar(11),
IN text varchar(80), IN psw varchar(16))
BEGIN


DECLARE op_id int;

SELECT StudentID INTO op_id FROM student where  StudentID=stud_id and `Password`=psw;

IF op_id = stud_id THEN
	INSERT INTO `application`( `StudentID`, `HostelID`, `RoomID`, `Message`)  
	VALUES(stud_id,hostel_id,roomID,text);
	select 'done';
ELSE
	select 'fail';
END IF;
END;
BEGIN;
LOCK TABLES `hms`.`application` WRITE;
DELETE FROM `hms`.`application`;
INSERT INTO `hms`.`application` (`ApplicationID`,`StudentID`,`HostelID`,`RoomID`,`Application_status`,`Message`,`Date`,`StaffID`) VALUES (9845, 111129, 222222, 7890, 2, 'say something', '2019-10-06 17:35:22', 112),(9846, 111130, 222222, 7890, 2, 'say something', '2019-10-15 09:11:23', 112),(9847, 111131, 222223, 7895, 2, 'I HAVE PAID ALL THE HOSTEL FEES PLZ ALLOW IN HOSTEL KAVERI...!!!', '2019-10-15 19:46:17', 111),(9848, 111134, 222223, 7895, 2, 'helo', '2019-10-16 09:06:25', 111),(9849, 111135, 222223, 7895, 2, 'ok', '2019-10-17 10:42:00', 111),(9850, 111137, 222222, 7890, 1, 'eee', '2019-10-24 15:27:40', NULL),(9851, 111138, 222223, 7895, 2, 'guyguy', '2019-10-24 15:43:43', 111);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`hostel` WRITE;
DELETE FROM `hms`.`hostel`;
INSERT INTO `hms`.`hostel` (`HostelID`,`HostelName`,`HostelType`,`ContactNo`,`no_of_vacantRooms`,`no_of_totalRooms`,`BookingStatus`) VALUES (222222, 'TORNA', 'Female', '9834881607', 6, 10, 'AVAILABLE'),(222223, 'KAVERI', 'Male', '7066323990', 4, 10, 'AVAILABLE'),(222224, 'Pochinki', 'Male', '8876989987', 8, 10, 'AVAILABLE'),(222225, 'Milta', 'Male', '7778987809', 2, 10, 'AVAILABLE'),(222226, 'Pekado', 'Male', '8887723533', 3, 10, 'AVAILABLE'),(222227, 'Yasnaya', 'Male', '9988334422', 4, 10, 'AVAILABLE'),(222228, 'Shelter', 'Male', '9890098985', 1, 10, 'AVAILABLE'),(222229, 'Rangoli', 'Female', '7867986789', 5, 10, 'AVAILABLE'),(222230, 'Rajgad', 'Female', '7867898755', 5, 5, 'AVAILABLE'),(222231, 'Patil', 'Female', '8978987896', 5, 5, 'AVAILABLE'),(222232, 'Shrichaitanya', 'Female', '7977879990', 5, 5, 'AVAILABLE'),(222233, 'Mane', 'Female', '9865908906', 5, 5, 'AVAILABLE');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`message` WRITE;
DELETE FROM `hms`.`message`;
INSERT INTO `hms`.`message` (`msgID`,`senderID`,`RoomID`,`hostelID`,`subject`,`message`,`msg_date`,`reciverID`) VALUES (4, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 13:59:25', NULL),(5, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 13:59:25', NULL),(6, 111, 7895, 222223, 'Room Allocation', 'Dear ', '2019-10-06 13:59:25', NULL),(7, 111, 7895, 222223, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 13:59:57', NULL),(8, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 14:00:38', NULL),(9, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 14:00:38', NULL),(10, 111, 7895, 222223, 'Room Allocation', 'Dear ', '2019-10-06 14:00:38', NULL),(11, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 15:35:50', NULL),(12, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 15:35:50', NULL),(13, 111, 7895, 222223, 'Room Allocation', 'Dear ', '2019-10-06 15:35:50', NULL),(14, 111, 7895, 222223, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 15:37:20', NULL),(15, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 15:37:48', NULL),(16, 111, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 15:37:48', NULL),(17, 111, 7895, 222223, 'Room Allocation', 'Dear ', '2019-10-06 15:37:48', NULL),(18, 111, 7895, 222223, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 15:42:15', NULL),(19, 111, 7890, 222222, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 15:42:20', NULL),(20, 111, 7890, 222222, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 15:42:23', NULL),(21, 111, 7895, 222223, 'Room Allocation', 'Dear ', '2019-10-06 15:43:02', NULL),(22, 112, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 15:59:57', NULL),(23, 112, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 16:12:29', NULL),(24, 112, 7890, 222222, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 17:15:24', NULL),(25, 112, 7890, 222222, 'Room Allocation', 'Dear ', '2019-10-06 17:27:36', 111129),(26, 112, 7890, 222222, 'Room Allocation', 'Dear uiu', '2019-10-06 17:31:03', 111129),(27, 112, 7890, 222222, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 17:31:09', NULL),(28, 112, 7890, 222222, 'Room Allocation', 'Dear uiu', '2019-10-06 17:31:13', 111129),(29, 112, 7890, 222222, 'Room Allocation', 'Dear , Your Application is Rejected!!We Are Sorry For That', '2019-10-06 17:35:18', NULL),(30, 112, 7890, 222222, 'Room Allocation', 'Dear Mrunmayi patil Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7890', '2019-10-06 17:35:22', 111129),(31, 112, 7890, 222222, 'Room Allocation', 'Dear Kiran Mahalle Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7890', '2019-10-15 09:11:23', 111130),(32, 111, 7895, 222223, 'Room Allocation', 'Dear ranjeet nimbalkar Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-15 19:46:17', 111131),(33, 111131, 7895, 222223, 'sss', 'jhhjhj', '2019-10-16 07:57:18', NULL),(34, 111131, 7895, 222223, 'sss', 'jhhjhj', '2019-10-16 07:57:21', NULL),(35, 111, 7895, 222223, 'Room Allocation', 'Dear mahesh anarse Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-16 09:06:25', 111134),(36, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:00', 111135),(37, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:05', 111135),(38, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:08', 111135),(39, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:13', 111135),(40, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:17', 111135),(41, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:20', 111135),(42, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:23', 111135),(43, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:26', 111135),(44, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:29', 111135),(45, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:34', 111135),(46, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:37', 111135),(47, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:40', 111135),(48, 111, 7895, 222223, 'Room Allocation', 'Dear aayush chirde Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-17 10:42:42', 111135),(49, 111131, 7895, 222223, 'testtt', 'testtt', '2019-10-24 12:13:35', NULL),(50, 111131, 7895, 222223, 'hii', 'sss', '2019-10-24 14:44:08', NULL),(51, 111, 7895, 222223, 'Room Allocation', 'Dear harshad yeola Congrachulations!! Your Aplicaton has been Aproved , Your Room ID is 7895', '2019-10-24 15:43:43', 111138);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`roomdetails` WRITE;
DELETE FROM `hms`.`roomdetails`;
INSERT INTO `hms`.`roomdetails` (`Allocation_ID`,`StudentID`,`RoomID`,`AllocatedDate`,`Rental_Prtiod`) VALUES (16, 111129, 7890, '2019-10-06 16:12:29', '1 Year'),(17, 111129, 7890, '2019-10-06 17:27:36', '1 Year'),(18, 111129, 7890, '2019-10-06 17:31:03', '1 Year'),(19, 111129, 7890, '2019-10-06 17:31:13', '1 Year'),(20, 111129, 7890, '2019-10-06 17:35:22', '1 Year'),(21, 111130, 7890, '2019-10-15 09:11:23', '1 Year'),(22, 111131, 7895, '2019-10-15 19:46:17', '1 Year'),(23, 111134, 7895, '2019-10-16 09:06:25', '1 Year'),(24, 111135, 7895, '2019-10-17 10:42:00', '1 Year'),(25, 111135, 7895, '2019-10-17 10:42:05', '1 Year'),(26, 111135, 7895, '2019-10-17 10:42:08', '1 Year'),(27, 111135, 7895, '2019-10-17 10:42:13', '1 Year'),(28, 111135, 7895, '2019-10-17 10:42:17', '1 Year'),(29, 111135, 7895, '2019-10-17 10:42:20', '1 Year'),(30, 111135, 7895, '2019-10-17 10:42:23', '1 Year'),(31, 111135, 7895, '2019-10-17 10:42:26', '1 Year'),(32, 111135, 7895, '2019-10-17 10:42:29', '1 Year'),(33, 111135, 7895, '2019-10-17 10:42:34', '1 Year'),(34, 111135, 7895, '2019-10-17 10:42:37', '1 Year'),(35, 111135, 7895, '2019-10-17 10:42:40', '1 Year'),(36, 111135, 7895, '2019-10-17 10:42:42', '1 Year'),(37, 111138, 7895, '2019-10-24 15:43:43', '1 Year');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`rooms` WRITE;
DELETE FROM `hms`.`rooms`;
INSERT INTO `hms`.`rooms` (`RoomID`,`HostelID`,`RoomName`,`StudentCount`) VALUES (7890, 222222, 101, 0),(7891, 222222, 102, 0),(7892, 222222, 103, 0),(7893, 222222, 104, 0),(7894, 222222, 105, 0),(7895, 222223, 101, 0),(7896, 222223, 102, 0),(7897, 222223, 103, 0),(7898, 222223, 104, 0),(7899, 222223, 105, 0),(7900, 222223, 106, 0),(7901, 222223, 107, 0),(7902, 222223, 108, 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`staff` WRITE;
DELETE FROM `hms`.`staff`;
INSERT INTO `hms`.`staff` (`StaffID`,`HostelID`,`FirstName`,`MiddleName`,`LastName`,`Username`,`Password`,`contactNo`,`dob`,`Email`,`Gender`,`Address`,`Role`) VALUES (111, 222223, 'MANAS', 'KAILAS', 'PATIL', 'manas', 'manas', '9078563412', '16/7/1999', 'manas@gmail.com', 'MALE', '12ABC', '123'),(112, 222222, 'MRUNMAYI', 'RAJU', 'PATIL', 'maru', 'maru', '983481609', '20/2/2000', 'maru@gmail.com', 'FEMALE', '21ABC', '124');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `hms`.`student` WRITE;
DELETE FROM `hms`.`student`;
INSERT INTO `hms`.`student` (`StudentID`,`FirstName`,`LastName`,`Password`,`dob`,`ContactNo`,`Address`,`ParentContact`,`Gender`,`Email`,`registrationDate`) VALUES (111111, 'Ajit', 'Shitole', '123', '04/04/1998', '9890098987', 'Pune', '123', 'Male', 'ajit@gmail.com', '2019-09-27 12:17:42'),(111112, 'a', 'b', '123', '20/2/2000', '9834881608', 'avc', '123', 'Female', 'abc@gmail.com', '2019-09-27 17:56:18'),(111113, 'A', 'B', 'ASD', '12', '123', 'QWE', 'QWE', 'MALE', 'QWE', '2019-09-27 19:05:36'),(111114, 'A', 'B', 'ASD', '12', '123', 'QWE', 'QWE', 'MALE', 'QWE', '2019-09-27 19:06:35'),(111115, '11', '11', '11', '11', '11', '11', '11', '11', '11', '2019-09-27 19:07:51'),(111116, 'A', 'B', 'ASD', '12', '123', 'QWE', 'QWE', 'MALE', 'QWE', '2019-09-27 19:09:51'),(111117, 'A', 'B', 'ASD', '12', '123', 'QWE', 'QWE', 'MALE', 'QWE', '2019-09-27 19:10:02'),(111118, 'f', 'sdb', '234', 'g', '9890098987', 'sfg', '9890098987', 'Male', 'sfd@gf.dfgr', '2019-09-27 19:16:42'),(111119, 'ytfr', 'ghfh', '123', 'sdgwe', '9890098987', 'sdfg', '9890098987', 'Male', 'ghf@fdh.vd', '2019-09-27 19:17:39'),(111120, 'hjefg', 'gfh', '123', 'sdfhg', '9890098987', 'sdhfg', '9890098987', 'Male', 'hgaf@gd.sgd', '2019-09-27 19:20:53'),(111121, 'hjefg', 'gfh', '123', 'sdfhg', '9890098987', 'sdhfg', '9890098987', 'Male', 'hgaf@gd.sgd', '2019-09-27 19:21:06'),(111122, 'ghf', 'ghf', '123', 'sg', '9890098987', 'asf', '9890098987', 'Male', 'gff@dfg.sdg', '2019-09-27 19:23:11'),(111123, 'shdfv', 'hsfv', 'hjfsh', 'hsdfjh', 'jfshj', 'jhdjhq', 'hfhj', 'jhqhjg', 'gweg', '2019-09-27 19:24:34'),(111124, 'ghf', 'ghf', '123', 'sg', '9890098987', 'asf', '9890098987', 'Male', 'gff@dfg.sdg', '2019-09-27 19:25:22'),(111125, 'hjsdf', 'hfbs', '123', 'sdf', '9890098987', 'dshgb', '9890098987', 'Male', 'hbs@gs.sdfb', '2019-09-27 19:26:12'),(111126, 'mrunmayi', 'patil', 'patil@123', '20/2/2000', '9834881607', 'ABC', 'patil@123', 'Female', 'mrunmayirpatil@gmail.com', '2019-10-04 17:51:37'),(111127, 'Mrunmayi', 'Patil', 'patil@123', '1/23/4556', '9812346782', 'ABC', '9812334567', 'Female', 'qnshj@gmail.com', '2019-10-04 17:56:05'),(111128, 'rajit1', 'nimbalkar', 'qwe', '12/1/1123', '9812345612', 'qwe', '9812345678', 'Male', 'ranhit@gmail.com', '2019-10-04 18:03:24'),(111129, 'Mrunmayi', 'patil', '123', '20/2/2000', '9834881607', 'qwe', '9834881607', 'Female', 'abc@gmail.com', '2019-10-06 15:44:32'),(111130, 'Kiran', 'Mahalle', 'kiran@123', '27/02/2000', '9876534278', 'pune', '9993546783', 'Female', 'kiranmahalle28@gmail.com', '2019-10-15 09:00:38'),(111131, 'ranjeet', 'nimbalkar', 'ranjit@3112', '31-12-1999', '9561439165', 'karjat', '9834799181', 'Male', 'ranjit.nimbalkar3112@gmail.com', '2019-10-15 18:58:28'),(111132, 'mrun', 'patil', '123', '1999-31-31', '9561439878', 'dhule', '9834799181', 'Female', 'hah@gmail.com', '2019-10-16 08:00:14'),(111133, 'mrun', 'patil', '123', '1999-31-31', '9561439878', 'dhule', '9834799181', 'Female', 'hah@gmail.com', '2019-10-16 08:00:30'),(111134, 'mahesh', 'anarse', '123', '1999-10-10', '9834799181', 'karjat', '9561439165', 'Male', 'ahah@gmail.com', '2019-10-16 09:05:10'),(111135, 'aayush', 'chirde', '123', '1999-30-30', '9561439165', 'yavtmal', '9834799181', 'Male', 'ac@gmail.com', '2019-10-17 10:36:28'),(111136, 'manas', 'patil', '123', '20/2/2000', '9834881607', 'manas', '9834881607', 'Male', 'manas@gmail.com', '2019-10-24 11:40:01'),(111137, 'payal', 'kamthe', '123', '1999-12-12', '9834799181', 'saswad', '9561439165', 'Female', 'jdj@gmail.com', '2019-10-24 15:27:18'),(111138, 'harshad', 'yeola', '123', '1999-12-12', '9834799181', 'kalwan', '9561439165', 'Male', 'harshad@gmail.com', '2019-10-24 15:42:05');
UNLOCK TABLES;
COMMIT;
