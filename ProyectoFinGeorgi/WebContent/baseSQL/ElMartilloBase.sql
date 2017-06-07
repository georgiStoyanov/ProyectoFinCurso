-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5168
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para elmartillo
CREATE DATABASE IF NOT EXISTS `elmartillo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `elmartillo`;

-- Volcando estructura para tabla elmartillo.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.categorias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
	(3, 'Instalaciones'),
	(2, 'Obras menores'),
	(4, 'Otros'),
	(1, 'Reformas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.comentarios_inicio
CREATE TABLE IF NOT EXISTS `comentarios_inicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(500) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.comentarios_inicio: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `comentarios_inicio` DISABLE KEYS */;
INSERT INTO `comentarios_inicio` (`id`, `email`, `name`, `content`) VALUES
	(1, 'asd', 'asd', 'asd'),
	(2, 'asd', 'asd', 'asd'),
	(3, 'sad', 'asd', 'asd'),
	(4, 'asd', 'asd', 'asd'),
	(5, 'asd@asd.com', 'asd', 'asd'),
	(6, 'asd@asd.com', 'asd', 'asd'),
	(7, 'asd@asd.com', 'asd', 'asd'),
	(8, 'asd@abv.comasd', 'asd', 'asd'),
	(9, '', '', ''),
	(10, 'asd@abv.bg', 'asd', 'asd'),
	(11, 'asd@asd.com', 'asd', 'asd'),
	(12, 'asd@asd.com', 'asd', 'asd'),
	(13, 'asd@asd.com', 'asd', 'asd'),
	(14, 'asd@asd.com', 'asd', 'asd'),
	(15, 'asd@asd.com', 'asd', 'asd'),
	(16, 'asd@asd.com', 'asd', 'asd'),
	(17, 'asd@asd.com', 'asd', 'asd'),
	(18, 'asd@asd.com', 'asd', 'asd'),
	(19, 'asd@asd.com', 'asd', 'asd'),
	(20, 'asd@asd.com', 'asd', 'asd');
/*!40000 ALTER TABLE `comentarios_inicio` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.precios
CREATE TABLE IF NOT EXISTS `precios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio_servicio` double DEFAULT NULL,
  `precio_mercancia_de` double DEFAULT NULL,
  `precio_mercancia_a` double DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicio` (`servicio`),
  CONSTRAINT `precios_ibfk_1` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.precios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` (`id`, `precio_servicio`, `precio_mercancia_de`, `precio_mercancia_a`, `servicio`) VALUES
	(1, 11, NULL, NULL, 1);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.relacion_servicio_categoria
CREATE TABLE IF NOT EXISTS `relacion_servicio_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_categoria_id` int(11) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categoria` (`sub_categoria_id`),
  KEY `servicio` (`servicio_id`),
  CONSTRAINT `relacion_servicio_categoria_ibfk_1` FOREIGN KEY (`sub_categoria_id`) REFERENCES `sub_categorias` (`id_sub_categoria`),
  CONSTRAINT `relacion_servicio_categoria_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.relacion_servicio_categoria: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `relacion_servicio_categoria` DISABLE KEYS */;
INSERT INTO `relacion_servicio_categoria` (`id`, `sub_categoria_id`, `servicio_id`) VALUES
	(1, 1, 1),
	(2, 3, 1),
	(3, 2, 1),
	(4, 4, 1),
	(5, 5, 2),
	(6, 4, 2),
	(7, 1, 2);
/*!40000 ALTER TABLE `relacion_servicio_categoria` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `medida` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.servicios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id`, `nombre`, `medida`) VALUES
	(1, 'Construir una de pared de ladrillo', 'm2'),
	(2, 'Instalación de parquet', 'm2');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.sub_categorias
CREATE TABLE IF NOT EXISTS `sub_categorias` (
  `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sub_categoria` varchar(200) NOT NULL,
  `categoria` varchar(200) NOT NULL,
  PRIMARY KEY (`id_sub_categoria`),
  UNIQUE KEY `nombre` (`nombre_sub_categoria`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `sub_categorias_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.sub_categorias: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `sub_categorias` DISABLE KEYS */;
INSERT INTO `sub_categorias` (`id_sub_categoria`, `nombre_sub_categoria`, `categoria`) VALUES
	(1, 'Vivienda', 'Reformas'),
	(2, 'Cocina', 'Reformas'),
	(3, 'Baño', 'Reformas'),
	(4, 'Oficina', 'Reformas'),
	(5, 'Local Comercial', 'Reformas'),
	(6, 'Pintor', 'Obras menores'),
	(7, 'Electrodomésticos', 'Instalaciones'),
	(8, 'Desescombrar', 'Otros');
/*!40000 ALTER TABLE `sub_categorias` ENABLE KEYS */;

-- Volcando estructura para tabla elmartillo.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(500) DEFAULT NULL,
  `derechos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla elmartillo.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `email`, `pass`, `derechos`) VALUES
	(1, 'asd@asd.com', 'asd', 'admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
