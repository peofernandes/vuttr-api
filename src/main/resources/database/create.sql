-- MySQL Script generated by MySQL Workbench
-- Tue Oct 18 18:18:23 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VUTTR
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VUTTR
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VUTTR` DEFAULT CHARACTER SET utf8 ;
USE `VUTTR` ;

-- -----------------------------------------------------
-- Table `VUTTR`.`TOOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VUTTR`.`TOOL` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NOT NULL,
  `LINK` TEXT NOT NULL,
  `DESCRIPTION` TEXT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VUTTR`.`TAG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VUTTR`.`TAG` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VUTTR`.`TOOL_has_TAG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VUTTR`.`TOOL_has_TAG` (
  `TOOL_ID` INT NOT NULL,
  `TAG_ID` INT NOT NULL,
  PRIMARY KEY (`TOOL_ID`, `TAG_ID`),
  INDEX `fk_TOOL_has_TAG_TAG1_idx` (`TAG_ID` ASC) VISIBLE,
  INDEX `fk_TOOL_has_TAG_TOOL_idx` (`TOOL_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TOOL_has_TAG_TOOL`
    FOREIGN KEY (`TOOL_ID`)
    REFERENCES `VUTTR`.`TOOL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TOOL_has_TAG_TAG1`
    FOREIGN KEY (`TAG_ID`)
    REFERENCES `VUTTR`.`TAG` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;