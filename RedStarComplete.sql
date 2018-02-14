-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Red_Star_FC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Red_Star_FC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Red_Star_FC` DEFAULT CHARACTER SET utf8 ;
USE `Red_Star_FC` ;

-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Customer` (
  `CustID` VARCHAR(5) NOT NULL,
  `CustFName` CHAR(15) NULL DEFAULT NULL,
  `CustLName` CHAR(15) NULL DEFAULT NULL,
  `CustAddr1` VARCHAR(30) NULL DEFAULT NULL,
  `CustAddr2` VARCHAR(30) NULL DEFAULT NULL,
  `CustEmail` VARCHAR(30) NULL DEFAULT NULL,
  `CustPhoneNo` INT(11) NULL DEFAULT NULL,
  `Member` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`CustID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Facility` (
  `FacilityID` VARCHAR(5) NOT NULL,
  `FacilityDesc` CHAR(15) NULL DEFAULT NULL,
  `Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`FacilityID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Staff` (
  `StaffID` VARCHAR(5) NOT NULL,
  `StaffFName` CHAR(15) NULL DEFAULT NULL,
  `StaffLName` CHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Booking` (
  `BookID` VARCHAR(5) NOT NULL,
  `BookDate` DATE NULL DEFAULT NULL,
  `BookSTime` TIME NULL DEFAULT NULL,
  `BookFTime` TIME NULL DEFAULT NULL,
  `CustID` VARCHAR(5) NOT NULL,
  `FacilityID` VARCHAR(5) NOT NULL,
  `StaffID` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`BookID`),
  INDEX `fk_Booking_Customer_idx` (`CustID` ASC),
  INDEX `fk_Booking_Facility1_idx` (`FacilityID` ASC),
  INDEX `fk_Booking_Staff1_idx` (`StaffID` ASC),
  CONSTRAINT `fk_Booking_Customer`
    FOREIGN KEY (`CustID`)
    REFERENCES `Red_Star_FC`.`Customer` (`CustID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Facility1`
    FOREIGN KEY (`FacilityID`)
    REFERENCES `Red_Star_FC`.`Facility` (`FacilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Red_Star_FC`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`MembershipType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`MembershipType` (
  `MemberTypeID` VARCHAR(5) NOT NULL,
  `MemberTypeDescr` VARCHAR(30) NULL DEFAULT NULL,
  `AnnualFee` DECIMAL(10,2) NULL DEFAULT NULL,
  `DueDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`MemberTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Member` (
  `MemberID` VARCHAR(5) NOT NULL,
  `MemberFName` CHAR(15) NULL DEFAULT NULL,
  `MemberLName` CHAR(15) NULL DEFAULT NULL,
  `MemberEmail` VARCHAR(30) NULL DEFAULT NULL,
  `MemberPhoneNo` INT(11) NULL DEFAULT NULL,
  `MemberAddr1` VARCHAR(30) NULL DEFAULT NULL,
  `MemberAddr2` VARCHAR(30) NULL DEFAULT NULL,
  `MemberTypeID` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`MemberID`),
  INDEX `fk_Member_MembershipType1_idx` (`MemberTypeID` ASC),
  CONSTRAINT `fk_Member_MembershipType1`
    FOREIGN KEY (`MemberTypeID`)
    REFERENCES `Red_Star_FC`.`MembershipType` (`MemberTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Red_Star_FC`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`Payment` (
  `PayID` VARCHAR(5) NOT NULL,
  `Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `DatePaid` DATE NULL DEFAULT NULL,
  `CustID` VARCHAR(5) NULL,
  `MemberID` VARCHAR(5) NULL,
  PRIMARY KEY (`PayID`),
  INDEX `fk_Payment_Customer1_idx` (`CustID` ASC),
  INDEX `fk_Payment_Member1_idx` (`MemberID` ASC),
  CONSTRAINT `fk_Payment_Customer1`
    FOREIGN KEY (`CustID`)
    REFERENCES `Red_Star_FC`.`Customer` (`CustID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_Member1`
    FOREIGN KEY (`MemberID`)
    REFERENCES `Red_Star_FC`.`Member` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `Red_Star_FC` ;

-- -----------------------------------------------------
-- Placeholder table for view `Red_Star_FC`.`booking_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`booking_details` (`Customer_First_Name` INT, `Customer_Last_Name` INT, `Booking_Identity` INT, `Booking_Date` INT, `Booking_Start_Time` INT, `Booking_Finish_Time` INT, `Staff_Identity` INT, `Staff_First_Name` INT, `Staff_Last_Name` INT, `Facility_Identity` INT, `Facility_Description` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Red_Star_FC`.`bookings_before_8`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`bookings_before_8` (`Booking_Identity_No` INT, `Booking_Date` INT, `Booking_Start_Time` INT, `Booking_Finish_Time` INT, `Customer_Identity_Number` INT, `Facility_Identity_Number` INT, `Staff_Identity_Number` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Red_Star_FC`.`customer_booking_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`customer_booking_view` (`Booking_Identity_Number` INT, `Booking_Date` INT, `Book_Start_Time` INT, `Book_Finish_Time` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Red_Star_FC`.`highest_payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red_Star_FC`.`highest_payments` (`Payment_Identity_Number` INT, `Amount` INT, `DatePaid` INT);

-- -----------------------------------------------------
-- View `Red_Star_FC`.`booking_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Red_Star_FC`.`booking_details`;
USE `Red_Star_FC`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `red_star_fc`.`booking_details` AS select `red_star_fc`.`customer`.`CustFName` AS `Customer_First_Name`,`red_star_fc`.`customer`.`CustLName` AS `Customer_Last_Name`,`red_star_fc`.`booking`.`BookID` AS `Booking_Identity`,`red_star_fc`.`booking`.`BookDate` AS `Booking_Date`,`red_star_fc`.`booking`.`BookSTime` AS `Booking_Start_Time`,`red_star_fc`.`booking`.`BookFTime` AS `Booking_Finish_Time`,`red_star_fc`.`staff`.`StaffID` AS `Staff_Identity`,`red_star_fc`.`staff`.`StaffFName` AS `Staff_First_Name`,`red_star_fc`.`staff`.`StaffLName` AS `Staff_Last_Name`,`red_star_fc`.`facility`.`FacilityID` AS `Facility_Identity`,`red_star_fc`.`facility`.`FacilityDesc` AS `Facility_Description` from (((`red_star_fc`.`customer` join `red_star_fc`.`booking` on((`red_star_fc`.`booking`.`CustID` = `red_star_fc`.`customer`.`CustID`))) join `red_star_fc`.`facility` on((`red_star_fc`.`booking`.`FacilityID` = `red_star_fc`.`facility`.`FacilityID`))) join `red_star_fc`.`staff` on((`red_star_fc`.`booking`.`StaffID` = `red_star_fc`.`staff`.`StaffID`)));

-- -----------------------------------------------------
-- View `Red_Star_FC`.`bookings_before_8`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Red_Star_FC`.`bookings_before_8`;
USE `Red_Star_FC`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `red_star_fc`.`bookings_before_8` AS select `red_star_fc`.`booking`.`BookID` AS `Booking_Identity_No`,`red_star_fc`.`booking`.`BookDate` AS `Booking_Date`,`red_star_fc`.`booking`.`BookSTime` AS `Booking_Start_Time`,`red_star_fc`.`booking`.`BookFTime` AS `Booking_Finish_Time`,`red_star_fc`.`booking`.`CustID` AS `Customer_Identity_Number`,`red_star_fc`.`booking`.`FacilityID` AS `Facility_Identity_Number`,`red_star_fc`.`booking`.`StaffID` AS `Staff_Identity_Number` from `red_star_fc`.`booking` where (`red_star_fc`.`booking`.`BookFTime` <= '8:00');

-- -----------------------------------------------------
-- View `Red_Star_FC`.`customer_booking_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Red_Star_FC`.`customer_booking_view`;
USE `Red_Star_FC`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `red_star_fc`.`customer_booking_view` AS select `red_star_fc`.`booking`.`BookID` AS `Booking_Identity_Number`,`red_star_fc`.`booking`.`BookDate` AS `Booking_Date`,`red_star_fc`.`booking`.`BookSTime` AS `Book_Start_Time`,`red_star_fc`.`booking`.`BookFTime` AS `Book_Finish_Time` from `red_star_fc`.`booking`;

-- -----------------------------------------------------
-- View `Red_Star_FC`.`highest_payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Red_Star_FC`.`highest_payments`;
USE `Red_Star_FC`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `red_star_fc`.`highest_payments` AS select `red_star_fc`.`payment`.`PayID` AS `Payment_Identity_Number`,`red_star_fc`.`payment`.`Amount` AS `Amount`,`red_star_fc`.`payment`.`DatePaid` AS `DatePaid` from `red_star_fc`.`payment` order by `red_star_fc`.`payment`.`Amount` desc limit 10;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
