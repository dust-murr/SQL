-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab10_2db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lab10_2db` ;

-- -----------------------------------------------------
-- Schema lab10_2db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab10_2db` DEFAULT CHARACTER SET utf8 ;
USE `lab10_2db` ;

-- -----------------------------------------------------
-- Table `lab10_2db`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab10_2db`.`customer` ;

CREATE TABLE IF NOT EXISTS `lab10_2db`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `default_billing_address` INT NULL,
  `default_shipping_address` INT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab10_2db`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab10_2db`.`country` ;

CREATE TABLE IF NOT EXISTS `lab10_2db`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab10_2db`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab10_2db`.`address` ;

CREATE TABLE IF NOT EXISTS `lab10_2db`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `customer_id_idx` (`customer_id` ASC),
  INDEX `country_id_idx` (`country_id` ASC),
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab10_2db`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `lab10_2db`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
