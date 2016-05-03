-- MySQL Script generated by MySQL Workbench
-- 05/03/16 08:41:27
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema vegetables
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vegetables
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vegetables` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `vegetables` ;

-- -----------------------------------------------------
-- Table `vegetables`.`vege_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_user` (
  `uid` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `openid` CHAR(28) NULL COMMENT '微信openid',
  `nickname` VARCHAR(45) NOT NULL COMMENT '昵称',
  `phone` VARCHAR(45) NULL COMMENT '电话号码',
  `status` TINYINT(8) UNSIGNED NOT NULL COMMENT '用户状态',
  `headimgurl` VARCHAR(255) NULL COMMENT '',
  `unionid` VARCHAR(45) NULL COMMENT '',
  `coin` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户积分',
  `money` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户账号余额',
  `use_money` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消费的金额',
  `invite_uid` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邀请者id',
  PRIMARY KEY (`uid`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vegetables`.`vege_goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_goods` (
  `gid` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `img` VARCHAR(255) NULL COMMENT '图片位置',
  `cose_price` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT '成本价',
  `vip_price` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT '代理价',
  `buy_price` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT '购买价',
  `status` TINYINT(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `left_num` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `sold_num` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `detail` TEXT NOT NULL COMMENT '详情',
  `create_time` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `cid` TINYINT(8) UNSIGNED NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`gid`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '蔬菜商品表';


-- -----------------------------------------------------
-- Table `vegetables`.`vege_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_orders` (
  `trade` BIGINT(20) UNSIGNED NOT NULL COMMENT '订单号',
  `create_time` INT(10) UNSIGNED NOT NULL COMMENT '下单时间',
  `pay_time` INT(10) UNSIGNED NOT NULL COMMENT '支付时间',
  `uid` INT(10) UNSIGNED NOT NULL COMMENT '买家uid',
  `status` TINYINT(10) UNSIGNED NOT NULL COMMENT '订单状态',
  `type` TINYINT(8) UNSIGNED NOT NULL COMMENT '订单类型',
  `goods_info` TEXT NOT NULL COMMENT '购买商品信息，json格式数据',
  `address_info` TEXT NOT NULL COMMENT '收货地址信息',
  `express_info` TEXT NOT NULL COMMENT '物流信息',
  PRIMARY KEY (`trade`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '订单信息表';


-- -----------------------------------------------------
-- Table `vegetables`.`vege_wxpay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_wxpay` (
  `mytrade` BIGINT(20) UNSIGNED NOT NULL COMMENT '微信支付商家订单',
  `wxtrade` BIGINT(20) UNSIGNED NOT NULL COMMENT '微信订单号',
  `amount` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '金额',
  `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `pay_time` INT(10) UNSIGNED NOT NULL COMMENT '支付时间',
  `status` TINYINT(8) UNSIGNED NOT NULL COMMENT '支付状态',
  `uid` INT(10) UNSIGNED NOT NULL COMMENT '用户UID',
  PRIMARY KEY (`mytrade`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vegetables`.`vege_money`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_money` (
  `mid` INT NOT NULL COMMENT '',
  `uid` INT(10) NOT NULL COMMENT '',
  `amonut` DECIMAL(7,2) NOT NULL COMMENT '涉及金额',
  `time` INT(10) NOT NULL COMMENT '操作时间',
  `note` VARCHAR(255) NULL DEFAULT '' COMMENT '操作备注',
  `type` TINYINT(8) NOT NULL COMMENT '类型',
  PRIMARY KEY (`mid`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vegetables`.`vege_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_config` (
  `key` VARCHAR(255) NOT NULL COMMENT '',
  `value` TEXT NULL COMMENT '',
  PRIMARY KEY (`key`)  COMMENT '')
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `vegetables`.`vege_admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetables`.`vege_admin` (
  `aid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `password` CHAR(32) NOT NULL COMMENT '',
  PRIMARY KEY (`aid`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
