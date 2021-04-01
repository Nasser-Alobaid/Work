-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`lecturer` (
  `Lecturer_id` INT NOT NULL AUTO_INCREMENT,
  `Lecturer_Firstname` VARCHAR(225) NOT NULL,
  `Lecturer_Lastname` VARCHAR(225) NULL DEFAULT NULL,
  `Employee_type` VARCHAR(225) NULL DEFAULT NULL,
  `Grade` INT NULL DEFAULT NULL,
  `Organization` VARCHAR(225) NULL DEFAULT NULL,
  PRIMARY KEY (`Lecturer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`courses` (
  `Course_id` INT NOT NULL AUTO_INCREMENT,
  `Course_Firstname` VARCHAR(225) NOT NULL,
  `Lecturer_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Course_id`),
  INDEX `Lecturer_ID` (`Lecturer_ID` ASC) VISIBLE,
  CONSTRAINT `courses_ibfk_1`
    FOREIGN KEY (`Lecturer_ID`)
    REFERENCES `university`.`lecturer` (`Lecturer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`students` (
  `Student_id` INT NOT NULL AUTO_INCREMENT,
  `Student_Firstname` VARCHAR(150) NULL DEFAULT NULL,
  `Student_Lastname` VARCHAR(225) NOT NULL,
  `Enrollement_status` VARCHAR(225) NOT NULL,
  `Study_year` INT NOT NULL,
  `Contact_Number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`schedules` (
  `Schedule_id` INT NOT NULL AUTO_INCREMENT,
  `term` VARCHAR(225) NOT NULL,
  `Student_ID` INT NULL DEFAULT NULL,
  `Course_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Schedule_id`),
  INDEX `Student_ID` (`Student_ID` ASC) VISIBLE,
  INDEX `Course_ID` (`Course_ID` ASC) VISIBLE,
  CONSTRAINT `schedules_ibfk_1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `university`.`students` (`Student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `schedules_ibfk_2`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `university`.`courses` (`Course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
