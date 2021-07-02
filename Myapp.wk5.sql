-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CustomerOrders
-- -----------------------------------------------------
-- 
-- 

-- -----------------------------------------------------
-- Schema CustomerOrders
--
-- 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CustomerOrders` DEFAULT CHARACTER SET utf8 ;
USE `CustomerOrders` ;

-- -----------------------------------------------------
-- Table `CustomerOrders`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerOrders`.`City` (
  `CityID` INT NOT NULL AUTO_INCREMENT,
  `StateId` VARCHAR(45) NOT NULL,
  `CountryID` INT NULL,
  PRIMARY KEY (`CityID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerOrders`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerOrders`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `BrowseAround` VARCHAR(5) NOT NULL,
  `PlaceingOrder` VARCHAR(8) NOT NULL,
  `SubmittingOrder` VARCHAR(10) NOT NULL,
  `Address` VARCHAR(50) NOT NULL,
  `CityId` INT NULL,
  PRIMARY KEY (`idCustomer`),
  CONSTRAINT `city`
    FOREIGN KEY ()
    REFERENCES `CustomerOrders`.`City` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerOrders`.`System`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerOrders`.`System` (
  `System` INT NOT NULL AUTO_INCREMENT,
  `Registeers orders` VARCHAR(45) NOT NULL,
  `Sends reminders what the delivery option is` VARCHAR(45) NOT NULL,
  `Get items out the door faster` VARCHAR(150) NOT NULL,
  `Customer` INT NULL,
  PRIMARY KEY (`System`),
  CONSTRAINT `customer`
    FOREIGN KEY (`System`)
    REFERENCES `CustomerOrders`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerOrders`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerOrders`.`Delivery` (
  `idDelivery` INT NOT NULL AUTO_INCREMENT,
  `Selecting Drivers` VARCHAR(15) NOT NULL,
  `Delivery Items` VARCHAR(25) NOT NULL,
  `Receive notifications when you are close to the delivery option` VARCHAR(10) NOT NULL,
  `Payment` INT NULL,
  PRIMARY KEY (`idDelivery`),
  CONSTRAINT `system`
    FOREIGN KEY (`idDelivery`)
    REFERENCES `CustomerOrders`.`System` (`System`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerOrders`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerOrders`.`PAYMENT` (
  `idPAYMENT` INT NOT NULL AUTO_INCREMENT,
  `Money on the pass` VARCHAR(10) NOT NULL,
  `PAYMENTcol` VARCHAR(15) NOT NULL,
  `Money on APP` VARCHAR(150) NOT NULL,
  `GoogleMaps` INT NULL,
  PRIMARY KEY (`idPAYMENT`),
  CONSTRAINT `System`
    FOREIGN KEY (`idPAYMENT`)
    REFERENCES `CustomerOrders`.`System` (`System`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
