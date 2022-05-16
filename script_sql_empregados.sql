
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empregados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empregados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empregados` DEFAULT CHARACTER SET utf8 ;
USE `empregados` ;

-- -----------------------------------------------------
-- Table `empregados`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregados_db`.`departamento` (
  `cod_depto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cod_depto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empregados`.`empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregados_db`.`empregado` (
  `cod_empregado` INT NOT NULL AUTO_INCREMENT,
  `cod_depto` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `dt_nascimento` DATETIME NOT NULL,
  `sexo` CHAR(1) NULL,
  `dt_admissao` DATETIME NOT NULL,
  `est_civil` CHAR(1) NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`cod_empregado`),
  CONSTRAINT `fk_empregado_departamento`
    FOREIGN KEY (`cod_depto`)
    REFERENCES `empregados_db`.`departamento` (`cod_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empregados`.`dependentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregados`.`dependentes` (
  `cod_dependente` INT NOT NULL AUTO_INCREMENT,
  `cod_empregado` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `dt_nascimento` DATETIME NOT NULL,
  `sexo` CHAR(1) NULL,
  PRIMARY KEY (`cod_dependente`, `cod_empregado`),
  CONSTRAINT `fk_dependentes_empregado1`
    FOREIGN KEY (`cod_empregado`)
    REFERENCES `empregados`.`empregado` (`cod_empregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
