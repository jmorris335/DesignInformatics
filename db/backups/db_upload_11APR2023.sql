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
-- Table `3DPrinterDT`.`Vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Vendor` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Vendor` (
  `vendor_ID` INT NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(60) NULL,
  PRIMARY KEY (`vendor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer` (
  `printer_ID` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NULL,
  `IPv6` VARCHAR(25) NULL,
  `model` VARCHAR(45) NULL,
  `vendor_ID` INT NOT NULL DEFAULT -1,
  `printer_name` VARCHAR(45) NULL,
  PRIMARY KEY (`printer_ID`),
  CONSTRAINT `fk_Printer_Vendor1`
    FOREIGN KEY (`vendor_ID`)
    REFERENCES `3DPrinterDT`.`Vendor` (`vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Printer_Vendor1_idx` ON `3DPrinterDT`.`Printer` (`vendor_ID` ASC);

CREATE UNIQUE INDEX `printer_name_UNIQUE` ON `3DPrinterDT`.`Printer` (`printer_name` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part` (
  `part_ID` INT NOT NULL AUTO_INCREMENT,
  `part_name` VARCHAR(60) NULL,
  `vendor_ID` INT NOT NULL DEFAULT -1,
  `printer_ID` INT NOT NULL DEFAULT -1,
  PRIMARY KEY (`part_ID`),
  CONSTRAINT `fk_Part_Vendor`
    FOREIGN KEY (`vendor_ID`)
    REFERENCES `3DPrinterDT`.`Vendor` (`vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Part_Vendor_idx` ON `3DPrinterDT`.`Part` (`vendor_ID` ASC);

CREATE INDEX `fk_Part_Printer1_idx` ON `3DPrinterDT`.`Part` (`printer_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Material` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Material` (
  `mat_ID` INT NOT NULL AUTO_INCREMENT,
  `melt_temp` DECIMAL(4) NULL,
  `mat_name` VARCHAR(45) NULL,
  `color` VARCHAR(15) NULL,
  `vendor_ID` INT NOT NULL DEFAULT -1,
  PRIMARY KEY (`mat_ID`),
  CONSTRAINT `fk_Material_Vendor1`
    FOREIGN KEY (`vendor_ID`)
    REFERENCES `3DPrinterDT`.`Vendor` (`vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Material_Vendor1_idx` ON `3DPrinterDT`.`Material` (`vendor_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Employee` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Employee` (
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
  CONSTRAINT `fk_Maintenance_Log_Employees1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `3DPrinterDT`.`Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Maintenance_Log_Employees1_idx` ON `3DPrinterDT`.`Maintenance_Log` (`employee_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part_Has_Maintenance_Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part_Has_Maintenance_Log` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part_Has_Maintenance_Log` (
  `part_ID` INT NOT NULL,
  `mlog_ID` INT NOT NULL,
  PRIMARY KEY (`part_ID`, `mlog_ID`),
  CONSTRAINT `fk_Part_has_Maintenance_Log_Part1`
    FOREIGN KEY (`part_ID`)
    REFERENCES `3DPrinterDT`.`Part` (`part_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_has_Maintenance_Log_Maintenance_Log1`
    FOREIGN KEY (`mlog_ID`)
    REFERENCES `3DPrinterDT`.`Maintenance_Log` (`mlog_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Part_has_Maintenance_Log_Maintenance_Log1_idx` ON `3DPrinterDT`.`Part_Has_Maintenance_Log` (`mlog_ID` ASC);

CREATE INDEX `fk_Part_has_Maintenance_Log_Part1_idx` ON `3DPrinterDT`.`Part_Has_Maintenance_Log` (`part_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Unit` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Unit` (
  `unit_name` VARCHAR(8) NOT NULL,
  `unit_group` VARCHAR(45) NULL,
  `is_main` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`unit_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Parameter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Parameter` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Parameter` (
  `param_ID` INT NOT NULL AUTO_INCREMENT,
  `param_name` VARCHAR(60) NOT NULL,
  `unit` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`param_ID`, `unit`),
  CONSTRAINT `fk_Parameter_Unit1`
    FOREIGN KEY (`unit`)
    REFERENCES `3DPrinterDT`.`Unit` (`unit_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Parameter_Unit1_idx` ON `3DPrinterDT`.`Parameter` (`unit` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Part_Parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Part_Parameters` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Part_Parameters` (
  `param_ID` INT NOT NULL,
  `part_ID` INT NOT NULL,
  `value` DECIMAL(8) NULL,
  PRIMARY KEY (`param_ID`, `part_ID`),
  CONSTRAINT `fk_Part_Parameters_has_Part_Part_Parameters1`
    FOREIGN KEY (`param_ID`)
    REFERENCES `3DPrinterDT`.`Parameter` (`param_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Parameters_has_Part_Part1`
    FOREIGN KEY (`part_ID`)
    REFERENCES `3DPrinterDT`.`Part` (`part_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Part_Parameters_has_Part_Part1_idx` ON `3DPrinterDT`.`Part_Parameters` (`part_ID` ASC);

CREATE INDEX `fk_Part_Parameters_has_Part_Part_Parameters1_idx` ON `3DPrinterDT`.`Part_Parameters` (`param_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer_Can_Print_Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer_Can_Print_Material` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer_Can_Print_Material` (
  `printer_ID` INT NOT NULL,
  `mat_ID` INT NOT NULL,
  PRIMARY KEY (`printer_ID`, `mat_ID`),
  CONSTRAINT `fk_Printer_has_Material_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Material1`
    FOREIGN KEY (`mat_ID`)
    REFERENCES `3DPrinterDT`.`Material` (`mat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Printer_has_Material_Material1_idx` ON `3DPrinterDT`.`Printer_Can_Print_Material` (`mat_ID` ASC);

CREATE INDEX `fk_Printer_has_Material_Printer1_idx` ON `3DPrinterDT`.`Printer_Can_Print_Material` (`printer_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Printer_State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Printer_State` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Printer_State` (
  `printer_ID` INT NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `is_connected` TINYINT NULL DEFAULT 1,
  `is_busy` TINYINT NULL DEFAULT 0,
  `is_available` TINYINT NULL DEFAULT 1,
  `needs_service` TINYINT NULL DEFAULT 0,
  `has_error` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`printer_ID`, `timestamp`),
  CONSTRAINT `fk_Network_State_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Network_State_Printer1_idx` ON `3DPrinterDT`.`Printer_State` (`printer_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Material_Loaded_In_Printer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Material_Loaded_In_Printer` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Material_Loaded_In_Printer` (
  `printer_ID` INT NOT NULL,
  `mat_ID` INT NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `volume` DECIMAL(7) NOT NULL,
  PRIMARY KEY (`printer_ID`, `mat_ID`, `timestamp`),
  CONSTRAINT `fk_Printer_has_Material_Printer2`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Material2`
    FOREIGN KEY (`mat_ID`)
    REFERENCES `3DPrinterDT`.`Material` (`mat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Printer_has_Material_Material2_idx` ON `3DPrinterDT`.`Material_Loaded_In_Printer` (`mat_ID` ASC);

CREATE INDEX `fk_Printer_has_Material_Printer2_idx` ON `3DPrinterDT`.`Material_Loaded_In_Printer` (`printer_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Print_Job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Print_Job` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Print_Job` (
  `job_ID` INT NOT NULL AUTO_INCREMENT,
  `model` BLOB NULL,
  `code` BLOB NULL,
  `designer_ID` INT NOT NULL,
  `curator_ID` INT NOT NULL,
  `preparer_ID` INT NOT NULL,
  `printer_ID` INT NOT NULL,
  `job_succeeded` TINYINT NULL,
  `in_queue` TINYINT NOT NULL DEFAULT 1,
  `print_volume` DECIMAL(8) NULL,
  `submission_time` DATETIME NULL,
  `print_finish_time` DATETIME NULL,
  `print_start_time` DATETIME NULL,
  `mat_ID` INT NOT NULL,
  PRIMARY KEY (`job_ID`, `mat_ID`),
  CONSTRAINT `fk_Print_Job_Employees1`
    FOREIGN KEY (`designer_ID`)
    REFERENCES `3DPrinterDT`.`Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Printer1`
    FOREIGN KEY (`printer_ID`)
    REFERENCES `3DPrinterDT`.`Printer` (`printer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees2`
    FOREIGN KEY (`curator_ID`)
    REFERENCES `3DPrinterDT`.`Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees3`
    FOREIGN KEY (`preparer_ID`)
    REFERENCES `3DPrinterDT`.`Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Material1`
    FOREIGN KEY (`mat_ID`)
    REFERENCES `3DPrinterDT`.`Material` (`mat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Print_Job_Employees1_idx` ON `3DPrinterDT`.`Print_Job` (`designer_ID` ASC);

CREATE INDEX `fk_Print_Job_Printer1_idx` ON `3DPrinterDT`.`Print_Job` (`printer_ID` ASC);

CREATE INDEX `fk_Print_Job_Employees2_idx` ON `3DPrinterDT`.`Print_Job` (`curator_ID` ASC);

CREATE INDEX `fk_Print_Job_Employees3_idx` ON `3DPrinterDT`.`Print_Job` (`preparer_ID` ASC);

CREATE INDEX `fk_Print_Job_Material1_idx` ON `3DPrinterDT`.`Print_Job` (`mat_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Job_Parameter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Job_Parameter` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Job_Parameter` (
  `jobparam_ID` INT NOT NULL AUTO_INCREMENT,
  `jobparam_name` VARCHAR(45) NULL,
  `unit` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`jobparam_ID`, `unit`),
  CONSTRAINT `fk_Job_Parameter_Unit1`
    FOREIGN KEY (`unit`)
    REFERENCES `3DPrinterDT`.`Unit` (`unit_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Job_Parameter_Unit1_idx` ON `3DPrinterDT`.`Job_Parameter` (`unit` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Print_Job_Has_Job_Parameter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Print_Job_Has_Job_Parameter` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Print_Job_Has_Job_Parameter` (
  `job_ID` INT NOT NULL,
  `jobparam_ID` INT NOT NULL,
  `value` DECIMAL(8) NULL,
  PRIMARY KEY (`job_ID`, `jobparam_ID`),
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

CREATE INDEX `fk_Print_Job_has_Job_Parameter_Job_Parameter1_idx` ON `3DPrinterDT`.`Print_Job_Has_Job_Parameter` (`jobparam_ID` ASC);

CREATE INDEX `fk_Print_Job_has_Job_Parameter_Print_Job1_idx` ON `3DPrinterDT`.`Print_Job_Has_Job_Parameter` (`job_ID` ASC);


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
-- Table `3DPrinterDT`.`Employee_Has_Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Employee_Has_Role` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Employee_Has_Role` (
  `employe_ID` INT NOT NULL,
  `role_ID` INT NOT NULL,
  PRIMARY KEY (`employe_ID`, `role_ID`),
  CONSTRAINT `fk_Employees_has_Role_Employees1`
    FOREIGN KEY (`employe_ID`)
    REFERENCES `3DPrinterDT`.`Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Role_Role1`
    FOREIGN KEY (`role_ID`)
    REFERENCES `3DPrinterDT`.`Role` (`role_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Employees_has_Role_Role1_idx` ON `3DPrinterDT`.`Employee_Has_Role` (`role_ID` ASC);

CREATE INDEX `fk_Employees_has_Role_Employees1_idx` ON `3DPrinterDT`.`Employee_Has_Role` (`employe_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Sensor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Sensor` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Sensor` (
  `sensor_ID` INT NOT NULL AUTO_INCREMENT,
  `sensor_name` VARCHAR(45) NOT NULL,
  `part_ID` INT NOT NULL DEFAULT -1,
  PRIMARY KEY (`sensor_ID`),
  CONSTRAINT `fk_Sensor_Part1`
    FOREIGN KEY (`part_ID`)
    REFERENCES `3DPrinterDT`.`Part` (`part_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Sensor_Part1_idx` ON `3DPrinterDT`.`Sensor` (`part_ID` ASC);


-- -----------------------------------------------------
-- Table `3DPrinterDT`.`Sensor_Data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `3DPrinterDT`.`Sensor_Data` ;

CREATE TABLE IF NOT EXISTS `3DPrinterDT`.`Sensor_Data` (
  `data_ID` INT NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `data_name` VARCHAR(45) NULL,
  `value` DECIMAL(10) NOT NULL,
  `unit` VARCHAR(8) NULL,
  `sensor_ID` INT NOT NULL DEFAULT -1,
  PRIMARY KEY (`data_ID`),
  CONSTRAINT `fk_Sensor_Data_Sensor1`
    FOREIGN KEY (`sensor_ID`)
    REFERENCES `3DPrinterDT`.`Sensor` (`sensor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Sensor_Data_Sensor1_idx` ON `3DPrinterDT`.`Sensor_Data` (`sensor_ID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
