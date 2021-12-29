-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex10_3
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ex10_3` ;

-- -----------------------------------------------------
-- Schema ex10_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex10_3` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema my_guitar_shop
-- -----------------------------------------------------
USE `ex10_3` ;

-- -----------------------------------------------------
-- Table `ex10_3`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ex10_3`.`users` ;

CREATE TABLE IF NOT EXISTS `ex10_3`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex10_3`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ex10_3`.`products` ;

CREATE TABLE IF NOT EXISTS `ex10_3`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex10_3`.`downloads`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ex10_3`.`downloads` ;

CREATE TABLE IF NOT EXISTS `ex10_3`.`downloads` (
  `download_id` INT NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(45) NOT NULL,
  `download_date_time` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`download_id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `product_id_idx` (`product_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ex10_3`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `ex10_3`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
