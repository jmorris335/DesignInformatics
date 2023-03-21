-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 3DPrinterDT
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `3DPrinterDT` ;

-- -----------------------------------------------------
-- Schema 3DPrinterDT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3DPrinterDT` DEFAULT CHARACTER SET utf8 ;
USE `3DPrinterDT` ;

-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer` (
  `printer_id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NULL,
  `IPv6` VARCHAR(25) NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`printer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Subsystem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Subsystem` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Subsystem` (
  `ss_ID` INT NOT NULL AUTO_INCREMENT,
  `ss_name` VARCHAR(20) NOT NULL,
  `printer_ID` INT NOT NULL,
  PRIMARY KEY (`ss_ID`),
  INDEX `fk_Subsystem_Printer1_idx` (`printer_ID` ASC),
  CONSTRAINT `fk_Subsystem_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Vendor` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Vendor` (
  `vendor_ID` INT NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(60) NULL,
  PRIMARY KEY (`vendor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part` (
  `part_id` INT NOT NULL AUTO_INCREMENT,
  `part_name` VARCHAR(60) NULL,
  `vendor_ID` INT NOT NULL,
  PRIMARY KEY (`part_id`),
  INDEX `fk_Part_Vendor_idx` (`vendor_ID` ASC),
  CONSTRAINT `fk_Part_Vendor`
    FOREIGN KEY (`vendor_ID`)
    REFERENCES `3DPrinterDT`.`Vendor` (`vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Material` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Material` (
  `mat_ID` INT NOT NULL AUTO_INCREMENT,
  `melt_temp` DECIMAL(2) NULL,
  `mat_name` VARCHAR(45) NULL,
  `color` VARCHAR(15) NULL,
  `vendor_ID` INT NOT NULL,
  PRIMARY KEY (`mat_ID`),
  INDEX `fk_Material_Vendor1_idx` (`vendor_ID` ASC),
  CONSTRAINT `fk_Material_Vendor1`
    FOREIGN KEY (`vendor_ID`)
    REFERENCES `3DPrinterDT`.`Vendor` (`vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Subsystem_has_Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Subsystem_has_Part` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Subsystem_has_Part` (
  `ss_ID` INT NOT NULL,
  `part_ID` INT NOT NULL,
  `quantity` INT NULL DEFAULT 1,
  PRIMARY KEY (`ss_ID`, `part_ID`),
  INDEX `fk_Subsystem_has_Part_Part1_idx` (`part_ID` ASC),
  INDEX `fk_Subsystem_has_Part_Subsystem1_idx` (`ss_ID` ASC),
  CONSTRAINT `fk_Subsystem_has_Part_Subsystem1`
    FOREIGN KEY (`ss_ID`)
    REFERENCES `3DPrinterDT`.`Subsystem` (`ss_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subsystem_has_Part_Part1`
    FOREIGN KEY (`part_ID`)
    REFERENCES `3DPrinterDT`.`Part` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Employees` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Employees` (
  `employee_ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`employee_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Maintenance_Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Maintenance_Log` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Maintenance_Log` (
  `mlog_ID` INT NOT NULL AUTO_INCREMENT,
  `employee_ID` INT NOT NULL,
  `timestamp` DATETIME NULL,
  `notes` BLOB NULL,
  PRIMARY KEY (`mlog_ID`),
  INDEX `fk_Maintenance_Log_Employees1_idx` (`employee_ID` ASC),
  CONSTRAINT `fk_Maintenance_Log_Employees1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `3DPrinterDT`.`Employees` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part_has_Maintenance_Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part_has_Maintenance_Log` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part_has_Maintenance_Log` (
  `part_ID` INT NOT NULL,
  `mlog_ID` INT NOT NULL,
  PRIMARY KEY (`part_ID`, `mlog_ID`),
  INDEX `fk_Part_has_Maintenance_Log_Maintenance_Log1_idx` (`mlog_ID` ASC),
  INDEX `fk_Part_has_Maintenance_Log_Part1_idx` (`part_ID` ASC),
  CONSTRAINT `fk_Part_has_Maintenance_Log_Part1`
    FOREIGN KEY (`part_ID`)
    REFERENCES `3DPrinterDT`.`Part` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_has_Maintenance_Log_Maintenance_Log1`
    FOREIGN KEY (`mlog_ID`)
    REFERENCES `3DPrinterDT`.`Maintenance_Log` (`mlog_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Parameters` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Parameters` (
  `param_id` INT NOT NULL AUTO_INCREMENT,
  `param_name` VARCHAR(60) NOT NULL,
  `value` DECIMAL(4) NULL,
  `unit` VARCHAR(3) NULL,
  PRIMARY KEY (`param_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part_Parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part_Parameters` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part_Parameters` (
  `param_id` INT NOT NULL,
  `part_id` INT NOT NULL,
  PRIMARY KEY (`param_id`, `part_id`),
  INDEX `fk_Part_Parameters_has_Part_Part1_idx` (`part_id` ASC),
  INDEX `fk_Part_Parameters_has_Part_Part_Parameters1_idx` (`param_id` ASC),
  CONSTRAINT `fk_Part_Parameters_has_Part_Part_Parameters1`
    FOREIGN KEY (`param_id`)
    REFERENCES `3DPrinterDT`.`Parameters` (`param_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Parameters_has_Part_Part1`
    FOREIGN KEY (`part_id`)
    REFERENCES `3DPrinterDT`.`Part` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer_Can_Print_Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer_Can_Print_Material` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer_Can_Print_Material` (
  `printer_ID` INT NOT NULL,
  `mat_ID` INT NOT NULL,
  PRIMARY KEY (`printer_ID`, `mat_ID`),
  INDEX `fk_Printer_has_Material_Material1_idx` (`mat_ID` ASC),
  INDEX `fk_Printer_has_Material_Printer1_idx` (`printer_ID` ASC),
  CONSTRAINT `fk_Printer_has_Material_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Material1`
    FOREIGN KEY (`mat_ID`)
    REFERENCES `3DPrinterDT`.`Material` (`mat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer_State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer_State` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer_State` (
  `timestamp` DATETIME NOT NULL,
  `printer_id` INT NOT NULL,
  `is_connected_to_net` TINYINT NULL,
  `is_busy` TINYINT NULL,
  `is_available` TINYINT NULL,
  `needs_service` TINYINT NULL,
  PRIMARY KEY (`timestamp`, `printer_id`),
  INDEX `fk_Network_State_Printer1_idx` (`printer_id` ASC),
  CONSTRAINT `fk_Network_State_Printer1`
    FOREIGN KEY (`printer_id`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Material_Loaded_In_Printer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Material_Loaded_In_Printer` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Material_Loaded_In_Printer` (
  `printer_ID` INT NOT NULL,
  `mat_ID` INT NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `volume` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`printer_ID`, `mat_ID`, `timestamp`),
  INDEX `fk_Printer_has_Material_Material2_idx` (`mat_ID` ASC),
  INDEX `fk_Printer_has_Material_Printer2_idx` (`printer_ID` ASC),
  CONSTRAINT `fk_Printer_has_Material_Printer2`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Material2`
    FOREIGN KEY (`mat_ID`)
    REFERENCES `3DPrinterDT`.`Material` (`mat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Print_Job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Print_Job` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Print_Job` (
  `job_ID` INT NOT NULL AUTO_INCREMENT,
  `model` BLOB NULL,
  `code` BLOB NULL,
  `employee_ID` INT NOT NULL,
  `printer_ID` INT NOT NULL,
  PRIMARY KEY (`job_ID`),
  INDEX `fk_Print_Job_Employees1_idx` (`employee_ID` ASC),
  INDEX `fk_Print_Job_Printer1_idx` (`printer_ID` ASC),
  CONSTRAINT `fk_Print_Job_Employees1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `3DPrinterDT`.`Employees` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Job_Parameter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Job_Parameter` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Job_Parameter` (
  `jobparam_ID` INT NOT NULL AUTO_INCREMENT,
  `jobparam_Name` VARCHAR(45) NULL,
  `value` DECIMAL(5) NULL,
  `unit` VARCHAR(4) NULL,
  PRIMARY KEY (`jobparam_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Print_Job_has_Job_Parameter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Print_Job_has_Job_Parameter` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Print_Job_has_Job_Parameter` (
  `job_ID` INT NOT NULL,
  `jobparam_ID` INT NOT NULL,
  PRIMARY KEY (`job_ID`, `jobparam_ID`),
  INDEX `fk_Print_Job_has_Job_Parameter_Job_Parameter1_idx` (`jobparam_ID` ASC),
  INDEX `fk_Print_Job_has_Job_Parameter_Print_Job1_idx` (`job_ID` ASC),
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Print_Job1`
    FOREIGN KEY (`job_ID`)
    REFERENCES `3DPrinterDT`.`Print_Job` (`job_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Job_Parameter1`
    FOREIGN KEY (`jobparam_ID`)
    REFERENCES `3DPrinterDT`.`Job_Parameter` (`jobparam_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Role` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Role` (
  `role_ID` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NULL,
  PRIMARY KEY (`role_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Employees_has_Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Employees_has_Role` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Employees_has_Role` (
  `employe_ID` INT NOT NULL,
  `role_ID` INT NOT NULL,
  PRIMARY KEY (`employe_ID`, `role_ID`),
  INDEX `fk_Employees_has_Role_Role1_idx` (`role_ID` ASC),
  INDEX `fk_Employees_has_Role_Employees1_idx` (`employe_ID` ASC),
  CONSTRAINT `fk_Employees_has_Role_Employees1`
    FOREIGN KEY (`employe_ID`)
    REFERENCES `3DPrinterDT`.`Employees` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Role_Role1`
    FOREIGN KEY (`role_ID`)
    REFERENCES `3DPrinterDT`.`Role` (`role_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
