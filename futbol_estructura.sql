-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.13 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.20.0.7320
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para futbol
CREATE DATABASE IF NOT EXISTS `futbol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futbol`;

-- Volcando estructura para tabla futbol.codemast
CREATE TABLE IF NOT EXISTS `codemast` (
  `Type` varchar(10) NOT NULL DEFAULT '',
  `Code` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`Type`,`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.codetype
CREATE TABLE IF NOT EXISTS `codetype` (
  `Type` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(30) NOT NULL DEFAULT '',
  `Comment` mediumtext,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.dflastid
CREATE TABLE IF NOT EXISTS `dflastid` (
  `Reservado` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.entrenador
CREATE TABLE IF NOT EXISTS `entrenador` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `EquipoID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqEntrenadorApellidoID` (`Apellido`,`ID`) USING BTREE,
  UNIQUE KEY `uqEntrenadorEquipo` (`EquipoID`),
  CONSTRAINT `fk_entrenador_equipo` FOREIGN KEY (`EquipoID`) REFERENCES `equipo` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `LigaID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqEquipoNombreLiga` (`LigaID`,`Nombre`),
  CONSTRAINT `fk_Equipo_LigaID` FOREIGN KEY (`LigaID`) REFERENCES `liga` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.jugador
CREATE TABLE IF NOT EXISTS `jugador` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `EquipoID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqJugadorApellidoID` (`Apellido`,`ID`) USING BTREE,
  UNIQUE KEY `uqJugadorEquipoID` (`EquipoID`,`ID`),
  CONSTRAINT `fkJugadorEquipo` FOREIGN KEY (`EquipoID`) REFERENCES `equipo` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.jugadorposicion
CREATE TABLE IF NOT EXISTS `jugadorposicion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `JugadorID` int NOT NULL,
  `PosicionID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqJugadorPosicion` (`JugadorID`,`PosicionID`),
  UNIQUE KEY `uqPosicionJugador` (`PosicionID`,`JugadorID`),
  CONSTRAINT `fkJPJugador` FOREIGN KEY (`JugadorID`) REFERENCES `jugador` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkJPPosicion` FOREIGN KEY (`PosicionID`) REFERENCES `posicion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.liga
CREATE TABLE IF NOT EXISTS `liga` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `Equipos` int NOT NULL DEFAULT '0',
  `EquiposMax` int NOT NULL DEFAULT '20',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqLigaNombrePais` (`Nombre`,`Pais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.posicion
CREATE TABLE IF NOT EXISTS `posicion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqPosicionNombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.webappserverprops
CREATE TABLE IF NOT EXISTS `webappserverprops` (
  `Key` varchar(64) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL DEFAULT '0001-01-01',
  `CreateTime` varchar(12) NOT NULL DEFAULT '',
  `ExpiresDate` date NOT NULL DEFAULT '0001-01-01',
  `ExpiresTime` varchar(12) NOT NULL DEFAULT '',
  `Locked` smallint NOT NULL DEFAULT '0',
  `LockedDate` date NOT NULL DEFAULT '0001-01-01',
  `LockedTime` varchar(12) NOT NULL DEFAULT '',
  `Page` smallint NOT NULL DEFAULT '0',
  `Pages` smallint NOT NULL DEFAULT '0',
  `Data` mediumtext,
  PRIMARY KEY (`Key`,`Page`),
  UNIQUE KEY `WebAppServerProps002` (`ExpiresDate` DESC,`ExpiresTime` DESC,`Key`,`Page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.webappsession
CREATE TABLE IF NOT EXISTS `webappsession` (
  `SessionKey` varchar(36) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL DEFAULT '0001-01-01',
  `CreateTime` varchar(8) NOT NULL DEFAULT '',
  `LastAccessDate` date NOT NULL DEFAULT '0001-01-01',
  `LastAccessTime` varchar(8) NOT NULL DEFAULT '',
  `UseCount` int NOT NULL DEFAULT '0',
  `RemoteAddress` varchar(57) NOT NULL DEFAULT '',
  `LoginName` varchar(20) NOT NULL DEFAULT '',
  `Active` varchar(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`SessionKey`),
  UNIQUE KEY `WebAppSession002` (`CreateDate`,`CreateTime`,`SessionKey`),
  UNIQUE KEY `WebAppSession003` (`LastAccessDate`,`LastAccessTime`,`SessionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla futbol.webappuser
CREATE TABLE IF NOT EXISTS `webappuser` (
  `LoginName` varchar(20) NOT NULL DEFAULT '',
  `Password` varchar(128) NOT NULL DEFAULT '',
  `Rights` smallint NOT NULL DEFAULT '0',
  `FullName` varchar(30) NOT NULL DEFAULT '',
  `LastLogin` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
