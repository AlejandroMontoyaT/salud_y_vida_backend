-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema salud_y_vida
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema salud_y_vida
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `salud_y_vida` DEFAULT CHARACTER SET utf8 ;
USE `salud_y_vida` ;

-- -----------------------------------------------------
-- Table `salud_y_vida`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`tipo_usuario` (
  `id_tipo` BIGINT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`usuarios` (
  `id_usuarios` BIGINT NOT NULL AUTO_INCREMENT,
  `id_tipo` BIGINT NOT NULL,
  `nombres` VARCHAR(60) NOT NULL,
  `apellidos` VARCHAR(60) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(10) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `fecha_registro` DATETIME NULL,
  `estatus` VARCHAR(10) NULL DEFAULT 'A',
  PRIMARY KEY (`id_usuarios`, `id_tipo`),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE,
  INDEX `fk_usuarios_tipo_usuario_idx` (`id_tipo` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_tipo_usuario`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `salud_y_vida`.`tipo_usuario` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`marcas` (
  `id_marca` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_marca` VARCHAR(45) NOT NULL,
  `estatus` VARCHAR(10) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`modelos` (
  `id_modelo` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_modelo` VARCHAR(100) NOT NULL,
  `estatus` VARCHAR(10) NOT NULL DEFAULT 'A',
  `id_marca` BIGINT NOT NULL,
  `genero` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_modelo`, `id_marca`),
  INDEX `fk_modelos_marcas1_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_modelos_marcas1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `salud_y_vida`.`marcas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`lentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`lentes` (
  `id_lentes` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_lentes` VARCHAR(50) NOT NULL,
  `url_imagen` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `largo` VARCHAR(10) NULL,
  `ancho` VARCHAR(10) NULL,
  `alto` VARCHAR(10) NULL,
  `sku` VARCHAR(50) NULL,
  `precio` DECIMAL(9,2) NOT NULL,
  `material` VARCHAR(50) NULL,
  `modelos_id_modelo` BIGINT NOT NULL,
  PRIMARY KEY (`id_lentes`, `modelos_id_modelo`),
  INDEX `fk_lentes_modelos1_idx` (`modelos_id_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_lentes_modelos1`
    FOREIGN KEY (`modelos_id_modelo`)
    REFERENCES `salud_y_vida`.`modelos` (`id_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`tipos de pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`tipos de pago` (
  `id_tipo_pago` BIGINT NOT NULL,
  `descripcion_tipo_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`compras` (
  `id_compras` BIGINT NOT NULL AUTO_INCREMENT,
  `Id_usuario` BIGINT NOT NULL,
  `id_tipo_pago` BIGINT NOT NULL,
  `fecha_compra` DATETIME NOT NULL,
  `pago_total` BIGINT NOT NULL,
  PRIMARY KEY (`id_compras`, `Id_usuario`, `id_tipo_pago`),
  INDEX `fk_compras_usuarios1_idx` (`Id_usuario` ASC) VISIBLE,
  INDEX `fk_compras_tipos de pago1_idx` (`id_tipo_pago` ASC) VISIBLE,
  CONSTRAINT `fk_compras_usuarios1`
    FOREIGN KEY (`Id_usuario`)
    REFERENCES `salud_y_vida`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_tipos de pago1`
    FOREIGN KEY (`id_tipo_pago`)
    REFERENCES `salud_y_vida`.`tipos de pago` (`id_tipo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`carrito_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`carrito_compras` (
  `id_carrito` BIGINT NOT NULL,
  `fecha_actualizacion` DATETIME NULL,
  `usuarios_id_usuarios` BIGINT NOT NULL,
  PRIMARY KEY (`id_carrito`, `usuarios_id_usuarios`),
  INDEX `fk_carrito_compras_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_compras_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `salud_y_vida`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`citas` (
  `id_citas` BIGINT NOT NULL AUTO_INCREMENT,
  `usuarios_id_usuarios` BIGINT NOT NULL,
  `fecha_hora_cita` DATETIME NOT NULL,
  PRIMARY KEY (`id_citas`, `usuarios_id_usuarios`),
  INDEX `fk_citas_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_citas_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `salud_y_vida`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`direcciones` (
  `id_direcciones` BIGINT NOT NULL AUTO_INCREMENT,
  `usuarios_id_usuarios` BIGINT NOT NULL,
  `calle` VARCHAR(100) NOT NULL,
  `colonia` VARCHAR(100) NOT NULL,
  `municipio_alcaldia` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_direcciones`, `usuarios_id_usuarios`),
  INDEX `fk_direcciones_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_direcciones_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `salud_y_vida`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`tarjetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`tarjetas` (
  `id_tarjeta` BIGINT NOT NULL,
  `numero_tarjeta` VARCHAR(15) NOT NULL,
  `expiracion` VARCHAR(10) NOT NULL,
  `direccion_tarjeta` VARCHAR(45) NULL,
  `usuarios_id_usuarios` BIGINT NOT NULL,
  PRIMARY KEY (`id_tarjeta`, `usuarios_id_usuarios`),
  INDEX `fk_tarjetas_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_tarjetas_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `salud_y_vida`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`compras_has_lentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`compras_has_lentes` (
  `compras_id_compras` BIGINT NOT NULL,
  `lentes_id_lentes` BIGINT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`compras_id_compras`, `lentes_id_lentes`, `cantidad`),
  INDEX `fk_compras_has_lentes_lentes1_idx` (`lentes_id_lentes` ASC) VISIBLE,
  INDEX `fk_compras_has_lentes_compras1_idx` (`compras_id_compras` ASC) VISIBLE,
  CONSTRAINT `fk_compras_has_lentes_compras1`
    FOREIGN KEY (`compras_id_compras`)
    REFERENCES `salud_y_vida`.`compras` (`id_compras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_has_lentes_lentes1`
    FOREIGN KEY (`lentes_id_lentes`)
    REFERENCES `salud_y_vida`.`lentes` (`id_lentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_y_vida`.`carrito_compras_has_lentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_y_vida`.`carrito_compras_has_lentes` (
  `id_carrito` BIGINT NOT NULL,
  `id_lentes` BIGINT NOT NULL,
  `cantidad` INT(10) NOT NULL,
  PRIMARY KEY (`id_carrito`, `id_lentes`),
  INDEX `fk_carrito_compras_has_lentes_lentes1_idx` (`id_lentes` ASC) VISIBLE,
  INDEX `fk_carrito_compras_has_lentes_carrito_compras1_idx` (`id_carrito` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_compras_has_lentes_carrito_compras1`
    FOREIGN KEY (`id_carrito`)
    REFERENCES `salud_y_vida`.`carrito_compras` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_compras_has_lentes_lentes1`
    FOREIGN KEY (`id_lentes`)
    REFERENCES `salud_y_vida`.`lentes` (`id_lentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
