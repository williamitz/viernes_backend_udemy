/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100121
 Source Schema         : viernes_db

 Target Server Type    : MySQL
 Target Server Version : 100121
 File Encoding         : 65001

 Date: 05/09/2021 22:04:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for as_product
-- ----------------------------
DROP TABLE IF EXISTS `as_product`;
CREATE TABLE `as_product`  (
  `pkProduct` int(255) NOT NULL AUTO_INCREMENT,
  `fkUser` int(255) NULL DEFAULT NULL,
  `nameProduct` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priceProduct` decimal(10, 2) NULL DEFAULT NULL,
  `urlImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statusRegister` tinyint(255) NULL DEFAULT NULL,
  `dateRegister` datetime(0) NULL DEFAULT NULL,
  `dateUpdated` datetime(0) NULL DEFAULT NULL,
  `dateDeleted` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pkProduct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of as_product
-- ----------------------------
INSERT INTO `as_product` VALUES (1, 1, 'Termo aluminio editado', 39.90, 'file1-668.png', 0, '2021-08-15 11:10:13', '2021-08-30 10:00:03', NULL);
INSERT INTO `as_product` VALUES (2, 1, 'Bicicleta fixie ', 500.00, NULL, 1, '2021-08-15 11:11:44', NULL, NULL);
INSERT INTO `as_product` VALUES (3, 1, 'Laptop lenovo', 900.00, NULL, 1, '2021-08-15 11:12:54', NULL, NULL);
INSERT INTO `as_product` VALUES (4, 2, 'Hervidor edit', 80.00, NULL, 1, '2021-08-15 11:23:12', '2021-08-15 11:23:39', NULL);

-- ----------------------------
-- Table structure for as_user
-- ----------------------------
DROP TABLE IF EXISTS `as_user`;
CREATE TABLE `as_user`  (
  `pkUser` int(255) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPassword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statusRegister` tinyint(255) NULL DEFAULT NULL,
  `dateRegister` datetime(0) NULL DEFAULT NULL,
  `fkUserRegister` int(255) NULL DEFAULT NULL,
  `ipRegister` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pkUser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of as_user
-- ----------------------------
INSERT INTO `as_user` VALUES (1, 'william', 'calle.usp@gmail.com', '951543871', '$2b$10$w4pgbkkl5CXuir8sjsHRQepuHCrJ8nD4R4EFSXCbgqpEUiXHm71AS', 1, '2021-07-11 15:21:59', 0, '::ffff:192.168.1.22');
INSERT INTO `as_user` VALUES (2, 'fulanito de tal', 'fulanuski@hotmail.com', '951543871', '$2b$10$.ooSlFTOMKa5c/a3l6ATAeh0y2KatakAdiNbfYs01KVXN2MSk7ee.', 1, '2021-07-11 20:13:01', 0, '::ffff:192.168.1.22');
INSERT INTO `as_user` VALUES (3, 'Fulanito de tal', 'fulanito@gmail.com', '951543871', '$2b$10$IqwOZ4bOcmias7bYlkYMEernhGyri3XTIz/40V1R/r6mh.P4ScMFO', 1, '2021-07-29 11:33:59', 0, '::ffff:192.168.0.160');
INSERT INTO `as_user` VALUES (4, 'fulls', 'fulls@gmail.com', '95154', '$2b$10$P6jXs8bjYWJbhsv/7lG2w.iSDvtkYqKo1pPBcpaqxVE2CaBsLRBQu', 1, '2021-07-29 11:47:26', 0, '::ffff:192.168.0.160');
INSERT INTO `as_user` VALUES (5, 'Robert Marley', 'bob@gmail.com', '951543871', '$2b$10$Qc1qpgCg4q6i53zWDBIAnOGDg/fALIEbXFMhJB9O/tk3ShGWejB5u', 1, '2021-07-29 11:57:18', 0, '::ffff:192.168.0.160');
INSERT INTO `as_user` VALUES (6, 'Tony Stark', 'markII@gmail.com', '95949', '$2b$10$XP.E8ZJVgxaUMj5nMfA2rupD/0v2Kl.cuIl.q.Va9c3lVktDJ0RzC', 1, '2021-07-29 11:58:55', 0, '::ffff:192.168.0.160');
INSERT INTO `as_user` VALUES (7, 'benito', 'elconejomalo@gmail.com', '951543871', '$2b$10$IpK224bmRyDSa4DVvZlxnuifYcq00TPvXgrkhhj97au3srA507II2', 1, '2021-07-29 21:45:21', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (8, 'fulanix', 'fulanix@gmail.com', '951543871', '$2b$10$8u.4oKOAYt2c2J6ubAu4Ye5YfBhkOiQAlc14oqqn6XPXMl4heKSgu', 1, '2021-07-29 21:47:28', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (9, 'Steve rogers', 'capitan@america.com', '8553', '$2b$10$x61Ygb4ZOtfWQbIWY64mN.LDYP4XZvhVNJKQPkKFH8cUzXikejvfu', 1, '2021-07-29 21:52:49', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (10, 'lorem', 'test@driver.com', '654', '$2b$10$jHmKC1GzUyR.ZXprGCagDehc2AZ11AyfOUI9UOJ8ypG3ifj93eCkO', 1, '2021-07-29 21:54:37', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (11, 'grood', 'grood@gmail.com', '76443', '$2b$10$cSAjMNt67FaTDZHZ0Zoqgu/bY7w4jwIj7JD5t3NqWnjjR0nHKyPje', 1, '2021-07-29 21:57:10', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (12, 'grood', 'fullsxd@gmail.com', '76443', '$2b$10$dypMnUwXKncHHxLDBXg7pu348D.zQj71i16SNhVpY62niMKASpxg.', 1, '2021-07-29 22:00:52', 0, '::ffff:192.168.0.167');
INSERT INTO `as_user` VALUES (13, 'Wade wilson', 'mrpoll@gmail.com', '76533', '$2b$10$sTbI5uZ/mExJ60aLzKcWdO90z/v5R9uHmZBS5bOfQ14DdnAuoez1q', 1, '2021-07-29 22:06:21', 0, '::ffff:192.168.0.167');

-- ----------------------------
-- Function structure for as_fn_verify_addProduct
-- ----------------------------
DROP FUNCTION IF EXISTS `as_fn_verify_addProduct`;
delimiter ;;
CREATE FUNCTION `as_fn_verify_addProduct`(`InName` varchar(100),
`InPkUser` int)
 RETURNS tinyint(4)
BEGIN
	#Routine body goes here...
	DECLARE outError, vErrFound, vErrStatus, vErrFoundU, vErrStatusU TINYINT DEFAULT 0;
	DECLARE vPkProduct, vPkUser INT;
	
	SELECT pkProduct,
					IF(statusRegister = 0, 2, 0)
	INTO vPkProduct, vErrStatus
	FROM as_product
	WHERE nameProduct = InName AND fkUser = InPkUser;
	
	SELECT pkUser,
					IF(statusRegister = 0, 8, 0)
	INTO vPkUser, vErrStatusU
	FROM as_user
	WHERE pkUser = InPkUser;
	
	IF vPkProduct IS NOT NULL THEN
		SET vErrFound = 1;
	END IF;
	
	IF vPkUser IS NULL THEN
		SET vErrFoundU = 4;
	END IF;
	
	SET outError = vErrFound + vErrStatus + vErrFoundU + vErrStatusU;

	RETURN outError;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for as_fn_verify_deleteProduct
-- ----------------------------
DROP FUNCTION IF EXISTS `as_fn_verify_deleteProduct`;
delimiter ;;
CREATE FUNCTION `as_fn_verify_deleteProduct`(`InPkProduct` bigint,
`InFkUser` int)
 RETURNS tinyint(4)
BEGIN
	#Routine body goes here...
	DECLARE outError, vErrFound, vErrFoundU, vErrStatusU TINYINT DEFAULT 0;
	DECLARE vPkProduct, vPkUser BIGINT;
	
	SELECT pkProduct INTO vPkProduct
	FROM as_product
	WHERE pkProduct = InPkProduct;
	
	SELECT pkUser,
					IF(statusRegister = 0, 4, 0)
	INTO vPkUser, vErrStatusU
	FROM as_user
	WHERE pkUser = InPkUser;
	
	IF vPkProduct IS NOT NULL THEN
		SET vErrFound = 1;
	END IF;
	
	IF vPkUser IS NULL THEN
		SET vErrFoundU = 2;
	END IF;
	
	SET outError = vErrFound + vErrFoundU + vErrStatusU;

	RETURN outError;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for as_fn_verify_singin
-- ----------------------------
DROP FUNCTION IF EXISTS `as_fn_verify_singin`;
delimiter ;;
CREATE FUNCTION `as_fn_verify_singin`(`InEmail` varchar(50))
 RETURNS tinyint(4)
BEGIN
	#Routine body goes here...
	DECLARE outError TINYINT DEFAULT 0;
	DECLARE vPkUser INT;
	
	SELECT pkUser INTO vPkUser
	FROM as_user
	WHERE email = InEmail;
	
	IF vPkUser IS NOT NULL THEN
		
		SET outError = 1;
		
	END IF;

	RETURN outError;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for as_fn_verify_updateImgProduct
-- ----------------------------
DROP FUNCTION IF EXISTS `as_fn_verify_updateImgProduct`;
delimiter ;;
CREATE FUNCTION `as_fn_verify_updateImgProduct`(`InPkProduct` int,
`InFkUser` int)
 RETURNS tinyint(4)
BEGIN
	#Routine body goes here...
	DECLARE outError, vErrFound, vErrFoundU, vErrStatusU TINYINT DEFAULT 0;
	DECLARE vPkProduct, vPkUser INT;
	
	SELECT pkProduct INTO vPkProduct	
	FROM as_product 
	WHERE pkProduct = InPkProduct AND fkUser = InFkUser;
	
	SELECT pkUser,
         IF(statusRegister = 0, 4, 0)	
	INTO vPkUser, vErrStatusU
	FROM as_user 
	WHERE pkUser = InFkUser;
	
	IF vPkProduct IS NULL THEN
		SET vErrFound = 1;
	END IF;
	
	IF vPkUser IS NULL THEN
		SET vErrFoundU = 2;
	END IF;
	
	SET outError = vErrFound + vErrFoundU + vErrStatusU;

	RETURN outError;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for as_fn_verify_updateProduct
-- ----------------------------
DROP FUNCTION IF EXISTS `as_fn_verify_updateProduct`;
delimiter ;;
CREATE FUNCTION `as_fn_verify_updateProduct`(`InPkProduct` int,
`InName` varchar(100),
`InPkUser` int)
 RETURNS tinyint(4)
BEGIN
	#Routine body goes here...
	DECLARE outError, vErrFound, vErrStatus, vErrRepit, vErrFoundU, vErrStatusU TINYINT DEFAULT 0;
	DECLARE vPkProduct, vPkProductRepit, vPkUser INT;
	
	SELECT pkProduct,
					IF(statusRegister = 0, 2, 0)
	INTO vPkProductRepit, vErrStatus
	FROM as_product
	WHERE nameProduct = InName AND fkUser = InPkUser AND pkProduct != InPkProduct;
	
	SELECT pkProduct INTO vPkProduct
	FROM as_product
	WHERE pkProduct = InPkProduct AND fkUser = InPkUser;
	
	SELECT pkUser,
					IF(statusRegister = 0, 16, 0)
	INTO vPkUser, vErrStatusU
	FROM as_user
	WHERE pkUser = InPkUser;
	
	IF vPkProduct IS NULL THEN
		SET vErrRepit = 4;
	END IF;
	
	IF vPkProductRepit IS NOT NULL THEN
		SET vErrRepit = 1;
	END IF;
	
	IF vPkUser IS NULL THEN
		SET vErrFoundU = 8;
	END IF;
	
	SET outError = vErrFound + vErrStatus + vErrRepit + vErrFoundU + vErrStatusU;

	RETURN outError;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_add_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_add_product`;
delimiter ;;
CREATE PROCEDURE `as_sp_add_product`(IN `InName` varchar(100),
IN `InPrice` decimal(10,2),
IN `InStatus` tinyint,
IN `InPkUser` int)
BEGIN
	#Routine body goes here...
	DECLARE outError, outPk INT DEFAULT 0;
	
	SET outError = as_fn_verify_addProduct( InName, InPkUser );
	
	IF outError = 0 THEN
		
		INSERT INTO as_product(
				nameProduct,
				priceProduct,
				statusRegister,
				fkUser,
				dateRegister
		) VALUES (
				InName,
				InPrice,
				InStatus,
				InPkUser,
				CURRENT_TIMESTAMP()
		);
		
		SET outPk = LAST_INSERT_ID();
		
	END IF;
	
	SELECT outError AS 'showError', outPk AS 'pk';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_delete_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_delete_product`;
delimiter ;;
CREATE PROCEDURE `as_sp_delete_product`(IN `InPkProduct` bigint,
IN `InFkUser` int)
BEGIN
	#Routine body goes here...
	DECLARE outError TINYINT DEFAULT 0;
	
	SET outError = as_fn_verify_deleteProduct( InPkProduct, InFkUser );
	
	IF outError = 0 THEN
		
		DELETE FROM as_product
		WHERE pkProduct = InPkProduct AND fkUser = InFkUser;
		
	END IF;
	
	SELECT outError AS 'showError';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_get_products
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_get_products`;
delimiter ;;
CREATE PROCEDURE `as_sp_get_products`(IN `InPage` tinyint,
IN `InFkUser` int)
BEGIN
	#Routine body goes here...
	DECLARE InStart INT DEFAULT 0;
	
	SET @InStart = ( InPage - 1 ) * 10;
	
	/*IF InQuery != '' THEN
		SET outWhere = CONCAT( outWhere, " AND P.nameSport LIKE '%", InQuery, "%'" );
	END IF;*/
	
	SELECT
				P.pkProduct,
				P.nameProduct,
				P.priceProduct,
				P.urlImg,

				P.statusRegister,
				P.dateRegister
	FROM as_product P
	WHERE P.fkUser = InFkUser
	LIMIT InStart, 10;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_login`;
delimiter ;;
CREATE PROCEDURE `as_sp_login`(IN `InUserName` varchar(100))
BEGIN
	#Routine body goes here...
	DECLARE outError TINYINT DEFAULT 0;
	DECLARE vPkUser INT;
	
	SELECT pkUser INTO vPkUser
	FROM as_user
	WHERE email = InUserName;
	
	IF vPkUser IS NULL THEN
		SET outError = 1;
	END IF;

	IF outError = 0 THEN
		
		SELECT pkUser,
					fullname,
					email,
					phone,
					userPassword,
					outError AS 'showError'
	FROM as_user
	WHERE email = InUserName
	LIMIT 0,1;
		
	ELSE
		 SELECT outError AS 'showError';
	END IF;

	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_singin
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_singin`;
delimiter ;;
CREATE PROCEDURE `as_sp_singin`(IN `InName` varchar(50),
IN `InEmail` varchar(100),
IN `InPhone` varchar(20),
IN `InPassword` varchar(200),
IN `InIpUser` varchar(20))
BEGIN
	#Routine body goes here...
	DECLARE outError TINYINT DEFAULT 0;
	DECLARE outPk INT;
	
	SET outError = as_fn_verify_singin( InEmail );
	
	IF outError = 0 THEN
		
		INSERT INTO as_user (
			fullname,
			email,
			phone,
			userPassword,
			
			statusRegister,
			dateRegister,
			fkUserRegister,
			ipRegister
			
		) VALUES (
			InName,
			InEmail,
			InPhone,
			InPassword,
			
			1,
			CURRENT_TIMESTAMP(),
			0,
			InIpUser
		);
		
		SET outPk = LAST_INSERT_ID();
		
	END IF;
	
	SELECT outError AS 'showError', outPk AS 'pk';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_update_imgProduct
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_update_imgProduct`;
delimiter ;;
CREATE PROCEDURE `as_sp_update_imgProduct`(IN `InPkProduct` int,
IN `InImg` varchar(100),
IN `InFkUser` int)
BEGIN
	#Routine body goes here...
	DECLARE outError TINYINT DEFAULT 0;
	DECLARE outOldImg VARCHAR(100) DEFAULT '';
	
	SET outError = as_fn_verify_updateImgProduct( InPkProduct, InFkUser );
	
	IF outError = 0 THEN
		
		SELECT urlImg INTO outOldImg
		FROM as_product
		WHERE pkProduct = InPkProduct AND fkUser = InFkUser;
		
		UPDATE as_product SET urlImg = InImg,
													dateUpdated = CURRENT_TIMESTAMP()
		WHERE pkProduct = InPkProduct AND fkUser = InFkUser;
		
	END IF;
	
	SELECT outError AS 'showError', outOldImg AS 'oldImg';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for as_sp_update_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_update_product`;
delimiter ;;
CREATE PROCEDURE `as_sp_update_product`(IN `InPkProduct` int,
IN `InName` varchar(100),
IN `InPrice` decimal(10,2),
IN `InStatus` tinyint,
IN `InPkUser` int)
BEGIN
	#Routine body goes here...
	DECLARE outError INT DEFAULT 0;
	
	SET outError = as_fn_verify_updateProduct( InPkProduct, InName, InPkUser );
	
	IF outError = 0 THEN
		
		UPDATE as_product SET nameProduct = InName,
													priceProduct = InPrice,
													statusRegister = InStatus,													
													dateUpdated = CURRENT_TIMESTAMP()
		WHERE pkProduct = InPkProduct AND fkUser = InPkUser;
		
	END IF;
	
	SELECT outError AS 'showError';

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
