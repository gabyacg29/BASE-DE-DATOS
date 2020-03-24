-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agencia_viaje
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agencia_viaje
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agencia_viaje` DEFAULT CHARACTER SET utf8 ;
USE `agencia_viaje` ;

-- -----------------------------------------------------
-- Table `agencia_viaje`.`turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`turista` (
  `idturista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  PRIMARY KEY (`idturista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agencia_viaje`.`agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`agente` (
  `idagente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idagente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agencia_viaje`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`destino` (
  `iddestino` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen_destino` VARCHAR(50) NOT NULL,
  `popularidad` INT NOT NULL,
  PRIMARY KEY (`iddestino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agencia_viaje`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`hotel` (
  `idhotel` INT NOT NULL AUTO_INCREMENT,
  `nombre_hotel` VARCHAR(45) NOT NULL,
  `direccion_hotel` VARCHAR(45) NOT NULL,
  `imagen_hotel` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idhotel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agencia_viaje`.`promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`promociones` (
  `idpromociones` INT NOT NULL AUTO_INCREMENT,
  `nombre_promocion` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha:final` DATE NOT NULL,
  `precio` DECIMAL(2) NOT NULL,
  `destino_iddestino` INT NOT NULL,
  `turista_idturista` INT NOT NULL,
  `agente_idagente` INT NOT NULL,
  `hotel_idhotel` INT NOT NULL,
  PRIMARY KEY (`idpromociones`),
  INDEX `fk_promociones_destino1_idx` (`destino_iddestino` ASC) VISIBLE,
  INDEX `fk_promociones_turista1_idx` (`turista_idturista` ASC) VISIBLE,
  INDEX `fk_promociones_agente1_idx` (`agente_idagente` ASC) VISIBLE,
  INDEX `fk_promociones_hotel1_idx` (`hotel_idhotel` ASC) VISIBLE,
  CONSTRAINT `fk_promociones_destino1`
    FOREIGN KEY (`destino_iddestino`)
    REFERENCES `agencia_viaje`.`destino` (`iddestino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promociones_turista1`
    FOREIGN KEY (`turista_idturista`)
    REFERENCES `agencia_viaje`.`turista` (`idturista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promociones_agente1`
    FOREIGN KEY (`agente_idagente`)
    REFERENCES `agencia_viaje`.`agente` (`idagente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promociones_hotel1`
    FOREIGN KEY (`hotel_idhotel`)
    REFERENCES `agencia_viaje`.`hotel` (`idhotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agencia_viaje`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia_viaje`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `fecha_vta` DATE NOT NULL,
  `promociones_idpromociones` INT NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_venta_promociones1_idx` (`promociones_idpromociones` ASC) VISIBLE,
  CONSTRAINT `fk_venta_promociones1`
    FOREIGN KEY (`promociones_idpromociones`)
    REFERENCES `agencia_viaje`.`promociones` (`idpromociones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
