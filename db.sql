-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PrestamoLibros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PrestamoLibros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PrestamoLibros` ;
USE `PrestamoLibros` ;

-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Libro` (
  `IDLibro` INT NOT NULL,
  `Titulo` VARCHAR(100) NOT NULL,
  `Autor` VARCHAR(45) NOT NULL,
  `Editorial` VARCHAR(80) NOT NULL,
  `AñoPublicacion` VARCHAR(4) NOT NULL,
  `EjemplaresDisponibles` INT NOT NULL,
  PRIMARY KEY (`IDLibro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Miembro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Miembro` (
  `idMiembro` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(150) NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `FechaRegistro` DATETIME NOT NULL,
  PRIMARY KEY (`idMiembro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Prestamo` (
  `idPrestamo` INT NOT NULL,
  `FechaPrestamo` DATETIME NOT NULL,
  `FechaDevolucion` DATETIME NOT NULL,
  `Libro_IDLibro` INT NOT NULL,
  `Miembro_idMiembro` INT NOT NULL,
  PRIMARY KEY (`idPrestamo`, `Libro_IDLibro`, `Miembro_idMiembro`),
  INDEX `fk_Prestamo_Libro_idx` (`Libro_IDLibro` ASC) VISIBLE,
  INDEX `fk_Prestamo_Miembro1_idx` (`Miembro_idMiembro` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamo_Libro`
    FOREIGN KEY (`Libro_IDLibro`)
    REFERENCES `PrestamoLibros`.`Libro` (`IDLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_Miembro1`
    FOREIGN KEY (`Miembro_idMiembro`)
    REFERENCES `PrestamoLibros`.`Miembro` (`idMiembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `NombreCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Categoria_has_Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Categoria_has_Libro` (
  `Categoria_idCategoria` INT NOT NULL,
  `Libro_IDLibro` INT NOT NULL,
  PRIMARY KEY (`Categoria_idCategoria`, `Libro_IDLibro`),
  INDEX `fk_Categoria_has_Libro_Libro1_idx` (`Libro_IDLibro` ASC) VISIBLE,
  INDEX `fk_Categoria_has_Libro_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_has_Libro_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `PrestamoLibros`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_has_Libro_Libro1`
    FOREIGN KEY (`Libro_IDLibro`)
    REFERENCES `PrestamoLibros`.`Libro` (`IDLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrestamoLibros`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PrestamoLibros`.`Ejemplar` (
  `idEjemplar` INT NOT NULL,
  `Estado` VARCHAR(10) NOT NULL,
  `Libro_IDLibro` INT NOT NULL,
  `Miembro_idMiembro` INT NOT NULL,
  PRIMARY KEY (`idEjemplar`, `Libro_IDLibro`, `Miembro_idMiembro`),
  INDEX `fk_Ejemplar_Libro1_idx` (`Libro_IDLibro` ASC) VISIBLE,
  INDEX `fk_Ejemplar_Miembro1_idx` (`Miembro_idMiembro` ASC) VISIBLE,
  CONSTRAINT `fk_Ejemplar_Libro1`
    FOREIGN KEY (`Libro_IDLibro`)
    REFERENCES `PrestamoLibros`.`Libro` (`IDLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejemplar_Miembro1`
    FOREIGN KEY (`Miembro_idMiembro`)
    REFERENCES `PrestamoLibros`.`Miembro` (`idMiembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
