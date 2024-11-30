-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gestion_pruebas
CREATE DATABASE IF NOT EXISTS `gestion_pruebas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_pruebas`;

-- Volcando estructura para tabla gestion_pruebas.asignaciones_de_prueba
CREATE TABLE IF NOT EXISTS `asignaciones_de_prueba` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `prueba` text DEFAULT NULL,
  `proyecto` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `resultado` text DEFAULT NULL,
  `criterio` text DEFAULT NULL,
  `fecha_ejecucion` datetime DEFAULT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.casos_de_prueba
CREATE TABLE IF NOT EXISTS `casos_de_prueba` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `resultado_esperado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `prioridad` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `prueba` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `escenario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.defectos
CREATE TABLE IF NOT EXISTS `defectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `prioridad` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `defecto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_resolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.ejecuciones_de_prueba
CREATE TABLE IF NOT EXISTS `ejecuciones_de_prueba` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_ejecucion` datetime DEFAULT NULL,
  `resultado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `comentarios` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `estado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestion_pruebas.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento gestion_pruebas.c_rol
DELIMITER //
CREATE PROCEDURE `c_rol`(
	IN `xrol` TEXT,
	IN `xdesc` TEXT
)
insert into roles(r_nombre,r_descripcion)VALUES (xrol,xdesc)//
DELIMITER ;

-- Volcando estructura para procedimiento gestion_pruebas.c_usuario
DELIMITER //
CREATE PROCEDURE `c_usuario`(
	IN `xnombre` INT,
	IN `xemail` TEXT,
	IN `xpass` TEXT,
	IN `xrol` INT
)
INSERT INTO usuarios(nombre,email, pass, rol) 
values (xnombre,xemail, xpass, xrol)//
DELIMITER ;

-- Volcando estructura para procedimiento gestion_pruebas.d_rol
DELIMITER //
CREATE PROCEDURE `d_rol`(
	IN `xid` INT
)
DELETE FROM roles where r_id = xid//
DELIMITER ;

-- Volcando estructura para procedimiento gestion_pruebas.loguearse
DELIMITER //
CREATE PROCEDURE `loguearse`(
	IN `xemail` TEXT,
	IN `xpass` TEXT
)
SELECT * from usuarios where u_email=xemail and u_pass = xpass//
DELIMITER ;

-- Volcando estructura para procedimiento gestion_pruebas.r_rol
DELIMITER //
CREATE PROCEDURE `r_rol`(
	IN `xid` INT
)
select * from roles where r_id=xid//
DELIMITER ;

-- Volcando estructura para procedimiento gestion_pruebas.u_rol
DELIMITER //
CREATE PROCEDURE `u_rol`(
	IN `xid` INT,
	IN `xrol` TEXT,
	IN `xdesc` TEXT
)
UPDATE roles SET r_nombre=xrol,r_descripcion=xdesc WHERE r_id=xid//
DELIMITER ;

create table defectos_prueba (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_prueba int not null,
    id_defecto int not null
);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
