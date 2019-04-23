-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema thevillageteam_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema thevillageteam_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `thevillageteam_db` DEFAULT CHARACTER SET utf8 ;
USE `thevillageteam_db` ;

-- -----------------------------------------------------
-- Table `thevillageteam_db`.`Postal_town`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`Postal_town` (
  `postal_town_id` INT NOT NULL,
  `postal_town_city` VARCHAR(45) NULL,
  PRIMARY KEY (`postal_town_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`Email` (
  `email_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(100) NULL,
  PRIMARY KEY (`email_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`EmpCondition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`EmpCondition` (
  `emp_condition_id` INT NOT NULL AUTO_INCREMENT,
  `emp_condition_name` VARCHAR(45) NULL,
  PRIMARY KEY (`emp_condition_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`Occupation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`Occupation` (
  `occupation_id` INT NOT NULL AUTO_INCREMENT,
  `occupation_name` VARCHAR(45) NULL,
  PRIMARY KEY (`occupation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`Company` (
  `company_id` INT NOT NULL AUTO_INCREMENT,
  `corpurate_id` VARCHAR(45) NULL,
  `company_name` VARCHAR(100) NULL,
  `company_address` VARCHAR(45) NULL,
  `postal_town_id` INT NULL,
  `email_id` INT NULL,
  `company_contact` VARCHAR(45) NULL,
  `company_about_company` TEXT NULL,
  PRIMARY KEY (`company_id`),
  INDEX `postal_town_id_idx` (`postal_town_id` ASC) VISIBLE,
  INDEX `kalle_idx` (`email_id` ASC) VISIBLE,
  CONSTRAINT `postal_town_id`
    FOREIGN KEY (`postal_town_id`)
    REFERENCES `thevillageteam_db`.`Postal_town` (`postal_town_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `email_id`
    FOREIGN KEY (`email_id`)
    REFERENCES `thevillageteam_db`.`Email` (`email_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`JobAd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`JobAd` (
  `job_ad_id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NULL,
  `occupation_id` INT NULL,
  `postal_town_id` INT NULL,
  `condition_id` INT NULL,
  `experience` TEXT NULL,
  PRIMARY KEY (`job_ad_id`),
  INDEX `company_id_idx` (`company_id` ASC) VISIBLE,
  INDEX `occupation_id_idx` (`occupation_id` ASC) VISIBLE,
  INDEX `postal_town_id_idx` (`postal_town_id` ASC) VISIBLE,
  INDEX `condition_id_idx` (`condition_id` ASC) VISIBLE,
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `thevillageteam_db`.`Company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occupation_id`
    FOREIGN KEY (`occupation_id`)
    REFERENCES `thevillageteam_db`.`Occupation` (`occupation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `postal_town_id`
    FOREIGN KEY (`postal_town_id`)
    REFERENCES `thevillageteam_db`.`Postal_town` (`postal_town_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `condition_id`
    FOREIGN KEY (`condition_id`)
    REFERENCES `thevillageteam_db`.`EmpCondition` (`emp_condition_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `thevillageteam_db`.`ApplicationAd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thevillageteam_db`.`ApplicationAd` (
  `application_ad_id` INT NOT NULL AUTO_INCREMENT,
  `job_ad_id` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email_id` INT NULL,
  `cv` BLOB NULL,
  `personal_letter` BLOB NULL,
  PRIMARY KEY (`application_ad_id`),
  INDEX `job_ad_id_idx` (`job_ad_id` ASC) VISIBLE,
  INDEX `email_id_idx` (`email_id` ASC) VISIBLE,
  CONSTRAINT `job_ad_id`
    FOREIGN KEY (`job_ad_id`)
    REFERENCES `thevillageteam_db`.`JobAd` (`job_ad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `email_id`
    FOREIGN KEY (`email_id`)
    REFERENCES `thevillageteam_db`.`Email` (`email_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
