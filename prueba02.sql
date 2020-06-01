-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-06-2020 a las 21:29:33
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba02`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciudad` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre`) VALUES
('01', 'Temuco'),
('02', 'Santiago'),
('03', 'Madrid'),
('04', 'Barcelona'),
('05', 'New York'),
('06', 'rostech'),
('07', 'Atenas'),
('08', 'Moscu'),
('09', 'Praga'),
('10', 'Estambul'),
('11', 'Buenos aires'),
('12', 'londres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisiones`
--

DROP TABLE IF EXISTS `divisiones`;
CREATE TABLE IF NOT EXISTS `divisiones` (
  `id_division` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_division`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `divisiones`
--

INSERT INTO `divisiones` (`id_division`, `nombre`) VALUES
('01', 'Primera'),
('02', 'Segunda'),
('03', 'Tercera'),
('04', 'Cuartas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `procedencia` varchar(50) NOT NULL,
  `id_estadio` varchar(50) NOT NULL,
  `id_division` varchar(50) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_estadio` (`id_estadio`),
  KEY `id_division` (`id_division`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre`, `procedencia`, `id_estadio`, `id_division`) VALUES
('02', 'Madrid', 'espana', '02', '01'),
('01', 'Barcelona', 'espanol', '02', '01'),
('03', 'Olympiacos', 'Griega', '06', '01'),
('04', 'Panathinaikos', 'Griega', '06', '02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadios`
--

DROP TABLE IF EXISTS `estadios`;
CREATE TABLE IF NOT EXISTS `estadios` (
  `id_estadio` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_ciudad` varchar(50) NOT NULL,
  `capacidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estadio`),
  KEY `id_ciudad` (`id_ciudad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadios`
--

INSERT INTO `estadios` (`id_estadio`, `nombre`, `id_ciudad`, `capacidad`) VALUES
('01', 'Estadio Temuco', '01', '800000'),
('02', 'lalala', '04', '123345'),
('03', 'Estadio Santiago Bernabeu', '03', '900000'),
('04', 'Estadio moscu', '08', '1000000'),
('05', 'Estadio Newnew', '05', '1200000'),
('06', 'Estadio Atenea', '07', '900000'),
('07', 'Estadio Grapa', '09', '850000'),
('08', 'Estadio bultames', '10', '600000'),
('09', 'Estadio trambul', '10', '700000'),
('10', 'Cuantas copas tenes', '11', '1000000'),
('11', 'Estadio dreslon', '12', '950000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` date NOT NULL,
  `id_posicion` varchar(50) NOT NULL,
  `sueldo_anual` varchar(50) NOT NULL,
  `id_equipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_posicion` (`id_posicion`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre`, `apellido`, `edad`, `id_posicion`, `sueldo_anual`, `id_equipo`) VALUES
('01', 'Ricardo', 'Milos', '1990-02-01', '01', '100000', '01'),
('02', 'Edgar', 'Carcamo', '2000-02-01', '02', '100000', '02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posiciones`
--

DROP TABLE IF EXISTS `posiciones`;
CREATE TABLE IF NOT EXISTS `posiciones` (
  `id_posicion` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_posicion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `posiciones`
--

INSERT INTO `posiciones` (`id_posicion`, `nombre`) VALUES
('01', 'Delantero'),
('02', 'Defensa central'),
('03', 'Centro Campista defensivo'),
('04', 'Defensa lateral'),
('05', 'Medio campista externo'),
('06', 'Medio campista ofensivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `nombre`, `apellido`, `password`) VALUES
('TheGixe', 'Guillermo', 'Carcamo', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
