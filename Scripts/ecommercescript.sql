-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(200) NOT NULL,
  `category_id` INT NOT NULL,
  `height` DOUBLE NOT NULL,
  `width` DOUBLE NOT NULL,
  `length` DOUBLE NOT NULL,
  `img_path` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`),
  INDEX `category_id_idx` (`category_id` ASC),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `Ecommerce`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`cart` (
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `product_id`),
  INDEX `product_id_idx` (`product_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `Ecommerce`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `Ecommerce`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`credit_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`credit_card` (
  `credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(45) NOT NULL,
  `name_on_card` VARCHAR(45) NOT NULL,
  `expiration_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`credit_card_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`credit_card_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`credit_card_lookup` (
  `user_id` INT NOT NULL,
  `credit_card_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `credit_card_id`),
  INDEX `credit_card_id_idx` (`credit_card_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `Ecommerce`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `credit_card_id`
    FOREIGN KEY (`credit_card_id`)
    REFERENCES `Ecommerce`.`credit_card` (`credit_card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`billing_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`billing_address` (
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `address_id_idx` (`address_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `Ecommerce`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `Ecommerce`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`shipping_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`shipping_address` (
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `address_id_idx` (`address_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `Ecommerce`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `Ecommerce`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
