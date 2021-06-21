-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-06-2021 a las 04:11:47
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `regalos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl`
--

CREATE TABLE `acl` (
  `ai` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_actions`
--

CREATE TABLE `acl_actions` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_categories`
--

CREATE TABLE `acl_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `category_desc` varchar(100) NOT NULL COMMENT 'Human readable description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_sessions`
--

CREATE TABLE `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('nalrval217n2jntc4bprhe22lagb9dfn', 342590530, '2021-06-21 04:04:48', '2021-06-21 04:04:48', '127.0.0.1', 'Chrome 91.0.4472.106 on Windows 10'),
('fvq29k4ol9dan60jjiu2abab4nomeea6', 342590530, '2021-06-20 04:24:00', '2021-06-20 04:29:59', '127.0.0.1', 'Chrome 91.0.4472.106 on Windows 10'),
('mbe5qpm2l7pcfj7np59ulvv5mjrbg164', 342590530, '2021-06-20 17:06:57', '2021-06-20 17:19:11', '127.0.0.1', 'Chrome 91.0.4472.106 on Windows 10'),
('j0pstat2ro5d8aifr69juvkafpcaioam', 342590530, '2021-06-20 17:13:22', '2021-06-20 17:18:39', '127.0.0.1', 'Chrome 91.0.4472.106 on Windows 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `carrito` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'cervezas'),
(2, 'botanas'),
(3, 'tequilas'),
(4, 'brandy'),
(5, 'ron'),
(6, 'vodkas'),
(7, 'wisky');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`) VALUES
(1, 'Publico General', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocina`
--

CREATE TABLE `cocina` (
  `id` int(11) NOT NULL,
  `producto` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `mesa` varchar(90) NOT NULL,
  `status` int(90) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `producto` varchar(90) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(9,1) NOT NULL,
  `importe` decimal(9,1) NOT NULL,
  `costo` decimal(9,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `id_venta`, `producto`, `cantidad`, `precio`, `importe`, `costo`) VALUES
(1, 1, 'MINIATURA ARBOL DE NAVIDAD', 1, '60.0', '60.0', '5.0'),
(2, 2, 'GLOBO TE AMO DECORACION SIN HELIO', 1, '100.0', '100.0', '0.0'),
(3, 2, 'BOLSA CHICA FUDI SAN VALENTIN', 1, '25.0', '25.0', '0.0'),
(4, 2, 'CARGA DE ELIO LATEX JUMBO', 1, '250.0', '250.0', '0.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ips_on_hold`
--

CREATE TABLE `ips_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_errors`
--

CREATE TABLE `login_errors` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_errors`
--

INSERT INTO `login_errors` (`ai`, `username_or_email`, `ip_address`, `time`) VALUES
(22, 'admin', '127.0.0.1', '2021-06-20 04:21:37'),
(23, 'admin', '127.0.0.1', '2021-06-20 04:23:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `seccion` int(11) NOT NULL,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `alias` varchar(120) NOT NULL,
  `cuadrara` int(1) NOT NULL,
  `arriba` int(11) NOT NULL,
  `izquierda` int(11) NOT NULL,
  `alto` int(11) NOT NULL DEFAULT '60',
  `ancho` int(11) NOT NULL DEFAULT '60'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL,
  `metodo` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`id`, `metodo`) VALUES
(1, 'Efectivo'),
(2, 'debito'),
(4, 'transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_metodo` int(11) NOT NULL,
  `importe` decimal(9,1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_venta`, `id_metodo`, `importe`, `fecha`) VALUES
(1, 1, 1, '60.0', '2021-06-21 01:48:30'),
(2, 2, 1, '375.0', '2021-06-21 02:54:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre_generico` varchar(50) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `costo` decimal(9,1) DEFAULT NULL,
  `precio` decimal(9,1) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT '0',
  `PDate` datetime DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Exp` int(11) DEFAULT '0',
  `Descuento` float DEFAULT '0',
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `NivelOptimo` int(11) DEFAULT '0',
  `Saldo` double DEFAULT '0',
  `CantidadDesc` int(11) DEFAULT '0',
  `ExisteAqui` tinyint(1) DEFAULT NULL,
  `Borrado` tinyint(1) DEFAULT NULL,
  `inventariable` tinyint(4) NOT NULL,
  `imagen` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `codigo`, `nombre_generico`, `id_categoria`, `stock`, `stock_minimo`, `costo`, `precio`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `inventariable`, `imagen`) VALUES
(1, 'PORTA RETRATO REPUJADO ', '8412', 'P.REPUJADO', 27, 0, 0, '10.0', '27.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(2, 'PORTA RETRATO RUSS 1', '039915253096', 'P.RUSS.1', 27, 0, 0, '50.0', '100.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(3, 'PORTA RETRATO RUSS 2', '039915256622', 'P.RUSS.2', 27, 0, 0, '80.0', '200.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(4, 'CAJITA PARA JOYERIA LARGA', '00291', 'C.JOY.L', 1, 25, 0, '7.0', '28.0', 21, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 175, 0, 0, 0, 0, ''),
(5, 'COJIN CORAZON COMICS AMOR', '00594', 'C.COMICS.MANT', 20, 0, 0, '129.0', '270.0', 28, '2012-07-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(6, 'CARTERA GRACE PELUCHE DAMA', '00112', 'PELUCH', 23, 0, 0, '95.0', '218.0', 27, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(7, 'COJIN IPHONE LOVEYOU JUMBO', '00576', 'C.IPHONE', 20, 0, 0, '108.0', '250.0', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(8, 'MINIATURA RANIRA C/ CORAZON', '00578', 'RANITA', 27, 0, 0, '23.0', '48.0', 26, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(9, 'MINIATURA VITRAL COMICS GRANDE', '00358', 'M.COMICS.G', 27, 0, 0, '30.0', '58.0', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(10, 'MINIATURA VITRAL COMICS MEDIANO ', '7502209450066', 'M.VITRAL', 27, 0, 0, '18.0', '40.0', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(11, 'PERGAMINO COMICS', '00121', 'P.COMICS', 22, 4, 0, '95.0', '240.0', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, 0, ''),
(12, 'PELUCHE GOOFFY STANDARD ', '7501917232759', 'P.GOFFY', 20, 0, 0, '100.0', '187.0', 24, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(13, 'MOCHILA TOY STORY DE 350 A 199', '7506111762491', 'M.DESCUENTO', 25, 0, 0, '100.0', '199.0', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(14, 'LAMPARA DE LAVA', '00123', 'L.LAVA', 22, 0, 0, '100.0', '250.0', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(15, 'CUADRO DE EYORE GRANDE', '00213', 'C.EEYORE', 22, 0, 0, '100.0', '250.0', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(16, 'RELOJ UNISET CABALLERO', '00214', 'PUMAS', 23, 0, 0, '75.0', '250.0', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(17, 'CUADRO DE POOH FAMILIAR ', '00215', 'C.FAMILI', 22, 1, 0, '70.0', '150.0', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(18, 'CUADRO BB ROSA', '079522681318', 'C.ROSA', 22, 0, 0, '50.0', '100.0', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(19, 'MINIATURA CUADRO REPUJADO ', '00379', 'MINI.CUADRI', 27, 1, 0, '7.0', '40.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 7, 0, 0, 0, 0, ''),
(20, 'BOTE CON DULCE MEDIANA ', '00175', 'BOTELL-M', 27, 1, 0, '30.0', '79.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, 0, ''),
(21, 'BOTELLA C/ DULCE GRANDE', '00039', 'BOTELL-G', 27, 1, 0, '48.0', '100.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, 0, ''),
(22, 'MINIATURA ANIMALES CAJITA SORPRESA', '00367', 'AMIGA', 27, 0, 0, '25.0', '49.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(23, 'MINIATURA TRONCO PANDA Y LEON', '00370', 'TRON', 27, 0, 0, '38.0', '79.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(24, 'TAZA MENSAJES DETALLES DE AMOOR', '00366', 'TAZ-DETALL', 27, 6, 0, '40.0', '110.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 240, 0, 0, 0, 0, ''),
(25, 'RECADITO RUSS CORAZON', '00536', 'REC.RUSS', 28, 0, 0, '30.0', '81.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(26, 'RECADITO RUSS CHEER UP', '00417', 'REC.CHEER-UP', 28, 0, 0, '20.0', '61.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(27, 'BOLSA MEDIANA DIPAK ', '0011', 'M-DIPAK', 1, 7, 0, '14.0', '27.0', 22, '2014-10-02 00:00:00', '', 0, 0, NULL, NULL, 0, 98, 0, 0, 0, 0, ''),
(28, 'COJIN CARITA WHATSAPP CHANGO ', '00122', 'WHATS', 20, 0, 0, '120.0', '270.0', 23, '2015-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(29, 'BOLSA GRANDE GRABA IMAGEN ', '00541', 'B.IMAGEN GRANDE', 1, 13, 0, '13.0', '31.0', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 169, 0, 0, 0, 0, ''),
(30, 'BOLSA BUTIC MEDIANA GRABA IMAGEN ', '00543', 'B.IMAGEN MEDIANA ', 1, 2, 0, '10.0', '25.0', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 20, 0, 0, 0, 0, ''),
(31, 'BOLSA DIPAK EX JUMBO TODA OCACION ', '7501091801406', 'B.DIPAK JUMBO', 1, 0, 0, '19.0', '39.0', 22, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(32, 'BOLSA ELEGANS MEDIANA ', '7500311002296', 'B.ELEGANS MED', 1, 0, 0, '15.0', '29.0', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(33, 'BOLSA DISNEY ADAS MEDIANA ', '7501091899052', 'B.DISNEY ADAS', 1, 0, 0, '8.0', '18.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(34, 'BOLSA DISNEY POOH MEDIANA ', '7501091899212', 'B.DISNEY POOH', 1, 0, 0, '8.0', '18.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(35, 'BOLSA DIPAK GRANDE AMOR (SAN VALENTIN )', '7501091825235', 'B.DIPAK FLORES', 1, 0, 0, '13.0', '26.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(36, 'BOLSA DIPAK NOVIAS BAUTIZO Y COMUNION GRANDE', '7501091825037', 'B.DIPAK NOVIAS', 1, 0, 0, '10.0', '20.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(37, 'SOMBRAS SHE CHERRY CREAM SODA', '00606', 'SOMBRA', 23, 0, 0, '7.0', '18.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(38, 'CAJA FRANJAS GRANDE ', '7501064303937', 'C.FRANJAS GDE', 1, 0, 0, '29.0', '40.0', 21, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(39, 'CAJA IMAGEN PRINTS GRANDE', '00203', 'C.LUNARES GRD', 1, 70, 0, '49.0', '105.0', 21, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 3430, 0, 0, 0, 0, ''),
(40, 'COJIN EX LARGO PLANETART ', '00583', 'C.EX PLANETART', 20, 0, 0, '150.0', '300.0', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(41, 'PELUCHE TIGEER DETECTIVE E', '7501917228370', 'P.DETECTIVE E', 20, 0, 0, '200.0', '380.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(42, 'PELUCHE PIGLET PEQ LETF D', '7501917239079', 'P.LETF D', 20, 0, 0, '99.0', '199.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(43, 'PELUCHE TIGGER BEISVOLISTA E', '7501917219200', 'P.BEIS.E', 20, 0, 0, '199.0', '350.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(44, 'PELUCHE POOH AVIADOR D', '7506223749687', 'P.AVIADOR.D', 20, 0, 0, '145.0', '300.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(45, 'PELUCHE EEYORE JARDINERO D ', '7506223799576', 'P.JARDINERO.D', 20, 0, 0, '109.0', '299.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(46, 'PELUCHE POOH CLASICO D', '7506223712773', 'P.CLASICO.D', 20, 0, 0, '109.0', '299.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(47, 'MOCHILITA  AMONGO ', '0014', 'M-AMONGGO', 22, 0, 0, '50.0', '140.0', 26, '2014-10-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(48, 'BOLSA CHICA DIPAK TODA OCACION ', '0016', 'DIPAK-C', 1, 0, 0, '8.0', '10.0', 22, '2014-10-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(49, 'COJIN CORAZON ROMPECABEZA', '00568', 'ROMPECABEZA', 20, 1, 0, '140.0', '170.0', 26, '2014-10-04 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, 0, ''),
(50, 'PELUCHE PANDA COSTURINI MED', '2009030317520', 'PAN-DA', 20, 0, 0, '70.0', '180.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(51, 'PELUCHE VACA MALTEADA MED', '2010055251317', 'MAL-TEADA', 20, 0, 0, '80.0', '199.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(52, 'PELUCHE CHANGO Y OSO SUAVECITO GRANDE ', '4611', 'P-SUAVECITO', 20, 0, 0, '370.0', '799.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(53, 'PELUCHE SPEEDY GONZALES 16\"', '7501917222477', 'SPEEDY', 20, 0, 0, '90.0', '199.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(54, 'MINIATURA ANIMALITO EN TROCO', '0013', 'M-TRON', 27, 0, 0, '30.0', '64.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(55, 'MINIATURA BUUO', '1170', 'BUO', 27, 0, 0, '30.0', '58.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(56, 'ANILLO P/ DAMA FASION ', '00422', 'A.FASION', 23, 0, 0, '100.0', '40.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(57, 'RELOJ  P/ DAMA FASION', '00056', 'R-FLORS', 23, 9, 0, '65.0', '180.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 585, 0, 0, 0, 0, ''),
(58, 'BRAZALETE P/ DAMA FASION', '00609', 'B.FASION', 23, 2, 0, '50.0', '100.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(59, 'BRAZALETE P/ DAMA PLATA Y DORADO', '00528', 'B.P/DAMA', 23, 2, 0, '80.0', '100.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, 0, ''),
(60, 'RELOJ DE VIRGEN ', '00228', 'R. VIRGEN', 23, 0, 0, '100.0', '199.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(61, 'DIJE DE ACERO INOXIDABLE C/ CAUCHO ', '00347', 'D.INOX.CAUCH', 23, 0, 0, '40.0', '120.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(62, 'DIJE ACERO INOXIDABLE CRUZ C/ CAUCHO ', '00386', 'D.CRUZ', 23, 0, 0, '60.0', '170.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(63, 'COSMETIQUERA  YAALI', '7506024859035', 'C.YAALI', 23, 0, 0, '50.0', '100.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(64, 'CINTURON P/DAMA BRILLIT', '001791', 'C.BRILLIT', 23, 0, 0, '40.0', '100.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(65, 'LENTES UNIXE', '00013', 'UNIX', 23, 1, 0, '28.0', '70.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 28, 0, 0, 0, 0, ''),
(66, 'MONEDERO FLO YAALI', '00979', 'M.FLO', 23, 0, 0, '40.0', '100.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(67, 'BOLSO FASION DAMA LUNARES', '00284', 'B.FASS', 23, 1, 0, '45.0', '170.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(68, 'PELUCHE SULY Y PERRO AMARILLO POLIESFERA ', '00537', 'P-SULY', 20, 0, 0, '85.0', '150.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(69, 'COJIN STITCH GRANDE', '00137', 'STICHIS', 20, 0, 0, '120.0', '350.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(70, 'MONEDERO DE METAL DISNEY GRANDE ', '00115', 'ALCAN.B.G', 22, 0, 0, '27.0', '59.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(71, 'BOTE CON DULCE CURATIVOS', '716', 'CURA', 27, 1, 0, '55.0', '100.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 55, 0, 0, 0, 0, ''),
(72, 'PELUCHE ALCANCIA ', '00113', 'ALCAN.B.CH', 20, 4, 0, '120.0', '265.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 480, 0, 0, 0, 0, ''),
(73, 'CIGARRERAS', '00131', 'CIGA', 23, 1, 0, '75.0', '190.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 75, 0, 0, 0, 0, ''),
(74, 'MOTO DE METAL', '00102', 'MOTT', 22, 0, 0, '75.0', '200.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(75, 'TERMO AMOR Y AMISTAD', '00136', 'TERMO', 27, 0, 0, '129.0', '250.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(76, 'TOCADO PARA DAMA', '00144', 'TOCADO', 23, 1, 0, '70.0', '140.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(77, 'FIGURA DISNEY CON MOVIMIENTO DAFFYB Y PIOLIN', '00026', 'FIG.DISNEY', 22, 0, 0, '70.0', '110.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(78, 'BIG BEN LONDON METAL', '00126', 'MET', 22, 0, 0, '135.0', '300.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(79, 'LONCHERA DISNEY LAMIN ', '00128', 'LONCH.DISNEY', 22, 0, 0, '60.0', '140.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(80, 'MINIATURA FLOR C/ MACETA ', '00400', 'FLO', 27, 0, 0, '31.0', '64.0', 26, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(81, 'MUSICO ADA DE METAL ', '00380', 'MUSI', 23, 0, 0, '65.0', '198.0', 27, '2016-10-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(82, 'PORTA LAPICERO MUSICOS', '00148', 'XTA', 22, 0, 0, '55.0', '150.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(83, 'ALBUN PIRATAS DEL CARIBE ', '00434', 'ALBN.PIRATAS', 22, 0, 0, '35.0', '78.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(84, 'LONCHERA DISNEY', '00297', 'LONCH.PIOLIN', 22, 0, 0, '45.0', '118.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(85, 'ALBUN SENCILLO 2', '00107', 'ALBUN.2', 22, 0, 0, '15.0', '27.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(86, 'CORONITA INFANTIL', '00116', 'CORONA', 23, 0, 0, '40.0', '110.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(87, 'CARPETA DE POOH ', '00100', 'CARP-POOH', 22, 0, 0, '5.0', '10.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(88, 'TANQUE MILITAR DE COLECCION ', '00101', 'TANQUE', 22, 0, 0, '125.0', '250.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(89, 'DIARIO C/ CANDADO DIFERENTES MODELOS', '00534', 'DIAR.', 22, 0, 0, '20.0', '40.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(90, 'LONCHERA TERMICA FORTUNIKS', '00118', 'FORTU', 25, 0, 0, '49.0', '150.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(91, 'CUADRO DE MADERA CON PENSAMIENTO', '00119', 'CUADRO', 22, 0, 0, '115.0', '230.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(92, 'PORTA CLIP RICH', '00403', 'PORT.RICH', 22, 0, 0, '25.0', '40.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(93, 'CARTERITA DE PELUCHE ANIMALITOS', '7184', 'C-NIÑA', 22, 2, 0, '52.0', '118.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 104, 0, 0, 0, 0, ''),
(94, 'SEPARADOR GUSANITO', '7512', 'SEPARA.GUS', 22, 41, 0, '3.0', '7.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 123, 0, 0, 0, 0, ''),
(95, 'SEPARADOR DE POOH', '751214221964', 'SEPARA .POOH', 22, 0, 0, '3.0', '7.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(96, 'LLAVERO CORAZON PARIS', '1030', 'LL.BETTY', 22, 0, 0, '40.0', '120.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(97, 'MOCHILA PORTAFOLIO GUSANITO', '00493', 'M.POTAF.CHEN', 25, 1, 0, '200.0', '300.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(98, 'MOCHILA MK ', '00488', 'M-K', 25, 0, 0, '130.0', '299.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(99, 'MOCHILA DE VIRGEN ', '00558', 'M.VIRGEN', 25, 0, 0, '110.0', '311.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(100, 'MOCHILA LOI WOOPS DE 360 A 150', '00556', 'M-LOIWOOPS', 25, 0, 0, '150.0', '150.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(101, 'MOCHILA TOY STORY Y JACK C/DESCUENTO $350 A $250', '00559', 'M.TOY.JACK', 25, 0, 0, '120.0', '250.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(102, 'MOCHILA SHREK C/ DESCUENTO $310 A 150', '00484', 'M.SHR', 25, 0, 0, '120.0', '150.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(103, 'BOLSITO SIRENA DORADA', '00553', 'DORADA', 23, 0, 0, '100.0', '200.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(104, 'LONCHERA CHENSON COWCO', '7509048099203', 'LONCH.COWCO', 25, 0, 0, '80.0', '160.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(105, 'MOCHILA FULANITOS RUEDAS ', '7509048154711', 'M.RUEDAS', 25, 0, 0, '150.0', '380.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(106, 'MOCHILA FULANITOS CHENSON DE 300 A 180', '7509048151871', 'M.FULAN.CHENS', 25, 0, 0, '120.0', '180.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(107, 'MOCHILA LOI WOOPS CHICA', '00557', 'M.LOI-WOOPS', 25, 0, 0, '100.0', '300.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(108, 'MOCHILA CHENSON FULANITO C/DESCUENTO $150 A$100', '7509048140455', 'M.FUL', 25, 0, 0, '80.0', '100.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(109, 'MOCHILA MIKO CLUB 1', '00456', 'M.MIKO', 25, 0, 0, '100.0', '231.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(110, 'MOCHILA SPIDERMAN CHICA', '840716050131', 'M.SPIDER', 25, 0, 0, '100.0', '199.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(111, 'PELUCHE BABY MADEQUITOS ', '81165', 'P.MADEQUITOS', 20, 0, 0, '109.0', '251.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(112, 'PELUCHE STUPID FACTORY ', '00472', 'P.STUPIC', 20, 0, 0, '100.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(113, 'PELUCHE PIOLIN PANA D', '7501917230465', 'P.P.PANA', 20, 0, 0, '109.0', '250.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(114, 'PELUCHE PETUNIA', '7501917222514', 'P.COCHI', 20, 0, 0, '109.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(115, 'PELUCHE PIOLIN MOCHILA ', '7501917220909', 'P.P.MOCHILA', 20, 0, 0, '90.0', '199.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(116, 'PELUCHE DAFFY ', '7501917220220', 'P.DAFFY', 20, 0, 0, '100.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(117, 'PELUCHE AGUACATE MEDIANO', '1371', 'AGUACATE-M', 20, 7, 0, '120.0', '300.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 840, 0, 0, 0, 0, ''),
(118, 'PELUCHE REY LOOI', '7501917270089', 'P-REY', 20, 0, 0, '109.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(119, 'PELUCHE BOMBON CHICAS SUPER PODEROSAS', '7501917232117', 'P.BOMBON', 20, 0, 0, '109.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(120, 'PELUCHE BELLOTA CHICAS SUPER PODEROSAS ', '7501917232032', 'P.BELLOTA', 20, 0, 0, '109.0', '200.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(121, 'PELUCHE SYLVESTRE PANA D', '7501917230380', 'P.SYLVES.P', 20, 0, 0, '109.0', '250.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(122, 'PELUCHE MARCH SIMPSONS', '00019', 'P.MARCH', 20, 0, 0, '100.0', '150.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(123, 'PELUCHE ENANO DORMILON BB', '7501917271505', 'P-DORM.BB', 20, 0, 0, '40.0', '97.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(124, 'PELUCHE MARC ANTONY BB', '7501917222149', 'P.ANTONY.BB', 20, 0, 0, '40.0', '50.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(125, 'PELUCHE DADO BB', '831029737093', 'P.DADO', 20, 0, 0, '20.0', '49.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(126, 'ORGANIZADOR  HELLO KITTY', '00149', 'OR-HELLO', 22, 0, 0, '45.0', '110.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(127, 'CAJA FRANJAS CHICA ', '7501064303913', 'C.FRAN.CH', 1, 0, 0, '8.0', '27.0', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(128, 'CAJA IMAGEN PRINTS CHICA', '00200', 'C.LUNARS.CH', 1, 3, 0, '15.0', '40.0', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(129, 'CAJA FRANJAS MEDIANA', '7501064303920', 'C.FRANJS.MEDIANA', 1, 0, 0, '16.0', '49.0', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(130, 'CAJA IMAGEN PRINTS MEDIANA ', '00201', 'C.LUNARS.MEDIANA', 1, 0, 0, '29.0', '62.0', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(131, 'CARTERA CABALLERO DIFERENTES MARCAS', '00104', 'C-YAALI', 23, 10, 0, '68.0', '300.0', 27, '2012-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 680, 0, 0, 0, 0, ''),
(132, 'COJINNETTE EXPLOWORLD DIFERENTES MODELOS ', '00567', 'C.EXPLOW', 20, 1, 0, '90.0', '100.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 90, 0, 0, 0, 0, ''),
(133, 'CAJA DE REGALOS THE CAT GRANDE', '1487', 'THE CAT-G', 1, 0, 0, '37.0', '95.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(134, 'MINIATURA PERGAMINO GRANDE', '00105', 'PERG-G', 27, 0, 0, '58.0', '119.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(135, 'VELERO DE METAL COLECCION ', '00564', 'VELERO', 22, 0, 0, '65.0', '180.0', 27, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(136, 'BALANCE P/ OFICINA ', '00563', 'BALANCE', 22, 0, 0, '67.0', '170.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(137, 'VELADORA RUSS', '00110', 'VELA.RUSS', 27, 4, 0, '50.0', '100.0', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(138, 'EXIBIDOR PARA RELOJ DAMA', '01000', 'EXIBI', 23, 34, 0, '10.0', '35.0', 27, '2015-09-18 00:00:00', '', 0, 0, NULL, NULL, 0, 340, 0, 0, 0, 0, ''),
(139, 'MINIATURA VAQUITA Y RANITA', '00392', 'PAÑUEL', 27, 0, 0, '26.0', '54.0', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(140, 'PELUCHE OSO CORAZON METALICO C/ SONIDO JUMBO', '7500107573528', 'METALICO', 20, 0, 0, '289.0', '650.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(141, 'PELUCHE PERRO CON CORBATA GRANDE', '00717', 'P.CORBATA', 20, 0, 0, '210.0', '600.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(142, 'PELUCHE OSO TEDY GRANDE', '00718', 'TEDY-G', 20, 0, 0, '140.0', '370.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(143, 'PELUCHE OSOS KIMI', '00719', 'KIMI', 20, 0, 0, '98.0', '215.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(144, 'PELUCHE OSA BLANQUITA CON MOÑO GRANDE ', '00720', 'OSA.ESTR', 20, 0, 0, '520.0', '1100.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(145, 'PELUCHE PERRO PEKAS GRANDE', '00721', 'P.PERRIT.PK', 20, 0, 0, '350.0', '780.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(146, 'PELUCHE OSO RELOJ GRANDE', '3116', 'RELOJ', 20, 0, 0, '320.0', '750.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(147, 'PELUCHE 0S0 CARACOLIN EXTRA GRANDE', '2012702418630', 'P.CARACOLIN.EXG', 20, 0, 0, '125.0', '390.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(148, 'PELUCHE OSA CARACOLINY EXTRA GRANDE ', '2012702418333', 'P.CARACOLINY.EXG', 20, 0, 0, '125.0', '390.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(149, 'PELUCHE OSO BELENGUE GRANDE ', '2011098230024', 'P.BELENGUE', 20, 0, 0, '89.0', '260.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(150, 'PELUCHE OSO CORAZON DORADO GRANDE ', '1644', 'DORADO', 20, 0, 0, '650.0', '1100.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(151, 'PELUCHE OSA CORACOLINY GRANDE ', '2012070241830', 'P.CARACILINY.G', 20, 0, 0, '119.0', '280.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(152, 'PELUCHE OSO SENTADO CON BUFANDA GRANDE ', '800010700347', 'P.BUFANDA.G', 20, 0, 0, '119.0', '350.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(153, 'PELUCHE OSO GARABATOSO GRANDE ', '2011091424185', 'P.GARABATOS.G', 20, 0, 0, '119.0', '280.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(154, 'PELUCHE OSO GARABATOSO MEDIANO ', '2011091214175', 'P.GARABATOSO.M', 20, 0, 0, '89.0', '199.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(155, 'PELUCHE PERRITA NECTAR MEDIANA', '2010112696266', 'P.NECTAR.M', 20, 0, 0, '69.0', '199.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(156, 'PELUCHE OSA GALLY MEDIANO ', '2010109007259', 'P.GALLY.M', 20, 0, 0, '89.0', '180.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(157, 'COJIN CARITA UNICORNIO MEDIANO', '00779', 'C-UNICOR', 20, 0, 0, '120.0', '280.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(158, 'PELUCHE AMONGAS POLIESFERA ', '00723', 'AAMONG', 20, 4, 0, '80.0', '250.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 320, 0, 0, 0, 0, ''),
(159, 'ALMOHADA GRANDE MANTA PINTADA ', '00724', 'AL.MANTA', 20, 0, 0, '200.0', '400.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(160, 'ALMOHADA MEDIANA MANTA PINTADA ', '7150', 'AL.MANTT', 20, 6, 0, '100.0', '200.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, 0, ''),
(161, 'ALMOHADA HUESO BEST FRIENDS SUPER', '00726', 'AL.BEST', 20, 0, 0, '190.0', '400.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(162, 'ALMOHADA BALON EQUIPOS', '00727', 'AL.BALON', 20, 1, 0, '75.0', '110.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 75, 0, 0, 0, 0, ''),
(163, 'PELUCHE MUÑECA WOODY TOYS GRANDE', '00728', 'P.MUÑ.G', 20, 0, 0, '140.0', '280.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(164, 'PELUCHE JIRAFA BEBE MUSICAL', '00729', 'P-JIRAF.BB', 20, 0, 0, '135.0', '270.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(165, 'PELUCHE MUÑECA WOODY TOYS CHICA ', '851785039002', 'P.MUÑ.CH', 20, 0, 0, '68.0', '140.0', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(166, 'PERGAMINO GRANDE AMOR', '00730', 'PERG.G', 22, 0, 0, '199.0', '395.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(167, 'CAJA DE REGALOS DEDICADA JUMBO', '1733', 'DEDICADA-J', 1, 9, 0, '65.0', '145.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 585, 0, 0, 0, 0, ''),
(168, 'CAJA DE REGALOS LUNARES 1883 MED', '00734', '1883-M', 1, 0, 0, '35.0', '79.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(169, 'CAJA DE REGALOS DEDICADA CHICA', '1735', 'DEDICADA-CH', 1, 0, 0, '25.0', '50.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(170, 'CAJA DE REGALOS DEDICADA MEDIANA', '1736', 'DEDICADA-M', 1, 0, 0, '40.0', '80.0', 21, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(171, 'CAJA DE REGALOS DEDICADA GRANDE', '1737', 'DEDICADA-G', 1, 3, 0, '50.0', '120.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, ''),
(172, 'CAJA DE REGALOS LUNARES JUMBO', '00738', 'LUNARES-J', 1, 0, 0, '55.0', '128.0', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(173, 'CAJA DE REGALO C/ MOÑO GDE', '00739', '1883-G', 1, 0, 0, '40.0', '115.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(174, 'CAJA DE REGALOS LUNARES 2463 MEDIANA ', '00740', '2463-M', 1, 0, 0, '40.0', '79.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(175, 'CAJA DE REGALOS LUNARES 2463 CH', '00741', '2463-CH', 1, 0, 0, '30.0', '55.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(176, 'CAJITA ALAJERO CHICA NO.01', '00747', 'C.ALA.01', 1, 0, 0, '7.0', '36.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(177, 'PELUCHE ANIMALES PATONES', '00748', 'C.MINI.PELUCH', 20, 0, 0, '112.0', '229.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(178, 'CAJITA DE REGALO CUADRO CORAZON MINI', '00749', 'C.CORAZ', 1, 0, 0, '2.6', '18.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(179, 'COJINNETTE MINI EXPLOWORLD NAVIDAD ', '00742', 'C.MINI.EXPLOW', 20, 0, 0, '28.0', '70.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(180, 'TARJETA NAVIDAD FIZZY MOON', '7502209338012', 'T.FIZZY.NAV', 21, 0, 0, '15.0', '36.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(181, 'TARJETA NAVIDAD FIZZY MOON 1', '38005', 'T.FIZZY.1', 21, 7, 0, '15.0', '38.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 105, 0, 0, 0, 0, ''),
(182, 'TARJETA PARA MAMA', '3371', 'T.MAMA', 21, 45, 0, '5.0', '10.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 225, 0, 0, 0, 0, ''),
(183, 'PELUCHE SHARPEI MEDIANO ', '7206', 'SHARPEI-M', 20, 1, 0, '400.0', '900.0', 24, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, 0, ''),
(184, 'TARJETA NAVIDAD DISNEY', '0002', 'T.NAVI', 21, 1, 0, '12.0', '27.0', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 12, 0, 0, 0, 0, ''),
(185, 'CARTERA GRACE DAMA ', '00751', 'GRACE', 23, 0, 0, '70.0', '250.0', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(186, 'CARTERA DE DAMA PROMOCION', '00750', 'PRO', 23, 0, 0, '50.0', '100.0', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(187, 'CARTERA DAMA LARGA GRACE', '00753', 'C.POLO', 23, 0, 0, '70.0', '200.0', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(188, 'CARTERA DAMA LEMON', '00754', 'LEMON', 23, 0, 0, '60.0', '150.0', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(189, 'CARTERA GRACE FASHION SINCE1996', '00752', 'GRACEE', 23, 0, 0, '100.0', '230.0', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(190, 'CARRO DE COLECCION DIFERENTES MARCAS', '00731', 'COLEC', 23, 0, 0, '300.0', '500.0', 27, '2015-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(191, 'RELOJ TOUCHS DAMA ', '00743', 'TOUHS', 23, 0, 0, '95.0', '250.0', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(192, 'RELOJ PARA DAMA BRAZALETE ', '00755', 'BRAZALET-B1', 23, 0, 0, '50.0', '180.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(193, 'RELOJ P/ DAMA BRIYITT', '00756', 'R-BRIYIT', 23, 0, 0, '65.0', '218.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(194, 'BRAZALETE DAMA ANALIE', '00757', 'ANALIE', 23, 0, 0, '10.0', '70.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(195, 'BRAZALETE FASHION ', '00758', 'BRA-FASH', 23, 1, 0, '100.0', '150.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(196, 'BRAZALETE PARA DAMA NO.1', '00759', 'BRA.1', 23, 0, 0, '50.0', '151.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(197, 'BRAZALETE DAMA BRILLANTE', '00760', 'BRA-2', 23, 0, 0, '35.0', '140.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(198, 'CARTERA LARGA DAMA POVI-POMI', '00761', 'POMI', 23, 0, 0, '50.0', '160.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(199, 'DEODORANTE CABALLERO ', '00762', 'DEO', 23, 0, 0, '50.0', '100.0', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(200, 'BOLSA GRANDE IMAGEN PRINTS NAVIDAD', '00763', 'PRINS-G', 1, 0, 0, '10.0', '26.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(201, 'BOLSA GRANDE S NAVIDAD BEST FOR', '00764', 'PRINTS-J', 1, 0, 0, '10.0', '37.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(202, 'BOLSA JUMBO IMAGEN PRINTS (BODA)', '00765', 'PRINTS-BODA', 1, 0, 0, '19.0', '39.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(203, 'BOLSA MEDIANA IMAGEN PRINTS NAVIDAD', '00766', 'PRINTS-M', 1, 0, 0, '7.0', '18.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(204, 'BOLSA CHICA IMAGEN PRINTS NAVIDAD ', '00767', 'PRINTS-CH', 1, 0, 0, '6.0', '16.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(205, 'BOTELLA CON DULCE GRANDE', '717', 'BOTELLA', 27, 3, 0, '70.0', '119.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 210, 0, 0, 0, 0, ''),
(206, 'PAPEL DE REGALO (NAVIDA)', '00769', 'PAPEL-N', 1, 26, 0, '4.0', '13.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 104, 0, 0, 0, 0, ''),
(207, 'CAJA DULCE NAVIDAD ', '6915288154045', 'C.DULCE', 1, 6, 0, '5.0', '15.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, 0, ''),
(208, 'CAJA MINI PELUCHERA (NAVIDAD)', '6915288154052', 'MINI-PELUC', 1, 0, 0, '4.0', '13.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(209, 'CAJA PELUCHERA CHICA', '1317', 'C.P.NAV', 1, 9, 0, '18.0', '75.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 162, 0, 0, 0, 0, ''),
(210, 'BOLSA GRANDE CELEBRATE (NAVIDAD)', '7501091899847', 'B-CELEB', 1, 0, 0, '10.0', '26.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(211, 'BOLSA GRANDE DIPAK (NAVIDAD)', '7501091855232', 'NAV.DIPAK', 1, 0, 0, '10.0', '28.0', 22, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(212, 'BOLSA CHICA CELEBRATE (NAVIDAD)', '7501091899816', 'CELEBRA-CH', 1, 0, 0, '5.0', '16.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(213, 'BOLSA DE PAPEL TAMAÑO GIGANTE NAVIDAD ', '884118133009', 'B.GIGANT', 1, 0, 0, '25.0', '70.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(214, 'PELUCHE CHIHUAHUA GRANDE', '00770', 'CHIHUA', 20, 0, 0, '68.0', '230.0', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(215, 'CAJA TORRE NAVIDAD', '7501091855829', 'C.TORRE', 1, 0, 0, '20.0', '35.0', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(216, 'CAJA KIUT CHICA', '00771', 'C.KIUT.C', 29, 0, 0, '130.0', '200.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(217, 'CAJA KIUT MEDIANA ', '00772', 'C.KIUT-M', 29, 1, 0, '140.0', '250.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, 0, ''),
(218, 'SILUETA LOVE DE KIUT', '00773', 'LOVE', 29, 0, 0, '110.0', '230.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(219, 'PORTA RETRATO KIUT 6', '00774', 'KIUT-6', 29, 0, 0, '95.0', '190.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(220, 'PORTA RETRATO KIUT BABY', '00775', 'P-BABY', 29, 0, 0, '120.0', '200.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(221, 'PORTA RETRATO CORAZON KIUT (PARED)', '00776', 'P-PARET', 29, 0, 0, '110.0', '200.0', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(222, 'PULCERA K3 DAMA', '1777', 'PULCERA-K', 23, 0, 0, '35.0', '118.0', 26, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(223, 'CAJA KIUT GRANDE', '00778', 'C.KIUTT', 29, 1, 0, '160.0', '350.0', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, 0, ''),
(224, 'CRUZ HOGAR KIUT', '00780', 'HOGAR', 29, 0, 0, '140.0', '250.0', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(225, 'PORTA RETRATO KIUT NOVIOS (PARED)', '00781', 'P.PARED', 29, 0, 0, '110.0', '230.0', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(226, 'PORTA RETRATO KIUT LOVE YOU (PARED)', '00782', 'P.LOVE', 29, 0, 0, '130.0', '200.0', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(227, 'PORTA RETRATO KIUT 7 ', '00783', 'PORTA-7', 29, 1, 0, '100.0', '200.0', 25, '2012-12-29 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(228, 'COJIN CORAZON SAN VALENTIN', '00784', 'C-VALENTIN', 20, 3, 0, '79.0', '140.0', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 237, 0, 0, 0, 0, ''),
(229, 'COJIN CUELLERA POLIESFERA ( HABLANDO SOLA )', '00785', 'CUELLRA', 20, 0, 0, '95.0', '200.0', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(230, 'COJIN MINIUMS BOOT Y STICHIS', '00786', 'C-REDONDO', 20, 0, 0, '90.0', '250.0', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(231, 'COJIN CORAZON TRIMANIX MEDIANO', '00787', 'CRZN-TRIMANX', 20, 0, 0, '92.0', '190.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(232, 'ALMOHADA  BLANCA MICKEY MOUSE', '00788', 'C-MOU', 20, 0, 0, '150.0', '350.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(233, 'COJIN CORAZON SUPER TRIMANIX ', '00789', 'C-SUPER', 20, 0, 0, '350.0', '700.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(234, 'COJIN CORAZON GRANDE TRIMANIX', '00790', 'C-TRIMAN', 20, 0, 0, '255.0', '350.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(235, 'COJIN NEGRO MEDIANO TRIMANIX', '00791', 'C-NEGRO', 20, 0, 0, '65.0', '180.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(236, 'ALMOHADA PINTADA CORAZON GRANDE', '00792', 'AL-CORAZ', 20, 0, 0, '170.0', '350.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(237, 'ALMOHADA LARGA GRANDE', '00793', 'MANTA', 20, 0, 0, '150.0', '350.0', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(238, 'GLOBO MEDIANO SAN VALENTIN', '02', 'GLOBO-1', 30, 17, 0, '21.0', '60.0', 26, '2013-02-02 00:00:00', '', 0, 0, NULL, NULL, 0, 357, 0, 0, 0, 0, ''),
(239, 'GLOBO GRANDE CORAZON ESPIRAL', '03', 'GLOBO-3', 30, 11, 0, '40.0', '150.0', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, 0, ''),
(240, 'GLOBO MEDIANO ALARGADO', '04', 'GLOBO-4', 30, 33, 0, '22.0', '70.0', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 726, 0, 0, 0, 0, ''),
(241, 'GLOBO EX GRANDE TODA OCACION ', '05', 'GLOBO-5', 30, 15, 0, '40.0', '150.0', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, 0, ''),
(242, 'REKADITO KIUT (SILUETAS )', '00794', 'REKA', 29, 0, 0, '50.0', '130.0', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(243, 'SILUETAS  KIUT 1', '00795', 'SILUET-1', 29, 0, 0, '70.0', '140.0', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(244, 'PORTA RETRATO KIUT LARGO ', '00796', 'KIUTT', 29, 0, 0, '110.0', '230.0', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(245, 'PELUCHE DIEGO ( ICE AGE 3)', '00797', 'HIELO', 20, 0, 0, '150.0', '399.0', 24, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(246, 'ALMOHADA LARGA  TRIMANIX GRANDE', '00798', 'LARGA', 20, 0, 0, '220.0', '399.0', 26, '2013-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(247, 'CARTERA DAMA LARGA LEMON ', '00799', 'CHAROLL', 23, 0, 0, '100.0', '240.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(248, 'CARTERA DAMA MONA LISA', '00800', 'MONA', 23, 1, 0, '50.0', '200.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 50, 0, 0, 0, 0, ''),
(249, 'CARTERA DAMA LARGA XOXO', '00802', 'XOXO', 23, 0, 0, '100.0', '200.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(250, 'RELOJ JUVENIL TRANSPARENTE', '00803', 'JEVENIL', 23, 0, 0, '50.0', '120.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(251, 'RELOJ INFANTIL  ', '00804', 'INFAN', 23, 0, 0, '19.0', '60.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(252, 'RELOJ UNIXEE BLANCO', '00805', 'UNI', 23, 0, 0, '65.0', '170.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(253, 'PULCERA CABALLERO PIEL', '00806', 'PULC', 23, 2, 0, '40.0', '170.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, 0, ''),
(254, 'CAJA CAMISERA MEDIANA', '00807', 'CAMISERA', 1, 0, 0, '35.0', '89.0', 26, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(255, 'PULCERA DE CABALLERO IMANTADA', '00808', 'ACERO', 23, 0, 0, '100.0', '250.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(256, 'LLAVEROS EN ( OFERTA )', '00809', 'FASH', 23, 0, 0, '35.0', '20.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(257, 'CINTURON P/ CABALLERO DIFERENTES MARCAS', '00810', 'CINTO', 23, 0, 0, '40.0', '50.0', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(258, 'BOLSA JUMBO DIPAK AMOR ( SAN VALENTIN )', '7501091825273', 'SANN', 1, 0, 0, '20.5', '40.0', 22, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(259, 'BOLSA MEDIANA DIPAK AMOR', '7501091825228', 'AMORR', 1, 0, 0, '9.5', '18.0', 22, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(260, 'BOLSA JUMBO IMAGEN PRINTS ', '00811', 'JUM', 1, 0, 0, '35.0', '58.0', 21, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(261, 'CAJA ENVUELTA TIPO CARTERA', '337', 'C-CARTE', 1, 0, 0, '10.0', '28.0', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(262, 'CAJA CORBATA GRANDE', '368', 'C-CUAD', 1, 3, 0, '20.0', '49.0', 29, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, 0, ''),
(263, 'CAJA ENVUELTA  MEDIANA', '351', 'C-MED', 1, 0, 0, '10.0', '37.0', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(264, 'CAJA ENVOLTURA MED 2', '320', 'C-MED2', 1, 0, 0, '15.0', '40.0', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(265, 'CAJA SMOKIN GRANDE', '313', 'SMOKIN', 1, 9, 0, '20.0', '48.0', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 180, 0, 0, 0, 0, ''),
(266, 'CAJA COLORS GRANE ', '344', 'C-GRD1', 1, 2, 0, '20.0', '40.0', 29, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, 0, ''),
(267, 'BOLSA CELOFAN GRANDE', '1', 'CELO-1', 1, 0, 0, '8.0', '25.0', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(268, 'BOLSA CELOFAN JUMBO', '2', 'CELO2', 1, 0, 0, '8.0', '35.0', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(269, 'BOLSA CELOFAN EX JUMBO', '3', 'CELO3', 1, 0, 0, '15.0', '37.0', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(270, 'CAJA CRAF EX JUMBO ', '00812', 'CAJA-EXJ', 1, 0, 0, '60.0', '160.0', 29, '2013-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(271, 'CAJA CRAF GRANDE MOD2', '00813', 'CRAF-2', 1, 0, 0, '32.0', '100.0', 29, '2013-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(272, 'GLOBO BABY SHOWER', '06', 'G-BABY', 30, 81, 0, '15.0', '50.0', 26, '2013-04-26 00:00:00', '', 0, 0, NULL, NULL, 0, 1215, 0, 0, 0, 0, ''),
(273, 'PERGAMINO MANTA MEDIANO', '00814', 'PERGAMINO-MED', 22, 3, 0, '135.0', '245.0', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 405, 0, 0, 0, 0, ''),
(274, 'ALMOHADA MANTA NEGRA TRIMANIX JUMBO', '00815', 'CIJIN-TRI', 20, 3, 0, '195.0', '350.0', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 585, 0, 0, 0, 0, ''),
(275, 'COJIN TRIMANIX CHICO', '00816', 'TRIMANIX-CH', 20, 1, 0, '48.0', '78.0', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, 0, ''),
(276, 'PELUCHE SERPIENTE MUSICAL', '00985', 'SERP', 20, 0, 0, '70.0', '199.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(277, 'PELUCHE OSO CON PLAYERA GRANDE', '851785052612', 'PLAYERA', 20, 0, 0, '106.0', '350.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(278, 'PELUCHE RANA BOSHITA MEDIANA ', '2011091360865', 'BOSHITA', 20, 0, 0, '87.0', '210.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(279, 'PELUCHE TRENECITO ROSA CON SONIDO ', '7500813001223', 'TRENECITO', 20, 0, 0, '106.0', '270.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(280, 'PELUCHE OSO ROSAS CORAZON CON SONIDO ', '7500107573559', 'ROSAS', 20, 0, 0, '179.0', '389.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(281, 'PELUCHE KIKAMONKIKA CON SONIDO GRANDE ', '7500107431651', 'KIKA', 20, 0, 0, '135.0', '310.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(282, 'PELUCHE OSO MANGOCHO GDE', '7500601129078', 'MANGOCHO', 20, 0, 0, '77.0', '199.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(283, 'MARIQUERA DE BUO', '00828', 'B-UO', 23, 0, 0, '40.0', '100.0', 27, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(284, 'COJIN MEDIANO AMOR Y AMISTAD ', '00829', 'C-BB', 20, 4, 0, '40.0', '180.0', 24, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, 0, ''),
(285, 'CAJITA DE JOYERIA PARA ARETES', '00830', 'ARETES', 1, 6, 0, '6.0', '23.0', 22, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 36, 0, 0, 0, 0, ''),
(286, 'CAJA DE REGALOS LUNARES 2463 CHICA', '00831', '2463-C', 1, 0, 0, '25.0', '49.0', 26, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(287, 'MOÑO CHICO', '00832', 'MOÑO-M', 1, 43, 0, '3.0', '15.0', 21, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, 0, ''),
(288, 'MOÑO MEDIANO TODA OCACION', '00833', 'MOÑO-G', 1, 10, 0, '3.0', '20.0', 26, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, 0, ''),
(289, 'MOCHILA BOLSO C/DESCUENTO $130 A $100', '00834', 'M-BOLSO', 25, 0, 0, '45.0', '100.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(290, 'BOLSO LUNARES MEDIANO', '00835', 'LUN-M', 23, 0, 0, '60.0', '140.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(291, 'MOCHILA LOS PITUFOS ATM ', '7500351012781', 'M-PITUF', 25, 0, 0, '200.0', '350.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(292, 'MOCHILA FULANITOS CHENSON 1', '7509048231450', 'M-FULA', 25, 0, 0, '175.0', '350.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(293, 'MOCHILA CHOCOCAT RUZ', '7500247138663', 'M-CHOCO', 25, 0, 0, '225.0', '370.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(294, 'MOCHILA FULANITOS CHENSON 2', '7509048231252', 'M-FUL-2', 25, 0, 0, '180.0', '350.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(295, 'MOCHILA HELLO KITTY C/DESCUENTO $300 A $250', '7500247200834', 'B-HELLO', 25, 0, 0, '160.0', '250.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(296, 'MOCHILA TOTE CHOCOCAT C/DESCUENTO $300 A $250', '7500247138762', 'B-TOTE', 25, 0, 0, '160.0', '250.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(297, 'MOCHILA ANGRY TARGMEX C/DESCUENTO $380 A$300', '7504024768227', 'ANGRY-1', 25, 0, 0, '225.0', '300.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(298, 'MOCHILA ANGRY TARGMEX 2 / DESCUENTO $380 A $200', '7504024768234', 'ANGRY-2', 25, 1, 0, '225.0', '200.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 225, 0, 0, 0, 0, ''),
(299, 'MOCHILA BOLSO HELLO KITTY 2', '7500247200889', 'M-HELLO-2', 25, 0, 0, '180.0', '350.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(300, 'MOCHILA HELLO KITTY 3 C/DESCUENTO $350 A$300', '7500247200865', 'HELLO-3', 25, 0, 0, '180.0', '300.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(301, 'MOCHILA  HELLO KITTY C/ DESCUENTO $399 A $200', '7500247138014', 'M-TOTE', 25, 0, 0, '150.0', '200.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(302, 'MOCHILA HELLO KITTY 4 C/DESCUENTO $300 A$200', '7500247200872', 'HELLO-4', 25, 0, 0, '160.0', '200.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(303, 'MOCHILA BOLSO HELLO KITTY RUS 5', '7500247200858', 'HELLO-5', 25, 0, 0, '160.0', '300.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(304, 'PELUCHE MINI MOUSE VAQUERA', '7506223749786', 'MOUSE', 20, 0, 0, '159.0', '300.0', 24, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(305, 'PELUCHE MINI PIJAMA', '7500247041710', 'M-PIJAMA', 20, 0, 0, '149.0', '300.0', 24, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(306, 'PELUCHE PINGUINO  GRANDE', '3134', 'PINGUNO', 20, 0, 0, '140.0', '380.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(307, 'PELUCHE OSITO PINKILIN CORAZON MEDIANO', '7500107431323', 'PINKILIN-M', 20, 0, 0, '89.0', '210.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(308, 'PELUCHE PERRO DADY GRANDE', '7500107432221', 'DADY-G', 20, 0, 0, '129.0', '289.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(309, 'PELUCHE PERRO CHIPO GRANDE ', '2011098227659', 'CHIPO-G', 20, 0, 0, '96.0', '280.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(310, 'PELUCHE OSO CHONCHITO GRANDE ', '7500124440308', 'CHONCHI-G', 20, 0, 0, '129.0', '300.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(311, 'PELUCHE OSO CARACOLITO GRANDE', '2012070241847', 'CARACOLITO-G', 20, 0, 0, '109.0', '250.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(312, 'PELUCHE RANA LINDA GRANDE ', '2012070241632', 'RANALINDA-G', 20, 0, 0, '119.0', '260.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(313, 'PELUCHE PATA PRIMAVERA KUA KUA GRANDE ', '7500107266420', 'PATA-G', 20, 0, 0, '99.0', '230.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(314, 'PELUCHE PATO PUCHOLO MEDIANO', '2011098230017', 'PATO-M', 20, 0, 0, '59.0', '199.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(315, 'PELUCHE CONEJA TEDY GRANDE', '4585', 'CONEJA-T', 20, 0, 0, '140.0', '360.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(316, 'PELUCHE OSO ECHADO CHOKOROL GRANDE', '7500105304711', 'CHOKO-G', 20, 0, 0, '129.0', '250.0', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(317, 'LLAVERO COLECCION SIX', '00817', 'SIX', 23, 0, 0, '45.0', '110.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(318, 'CARTERA DAMA ZIMD', '00818', 'PLAYBOY', 23, 0, 0, '70.0', '200.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `productos` (`id`, `nombre`, `codigo`, `nombre_generico`, `id_categoria`, `stock`, `stock_minimo`, `costo`, `precio`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `inventariable`, `imagen`) VALUES
(319, 'CARTERA FOREVER YOUNG DAMA', '00819', 'FOREVER', 23, 0, 0, '145.0', '300.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(320, 'CARTERA BOLSO COOL', '00820', 'C-BOLSO', 23, 4, 0, '100.0', '250.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, 0, ''),
(321, 'CARTERA FASHION GRACE DAMA', '00821', 'C-FASHION', 23, 1, 0, '100.0', '250.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(322, 'CARTERA MONEDERO GRACE ', '00822', 'C-GRACE', 23, 0, 0, '60.0', '180.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(323, 'COSMETIQUERA GRACE', '00823', 'COMET-GRAC', 23, 0, 0, '50.0', '118.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(324, 'COSMETIQUERA MICHAEL MICHELLE', '00824', 'COSMET', 23, 0, 0, '59.0', '130.0', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(325, 'BOLSA CHICA DIPAK FLORES', '7501091800188', 'FLORES', 1, 0, 0, '7.0', '16.0', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(326, 'BOLSA EX JUMBO DIPAK FLORES', '7501091826096', 'B-FLORES', 1, 0, 0, '23.0', '59.0', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(327, 'BOLSA JUMBO DIPAK FLORES ', '7501091800348', 'B-JUM-FLORES', 1, 0, 0, '20.0', '40.0', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(328, 'MINIATURA ANIMALES C/ PERGAMINO', '00825', 'ANIMA', 27, 0, 0, '46.0', '100.0', 26, '2013-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(329, 'RELOJ TACTIL UNISEX', '00826', 'UNISEX', 23, 0, 0, '65.0', '199.0', 26, '2013-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(330, 'PELUCHE ELEFANTE KIMI', '00986', 'ELE-KIMI', 20, 0, 0, '180.0', '400.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(331, 'PERFUME GIVENCHY CABALLERO', '3274870122569', 'GIVEN', 24, 0, 0, '350.0', '700.0', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(332, 'PERFUME ARSENAL CABALLERO', '3457460203354', 'ARSENAL', 24, 0, 0, '150.0', '400.0', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(333, 'PERFUME BLACK KENNETH COLE DAMA', '031655471709', 'BLACK', 24, 0, 0, '200.0', '500.0', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(334, 'CENICERO', '00827', 'CENI', 22, 0, 0, '15.0', '35.0', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(335, 'PELUCHE MINNIE TENISTA ', '7500247040829', 'TENNIS', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(336, 'PELUCHE POOH JARDINERO ', '7500247013700', 'JARDINERO-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(337, 'PELUCHE POOH CON FLOR MEDIANO', '7506223799569', 'FLOR-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(338, 'PELUCHE EEYORE JARDINERO MEDIANO', '7500247013717', 'JARDI-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(339, 'PELUCHE MINNIE MEDIANA FLORES', '7506223799507', 'FLORES-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(340, 'PELUCHE MICKEY CORAZONES MEDIANO ', '7506223799392', 'CORAZON-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(341, 'PELUCHE MICKEY IMPERMEABLE MEDIANO ', '7500247042267', 'IMPER', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(342, 'PELUCHE POOH IMPERMEABLE MEDIANO', '7506223743821', 'IMPERR', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(343, 'PELUCHE TIGGER JARDINERO MEDIANO ', '7500247013694', 'T.JARDI-M', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(344, 'PELUCHE AGENTE P MEDIANO', '7500247115992', 'AGE-P', 20, 0, 0, '145.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(345, 'PELUCHE MINIE MAMELUCO CHICA', '7506223761085', 'MAMELUCO', 20, 0, 0, '70.0', '149.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(346, 'COJIN FLOR MAGNOLIAS GRANDE', '2009154230606', 'MAGNOLIAS', 20, 0, 0, '97.0', '230.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(347, 'PELUCHE JIRAFA GOGYS', '2011052850114', 'GOGYS', 20, 0, 0, '96.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(348, 'PELUCHE  AGUACATE JUMBO', '1138', 'AGUACATE-JUM', 20, 3, 0, '180.0', '400.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 540, 0, 0, 0, 0, ''),
(349, 'PELUCHE MIKE MONSTER UNIVERSITARIO ', '7500247177570', 'MIKE', 20, 0, 0, '145.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(350, 'PELUCHE RANDALL MONSTER UNIVERSITY', '7500247177587', 'RANDALL', 20, 0, 0, '145.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(351, 'PELUCHE RANA MOÑO', '851785542618', 'MOÑO', 20, 0, 0, '135.0', '350.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(352, 'PELUCHE RANA IPOPOTAMO PACHONES', '851785281920', 'PACHONS', 20, 0, 0, '115.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(353, 'PELUCHE PESCADITO BLUPIZ GRANDE ', '7500123121901', 'BLUPIZ', 20, 0, 0, '106.0', '290.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(354, 'PELUCHE JIRAFA BARRICHONCHIS EX GRANDE ', '2011091340676', 'BARRI', 20, 0, 0, '125.0', '300.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(355, 'PELUCHE BORREGUITA LUKINA C/ SONIDO ', '7500124576427', 'LUKINA', 20, 0, 0, '116.0', '260.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(356, 'PELUCHE VACA RUMMYNA ', '2011091740681', 'RUMMYNA', 20, 0, 0, '106.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(357, 'PELUCHE LEON PUNKYS GRANDE ', '2011091540663', 'PUNKYS', 20, 0, 0, '106.0', '250.0', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(358, 'MOCHILA BOLSO MINNIE C/DESCUENTO $350 A$250', '7500247172513', 'B-MINNIE', 25, 0, 0, '180.0', '250.0', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(359, 'BOLSA EX JUMBO DIPAK TODA OCACION ', '7501091817094', 'EX', 1, 0, 0, '23.0', '57.0', 22, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(360, 'BOLSA JUMBO DIPAK TODA OCACION', '7501091817070', 'B-DIPAK', 1, 0, 0, '22.0', '39.0', 22, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(361, 'SET DE SIRENITA', '00836', 'SET-SIRENI', 22, 0, 0, '65.0', '150.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(362, 'LIBRETA HELLO KITTY', '00837', 'LIBRETA', 22, 0, 0, '50.0', '110.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(363, 'DIARIO DISTROLLER', '00838', 'DIARIOS', 22, 0, 0, '35.0', '79.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(364, 'DIARIO CON PLUMA ', '00839', 'DIAR/PLU', 22, 0, 0, '35.0', '79.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(365, 'SET DE LAPICEROS DE GEL', '00840', 'SET/GEL', 22, 0, 0, '43.0', '89.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(366, 'SET DIARIO C/ PLUMA DIFERENTES PERSONAJES ', '00841', 'SET-', 22, 0, 0, '65.0', '145.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(367, 'SET C/ ASA DIFERENTES PERSONAJES ', '00842', 'SET-ASA', 22, 0, 0, '75.0', '165.0', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(368, 'CAJITA DE REGALOS THE CAT  MINI', '1443', 'THE CAT-MN', 1, 1, 0, '12.0', '27.0', 26, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 12, 0, 0, 0, 0, ''),
(369, 'CAJITA FOREVER AND ALWAYS CHICA', '00844', 'FOREVER-CH', 1, 0, 0, '10.0', '35.0', 23, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(370, 'MOCHILA BOLSO POLO C/DESCUENTO $250 A $199', '00845', 'POLO', 25, 1, 0, '130.0', '199.0', 27, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, 0, ''),
(371, 'LAPICEROS DE GEL', '00846', 'GEL', 22, 0, 0, '10.0', '7.0', 26, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(372, 'MOCHILA DE RUEDAS C/RUEDAS $400 A $350', '00847', 'M-PRIMARIA', 25, 0, 0, '200.0', '350.0', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(373, 'LONCHERA TERMICA ANGRY C/DESCUENTO $310 A $200', '00848', 'LONCHSS', 25, 0, 0, '180.0', '200.0', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(374, 'MOCHILA ANGRY BIRDS C/ DESCUENTO $350 A$300', '00849', 'M-ANGRY', 25, 0, 0, '180.0', '300.0', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(375, 'MOCHILA RUEDAS KINDER', '00850', 'M-KINDER', 25, 0, 0, '70.0', '150.0', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(376, 'MOCHILA DOBLE CIERRE (LZL) ', '00851', 'ECO', 25, 2, 0, '110.0', '250.0', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, 0, ''),
(377, 'PELUCHE POCOYO MEDIANO', '00852', 'P-POCOYO', 20, 0, 0, '85.0', '180.0', 24, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(378, 'PELUCHE MI VILLANO FAVORITO ', '00853', 'VILLANO', 20, 0, 0, '80.0', '200.0', 24, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(379, 'GANCHOS EXHIBIDORES ', '00854', 'G-EXHIB', 23, 167, 0, '5.0', '10.0', 0, '2013-09-14 00:00:00', '', 0, 0, NULL, NULL, 0, 835, 0, 0, 0, 0, ''),
(380, 'MALLAS EXHIBIDORAS', '00855', 'R-EXHIBI', 23, 0, 0, '10000.0', '16000.0', 0, '2013-09-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(381, 'PELUCHE OSO TED SUPER ', '6940350806638', 'P-SUPER-TED', 20, 0, 0, '320.0', '870.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(382, 'PELUCHE OSA CON CRIA SUPER ', '6940350806775', 'CRIA', 20, 0, 0, '480.0', '1400.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(383, 'PELUCHE OSO TEDY SUPER', '8066', 'P-TED- SUPR', 20, 0, 0, '140.0', '400.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(384, 'PELUCHE OSO ROSA CON MOÑO', '6940350805884', 'P-OSOMOÑO', 20, 0, 0, '65.0', '200.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(385, 'PELUCHE OSO ROSA CON MOÑO CHICO', '6940350806010', 'P-OSO-CH', 20, 0, 0, '45.0', '130.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(386, 'PELUCHE SUAVE BEBE UNICORNIO JUMBO', '00857', 'SUAVE', 20, 2, 0, '330.0', '700.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, 0, ''),
(387, 'PELUCHE BOB ESPONJA GRANDE', '00858', 'P-BOB', 20, 0, 0, '220.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(388, 'PELUCHE PANDA MOÑO ROJO GRANDE ', '68131', 'P-PANDA', 20, 0, 0, '185.0', '600.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(389, 'PELUCHE OSA CON MOÑO GRANDE', '00859', 'P-ROSA', 20, 0, 0, '500.0', '989.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(390, 'PELUCHE CHANGO SUPER ', '00860', 'P-CHANGO', 20, 0, 0, '100.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(391, 'PELUCHE RENO NAVIDEÑO GRANDE', '00861', 'RENO', 20, 0, 0, '188.0', '415.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(392, 'PELUCHE PERRO OREJON CON MOÑO SUPER', '6041', 'P-OREJON', 20, 0, 0, '280.0', '900.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(393, 'PELUCHE PERRO RESORTIN', '6940350806102', 'P-RESORTIN', 20, 0, 0, '85.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(394, 'PELUCHE PERRO ROSA OREJON', '6940350805976', 'PERRO-ROS', 20, 0, 0, '80.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(395, 'PELUCHE OSO BLANCO CON MOÑO', '6940350806089', 'P-BLANK', 20, 0, 0, '75.0', '230.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(396, 'PELUCHE ZOMBIE JUMBO ', '00862', 'ZOMBIE', 20, 0, 0, '245.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(397, 'PELUCHE LOS MINION ', '00863', 'P-MINION', 20, 0, 0, '80.0', '280.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(398, 'PELUCHE LOS MINIONS 1', '00864', 'P-MINIONS', 20, 0, 0, '80.0', '200.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(399, 'PELUCHE MINIUMS MEDIANO', '00865', 'MINIUM-C', 20, 0, 0, '130.0', '380.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(400, 'PELUCHE SULLY MONTER UNIVERSE SUPER', '00866', 'P-MONSTER-S', 20, 0, 0, '300.0', '500.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(401, 'PELUCHE SULLY MONSTER UNIVERCITY MED', '00867', 'P-MONSTER', 20, 0, 0, '175.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(402, 'PELUCHE PERRO CHOMPY CON SONIDO ', '7500202106911', 'CHOMPY', 20, 1, 0, '139.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 139, 0, 0, 0, 0, ''),
(403, 'PELUCHE GUDY Y YESSI ( VAQUEROS)', '00869', 'P-GUDY', 20, 0, 0, '140.0', '260.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(404, 'PELUCHE BUU C/ SONIDO ', '00870', 'P-BUU', 20, 0, 0, '145.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(405, 'PELUCHE JAK ', '00871', 'P-JAK', 20, 0, 0, '120.0', '300.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(406, 'PELUCHE PERRO BOMBY C/ SONIDO', '7500107452236', 'P-BOMBY', 20, 0, 0, '96.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(407, 'PELUCHE CONEJA BOMBY C/SONIDO ', '7500107451727', 'P-BOMB', 20, 0, 0, '96.0', '270.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(408, 'PELUCHE OSO MAI-TOI CHICO', '00872', 'P-MAI', 20, 0, 0, '70.0', '199.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(409, 'PELUCHE OSO SPONCHIS MED', '7509008269240', 'P-SPONC', 20, 0, 0, '77.0', '200.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(410, 'PELUCHE OSO CUADRIKOS GDE ', '2012070280013', 'P-CUADRI', 20, 0, 0, '96.0', '240.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(411, 'PELUCHE OSO WOODY TOYS CHICO', '851785281746', 'P-WOODY', 20, 0, 0, '67.0', '180.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(412, 'PELUCHE ELEFANTE ELIZ GRANDE C/ SONIDO', '7500107156820', 'P-ELIZ', 20, 0, 0, '125.0', '350.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(413, 'PELUCHE PERRITA TRISKIS MED', '7500713110117', 'P-TRIS', 20, 0, 0, '77.0', '200.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(414, 'PELUCHE PERRO CACHORRY MED C/SONIDO', '0721', 'CACHORRY', 20, 2, 0, '94.0', '195.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 188, 0, 0, 0, 0, ''),
(415, 'PELUCHE OSOS BEBUKOS GRANDES', '7500140872787', 'BEBUKOS', 20, 0, 0, '139.0', '299.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(416, 'PELUCHE MINNIE CLASICA MED', '7506223706000', 'P-CLAS', 20, 0, 0, '145.0', '300.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(417, 'PELUCHE POOH SUDADERA MED', '7500247023525', 'P-SUDADERA', 20, 0, 0, '145.0', '300.0', 0, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(418, 'PELUCHE POOH BATA MED', '7500247051481', 'P-BATA', 20, 0, 0, '145.0', '300.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(419, 'PELUCHE EEYORE BATA MED ', '7500247051504', 'P-BATTA', 20, 0, 0, '145.0', '300.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(420, 'PELUCHE PEPA GRANDE', '00874', 'PEPA-G', 20, 0, 0, '120.0', '300.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(421, 'COJIN CORAZON LOVE GRAND POLIESFERA', '00875', 'LOVV', 20, 0, 0, '70.0', '218.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(422, 'COJIN KITY MEDIANA ', '00876', 'C-KITTY', 20, 0, 0, '85.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(423, 'COJIN SOY LUNA', '00877', 'LUNA', 20, 0, 0, '100.0', '250.0', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(424, 'COJIN NEGRO TRIMANIX CHICO', '00878', 'TRIMA', 20, 0, 0, '65.0', '180.0', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(425, 'COJIN NEGRO TRIMANIX MEDIANO', '00879', 'C-COLORS', 20, 0, 0, '95.0', '250.0', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(426, 'COJIN CUBO TRIMANIX GRANDE ', '00880', 'CUBO', 20, 0, 0, '215.0', '399.0', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(427, 'PELUCHE MI VILLANO FAVORITOO', '00881', 'P-VILLANO', 20, 0, 0, '110.0', '350.0', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(428, 'LAMPARA DE LAVA Y GLITTER', '00882', 'GLITTER', 22, 1, 0, '125.0', '350.0', 27, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, 0, ''),
(429, 'PERGAMINO NEGRO MEDIANO', '00883', 'PER', 22, 0, 0, '185.0', '250.0', 23, '2013-10-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(430, 'RELOJ UNISEX', '00884', 'RELOJJ', 23, 0, 0, '65.0', '250.0', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(431, 'BRAZALETE DAMA BRIYITT', '00886', 'BRIYITT', 23, 0, 0, '20.0', '100.0', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(432, 'CARRO MUSIC CAR', '00887', 'CAR', 23, 0, 0, '160.0', '390.0', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(433, 'MARIQUERAS RUZ DIFERENTES MODELOS', '00888', 'MARYQ', 25, 0, 0, '100.0', '200.0', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(434, 'LAPICERA (EKO)', '00889', 'EKO', 25, 0, 0, '25.0', '78.0', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(435, 'SET DE COLORES CHICO', '00890', 'SET-CHI', 22, 0, 0, '35.0', '78.0', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(436, 'BOLSITO PELUCHE GATO LENTEJUELAS', '00891', 'B-LENT', 23, 3, 0, '50.0', '140.0', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, ''),
(437, 'BOLSITO ANIMALES C/ LENTEJUELA', '00892', 'BOL', 22, 3, 0, '65.0', '150.0', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 195, 0, 0, 0, 0, ''),
(438, 'MARIQUERA DAMA', '00893', 'M-DAMA', 23, 0, 0, '90.0', '200.0', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(439, 'CAJA PARA COLLAR ', '00894', 'JOYERIA', 1, 7, 0, '16.0', '40.0', 26, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 112, 0, 0, 0, 0, ''),
(440, 'BOLSA DE REGALOS LOVE MOONS MINI', '00895', 'LOVEE', 1, 0, 0, '3.0', '18.0', 26, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(441, 'MOÑO DE TIRA  GRANDE', '1611', 'TIRA', 1, 122, 0, '10.0', '25.0', 26, '2021-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 1220, 0, 0, 0, 0, ''),
(442, 'BOLSO MICHAEL KORS ', '00896', 'B-MICHAEL', 23, 9, 0, '140.0', '200.0', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1260, 0, 0, 0, 0, ''),
(443, 'MUÑECAS MOXIE GIRLS', '00897', 'MOXIE', 26, 0, 0, '27.0', '87.0', 26, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(444, 'CINTURON CABALLERO SALVADORE FERAGAMO', '00898', 'CINNTO', 23, 9, 0, '150.0', '300.0', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 1350, 0, 0, 0, 0, ''),
(445, 'CARTERA CABALLERO BY ALBA', '00899', 'BY-ALBA', 23, 1, 0, '65.0', '200.0', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 65, 0, 0, 0, 0, ''),
(446, 'BARNIS DE UÑAS', '00900', 'BARNIS', 23, 0, 0, '13.0', '25.0', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(447, 'RUBOR BLUSH SHE', '00901', 'BLUSH', 23, 0, 0, '14.0', '38.0', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(448, 'PULSERA DAMA1', '00903', 'PULSER', 23, 0, 0, '8.0', '79.0', 27, '2013-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(449, 'PULSERA DAMA 2', '00902', 'PUL-2', 23, 12, 0, '7.0', '30.0', 27, '2013-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 84, 0, 0, 0, 0, ''),
(450, 'CARTERA DAMA XOXO COLLECTION', '00904', 'XOX', 23, 1, 0, '130.0', '200.0', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, 0, ''),
(451, 'MONEDERO YAALI', '00905', 'YAAALI', 23, 0, 0, '21.0', '100.0', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(452, 'COJIN DE4 MANTA ', '00906', 'CILIND', 20, 0, 0, '50.0', '110.0', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(453, 'COJIN PAREJA MICKEY MOUSE', '00907', 'C-MICK', 20, 0, 0, '220.0', '450.0', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(454, 'PELUCHE PERRO LADRILLITO SENTADO MEDIANO ', '2012703581494', 'LADRILL', 20, 0, 0, '51.0', '140.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(455, 'PELUCHE OSO CREPY MED', '2011111411218', 'CREPY', 20, 0, 0, '77.0', '197.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(456, 'PELUCHE PERRO KOKETO C/ SONIDO ', '7500124573112', 'KOKET', 20, 0, 0, '99.0', '250.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(457, 'PELUCHE PERRO HUESOKO GRANDE', '7500107432122', 'HUESOKO', 20, 0, 0, '106.0', '250.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(458, 'PELUCHE OSO MELOSO GRANDE ', '090211', 'MELO', 20, 0, 0, '106.0', '250.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(459, 'PELUCHE SULY DE MONSTERS UNIVERSITY', '7500247177563', 'MONSTER', 20, 0, 0, '145.0', '250.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(460, 'COJIN SIRENA GRANDE', '6940', 'SIRENA', 20, 0, 0, '140.0', '350.0', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(461, 'COJIN  KITY GRANDE ', '00908', 'KITT', 20, 2, 0, '140.0', '360.0', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(462, 'PELUCHE SPIDERMAN MARIO PANDA CUPKEY POLIESFERA ', '00910', 'POLI', 20, 7, 0, '90.0', '218.0', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 630, 0, 0, 0, 0, ''),
(463, 'BOLSA EX JUMBO DIPAK NAVIDAD', '7501091851296', 'EX-NAVIDAD', 1, 0, 0, '23.0', '57.0', 22, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(464, 'MUÑECA BOO', '00911', 'M-BOO', 20, 0, 0, '75.0', '140.0', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(465, 'MUÑECO SULIBAN', '00912', 'SULY', 20, 0, 0, '130.0', '220.0', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(466, 'PELUCHE PEPA Y PAPA CERDITO CHICA', '00913', 'PEPAA', 20, 0, 0, '40.0', '120.0', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(467, 'ALMOHADA MINIUMS SUPER', '00914', 'AL-MINIU', 20, 0, 0, '110.0', '270.0', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(468, 'PELUCHE MINIUNS SUPER', '00915', 'SUPER', 20, 0, 0, '190.0', '400.0', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(469, 'PELUCHE OSO MOÑO ROJO GRANDE', '6952938368001', 'M-ROJO', 20, 0, 0, '95.0', '300.0', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(470, 'PELUCHE OSO BRANDONN C/ MOÑO', '6940350806713', 'BRAN', 20, 0, 0, '90.0', '360.0', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(471, 'PELUCHE KITY GRANDE', '00916', 'P-KITY', 20, 0, 0, '85.0', '250.0', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(472, 'CAJA DE REGALO EXPLOWORLD MEDIANA', '00191', 'EXPLOW', 1, 0, 0, '20.0', '49.0', 28, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(473, 'BOLSA COUCHE MEDIANA GRABA IMAGEN', '00918', 'COUCHE-M', 1, 70, 0, '12.0', '27.0', 21, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 840, 0, 0, 0, 0, ''),
(474, 'BOLSA KAMKIO GRANDE ', '00919', 'KAM-GRANDE', 1, 0, 0, '10.0', '22.0', 27, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(475, 'BOLSA KAMKIO CHICA ', '00920', 'KAM-CHICA', 1, 0, 0, '8.0', '25.0', 26, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(476, 'RELOJ TACTIL CABALLERO NEGRO Y BLANCO', '00921', 'TACTIL', 23, 0, 0, '45.0', '240.0', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(477, 'BRAZALETE DAMA PLATA Y DORADO', '00922', 'BRAZ', 23, 0, 0, '100.0', '145.0', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(478, 'CARTERA LOI WOOPS', '00923', 'LOIWW', 23, 0, 0, '50.0', '149.0', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(479, 'COLLAR FASHION DAMA', '00924', 'FASHION', 23, 0, 0, '8.0', '70.0', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(480, 'PELUCHE OSA BRANDON SUPER IMPORTACION', '00925', 'P-IMPORT', 20, 0, 0, '1000.0', '2500.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(481, 'PELUCHE PERRO LOVE SUPER', '00927', 'P-BUFF', 20, 0, 0, '950.0', '2000.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(482, 'PELUCHE OSA C/ VESTIDO SUPER ', '00928', 'P-VESTID', 20, 0, 0, '350.0', '900.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(483, 'PELUCHE OSA C/ VESTIDO GRANDE ', '6952938385817', 'P-VESTI', 20, 0, 0, '260.0', '699.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(484, 'PELUCHE PERRO CORAZON ', '00929', 'P-CORAZON', 20, 0, 0, '280.0', '900.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(485, 'COJIN CUADRADO EXPLOWORT', '00930', 'EXPLO', 20, 0, 0, '149.0', '370.0', 26, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(486, 'COJIN GRANDE PANDA CERDITO Y GATO', '1931', 'C-KIT', 20, 4, 0, '65.0', '200.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 260, 0, 0, 0, 0, ''),
(487, 'PELUCHE OSO MOÑO CHICO', '6940350806683', 'P-MOÑ', 20, 0, 0, '60.0', '199.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(488, 'PELUCHE OSO CORAZON ROSA GRANDE ', '6952938368100', 'P-CORAZ', 20, 0, 0, '95.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(489, 'PELUCHE BELLO UNICORNIO JUMBO', '00933', 'BELLO-UNI', 20, 2, 0, '350.0', '750.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 700, 0, 0, 0, 0, ''),
(490, 'PELUCHE PERRO CORAZON LOVE YOU', '6940350806287', 'P-LOV', 20, 0, 0, '90.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(491, 'PELUCHE OSOS BUFANDA', '6940350885916', 'BUF', 20, 0, 0, '75.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(492, 'PELUCHE OSO PARCHE C/ BUFANDA', '6940350805792', 'P-PARCHE', 20, 0, 0, '75.0', '280.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(493, 'PELUCHE OSO CORAZON TRIPLE', '6952938373654', 'P-TRIPLE', 20, 0, 0, '100.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(494, 'PELUCHE OSO CORAZON GRIS LOVE YUO', '6952938373586', 'P-GRIS', 20, 0, 0, '95.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(495, 'PELUCHE OSO CORAZON SULEET', '6940350805891', 'P-SULEET', 20, 0, 0, '85.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(496, 'ESTUCHE  DE LAPICEROS', '00621', 'ESTUCHE', 23, 0, 0, '32.0', '79.0', 27, '2014-11-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(497, 'PELUCHE OSA DORMILONA SUPER', '00917', 'OSA-DORMI', 20, 0, 0, '430.0', '1000.0', 24, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(498, 'PELUCHE OSO C/ MOÑO SUPER ', '00926', 'P-MOÑO-S', 20, 0, 0, '1180.0', '2400.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(499, 'PELUCHE PERRO ROSA ', '6940350806027', 'P-ROSS', 20, 0, 0, '80.0', '230.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(500, 'PELUCHE PERRO SNOPY', '6952938385862', 'P-SNOPY', 20, 0, 0, '65.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(501, 'PELUCHE PERRITA FRENCHS', '6952938378369', 'P-FRENCH', 20, 0, 0, '120.0', '390.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(502, 'PELUCHE OSO CORAZON LOVE GRANDE ', '6940350806980', 'LOV', 20, 0, 0, '120.0', '450.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(503, 'PELUCHE OSO GLOBO KISS ME', '6940350806577', 'KISS', 20, 0, 0, '110.0', '400.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(504, 'PELUCHE OSA VESTIDO MEDIANA ', '00932', 'P-VESTIDO', 20, 0, 0, '140.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(505, 'PELUCHE OSO BRANDON IMPORTACION', '00396', 'P-BRAN', 20, 0, 0, '190.0', '650.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(506, 'PELUCHE PERRO C/ HUESO GRANDE', '6940350806355', 'P-HUESO', 20, 0, 0, '120.0', '400.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(507, 'PELUCHE OSO CORAZON I LOVE YOU GRANDE', '6952938386401', 'P-I.LOV', 20, 0, 0, '95.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(508, 'PELUCHE OSOS PATONES GRANDE', '00934', 'PATONES', 20, 0, 0, '190.0', '470.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(509, 'PELUCHE OSO C/ MOÑO CHICO', '610059970119', 'MOÑ', 20, 0, 0, '75.0', '189.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(510, 'PELUCHE OSA CORAZON GLITER GRANDE', '6121', 'CORAZ', 20, 0, 0, '400.0', '1000.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(511, 'PELUCHE OSITA CORAZON LOVE CHICA', '610059968017', 'LOOV', 20, 0, 0, '85.0', '238.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(512, 'PELUCHE PERRO CORAZON LOVE CHICA ', '610059966815', 'LOV-C', 20, 0, 0, '89.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(513, 'PELUCHE OSO TEDDY JASPIA GRANDE', '6904085800033', 'JASPIA', 20, 0, 0, '150.0', '400.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(514, 'PELUCHE OSITO CORAZON BESOS Y ABRASOS ', '848931080629', 'BESOS', 20, 0, 0, '79.0', '228.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(515, 'PELUCHE OSITA CORAZON MINI', '610059761281', 'OSIT-MINI', 20, 0, 0, '49.0', '130.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(516, 'PELUCHE OSITA CORAZON MUSICAL', '610059967911', 'MUSI-1', 20, 0, 0, '115.0', '270.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(517, 'PELUCHE OSO LISTON GRANDE', '8931', 'P-LISTON', 20, 5, 0, '280.0', '550.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 1400, 0, 0, 0, 0, ''),
(518, 'PELUCHE OSITO CORAZON LOVE', '610059739686', 'LOVVE', 20, 0, 0, '45.0', '130.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(519, 'PELUCHE ANIMALES DE PANA ', '848931000214', 'PANA', 20, 0, 0, '69.0', '231.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(520, 'PELUCHE OSITO DORMILON MINI', '693379113008', 'DORMI', 20, 0, 0, '44.0', '120.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(521, 'PELUCHE OSITA ESTRELLA MUSICAL', '00935', 'P-ESTRELLA', 20, 0, 0, '109.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(522, 'PELUCHE OSO PATAS LARGAS ', '610059620823', 'PATAS', 20, 0, 0, '75.0', '200.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(523, 'PELUCHE OSITA C/ SOMBRERO ', '610059970416', 'SOMBRERO', 20, 0, 0, '85.0', '240.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(524, 'PELUCHE PERRITA FRENCHS CHICA', '610059636008', 'FRENCHS', 20, 0, 0, '99.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(525, 'PELUCHE OSITA C/ SOMBRERO MUSICAL', '610059970218', 'MUSI-2', 20, 0, 0, '105.0', '220.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(526, 'PELUCHE OSO CORAZON LOVE YOU MUSICAL ', '610059360606', 'MUSI-3', 20, 0, 0, '119.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(527, 'PELUCHE OSITO CHINOS BLANCO', '00936', 'P-CHIN', 20, 0, 0, '50.0', '170.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(528, 'COJIN CORAZON ROSA Y ROJO LOVE', '00937', 'C-ROSA', 20, 0, 0, '80.0', '199.0', 26, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(529, 'COJIN FLOR CUADRADO', '845263020668', 'FLOR', 20, 0, 0, '99.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(530, 'COJIN CUADRADO CORAZON (MI ANGELITO )', '610059026410', 'TQM', 20, 0, 0, '99.0', '230.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(531, 'PELUCHE EYORE SUDADERA ', '7500247023532', 'SUDADE', 20, 0, 0, '145.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(532, 'PELUCHE EYORE PONCHO MED', '7506223743838', 'P-PONCH', 20, 0, 0, '145.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(533, 'PELUCHE MICKEY CLASICO MED', '7506223705980', 'CLAS', 20, 0, 0, '145.0', '250.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(534, 'PELUCHE EYORE CORAZON TE AMO', '7506223799637', 'EYO-TEAMO', 20, 0, 0, '145.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(535, 'PELUCHE POOH CORAZON TE AMO', '7506223799620', 'POOH-TE AMO', 20, 0, 0, '145.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(536, 'PELUCHE PERRO STARKY GRANDE', '2009090910778', 'STARKY', 20, 0, 0, '129.0', '350.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(537, 'PELUCHE OSO SILVER CORAZON GRANDE', '7500107430128', 'P-SILVER', 20, 0, 0, '125.0', '300.0', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(538, 'PELUCHE OSO BOGGY BABY GRANDE ', '2010055260326', 'P-BOGGY', 20, 0, 0, '116.0', '300.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(539, 'PELUCHE PERRO LADRILLITO ECHADO MED', '2012703581357', 'LADRILLIT', 20, 0, 0, '58.0', '189.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(540, 'MUÑECA KIMI KOKO PATAS LARGAS ', '00938', 'KIMI-G', 20, 0, 0, '141.0', '250.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(541, 'MUÑECA LILI MEDIANA', '00939', 'LILI', 20, 0, 0, '105.0', '310.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(542, 'MUÑECA  LILI CHICA', '00940', 'LILII', 20, 0, 0, '85.0', '210.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(543, 'ALMOHADA C/ MOÑO LARGA', '00941', 'AL-MOÑO', 20, 0, 0, '100.0', '300.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(544, 'MUÑECA MOCHILA MONSTER', '00942', 'M-MONST', 20, 0, 0, '120.0', '280.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(545, 'MUÑECA NIÑA VILLANO LUJO', '00943', 'NIÑA-LUJ', 20, 0, 0, '190.0', '380.0', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(546, 'RELOJ GI COLLECTIONS ', '00944', 'R-GI', 23, 0, 0, '90.0', '210.0', 27, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(547, 'RELOJ EPOZZ 2', '00945', 'EPOZZ-2', 23, 0, 0, '70.0', '180.0', 27, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(548, 'GLOBO ESTRELLA GRANDE', '07', 'ESTRE', 30, 7, 0, '40.0', '130.0', 26, '2014-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(549, 'CAJITA PAPEL CORRUGADO CHICA AMARILLA', '00946', 'CORRU-1', 1, 0, 0, '10.0', '39.0', 29, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(550, 'CAJITA PAPEL CORRUGADO ( 38 )', '00947', 'CORRU-2', 1, 0, 0, '10.0', '38.0', 29, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(551, 'CAJA DE REGALOS LUNARES 2398 CHICA', '00948', '2398-C', 1, 0, 0, '30.0', '58.0', 27, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(552, 'MINIATURA ARBOL DE NAVIDAD', '0700', 'ARBOL', 27, 1, 0, '30.0', '60.0', 26, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, 0, ''),
(553, 'HOJA DECORADA ', '0010', 'HOJA', 1, 70, 0, '1.0', '2.0', 26, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(554, 'CAJA DE REGALOS LUNARES 2398 GDE', '00949', '2398-G', 1, 0, 0, '50.0', '105.0', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(555, 'CAJA DE REGALOS LUNARES 2398 MEDIANA', '00950', '2398-M', 1, 0, 0, '40.0', '89.0', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(556, 'CAJA DE REGALOS 2478  XG', '00951', '2478-XG', 1, 0, 0, '60.0', '170.0', 29, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(557, 'CAJA DE REGALOS THE CAT CHICA', '1152', 'THE CAT-CH', 1, 0, 0, '19.0', '39.0', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(558, 'CAJA DE REGALOS PARIS MEDIANA', '00953', '2478-M', 1, 0, 0, '30.0', '100.0', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(559, 'PERFUME ACE OF SPADES CABALLERO', '5414666010016', 'P-SPA', 24, 0, 0, '200.0', '400.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(560, 'PERFUME L.A.DREAMS DAMA', '895589100858', 'P-DREA', 24, 0, 0, '150.0', '300.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(561, 'PERFUME SEX IN THE CITY 2 DAMA', '994206120320', 'SEX-1', 24, 0, 0, '100.0', '200.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(562, 'PERFUME FERRARI CABALLERO', '8002135046412', 'P-FERRA', 24, 0, 0, '250.0', '450.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(563, 'PERFUME BENETTON SPORT CABALLERO ', '715387780314', 'P-BENETT', 24, 0, 0, '200.0', '450.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(564, 'PERFUME CUBA CABALLERO', '5425017732884', 'P-CUBA', 24, 0, 0, '50.0', '100.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(565, 'PERFUME NINA RICCI DAMA', '3137370301356', 'P-NINA', 24, 0, 0, '250.0', '450.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(566, 'PERFUME BE DAZZLED DAMA ', '895589200015', 'P-DAZZ', 24, 0, 0, '200.0', '450.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(567, 'PERFUME SEX IN THE CITY DAMA ( SET)', '00954', 'P-SET', 24, 0, 0, '250.0', '500.0', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(568, 'RELOJ DESPERTADOR DIFERENTES MODELOS ', '00961', 'DESP-D', 22, 0, 0, '25.0', '70.0', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(569, 'RELOJ DESPERTADOR C/ CAMPANA ', '00962', 'R-CAM', 22, 0, 0, '65.0', '150.0', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(570, 'PORTA RETRATO LOVE REDONDO', '00955', 'P-5*7', 22, 0, 0, '20.0', '75.0', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(571, 'PELUCHE HOMBRE ARAÑA GRANDE ', '00956', 'P-ARAÑA', 20, 0, 0, '220.0', '400.0', 24, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(572, 'MINIATURA MINI VAQUITA', '00957', 'M-VAQ', 27, 0, 0, '22.0', '45.0', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(573, 'BOLSA COLORS CUMPLEAÑOS MEDIANA ', '00958', 'COLORS-M2', 1, 4, 0, '20.0', '37.0', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, 0, ''),
(574, 'BOLSA COUCHE JUMBO GRABA IMAGEN', '00959', 'COUCHE-J', 1, 0, 0, '26.0', '54.0', 21, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(575, 'BOLSA REYES JUMBO', '00960', 'REYES -JUM', 1, 4, 0, '20.0', '59.0', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, 0, ''),
(576, 'BOLSA COUCHE CHICA GRABA IMAGEN', '00963', 'COUCHE-CH', 1, 2, 0, '7.0', '17.0', 21, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 14, 0, 0, 0, 0, ''),
(577, 'PERFUME PURE BLACK CABALLERO ', '5414666009973', 'PURE', 24, 0, 0, '100.0', '300.0', 27, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(578, 'AGENDA P/ CABALLERO ', '00964', 'AGE', 23, 0, 0, '70.0', '150.0', 27, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(579, 'TIEMPO', '1015', 'TIE', 19, 0, 0, '5.0', '10.0', 29, '2014-03-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(580, 'BOLSA CHICA ELEGANS', '00965', 'B-GS', 1, 0, 0, '4.0', '15.0', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(581, 'PELUCHE PERRO NAVIDEÑO MUSICAL', '00987', 'P-NAVI', 20, 0, 0, '80.0', '199.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(582, 'PELUCHE LEONSITO BB', '00988', 'LEON-SIT', 20, 0, 0, '40.0', '110.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(583, 'BOTELLA LECHERA C/ DULCE', '1977', 'B-BOTELL', 27, 9, 0, '61.0', '135.0', 26, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 549, 0, 0, 0, 0, ''),
(584, 'BOLSA CRAF MEDIANA', '4364', 'B-CRAF', 1, 0, 0, '10.0', '27.0', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(585, 'BOLSA ROMBOS Y CORAZONES GRANDE ', '00967', 'ROMBOS', 1, 0, 0, '14.0', '31.0', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(586, 'BOLSA MEDIANA EKO MODELOS ', '00968', 'B-MED', 1, 0, 0, '6.0', '14.0', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(587, 'BOLSA LISA C/ PAPEL CORRUGADO ', '00969', 'B-LISA', 1, 0, 0, '9.0', '24.0', 21, '2014-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(588, 'BOLSA CELEBRATE  NOVIAS GRANDE', '7501091899649', 'B-CELEB-G', 1, 0, 0, '12.0', '29.0', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(589, 'BOLSA CELEBRATE MEDIANA TODA OCACIOIN', '7501091899632', 'B-CELEB-M', 1, 0, 0, '10.0', '24.0', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(590, 'BOLSA REYES EX GRANDE', '6475', 'BOMSA-M', 1, 11, 0, '20.0', '75.0', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, 0, ''),
(591, 'BOLSA SUICH GRANDE ', '742099005039', 'B-SUICH', 1, 0, 0, '10.0', '28.0', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(592, 'BOLSA DREAMS ART GRANDE', '00970', 'DREAMS-G', 1, 0, 0, '10.0', '29.0', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(593, 'BOLSA DREAMS MEDIANA ', '013429789548', 'DREAMS-M', 1, 0, 0, '8.0', '20.0', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(594, 'BOLSA CRAF GRANDE', '4023', 'B-COLOR', 1, 0, 0, '10.0', '29.0', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(595, 'BOLSA DIPAK JUMBO FLORES', '7501091826072', 'B-FLOR-J', 1, 0, 0, '15.0', '39.0', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(596, 'BOLSA D\"NOVAC GRANDE ', '00973', 'NOVAC-G', 1, 0, 0, '17.0', '38.0', 21, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(597, 'BOLSA DIPAK ESPECIAL  NAVIDAD GRANDE ', '00974', 'ESPEC', 1, 7, 0, '15.0', '28.0', 22, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 105, 0, 0, 0, 0, ''),
(598, 'BOLSA DIPAK ESPECIAL MEDIANA', '00975', 'ESPE-M', 1, 0, 0, '11.0', '21.0', 22, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(599, 'BOLSA BUTIC IMPRESIONES MEDIANA ', '00976', 'B-COLORS', 1, 1, 0, '11.0', '14.0', 26, '2014-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 11, 0, 0, 0, 0, ''),
(600, 'RELOJ CK- DAMA', '00977', 'BRAZZ', 23, 0, 0, '95.0', '300.0', 27, '2014-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(601, 'BRAZALETE DE PIEDRERIA', '00978', 'PIEDRE', 23, 0, 0, '150.0', '250.0', 27, '2014-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(602, 'CARTERA PARIS CIERRE', '00980', 'PROM', 23, 0, 0, '75.0', '198.0', 27, '2014-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(603, 'CARTERA CABALLERO MARCAS', '00981', 'PRO-2', 23, 6, 0, '55.0', '200.0', 27, '2014-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 330, 0, 0, 0, 0, ''),
(604, 'PELUCHE MICKEY JARDINERO 16\"', '7501917250210', 'JAR-16\"', 20, 0, 0, '105.0', '200.0', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(605, 'PELUCHE TIGGER D STANDART', '7501917211532', 'TIG-D', 20, 0, 0, '105.0', '300.0', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(606, 'PELUCHE BORREGUINA PATAS LARGAS', '00989', 'BORRE', 20, 0, 0, '50.0', '110.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(607, 'PELUCHE CERDITA PIG GRANDE', '00990', 'PIG', 20, 0, 0, '140.0', '350.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(608, 'BOLSA COUCHE GRANDE GRABA IMAGEN', '00971', 'COUCHE-G', 1, 58, 0, '18.0', '31.0', 21, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 1044, 0, 0, 0, 0, ''),
(609, 'PELUCHE MINNIE DESFILE 16\"', '7501917259275', 'DESF-16\"', 20, 0, 0, '105.0', '250.0', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(610, 'PELUCHE PLUTO HIGH SCHOOL MUSICA D', '7501917237853', 'HIGH-D', 20, 0, 0, '110.0', '250.0', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(611, 'PELUCHE DAFFY STANDAR 16\"', '75019', 'DAFF-16\"', 20, 0, 0, '100.0', '160.0', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(612, 'MOCHILA EKO ', '00982', 'M-EKO', 25, 0, 0, '50.0', '100.0', 27, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(613, 'MOCHILA EKO 1', '00983', 'M-EKO1', 25, 0, 0, '50.0', '160.0', 27, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(614, 'RELOJ DE PARED DISNEY ', '00984', 'RE-DISN', 22, 0, 0, '30.0', '90.0', 26, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(615, 'PELUCHE RANA MUSICAL', '00991', 'RANA-MUSI', 20, 0, 0, '100.0', '210.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(616, 'PELUCHE HOMERO SIMSOMS', '00992', 'P-HOME', 20, 0, 0, '40.0', '110.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(617, 'PELUCHE GONZO  PLAZA SESAMO', '00993', 'P-GONZ', 20, 0, 0, '70.0', '170.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(618, 'PELUCHE ENRIQUE BB PLZA SESAMO', '00994', 'P-ENRIQ', 20, 0, 0, '40.0', '100.0', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(619, 'ENCENDEDOR BOOSS Y CALVIN KLEIN', '00117', 'ENCEN', 23, 0, 0, '45.0', '140.0', 27, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(620, 'BOLSA DE REGALOS BABY Y CUMPLEAÑOS GRANDE', '00996', 'BABY', 1, 0, 0, '14.0', '36.0', 26, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(621, 'ARRACADA FASHION MOD-1', '00997', 'FAS-M1', 23, 0, 0, '55.0', '110.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(622, 'ARRACADA FASHION MOD-2', '00998', 'FAS-M2', 23, 0, 0, '40.0', '89.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(623, 'ARETE FASHION ', '00999', 'ARE-FAS', 23, 0, 0, '39.0', '79.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(624, 'ESPEJO FASHION ', '00615', 'ESP-FAS', 23, 0, 0, '20.0', '75.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(625, 'COLLAR CHIC GLAMUR', '00616', 'GLAMUR', 23, 9, 0, '40.0', '100.0', 29, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, 0, ''),
(626, 'COLLAR  FASHION ELEGANS', '00617', 'FASH-', 23, 7, 0, '40.0', '197.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(627, 'ARRACADA FASIHION ECO', '00618', 'ARRA-ECO', 23, 0, 0, '10.0', '30.0', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(628, 'PELUCHE OSA Y OSO OVEROL', '00125', 'OVEROL', 20, 0, 0, '95.0', '360.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(629, 'PELUCHE OSO RELOJ MEDIANO', '00127', 'REJOJ-M', 20, 0, 0, '170.0', '370.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(630, 'JUGUETE SHOE PHONE TELEFONO', '00129', 'SHOE', 26, 0, 0, '70.0', '160.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(631, 'PELUCHE MAFALDA MEDIANA ', '00130', 'MAFALD', 20, 0, 0, '120.0', '250.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(632, 'JUGUETE BARBYE CHIC', '00132', 'CHIC', 26, 0, 0, '40.0', '85.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(633, 'JUGUETE BARBIE FASHION', '00133', 'J-FASH', 26, 0, 0, '40.0', '95.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(634, 'JUGUETE MINI COMPUTADORA ', '00134', 'MINI-COM', 26, 0, 0, '30.0', '75.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(635, 'JUGUETE HIPOPOTAMO INTERACTIVO', '00135', 'IPO', 26, 0, 0, '70.0', '150.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(636, 'PELUCHE PELOTIN DIFERENTE MODELOS', '00138', 'PELOTIN', 20, 0, 0, '82.0', '190.0', 24, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(637, 'LAMPARAS DE LAVA ( BLANCAS )', '00124', 'LAM-BLAN', 22, 1, 0, '150.0', '400.0', 27, '2017-04-07 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, '');
INSERT INTO `productos` (`id`, `nombre`, `codigo`, `nombre_generico`, `id_categoria`, `stock`, `stock_minimo`, `costo`, `precio`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `inventariable`, `imagen`) VALUES
(638, 'JUEGO DE MESA MONOPOLY', '00140', 'MONOP', 26, 0, 0, '80.0', '200.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(639, 'PORTA RETRATO AMOR DETALLES.COM', '00142', 'DETALL.COM', 29, 4, 0, '115.0', '238.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 460, 0, 0, 0, 0, ''),
(640, 'VALERINA BEBE', '00143', 'VALE', 23, 3, 0, '7.0', '35.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 21, 0, 0, 0, 0, ''),
(641, 'CAJA PELUCHERA MEDIANA', '1418', 'C-BOMSA', 1, 22, 0, '20.0', '87.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, 0, ''),
(642, 'BOMBONERA CORAZON MINI', '00145', 'BOM-MINI', 27, 0, 0, '10.0', '25.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(643, 'BOMBONERA CHICA ', '00146', 'BOM-CH', 27, 0, 0, '15.0', '40.0', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(644, 'COLLAR BOUTIQUE COLLECION ', '00619', 'BOUTIC', 23, 0, 0, '40.0', '85.0', 27, '2014-10-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(645, 'MARIQUERA MINNIE ', '00620', 'MINNIEE', 23, 0, 0, '35.0', '100.0', 26, '2014-11-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(646, 'SANDALIA NIÑA  CHICA', '00622', '14/16', 23, 0, 0, '65.0', '130.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(647, 'SANDALIA NIÑA MEDIANA', '00623', '17/20', 23, 0, 0, '70.0', '140.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(648, 'SANDALIA NIÑA GRANDE', '00624', '21/26', 23, 0, 0, '50.0', '148.0', 21, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(649, 'DENTISTA DE METAL COLECCION', '00625', 'DENTIS', 22, 0, 0, '155.0', '300.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(650, 'BATERIA MUSICAL DE METAL COLECCION ', '00626', 'BATERIA', 23, 0, 0, '155.0', '350.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(651, 'PATINADOR DE METAL COLECCION ', '00627', 'PATINA', 23, 1, 0, '125.0', '300.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, 0, ''),
(652, 'FUTBOLISTA DE METAL COLECCION ', '00628', 'FUT', 23, 0, 0, '115.0', '300.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(653, 'PAREJA VALLET METAL COLECCION', '00629', 'VALLET', 23, 0, 0, '65.0', '178.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(654, 'BISICLETA DE METAL COLECCION', '00630', 'BISI', 23, 0, 0, '75.0', '190.0', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(655, 'PELUCHE OSA ROMBY GRANDE ', '7500110287078', 'O-ROMBY', 20, 0, 0, '106.0', '280.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(656, 'PELUCHE PERRO PERRYCOLORS GRANDE C/ SONIDO', '7500124461372', 'PERRY', 20, 0, 0, '141.0', '350.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(657, 'PELUCHE OSA RAMBLI GRANDE ', '7500107425421', 'O-RAMBLI', 20, 0, 0, '109.0', '280.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(658, 'PELUCHE OSA ESTRELLIN GRANDE C/ SONIDO', '7500107013314', 'O-ESTRELN', 20, 0, 0, '135.0', '330.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(659, 'PELUCHE OSA NILY GRANDE ', '2012250719869', 'O-NILY', 20, 0, 0, '116.0', '350.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(660, 'PERRO CACHORRYKY GRANDE ', '7500110286491', 'P-CACHORY', 20, 0, 0, '96.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(661, 'PELUCHE PERRO JAPONES EX GRANDE ', '7500113177222', 'P-JAPONES', 20, 0, 0, '154.0', '380.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(662, 'PELUCHE CONEJA ROMBY GRANDE ', '7500110287108', 'C-ROMBY', 20, 0, 0, '106.0', '280.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(663, 'PELUCHE BORREGO BIKO COLORIN C/ SONIDO', '7500107629126', 'B-BIKO', 20, 0, 0, '96.0', '230.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(664, 'PELUCHE PULPITO REVERSIBLE CHICO', '1628', 'PULPO', 20, 27, 0, '79.0', '120.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 2133, 0, 0, 0, 0, ''),
(665, 'PELUCHE OSO DORMILON C/ SONIDO ', '7500813002527', 'P-DORMI', 20, 0, 0, '125.0', '318.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(666, 'PELUCHE OSA DORMILONA C/ SONIDO', '7500813002510', 'P-DORMIL', 20, 0, 0, '125.0', '318.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(667, 'PELUCHE ELEFANTE ELIZ MEDIANO C/ SONIDO ', '7500107156813', 'E-ELIZ', 20, 0, 0, '87.0', '200.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(668, 'PELUCHE OSO CON  FRAZADA Y SONIDO', '606982082425', 'P-FRAZAD', 20, 0, 0, '119.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(669, 'PELUCHE CHANGA MONKYTINA MED C/ SONIDO', '7500120061330', 'C-MONKY', 20, 0, 0, '106.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(670, 'PELUCHE CHANGO MONKYTIN MED C/ SONIDO', '7500120061309', 'C-MONK', 20, 0, 0, '106.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(671, 'PELUCHE OSITO TEDDIKY CHICO', '7500130149356', 'O-TEDD', 20, 0, 0, '35.0', '100.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(672, 'PELUCHE PUERQUITA MARIMAR CHICA ', '7500130140445', 'P-MARI', 20, 0, 0, '38.0', '130.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(673, 'PELUCHE COCHILINDA CHICA ', '7500136161710', 'P-COCHILINDA', 20, 0, 0, '42.0', '140.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(674, 'PELUCHE COCODRILO COLMILLIN CHICO', '7500130140490', 'COLMILLIN', 20, 0, 0, '42.0', '130.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(675, 'PELUCHE VACA COJIN GRANDE ', '8429760093794', 'C-VACA', 20, 0, 0, '139.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(676, 'PELUCHE PERRITA PODKY GDE C/ SONIDO', '7500106222526', 'P-PODKY', 20, 0, 0, '106.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(677, 'PELUCHE OSA FLORECHITA EX GRANDE ', '7500107441834', 'FLORECHI', 20, 0, 0, '145.0', '350.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(678, 'PELUCHE VACA RUMYS GDE C/ SONIDO', '7500107456272', 'V-RUMYS', 20, 0, 0, '135.0', '318.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(679, 'PELUCHE PUERQUITA BICO BABY MED', '7500105139726', 'P-BICO', 20, 0, 0, '87.0', '200.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(680, 'PELUCHE CONEJITA BICO BABY MED ', '7500105139528', 'C-BIKOO', 20, 0, 0, '87.0', '200.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(681, 'PELUCHE ELEFANTE TEDY GRANDE ', '7534', 'ELEFANTE-G', 20, 0, 0, '140.0', '400.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(682, 'PELUCHE VACA MAKUKYS C/ SONIDO GDE', '7500121209533', 'V-MAKU', 20, 0, 0, '106.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(683, 'PELUCHE PERRO CACHETOWER GDE', '2012370783474', 'P-CACHE', 20, 0, 0, '129.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(684, 'PELUCHE CABALLITO KUAKO GDE C/ SONIDO', '7500123130125', 'KUAKO', 20, 0, 0, '116.0', '280.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(685, 'PELUCHE RATIKAS PATIFLAIS GDE ', '7500105130327', 'RATIKAS', 20, 0, 0, '96.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(686, 'PELUCHE PUERQUITA BOLUNITTA  MED', '7500120260849', 'BOLUNIT', 20, 0, 0, '87.0', '200.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(687, 'PELUCHE TIGGER PLAY SUIT', '7500247060902', 'PLAY', 20, 0, 0, '145.0', '210.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(688, 'PELUCHE SABUESSY FASHION GDE', '7509012330134', 'SABUESS', 20, 0, 0, '99.0', '270.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(689, 'PELUCHE OSA FLORIKY GDE', '7500107431125', 'FLORIK', 20, 0, 0, '125.0', '300.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(690, 'PELUCHE PERRO HUESIBODOKY GDE', '7509001818506', 'HUESI', 20, 0, 0, '99.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(691, 'PELUCHE OSOS MOJADOS GDE', '00631', 'MOJADO', 20, 0, 0, '99.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(692, 'PELUCHE CHANGA CHIMICHANGA C/ SONIDO', '7500120169623', 'CHIMI', 20, 0, 0, '99.0', '230.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(693, 'PELUCHE LEONCITO BOLUNITTA MED', '7500120260856', 'LEO', 20, 0, 0, '87.0', '197.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(694, 'PELUCHE LEON LEOPOLDO GDE C/ SONIDO', '7500120061408', 'LEOPOLD', 20, 0, 0, '96.0', '210.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(695, 'PELUCHE RANA C/ SONIDO MED', '7500120783553', 'P-RANA', 20, 0, 0, '77.0', '200.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(696, 'PELUCHE OSITA BABY COMETA C/ CUERDA MUSICAL', '7500813000110', 'COMETA ', 20, 0, 0, '87.0', '210.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(697, 'PELUCHE PERRO BULL CON HUESO MOV Y SONIDO', '851785961754', 'BULL', 20, 0, 0, '145.0', '350.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(698, 'PELUCHE PERRO BERTO', '800000700524', 'BERTO', 20, 0, 0, '96.0', '330.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(699, 'PELUCHE OSITA ROMBIKOS GDE', '00632', 'ROM', 20, 0, 0, '106.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(700, 'PELUCHE OSO CHOKORROKO GDE', '00633', 'CHOKO', 20, 0, 0, '99.0', '250.0', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(701, 'COJIN BOB ESPONJA', '00634', 'BOB', 20, 0, 0, '90.0', '200.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(702, 'PELUCHE PEPA  YORS Y PAPA GRANDE', '00635', 'P-PEPA', 20, 0, 0, '120.0', '250.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(703, 'PELUCHE PUERCO ROY GRANDE ', '00636', 'ROY', 20, 0, 0, '135.0', '370.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(704, 'PELUCHE ELMO ( PLAZA SESAMO )', '00637', 'ELMO', 20, 0, 0, '100.0', '250.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(705, 'PELUCHE SULY  Y PEPA POLIESFERA ', '00638', 'SUL', 20, 0, 0, '85.0', '150.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(706, 'COJIN PEPA Y FROSEN ', '00639', 'FROSS', 20, 0, 0, '90.0', '210.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(707, 'PELUCHE KITY BEBE', '00640', 'KITY-BB', 20, 0, 0, '75.0', '250.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(708, 'PELUCHE ANIMALES OJONES', '00641', 'P-OJONES', 20, 0, 0, '79.0', '198.0', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(709, 'GLOBO TE AMO DECORACION SIN HELIO', '08', 'G-MINI', 30, 9, 0, '15.0', '100.0', 26, '2014-12-03 00:00:00', '', 0, 0, NULL, NULL, 0, 135, 0, 0, 0, 0, ''),
(710, 'PELUCHES ANIMALES EN CAJA MINI ', '00642', 'P-CAJA', 20, 0, 0, '23.0', '115.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(711, 'PELUCHE ANIMALES CUELLO FLEXIBLE ', '00643', 'P-FLEX', 20, 0, 0, '34.0', '118.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(712, 'PELUCHE PERRITA MINI FRENCH', '00644', 'MINI-FRE', 20, 0, 0, '38.0', '110.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(713, 'PELUCHE PAREJA DE ANIMALES SOBRE CORAZON ', '00645', 'P-PAREJA', 20, 0, 0, '44.0', '145.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(714, 'PELUCHE MINI ANIMALES ', '00646', 'P-MINI', 20, 0, 0, '23.0', '84.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(715, 'PELUHE MINI CHIHUAHUA ', '00647', 'MINI-CHIHUA', 20, 0, 0, '35.0', '118.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(716, 'PELUCHE ANIMALES DE LA SELVA ', '00648', 'P-SELVA', 20, 0, 0, '43.0', '138.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(717, 'PELUCHE LEON TIERNO MEDIANO', '00649', 'P-TIERNO', 20, 0, 0, '88.0', '210.0', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(718, 'RELOJ DE PARET BABY', '00650', 'R-BABY', 22, 0, 0, '30.0', '110.0', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(719, 'COLLAR FASHION MOD-1', '001001', 'MOD-1', 23, 3, 0, '55.0', '190.0', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 165, 0, 0, 0, 0, ''),
(720, 'RELOJ DE PARET REDONDO', '00651', 'R-PARET', 22, 0, 0, '30.0', '130.0', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(721, 'PORTA RETRATO  DETALLES DE AMOR', '00652', 'P-AMOR', 29, 0, 0, '79.0', '170.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(722, 'PORTA RETRATO POOH SUPERDETECTIVE ', '00653', 'DETEC', 22, 0, 0, '30.0', '100.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(723, 'PORTA RETRATO CORAZO DETALLES', '00654', 'P-DETLL', 29, 2, 0, '49.0', '118.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 98, 0, 0, 0, 0, ''),
(724, 'RELOJ DESPERTADOR DE VACA ', '00656', 'D-VACA', 22, 0, 0, '20.0', '85.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(725, 'PORTA RETRATO PAREJA', '00657', 'PAREJA', 22, 0, 0, '30.0', '110.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(726, 'AGENDA POOH C/ PLUMA (OFERTA)', '00658', 'POH-AGE', 22, 0, 0, '15.0', '20.0', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(727, 'QUITA ESMALTE NAIL LACQUER', '00659', 'Q-NAIL', 23, 0, 0, '7.0', '20.0', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(728, 'BOLSA CHICA FUDI SAN VALENTIN', '0015', 'B-FUDI', 1, 52, 0, '8.0', '25.0', 26, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 416, 0, 0, 0, 0, ''),
(729, 'BOLSA MEDIANA NAVIDAD DIPAK', '09975', 'BM-DIPAK', 1, 0, 0, '9.0', '22.0', 22, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(730, 'BOLSA BOTELLERA IMAGEN PRINTS', '0017', 'BOTELL', 1, 3, 0, '9.0', '27.0', 21, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 27, 0, 0, 0, 0, ''),
(731, 'MARIQUERA PUMA CABALLERO ', '00661', 'PUMA-M1', 23, 0, 0, '120.0', '260.0', 27, '2015-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(732, 'PORTA LAPICERO MUSICOS EN BISI', '00150', 'P-BISI', 22, 0, 0, '65.0', '145.0', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(733, 'PORTA LAPICEROS MUSICOS RESORTE', '00660', 'P-MUSIC', 22, 0, 0, '78.0', '180.0', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(734, 'GOLFISTA DE METAL', '00662', 'GOOLF', 22, 0, 0, '125.0', '210.0', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(735, 'TAZOTA AMOR (ARTESANIA MEXICANA)', '00663', 'TAZOOT', 27, 0, 0, '145.0', '245.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(736, 'TAZA AMOR (ARTESANIA MEXICANA )', '00664', 'TZA', 27, 3, 0, '145.0', '270.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 435, 0, 0, 0, 0, ''),
(737, 'TAZA ORO FRASES DE AMOR', '1665', 'T-ORO', 27, 7, 0, '115.0', '230.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 805, 0, 0, 0, 0, ''),
(738, 'TAZOTA SUPER DETALLE.COM', '00666', 'T-AMOR', 27, 0, 0, '139.0', '278.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(739, 'MARIQUERA FERRARI CABALLERO', '00667', 'FERR', 23, 0, 0, '125.0', '240.0', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(740, 'LONAS MENSAJE DE AMOR ', '00668', 'LONAS', 22, 0, 0, '65.0', '150.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(741, 'PORTA RETRATO  DETALLES .COM', '00669', 'DETALL', 28, 0, 0, '75.0', '160.0', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(742, 'PULCERA CABALLERO', '00670', 'P-CABALL', 23, 2, 0, '40.0', '150.0', 27, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, 0, ''),
(743, 'RELOJ CLONES  DAMA', '00671', 'CLON', 23, 2, 0, '130.0', '400.0', 27, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 260, 0, 0, 0, 0, ''),
(744, 'LLAVERO ESCANDALOSOS', '673', 'ESCANDALO', 23, 4, 0, '70.0', '140.0', 26, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(745, 'DULCERO SANVALENTIN ', '714', 'CARAMELO', 27, 0, 0, '10.0', '25.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(746, 'PELUCHE  OSA FRESITA GDE', '7500110286996', 'P-FRES', 20, 0, 0, '89.0', '250.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(747, 'PELUCHE OSA CHOCOBOLOCHIS GDE', '7500121996136', 'P-CHOCO', 20, 0, 0, '139.0', '350.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(748, 'PELUCHE TIRO AL BLANCO', '00655', 'P-BLANCO', 20, 0, 0, '180.0', '350.0', 24, '2016-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(749, 'PELUCHE OSA RONKIKI GDE', '7509012297727', 'P-RONKI', 20, 0, 0, '109.0', '250.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(750, 'PELUCHE PERRO KOKETINES C/ SONIDO GDE', '7500106121188', 'P-KOKETINES', 20, 0, 0, '109.0', '230.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(751, 'PELUCHE OSA C/ CORAZON Y SONIDO GDE', '7500120814011', 'P-OSA', 20, 0, 0, '129.0', '370.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(752, 'ALMOHADA OSO PARCHES GDE', '9888820122994', 'ALMOHA', 20, 0, 0, '80.0', '250.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(753, 'COJIN CORAZON ROSA C/ MOÑO', '00672', 'C/MOÑO', 20, 0, 0, '70.0', '250.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(754, 'COJIN GABI TOY BEBE', '00674', 'TOY-BB', 20, 0, 0, '150.0', '300.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(755, 'COJIN MUSICAL BEBE', '00675', 'C-MUS-BB', 20, 0, 0, '130.0', '260.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(756, 'PELUCHE  CHIHUAHUA MEDIANO', '00676', 'P-CHIHUA', 20, 0, 0, '57.0', '170.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(757, 'PELUCHE CHANGO OJON CHICO', '00677', 'P-CHANG', 20, 0, 0, '48.0', '140.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(758, 'PELUCHE CHANGO OJON MEDIANO ', '00678', 'CHANG', 20, 0, 0, '60.0', '180.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(759, 'PELUCHE TORTUGA PACHONA', '00679', 'P-TORTUGA', 20, 0, 0, '110.0', '350.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(760, 'PORTA LAPICERO DE PELUCHE ', '00680', 'P-LUCHE', 22, 0, 0, '19.0', '70.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(761, 'PELUCHE OSO CORAZON FLOR GRANDE', '7500107574112', 'OSOFLOR', 20, 0, 0, '197.0', '300.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(762, 'PELUCHE PEGAZO BEBE ', '00682', 'P-PEGAZO', 20, 0, 0, '40.0', '185.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(763, 'PELUCHE GATO ENOJON', '00683', 'P-GAT', 20, 0, 0, '68.0', '180.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(764, 'PELUCHE OSOS CORAZON I YOU', '00684', 'IYOU', 20, 0, 0, '58.0', '170.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(765, 'PELUCHE OSO CORAZONADA CON SONIDO JUMBO', '7757', 'CORAZONADA', 20, 0, 0, '259.0', '550.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(766, 'PELUCHE OSO JAZPIADO GRANDE', '00686', 'P-JAZ', 20, 0, 0, '128.0', '370.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(767, 'PELUCHE PERRO BOXER C/ COLLAR', '00687', 'P/COLLAR', 20, 0, 0, '90.0', '218.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(768, 'PELUCHE VACA FELPA CHICA', '00688', 'P-FELP', 20, 0, 0, '58.0', '150.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(769, 'PELUCHE VACA ECHEDA CHICA ', '00689', 'P-ECHADA', 20, 0, 0, '48.0', '160.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(770, 'PELUCHE RANA ROSA GRANDE ', '00690', 'RANA-ROSS', 20, 0, 0, '68.0', '350.0', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(771, 'COJIN POLIESFERA CORAZON LOVE CHICO', '00691', 'POLIESF', 20, 0, 0, '50.0', '185.0', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(772, 'MARIQUERA P/ CABALLERO GRANDE', '00692', 'MARIK', 23, 0, 0, '120.0', '250.0', 27, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(773, 'PELUCHE OSOS CORAZON LOVE', '00693', 'P-LOVVE', 20, 0, 0, '174.0', '385.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(774, 'PELUCHE PERRO I HUFF YOU', '00694', 'P-HUFF', 20, 0, 0, '90.0', '250.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(775, 'PELUCHE VACA T.Q.M GDE', '00695', 'P.TQM', 20, 0, 0, '180.0', '430.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(776, 'PELUCHE RANA LOVE YOU GDE', '00696', 'R-LOV', 20, 0, 0, '190.0', '500.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(777, 'PELUCHE RANA LOVE YOU SUPER', '00697', 'RANA-SUP', 20, 0, 0, '340.0', '750.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(778, 'PELUCHE OSO PETALO GDE', '00698', 'P-PETALO', 20, 0, 0, '240.0', '600.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(779, 'PELUCHE OSA T.Q.M.  SUPER', '00699', 'T.Q.M', 20, 0, 0, '450.0', '1000.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(780, 'PELUCHE OSO BRANDON HUELLAS GRANDE', '00530', 'UELLAS', 20, 0, 0, '432.0', '1500.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(781, 'PELUCHE OSO BRANDON HUELLAS MEDIANO', '00532', 'P-HUELLAS', 20, 0, 0, '170.0', '399.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(782, 'PELUCHE TIERNO UNICORNIO EX GRANDE', '00533', 'TIER-UNI', 20, 0, 0, '290.0', '700.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(783, 'PELUCHE OSO HUELLAS DORADAS ', '00535', 'P-HUELL', 20, 0, 0, '150.0', '400.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(784, 'PELUCHE PANDA CON SUDADERA GDE', '00539', 'SUDADERA', 20, 0, 0, '148.0', '385.0', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(785, 'BOLSA BUTIC GRANDE IMAGEN PRINTS', '00540', 'BUTIC-G', 1, 0, 0, '14.0', '39.0', 21, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(786, 'PELUCHE GARFIEL AMOR GDE', '00202', 'P-GARF', 20, 0, 0, '150.0', '370.0', 26, '2015-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(787, 'CAJA DECORADA CHICA C/ CORDON ', '00204', 'CODON-CH', 1, 0, 0, '25.0', '110.0', 26, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(788, 'CAJA DECORADA C/ CORDON MEDIANA', '00205', 'CORDON-M', 1, 1, 0, '35.0', '145.0', 29, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 35, 0, 0, 0, 0, ''),
(789, 'CAJA CAMICERA CHICA ', '00206', 'CAMICERA', 1, 0, 0, '300.0', '79.0', 26, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(790, 'BOLSA EX JUMBO SAN VALENTIN ', '00207', 'B-EX', 1, 0, 0, '30.0', '79.0', 22, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(791, 'MINI PANQUESITOS', '1218', 'PASTEL', 22, 0, 0, '15.0', '40.0', 29, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(792, 'CAJA DECORADA C/ CORDON GRANDE', '00209', 'CORDON-G', 1, 0, 0, '40.0', '170.0', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(793, 'CONO DE CHOCOLATE', '00210', 'CONO', 22, 0, 0, '10.0', '20.0', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(794, 'CAJITA CORAZON DE CHOCOLATE ', '00211', 'C-CHOCO', 22, 0, 0, '10.0', '20.0', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(795, 'GLOBO MEDIANO CUMPLEÑOS', '09', 'PERS', 30, 70, 0, '25.0', '50.0', 26, '2015-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 1750, 0, 0, 0, 0, ''),
(796, 'BOTA  TEQUILERA ', '001000', 'BOTA', 23, 0, 0, '10.0', '75.0', 27, '2015-03-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(797, 'COLLAR FASHION MOD-2', '0012', 'MOD-2', 23, 2, 0, '85.0', '210.0', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 170, 0, 0, 0, 0, ''),
(798, 'COLLAR FASHION MOD-3', '001003', 'MOD-3', 23, 0, 0, '40.0', '175.0', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(799, 'PELUCHE OSO GIN GRANDE', '7500115157734', 'P-GIN', 20, 0, 0, '143.0', '300.0', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(800, 'PELUCHE OSA BLUBLU GRANDE', '7500115157642', 'P-BLU', 20, 0, 0, '143.0', '300.0', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(801, 'PELUCHE OSA NORA GRANDE ', '2012072015750', 'P-NORA ', 20, 0, 0, '143.0', '350.0', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(802, 'MINIATURA PASTELITO ', '00045', 'PASTELIT', 27, 0, 0, '29.0', '59.0', 26, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(803, 'CAJA DE REGALOS 2396 GRANDE', '00302', '2396-G', 1, 0, 0, '50.0', '120.0', 26, '2015-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(804, 'CAJA DE REGALOS 2396 MEDIANA ', '00303', '2396-M', 1, 0, 0, '40.0', '80.0', 26, '2015-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(805, 'PELUCHE OSO CHOCOLATE GDE', '00538', 'P-CHOCOLAT', 20, 0, 0, '320.0', '750.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(806, 'CARTERA CABALLERO ADIDAS Y PUMA', '00304', 'EQUIP', 23, 12, 0, '80.0', '300.0', 27, '2015-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 960, 0, 0, 0, 0, ''),
(807, 'PELUCHE OLAS POLIESFERA ', '00305', 'OLAS', 20, 0, 0, '95.0', '250.0', 24, '2015-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(808, 'COJIN CARITA WHATSAPP', '00306', 'WHAT', 20, 0, 0, '80.0', '210.0', 24, '2015-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(809, 'MARIQUERA  DAVICHI PORTAFOLIO', '00307', 'MARI-M', 23, 0, 0, '100.0', '350.0', 27, '2015-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(810, 'MARIQUERA P/ CABALLERO CHICA ', '00308', 'MARI-C', 23, 0, 0, '80.0', '195.0', 27, '2015-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(811, 'PELUCHE MINNIE SUPER', '00309', 'P-MICK', 20, 0, 0, '650.0', '1600.0', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(812, 'PELUCHE SULY MONSTERS INC', '7500247142363', 'SULYY', 20, 0, 0, '165.0', '330.0', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(813, 'MUÑECA KIMI KOKO MEDIANA', '00351', 'KIMI-M', 20, 0, 0, '98.0', '218.0', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(814, 'MUÑECA ROSITA PATAS LARGAS ', '00310', 'ROSITA', 20, 0, 0, '138.0', '350.0', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(815, 'PARAGUA CHICO ', '00311', 'PARAG', 23, 0, 0, '20.0', '40.0', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(816, 'PARAGUA CHICO FILTRA SOL', '00312', 'PARAG-F', 23, 0, 0, '25.0', '60.0', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(817, 'PARAGUA MEDIANO', '00313', 'PARA.M', 23, 0, 0, '40.0', '85.0', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(818, 'ROBOT DE METAL ', '00371', 'ROBOT', 23, 0, 0, '70.0', '210.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(819, 'MUSICOS PAREJA EN COLUMPIOS DE METAL', '00372', 'COLUM', 23, 0, 0, '75.0', '200.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(820, 'JINETE A CABALLO DE METAL', '00373', 'JINET', 23, 0, 0, '55.0', '140.0', 23, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(821, 'D\"J DE METAL', '00374', 'DJ', 23, 0, 0, '135.0', '280.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(822, 'MUSICO DE METAL ', '00375', 'MUS', 22, 0, 0, '65.0', '140.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(823, 'TORRE DE PARIS CHICA', '00376', 'PARIS', 23, 0, 0, '45.0', '120.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(824, 'CARTERA DE EQUIPO ', '00377', 'EQUI', 23, 0, 0, '69.0', '100.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(825, 'LLAVERO DE EQUIPO', '00378', 'EQUIPO', 23, 0, 0, '33.0', '78.0', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(826, 'MARIQUERA DAVICHI CHICA', '00381', 'DAVICHI-C', 23, 0, 0, '80.0', '190.0', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(827, 'MARIQUERA DAVICHI MEDIANA ', '00382', 'DAVICHI-M', 23, 0, 0, '110.0', '200.0', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(828, 'MARIQUERA DAVICHI GRANDE ', '00383', 'DAVICHI-G', 23, 0, 0, '115.0', '300.0', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(829, 'MONEDERO METAL DISNEY CHICO ', '00384', 'M-MET', 22, 0, 0, '17.0', '38.0', 26, '2015-09-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(830, 'EXIBIDOR PARA RELOJ DE CABALLERO', '0010001', 'EXII', 23, 16, 0, '8.0', '30.0', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 128, 0, 0, 0, 0, ''),
(831, 'EXIBIDOR PARA SANDALIAS', '0010003', 'EXIB', 23, 23, 0, '4.0', '15.0', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 92, 0, 0, 0, 0, ''),
(832, 'MONEDERO VIVIAN YAALI', '00391', 'M-VIVIAN', 23, 0, 0, '38.0', '120.0', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(833, 'PELUCHE OSO C/ PLAYERA ESTRELLITA MEDIANO', '7500110581886', 'ESTRE-M', 20, 0, 0, '79.0', '190.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(834, 'PORTA LAPICERA BISI DE METAL', '00151', 'L-BISI', 23, 0, 0, '55.0', '145.0', 27, '2016-10-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(835, 'PELUCHE OSITO ROMBIKOS GRANDE ', '7500107440202', 'ROMBY', 20, 0, 0, '106.0', '260.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(836, 'PELUCHE PERRO SPOTY GRANDE ', '2012070204187', 'SPOTY', 20, 0, 0, '106.0', '250.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(837, 'PELUCHE OSO GREKIS GDE', '7500107440189', 'GREKIS', 20, 0, 0, '109.0', '250.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(838, 'PELUCHE CHANGO PLATANOSKY GRANDE ', '2012270785004', 'PLATANOSK', 20, 0, 0, '116.0', '200.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(839, 'PELUCHE RANA CHIPYS MED C/ SONIDO ', '7500107456821', 'CHIPYS', 20, 0, 0, '106.0', '280.0', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(840, 'CAJA DE REGALOS LUNARES 1897 GDE', '00216', '1897-G', 1, 0, 0, '55.0', '119.0', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(841, 'CAJA DE REGALOS LUNARES 1897 MEDIANA ', '00217', '1897-M', 1, 0, 0, '40.0', '86.0', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(842, 'CAJA DE REGALOS LUNARES 1897 CHICA', '00218', '1897-C', 1, 0, 0, '30.0', '59.0', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(843, 'CAJA DE REGALOS LUNARES MEDIANA', '00219', 'LUNARES-M', 1, 0, 0, '25.0', '50.0', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(844, 'CAJA DE REGALOS LUNARES GRANDE', '00220', 'LUNARES-G', 1, 0, 0, '40.0', '95.0', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(845, 'CAJA DE REGALOS LUNARES CHICA', '00221', 'LUNAR-CH', 1, 0, 0, '15.0', '30.0', 21, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(846, 'CARTERA ENOSH', '00314', 'ENOSH', 23, 0, 0, '140.0', '250.0', 27, '2015-10-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(847, 'CARITA WHATSAPP CHICA ', '00316', 'WHAT-C', 20, 0, 0, '50.0', '130.0', 26, '2015-11-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(848, 'PELUCHE OSO CORAZON LOVE MEDIANO', '00317', 'P-LOVEE', 20, 0, 0, '180.0', '370.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(849, 'PELUCHE OSA LOVE CON MOÑO SUPER', '00318', 'DULCE', 20, 1, 0, '690.0', '2000.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 690, 0, 0, 0, 0, ''),
(850, 'PELUCHE OSO LUNARES GDE', '00319', 'P-LUNARES', 20, 0, 0, '160.0', '400.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(851, 'PELUCHE OSO I LOVE YOU GRANDE', '00321', 'P-ILOVE', 20, 0, 0, '169.0', '390.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(852, 'PELUCHE PERO HUESO GDE', '00322', 'HUESO', 20, 0, 0, '160.0', '600.0', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(853, 'CAJA DE REGALO C/ MOÑO CHICA', '00323', 'CAJ-CH', 1, 1, 0, '20.0', '75.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 20, 0, 0, 0, 0, ''),
(854, 'CAJA DE REGALO C/ MOÑO MEDIANA', '00324', 'CAJ-MED', 1, 1, 0, '30.0', '89.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, 0, ''),
(855, 'CAJA DE REGALOS LISA C/ MOÑO GRANDE ', '00325', 'CAJ-GDE', 1, 0, 0, '25.0', '79.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(856, 'CAJA DE REGALOS CORAZON CHICA', '111', 'CORA-CH', 1, 1, 0, '25.0', '65.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 25, 0, 0, 0, 0, ''),
(857, 'CAJA DE REGALOS CORAZON MEDIANO ', '112', 'CORAZON -M', 1, 0, 0, '30.0', '75.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(858, 'CAJA DE REGALOS CORAZON GRANDE ', '113', 'CORAZON-G', 1, 0, 0, '40.0', '89.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(859, 'CAJA DE REGALOS ALAJERO CHICA', '114', 'ALAJERO-CH', 1, 1, 0, '40.0', '97.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, 0, ''),
(860, 'CAJA DE REGALOS ALAJERO MEDIANO ', '115', 'ALAJERO-M', 1, 3, 0, '50.0', '140.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, ''),
(861, 'BOLSO PARISS LOVE TRAVEL', '00315', 'TRAVEL', 23, 0, 0, '75.0', '210.0', 27, '2016-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(862, 'CAJA DE REGALOS ALAJERO GRANDE ', '116', 'ALA-G', 1, 2, 0, '65.0', '179.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, 0, ''),
(863, 'CAJA DE REGALOS NO-7 DE 10', '117', 'C-7', 1, 0, 0, '30.0', '85.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(864, 'CAJA DE REGALOS NO-8 DE 10', '118', 'C-8', 1, 0, 0, '35.0', '110.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(865, 'CAJA DE REGALOS NO-9 DE 10', '119', 'C-9', 1, 0, 0, '38.0', '130.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(866, 'CAJA DE REGALOS NO-10 DE 10', '120', 'C-10', 1, 0, 0, '40.0', '140.0', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(867, 'PELUCHE PIRO AL BLANCO ', '00326', 'P-TIRO', 20, 0, 0, '160.0', '280.0', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(868, 'PELUCHE AGUACATE CHICO', '1327', 'AGUACATE-CH', 20, 1, 0, '90.0', '198.0', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 90, 0, 0, 0, 0, ''),
(869, 'PELUCHE MINIOMS CABERNICOLA CHICO', '00320', 'P-CABERN', 20, 0, 0, '50.0', '145.0', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(870, 'PELUCHE YORS CHICO', '00328', 'P-YORS', 20, 0, 0, '55.0', '130.0', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(871, 'PELUCHE SNOOPY MEDIANO', '00329', 'P-SNOP', 20, 0, 0, '125.0', '360.0', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(872, 'PELUCHE OSO BIKO GRANDE ', '7500120258235', 'P-BIKO', 20, 0, 0, '106.0', '250.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(873, 'PELUCHE OSO BERRICHIS MED', '7500120356917', 'P-BERRI', 20, 0, 0, '87.0', '189.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(874, 'PELUCHE OSO BENETTY EX GRANDE ', '7500107430937', 'P-BENET', 20, 0, 0, '135.0', '300.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(875, 'PELUCHE RANA MONSY C/ SONIDO ', '7500107456234', 'P-MONSY', 20, 0, 0, '135.0', '300.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(876, 'PELUCHE VACA BOMBY MED C/ SONIDO', '7500107452229', 'P-VAK BOM', 20, 0, 0, '96.0', '270.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(877, 'PELUCHE OSO BERRICHIS GRANDE', '7500120356924', 'P-BERRICS', 20, 0, 0, '106.0', '250.0', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(878, 'TORRE DE PARIS MINI', '00330', 'TORRE-M', 23, 0, 0, '35.0', '110.0', 27, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(879, 'JUGUETE TRUCK COMBINATION 36 +', '00331', 'J-TRU', 26, 0, 0, '50.0', '145.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(880, 'JUGUETE CONSTRUCTION 3 PZ', '00332', 'J-CONS', 26, 0, 0, '65.0', '179.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(881, 'JUGUETE VEHICLES 3+', '00333', 'J-VEHI', 26, 0, 0, '28.0', '100.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(882, 'JUGUETE VEHICLES SPEED CHALLENGE', '00334', 'J-VEHIC', 26, 0, 0, '38.0', '130.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(883, 'JUGUETE TOW MATER', '00335', 'J-MATE', 26, 0, 0, '40.0', '97.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(884, 'JUGUETE CONSTRUCTION MINI', '00337', 'J-CONST', 26, 0, 0, '25.0', '79.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(885, 'JUGUETE CASA FASHION FAMILY', '00338', 'J-FAMI', 26, 0, 0, '25.0', '79.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(886, 'JUGUETE CASA HAPPY HOUSE ', '00339', 'J-HOUSE', 26, 0, 0, '50.0', '140.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(887, 'JUGUETE TRANSFORMES ', '00340', 'J-TRANS', 26, 0, 0, '110.0', '235.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(888, 'JUGUETE PRETTY ANGELIA', '00341', 'J-PRET', 26, 0, 0, '85.0', '175.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(889, 'JUGUETE PRETTY ANGELIA SWEE', '00342', 'J-ANGE', 26, 0, 0, '70.0', '160.0', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(890, 'JUGUETE TRAILER CARS', '00343', 'J-TRAI', 26, 0, 0, '55.0', '140.0', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(891, 'JUGUETE MAX STEEL', '00344', 'J-MAX', 26, 0, 0, '70.0', '140.0', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(892, 'MINIATURA POLLITOS BEBES', '00345', 'M-POLL', 27, 0, 0, '27.0', '54.0', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(893, 'BOLSA MEDIANA NAVIDAD BEST FOR', '00346', 'BEST-M', 1, 0, 0, '8.0', '25.0', 26, '2015-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(894, 'BOLSA CHICA NAVIDAD BEST FOR', '00348', 'BETS-C', 1, 0, 0, '7.0', '21.0', 26, '2015-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(895, 'COJIN CARITA WHATSAPP EN CAJA ', '00349', 'C-WHATS', 20, 0, 0, '49.0', '200.0', 26, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(896, 'PELUCHE PERRITO BOLUNITTA MEDIANA', '7500120260825', 'P-BOLU', 20, 0, 0, '89.0', '197.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(897, 'PELUCHE LEONCITOS BEBES C/ SONIDO', '7500120814080', 'P-LEO', 20, 0, 0, '79.0', '200.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(898, 'PELUCHE CHANGUITA CHUNGYS CH', '7500119154289', 'P-CHUN', 20, 0, 0, '42.0', '140.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(899, 'PELUCHE OSOS PANKEKE GRANDE ', '7500713111022', 'P-PANKEKE', 20, 0, 0, '159.0', '380.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(900, 'PELUCHE RANA CROQUE MADAME ', '7500713112616', 'P-MADAME', 20, 0, 0, '159.0', '380.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(901, 'MUÑECA RESADORA ', '813237020341', 'RESAD', 20, 0, 0, '118.0', '250.0', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(902, 'CUADRO NEGRO DETALLES', '00352', 'CUAD', 22, 0, 0, '200.0', '140.0', 26, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(903, 'PELUCHE SONAJA BEBE', '00353', 'S-BB', 20, 0, 0, '65.0', '145.0', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(904, 'PELUCHE ROBOT MOVIL MUSICAL', '00355', 'P-ROBOT', 20, 0, 0, '130.0', '260.0', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(905, 'PELUCHE PANDA SELVA GRANDE', '00356', 'SELVA', 20, 0, 0, '98.0', '385.0', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(906, 'COJIN COSTALITO MANTA COMICS', '00357', 'C-COSTA', 20, 2, 0, '85.0', '100.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 170, 0, 0, 0, 0, ''),
(907, 'COJIN LARGO PLUZ AMOR ', '00359', 'C-PLUZ', 20, 0, 0, '164.0', '350.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(908, 'COJIN WHATSAPEANDO ', '00360', 'C-WHAT', 20, 0, 0, '125.0', '250.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(909, 'COJIN CORAZON SUBLIMADO GRANDE', '00361', 'C-SUBLI', 20, 0, 0, '195.0', '370.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(910, 'COJIN CUADRADO QUE MONITOS CHICO', '00362', 'C-MONITOS', 20, 1, 0, '48.0', '110.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, 0, ''),
(911, 'COJIN CUADRADO GARABATOS ', '00363', 'C-GARA', 20, 0, 0, '69.0', '185.0', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(912, 'PERGAMINO MANTA NEGRA ', '00364', 'P-MANT', 22, 0, 0, '99.0', '250.0', 26, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(913, 'PERGAMINO MANTA CHICO ', '00365', 'P-MANTA', 22, 0, 0, '61.0', '140.0', 26, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(914, 'ENCENDEDOR BROZE', '00368', 'E-BRONZ', 23, 0, 0, '38.0', '150.0', 27, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(915, 'FIGURA RANA DE METAL PORTA LAPICERO GRANDE', '00385', 'F-RANA-G', 22, 0, 0, '85.0', '195.0', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(916, 'FIGURA RANA DE METAL PORTA LAPICERO CHICO ', '00387', 'F-RANA-CH', 22, 0, 0, '55.0', '130.0', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(917, 'TORRE IFEL MEDIANA C/ PIEDRAS ', '00388', 'IFEL-PIED', 22, 0, 0, '75.0', '179.0', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(918, 'PELUCHE OSO HUELLAS CORAZON MED', '00350', 'HUE', 20, 0, 0, '106.0', '358.0', 27, '2018-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(919, 'TORRE IFEL GRANDE C/ PIEDRA ', '00389', 'T-IFEL', 22, 0, 0, '130.0', '270.0', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(920, 'LLAVERO PAREJAS ', '00390', 'PAREJAS', 23, 0, 0, '15.0', '75.0', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(921, 'COJIN POPO EMOTICONES', '00393', 'P-POPO', 20, 0, 0, '100.0', '210.0', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(922, 'PELUCHE OSO MOÑO ROJO 4908-2A', '9481954295925', 'P-4908-2A', 20, 0, 0, '148.0', '380.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(923, 'PELUCHE OSO MOÑO ROJO 4908-3A', '9481954295949', 'P-4908-3A', 20, 0, 0, '189.0', '499.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(924, 'PELUCHE OSO C/ CORAZON 4911-2AB', '6637541258016', 'P-4911-2AB', 20, 0, 0, '195.0', '395.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(925, 'PELUCHE OSO BUFANDA 5182-2BC', '9481954295642', 'P-5182-2BC', 20, 0, 0, '188.0', '400.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(926, 'PELUCHE OSO BUFANDA 5182-3BC', '5182', 'P-5182-3BC', 20, 0, 0, '170.0', '370.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(927, 'PELUCHE OSO C/MOÑO 4826-2C', '4925323329583', 'P-4826-2C', 20, 0, 0, '128.0', '350.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(928, 'PELUCHE GORILA CON COJIN', '9837', 'P-298-037S', 20, 0, 0, '300.0', '900.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(929, 'PELUCHE OSO C/ CAMISA ROSA 5154-40', '8517857400171', 'P-5154-40', 20, 0, 0, '185.0', '400.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(930, 'PELUCHE OSO C/ CORAZON ROSA 5107-1', '8517857400157', 'P-5107-1', 20, 0, 0, '89.0', '199.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(931, 'PELUCHE OSO ESPIRAL 14-234S', '734689342341', 'P-234S', 20, 0, 0, '78.0', '179.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(932, 'PELUCHE OSO C/CAMISA FUCSIA 4826-2C', '9481954295826', 'P4826-2C', 20, 0, 0, '128.0', '279.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(933, 'PELUCHE PERRO SENTADO V1251', '734689150076', 'P-V1251', 24, 0, 0, '79.0', '180.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(934, 'PELUCHE OSO C/ CUPCAKE CHICO', '734689120512', 'P-CUP CK', 20, 0, 0, '79.0', '198.0', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(935, 'PELUCHE OSA VESTIDO GRANDE ', '00394', 'P-VES-G', 20, 0, 0, '260.0', '750.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(936, 'PELUCHE OSO BRANDON HUELLAS ', '00395', 'P-BRAND', 20, 0, 0, '490.0', '1000.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(937, 'PELUCHE OSO NARIZ DE CORAZON GRANDE ', '00397', 'P-NARIZ', 20, 0, 0, '169.0', '400.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(938, 'PELUCHE OSO GARRAS JUMBO', '1798', 'P-GARRAS', 20, 1, 0, '280.0', '600.0', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(939, 'PELUCHES OSO PARCHES C/ BUFANDA', '00399', 'P-PARCH', 20, 0, 0, '400.0', '850.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(940, 'PELUCHE OSO PLAYERA CARIÑO GRANDE', '00401', 'P-CARIÑO', 20, 0, 0, '135.0', '380.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(941, 'PELUCHE PERRO HECHADO ', '1511', 'P-HECHA', 20, 0, 0, '175.0', '400.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(942, 'PELUCHE OSO HUELLAS CORAZON ', '152000086352', 'P-HUEE', 20, 0, 0, '120.0', '220.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(943, 'PELUCHE OSO HUELLA CON CORAZON MEDIANO', '86406', 'HUELL', 20, 0, 0, '169.0', '385.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(944, 'PELUCHE OSO XOXO GRANDE', '154201501283', 'P-XOXO', 20, 0, 0, '150.0', '380.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(945, 'PELUCHE OSO CORAZON XOXO MEDIANO', '154201501290', 'P-XOX', 20, 0, 0, '120.0', '250.0', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(946, 'PELUCHE OSO C/ MOÑO VOLTIADO MED', '142052090315', 'P-VOL', 20, 0, 0, '88.0', '200.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(947, 'PELUCHE PERRO LENGUA CHICO', '152000050261', 'P-LEN', 20, 0, 0, '78.0', '179.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(948, 'PELUCHE OSO C/ CORAZON CHICO MUSICAL', '152000107231', 'P-MUSI', 20, 0, 0, '80.0', '168.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(949, 'PELUCHE OSA VESTIDO T.Q.M. MED', '151169398306', 'P-VEZ', 20, 0, 0, '120.0', '250.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(950, 'PELUCHE OSA ROSA C/ MACETA MED', '9695888110692', 'P-MACET', 20, 0, 0, '130.0', '280.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(951, 'PELUCHE OSO CORAZON C/ LUZ ', '9695888110586', 'P-LUZ', 20, 0, 0, '110.0', '230.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(952, 'PELUCHE OSA CON HELADO MEDIANA', '8811', 'HELADO', 20, 0, 0, '170.0', '370.0', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(953, 'COJIN LOVE POLIESFERA ', '00402', 'C-LOVE', 20, 3, 0, '100.0', '218.0', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, 0, ''),
(954, 'PELUCHE OSO BRANDON C/ CORAZON ROSA', '00404', 'BRAN/C', 20, 0, 0, '435.0', '1500.0', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(955, 'CARTERA PARIS Y PAPRUM', '00405', 'PAPRUM', 23, 0, 0, '100.0', '200.0', 27, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `productos` (`id`, `nombre`, `codigo`, `nombre_generico`, `id_categoria`, `stock`, `stock_minimo`, `costo`, `precio`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `inventariable`, `imagen`) VALUES
(956, 'TAZA AMOOR Y AMISTADD', '00416', 'T-AMOOR', 27, 4, 0, '120.0', '218.0', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 480, 0, 0, 0, 0, ''),
(957, 'PERGAMINO AMOR Y AMISTAD', '00407', 'PERG-A', 22, 0, 0, '35.0', '95.0', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(958, 'TARJETA DETALLES DE AMOOR JUMBO ', '1140', 'T-TON', 21, 0, 0, '39.0', '100.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(959, 'TARJETA AMOR ZOTE JUMBO', '011818110348', 'T-ZOTE', 21, 0, 0, '25.0', '58.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(960, 'TARJETA CUADRIPOP  TOON COMPANY', '7502209450479', 'T-CUADRI', 21, 0, 0, '38.0', '79.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(961, 'TARGETA DESDOBLABLE TOON COMPANY ', '7502209452558', 'T-DESDO', 21, 0, 0, '25.0', '58.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(962, 'BOLSA SAN VALENTIN MEGA JUMBO', '00413', 'MEGA-G', 1, 0, 0, '35.0', '95.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(963, 'BOLSA SAN VALENTIN EX JUMBO ', '00411', 'SAN-EXJ', 1, 0, 0, '17.0', '51.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(964, 'BOLSA SAN VALENTIN MEGA ', '00412', 'MEGA', 1, 0, 0, '29.0', '85.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(965, 'BOLSA SAN VALENTIN EX GRANDE ', '00409', 'SAN-EX', 1, 0, 0, '17.0', '40.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(966, 'BOLSA SAN VALENTIN JUMBO', '00410', 'SAN-JM', 1, 26, 0, '15.0', '54.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 390, 0, 0, 0, 0, ''),
(967, 'BOLSA CHICA SAN VALENTIN ', '00408', 'SAN-CH', 1, 0, 0, '8.0', '24.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(968, 'BOLSA SAN VALENTIN MEDIANA ', '00418', 'SAN-M', 1, 47, 0, '12.0', '39.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 564, 0, 0, 0, 0, ''),
(969, 'CAJA SAN VALENTIN MEDIANA ', '00419', 'C-VALEM', 1, 0, 0, '8.0', '28.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(970, 'CAJA SAN VALENTIN GRANDE ', '00420', 'C-VALEG', 1, 0, 0, '9.0', '41.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(971, 'CAJA PELUCHERA GRANNDE', '1417', 'C-PELUC', 1, 18, 0, '25.0', '110.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, 0, ''),
(972, 'PELUCHE OSO BRANDON EN CAJA', '00423', 'P-CANAS', 20, 0, 0, '50.0', '150.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(973, 'PELUCHE CORY UNICORNIO GRANDE', '00424', 'CORY', 20, 0, 0, '290.0', '580.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(974, 'PELUCHE BABY ANIMALES', '00425', 'P-CAJA.CH', 20, 0, 0, '79.0', '198.0', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(975, 'PALETA FLOR  DE BOMBOM ', '711', 'P-BOM', 27, 0, 0, '5.0', '15.0', 29, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(976, 'PALETA BROCHETA DE BOMBOM', '713', 'BROCHETA', 27, 11, 0, '6.0', '15.0', 29, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 66, 0, 0, 0, 0, ''),
(977, 'ALMOHADA CARTA TRIMANIX', '00429', 'CARTA', 20, 0, 0, '135.0', '280.0', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(978, 'COJIN TRIMANIX MINI', '00430', 'C-MINIX', 20, 0, 0, '34.0', '100.0', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(979, 'PELUCHES POLIESFERA', '00431', 'MINI-P', 20, 2, 0, '110.0', '300.0', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, 0, ''),
(980, 'CARTERA DAMA PORTA CEL', '00160', 'PRT-CEL', 23, 0, 0, '55.0', '200.0', 24, '2016-03-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(981, 'MINIATURA CHOCO AMOR ', '00161', 'CHOCO', 27, 0, 0, '16.0', '35.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(982, 'MINIATURA PERRO Y GATO C/ COJIN ', '00162', 'PER-GAT', 27, 0, 0, '30.0', '60.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(983, 'MINIATURA EMOTICONES ', '00163', 'EMOTI', 27, 1, 0, '27.0', '54.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 27, 0, 0, 0, 0, ''),
(984, 'MINIATURA SAGUESO C/ CERCA', '00164', 'CERQIT', 27, 0, 0, '29.0', '58.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(985, 'MINIATURA OVEJITA C/ CERCA', '00165', 'OVEJI', 27, 0, 0, '31.0', '62.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(986, 'MINIATURA CERQUITA GRANDE', '00166', 'CERQ', 27, 0, 0, '42.0', '90.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(987, 'MINIATURA PANDAS C/ LETRERO', '00167', 'M-PANDA', 27, 0, 0, '70.0', '140.0', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(988, 'MINIATURA REGALITO SORPRESA ', '00168', 'REGALIT', 27, 1, 0, '39.0', '100.0', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 39, 0, 0, 0, 0, ''),
(989, 'MINIATURA OSO LOVE EN BANQUITA ', '00169', 'BANQ', 27, 0, 0, '58.0', '116.0', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(990, 'MINIATURA OS0 AMOROSO C/ CORAZON', '00170', 'OSO-C', 27, 0, 0, '46.0', '87.0', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(991, 'MINIATURA NIÑA COQUETA', '00171', 'NIÑAA', 27, 1, 0, '31.0', '75.0', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 31, 0, 0, 0, 0, ''),
(992, 'MARIQUERA PARIS DAMA', '00172', 'PARISS', 23, 0, 0, '115.0', '238.0', 27, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(993, 'BOLSA MINI IMPRECION ', '00176', 'B-BB', 1, 0, 0, '3.0', '17.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(994, 'BOLSO DAMA HEHE', '00177', 'HEHE', 23, 6, 0, '170.0', '400.0', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 1020, 0, 0, 0, 0, ''),
(995, 'BOLSO LETIAN DAMA', '00178', 'LETIAN', 23, 0, 0, '45.0', '140.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(996, 'CARTERA DAMA UNDER ARMOUR (CLON)', '00179', 'UNDER', 23, 4, 0, '100.0', '300.0', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, 0, ''),
(997, 'CARTERA DAMA MK LARGA', '00180', 'K-LARG', 23, 0, 0, '70.0', '250.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(998, 'CARTERA DAMA MK WILLIS', '00181', 'WILLIS', 23, 1, 0, '70.0', '299.0', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(999, 'CARTERA DAMA MK (MONEDERO)', '00183', 'MONEDERO', 23, 0, 0, '60.0', '198.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1000, 'COSMETIQUERA DAMA MICHAELKORS', '00185', 'MICHAEL', 23, 0, 0, '100.0', '180.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1001, 'MONEDERO LENTES', '00186', 'MONE', 23, 0, 0, '47.0', '100.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1002, 'CARTERA FLORES ( ECO )', '00187', '( ECO )', 23, 0, 0, '30.0', '100.0', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1003, 'MOÑO EX GRANDE', '00188', 'BODA', 1, 0, 0, '10.0', '60.0', 29, '2016-04-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1004, 'PELUCHE BRANDON C/ CORAZON ROJO GDE', '00189', 'BRAND', 20, 0, 0, '350.0', '1100.0', 24, '2016-04-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1005, 'COJIN PASTEL DE AMOR', '00190', 'C-DULCE', 20, 2, 0, '65.0', '100.0', 24, '2016-04-06 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, 0, ''),
(1006, 'PELUCHE BUUO GRANDE', '6940350976805', 'P-BUUO', 20, 0, 0, '110.0', '400.0', 24, '2016-04-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1007, 'GLOBO LATEX', '010', 'LATEX', 30, 214, 0, '3.0', '25.0', 23, '2016-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 642, 0, 0, 0, 0, ''),
(1008, 'MOÑO MEDIANO BODA', '00193', 'M-BODA', 1, 0, 0, '3.0', '15.0', 29, '2016-05-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1009, 'CARTERA PARIS DAMA PORTA CEL', '00173', 'B-PARIS', 23, 0, 0, '75.0', '250.0', 27, '2016-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1010, 'ZIPPO GASOLINA P/ ENCENDEDOR', '00174', 'GAS', 23, 0, 0, '45.0', '120.0', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1011, 'RECARGAS DE ZIPPO', '00194', 'ZIPPO', 23, 47, 0, '5.0', '25.0', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 235, 0, 0, 0, 0, ''),
(1012, 'LAPICERO INDIVIDUAL', '00195', 'IND', 23, 0, 0, '35.0', '100.0', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1013, 'TORRE DE PARIS MEDIANA', '00196', 'T-TORRE', 23, 0, 0, '90.0', '240.0', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1014, 'LONCHERA MINIUMS', '00197', 'B-DISNEY', 25, 0, 0, '40.0', '145.0', 26, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1015, 'MARIQUERA FASHION DAMA', '00198', 'M-FASHION', 23, 6, 0, '50.0', '145.0', 27, '2016-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, 0, ''),
(1016, 'SANDALIA EN OFERTA', '00199', 'OFERTA', 23, 0, 0, '65.0', '100.0', 27, '2016-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1017, 'PELUCHE MINIE Y MICKY', '0027', 'P-MYM', 20, 0, 0, '160.0', '350.0', 24, '2016-07-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1018, 'CAJA DECORADA CHICA ', '00230', 'CRAF-CH', 1, 0, 0, '20.0', '60.0', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1019, 'CAJA DECORADA MEDIANA', '00231', 'DECO-M', 1, 2, 0, '25.0', '90.0', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 50, 0, 0, 0, 0, ''),
(1020, 'CAJA DECORADA GRANDE', '00232', 'DECO-G', 1, 2, 0, '30.0', '125.0', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, 0, ''),
(1021, 'CAJA DECORADA JUMBO', '00233', 'DECO-J', 1, 1, 0, '40.0', '165.0', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, 0, ''),
(1022, 'PELUCHE PANDA SUPER', '00120', 'PAND', 20, 0, 0, '800.0', '1800.0', 24, '2016-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1023, 'PELUCHE OSO GRADUACION', '00223', 'P-GRADUA', 20, 0, 0, '59.0', '180.0', 26, '2016-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1024, 'COJIN LOVE YOU ROSA Y ROJO', '00432', 'C-YOU', 20, 0, 0, '130.0', '300.0', 26, '2016-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1025, 'PELUCHE OSO C/ PERGAMINO Y ENVOLTURA ', '00224', 'P-PERG', 20, 0, 0, '100.0', '200.0', 26, '2016-07-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1026, 'MOCHILA 3D DIFERENTE MODELOS', '80001', 'M-3D', 25, 0, 0, '300.0', '300.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1027, 'MOCHILA PRIMARIA DIFERENTES MODELOS', '80002', 'M-PRI', 25, 1, 0, '250.0', '300.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 250, 0, 0, 0, 0, ''),
(1028, 'MOCHILA PRIMARIA M2', '80003', 'M-M2', 25, 0, 0, '305.0', '499.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1029, 'MOCHILA KINDER 3D DIFERENTE MODELOS', '80004', 'MK-3D', 25, 0, 0, '280.0', '450.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1030, 'MOCHILA KINDER PEPA ', '80005', 'MK-P', 25, 0, 0, '265.0', '418.0', 26, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1031, 'CAJA DE REGALO THE CAT MEDIANA', '1197', 'TE CAT-M', 1, 0, 0, '27.0', '68.0', 26, '2016-12-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1032, 'LONCHERA O BOLSO KINDER ', '80006', 'LON-K', 25, 1, 0, '139.0', '299.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 139, 0, 0, 0, 0, ''),
(1033, 'LONCHERA CARS KINDER', '80007', 'L-CARS', 25, 0, 0, '220.0', '370.0', 26, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1034, 'LONCHERA KINDER LONCHS2', '80008', 'LON-2', 25, 0, 0, '109.0', '250.0', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1035, 'MOCHILA KINDER RUEDAS', '80011', 'MK-RUEDAS ', 25, 0, 0, '280.0', '580.0', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1036, 'MOCHILA PRIMARIA RUEDAS ', '80012', 'MP-RUEDAS ', 25, 0, 0, '345.0', '750.0', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1037, 'MOCHILA KIT RUEDAS 3D', '80013', 'M-K3D', 25, 0, 0, '67500.0', '1100.0', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1038, 'MOCHILA KIT RUEDAS PRIMARIA', '80014', 'M-KRP', 25, 0, 0, '770.0', '995.0', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1039, 'LAPICERA DIFERENTES MODELOS ', '80010', 'LAP', 25, 0, 0, '95.0', '150.0', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1040, 'TIARA DIFERENTE MODELOS ', '00234', 'TIARA-BB', 23, 7, 0, '20.0', '40.0', 26, '2016-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, 0, ''),
(1041, 'COJIN CARA CHAMOY GRANDE', '00235', 'C-CHAMOY', 20, 0, 0, '140.0', '300.0', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1042, 'COJIN CHAMOY GRANDE', '00236', 'J-CHAMOY', 20, 0, 0, '120.0', '280.0', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1043, 'COJIN BEBE NEONATO', '00237', 'C-NEONATO', 20, 0, 0, '100.0', '250.0', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1044, 'COJIN CARITA BEBE NEONATO', '00238', 'C-BB-NEO', 20, 0, 0, '100.0', '250.0', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1045, 'BOLSA BUTIC CHICA', '00542', 'BK-CH', 1, 0, 0, '9.0', '22.0', 21, '2016-10-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1046, 'PELUCHE OSOS KODAK MEDIANO', '734689005413', 'P-KODAK', 20, 0, 0, '130.0', '300.0', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1047, 'PELUCHE OSO JAZPIADO CHICO', '734689600113', 'PJAZP-C', 20, 0, 0, '100.0', '198.0', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1048, 'PELUCHE OSO JAKE MEDIANO', '734689164738', 'JAK', 20, 0, 0, '126.0', '300.0', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1049, 'PELUCHE OSO MOLT C/ BUFANDA', '7506406500326', 'P-MOLT', 20, 0, 0, '464.0', '900.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1050, 'PELUCHE OSOS BUBU SUPER', '7506406500388', 'P-BUBU', 20, 0, 0, '492.0', '1000.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1051, 'PELUCHE OSO RIZADO MEDIANO', '734689614431', 'P-RIZADO', 20, 0, 0, '130.0', '350.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1052, 'PELUCHE PERRO RIZADO MEDIANO', '734689041633', 'P-RIZZA', 20, 0, 0, '130.0', '350.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1053, 'PELUCHE OSO YUNI HUELLAS GRANDE', '734689165926', 'P-YUNI', 20, 0, 0, '250.0', '680.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1054, 'PELUCHE OSO TACHIS GRANDES', '734689104338', 'P-TACHIS', 20, 0, 0, '130.0', '370.0', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1055, 'PERFUME HALLOWEEN DAMA', '487698542', 'HALLOWE', 24, 0, 0, '500.0', '850.0', 24, '2017-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1056, 'PELUCHE PERRO NUR RIZADO', '734689164745', 'P-NUR', 20, 0, 0, '126.0', '300.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1057, 'PELUCHE PERROS COQUETOS', '8897', 'P-COQUET', 20, 0, 0, '85.0', '185.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1058, 'PELUCHE PERRO RIZADO C/ HUESO', '734689173754', 'P-RIZZ', 20, 0, 0, '149.0', '380.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1059, 'PELUCHE OSO KLIM GRANDE ', '734689164776', 'P-KLIM', 20, 0, 0, '200.0', '500.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1060, 'PELUCHE KODAK SUPER', '8517857400379', 'P-KODA', 20, 0, 0, '340.0', '850.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1061, 'PELUCHE OSO WALDO SUPER ', '7506406500241', 'P-WALDO', 20, 0, 0, '560.0', '1200.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1062, 'PELUCHE OSO VOTT T.Q.M SUPER', '851785770202', 'P-VOOT', 20, 0, 0, '475.0', '1100.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1063, 'PELUCHE PANDA Y POLAR GRANDE', '8896', 'P-PAND', 20, 0, 0, '204.0', '600.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1064, 'PELUCHE PANDA NINI GRANDE', '734689164790', 'P-NINI', 20, 0, 0, '204.0', '450.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1065, 'PELUCHE OSO HUELLAS GRANDE', '818980013381', 'P-HUELLS', 20, 0, 0, '390.0', '780.0', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1066, 'CARITA WHATSAPP MINI', '8899', 'C-MINI', 20, 2, 0, '40.0', '110.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, 0, ''),
(1067, 'MUÑEQUITO WHATSAPP', '8898', 'M-WHAT', 20, 3, 0, '50.0', '145.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, ''),
(1068, 'PELUCHE BUOS CHICO', '8895', 'P-BUO', 20, 0, 0, '38.0', '135.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1069, 'CUBO WHATSAPP ', '8894', 'P-CUBO', 20, 0, 0, '71.0', '160.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1070, 'GLOBO SAN VALENTIN MEDIANO', '444', 'G-SAN', 30, 122, 0, '25.0', '50.0', 26, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 3050, 0, 0, 0, 0, ''),
(1071, 'CAJA CAMICERA JUMBO', '8891', 'C-CAMIC', 1, 1, 0, '45.0', '168.0', 26, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(1072, 'PELUCHE OSO C/ RAMO', '8881', 'P-RAMO', 20, 0, 0, '250.0', '550.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1073, 'PELUCHE OSITA CORAZON FLORES CHICO', '8882', 'FLORS', 20, 0, 0, '80.0', '170.0', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1074, 'PELUCHE OSA CORAZON PETALOS ', '8884', 'P-PETALOS', 20, 0, 0, '250.0', '600.0', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1075, 'PELUCHE OSO C/ PALETA GRANDE', '8883', 'P-PALET', 20, 0, 0, '290.0', '650.0', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1076, 'PELUCHE OSO BRANDON GRANDE', '8885', 'P-GLOBO', 20, 0, 0, '432.0', '900.0', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1077, 'PELUCHE OSO BRANDON PATON', '8886', 'PATON', 20, 0, 0, '250.0', '550.0', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1078, 'PELUCHE OSA SAN VALENTIN JUMBO', '8887', 'VALEN-JUUM', 20, 5, 0, '350.0', '850.0', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1750, 0, 0, 0, 0, ''),
(1079, 'LAMPARA INFANTIL CONEJITA- ZMLY305', '0111', 'LMP-CONEJ', 22, 0, 0, '158.0', '350.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1080, 'LAMPARA INFANTIL RANA Y OSO -ZMLY346', '0112', 'LAM-RANI', 22, 0, 0, '102.0', '280.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1081, 'LAMPARA INFANTIL PANDA -ZOECG094', '0113', 'LAM-PAN', 22, 0, 0, '175.0', '400.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1082, 'LAMPARA INFANTIL RANA- ZMLY306', '0114', 'LAM-RAN', 22, 0, 0, '158.0', '350.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1083, 'LAMPARA INFANTIL C/DESPERTADOR', '0115', 'LAM-DESPER', 22, 0, 0, '190.0', '418.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1084, 'PORTA RETRATO TARRO', '0116', 'P-TARRO', 22, 0, 0, '62.0', '145.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1085, 'PORTA RETRATO OSO BEAR ', '0117', 'P-OSO', 29, 0, 0, '66.0', '160.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1086, 'RELOJ DESPERTADOR ROBOTT', '0118', 'R-ROBOTT', 22, 0, 0, '60.0', '160.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1087, 'RELOJ DISNEY DIFERENTE MODELOS ', '1911', 'R-DISNE', 22, 2, 0, '170.0', '400.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 340, 0, 0, 0, 0, ''),
(1088, 'PELUCHE CONEJO PANTUMFLINES GDE', '7500225183388', 'PANTUMFLINES ', 20, 0, 0, '99.0', '235.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1089, 'RELOJ DESPERTADOR OSO C/ PENDULO', '0121', 'R-PENDULO', 22, 0, 0, '60.0', '150.0', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1090, 'RELOJ DE PARET SANTA MANIA ', '0122', 'R-MANIA', 22, 0, 0, '56.0', '150.0', 26, '2017-05-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1091, 'BOLSO HEHE DOBLE BOLSO', '00526', 'B-HEHE', 23, 0, 0, '190.0', '600.0', 27, '2017-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1092, 'MOCHILA FULANITO Y CHANGOLO CHENSON P/N', '71618', 'MOCH-F', 25, 0, 0, '385.0', '600.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1093, 'MOCHILA FULANITO ROSA CHENSON P/N', '71619', 'FUL-ROS', 25, 0, 0, '420.0', '700.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1094, 'MOCHILA CARRO CARS KINDER P/N', '71617', 'CARS-K', 25, 0, 0, '314.0', '470.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1095, 'MOCHILA CARRO CARS PRIMARIA P/N', '71616', 'CARS-PR', 25, 1, 0, '380.0', '500.0', 21, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, 0, ''),
(1096, 'MOCHILA BARMAN Y MINIUM P/N', '71615', 'BAT-MIN', 25, 0, 0, '199.0', '480.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1097, 'MOCHILA BATMAN SERIE2 P/N', '71614', 'BAT-2', 25, 0, 0, '119.0', '350.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1098, 'SET MOCHILA LONCHERA Y LAPICERA P/N', '71613', 'SET-M', 25, 0, 0, '900.0', '1300.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1099, 'SET MOCHILA LONCHERA LAPICERA CARS', '71612', 'SET-CARS', 25, 0, 0, '950.0', '1400.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1100, 'MOCHILA DIFERENTES MODELOS P/N', '71611', 'M-P/N', 25, 1, 0, '120.0', '400.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1101, 'MOCHILA KINDER BATMAN', '71610', 'KIN-BAT', 25, 0, 0, '130.0', '300.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1102, 'MOCHILA KINDER DIFERENTES MODELOS P/N', '71609', 'M-KINN', 25, 0, 0, '100.0', '200.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1103, 'LONCHERA DIFERENTE MODELOS P/N', '71608', 'P/N', 25, 3, 0, '100.0', '300.0', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, 0, ''),
(1104, 'LAPICERA SERIE1  P/N', '71607', 'SERIE1', 25, 0, 0, '135.0', '190.0', 26, '2017-08-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1105, 'LAPICERA SERIE2  P/N', '71606', 'S/2', 25, 0, 0, '80.0', '160.0', 26, '2017-08-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1106, 'LAPICERA KIT', '71605', 'L-KIT', 25, 0, 0, '130.0', '190.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1107, 'LONCHERA KIT', '71604', 'LON-KIT', 25, 0, 0, '270.0', '350.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1108, 'MOCHILA RUEDAS', '71603', 'M-KIT', 25, 2, 0, '330.0', '700.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, 0, ''),
(1109, 'LAPICERA KIT CARS', '71602', 'CARS', 25, 0, 0, '130.0', '200.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1110, 'LONCHERA KIT CARS', '71601', 'KIT-CARS', 25, 0, 0, '270.0', '380.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1111, 'MOCHILA KIT CARS', '71600', 'M-CARS', 25, 0, 0, '550.0', '800.0', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1112, 'EXIBIDOR PARA GORRAS ', '002000', 'EX-GORRA', 23, 18, 0, '25.0', '100.0', 26, '2017-09-24 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, 0, ''),
(1113, 'MINIATURA CERQUITA CHICA C/ RANITA', '0100', 'M-CERQ', 27, 0, 0, '33.0', '68.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1114, 'MINIATURA CORAZON VALENTINO', '1171', 'VAALE', 27, 0, 0, '29.0', '70.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1115, 'MINIATURA OVEJA JUMBO', '1173', 'OVEJA-J', 27, 1, 0, '65.0', '150.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 65, 0, 0, 0, 0, ''),
(1116, 'MINIATURA OVEJA COLGANTE', '1174', 'OVE-COLG', 27, 0, 0, '29.0', '65.0', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1117, 'RELOJ CLON CABALLERO CAJA', '1175', 'R-CLON', 23, 4, 0, '130.0', '400.0', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 520, 0, 0, 0, 0, ''),
(1118, 'MOCHILA COOL IMPERMIABLE', '1176', 'B-COOL', 23, 0, 0, '130.0', '270.0', 26, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1119, 'BOLSO XR COOL DAMA', '1177', 'XR-COOL', 23, 0, 0, '220.0', '470.0', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1120, 'BOLSO VL-CH-MK-DAMA ', '1178', 'C&L', 23, 6, 0, '110.0', '199.0', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, 0, ''),
(1121, 'MARIQUERA OH CABALLERO', '1179', 'M-OH', 23, 0, 0, '6.0', '300.0', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1122, 'MARIQUERA LETIAN CABALLERO ', '1180', 'M-LETY', 23, 0, 0, '85.0', '250.0', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1123, 'MUÑEQUITO WHATSAPP EN CAJA', '8893', 'P-WHAT', 20, 0, 0, '67.0', '160.0', 26, '2017-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1124, 'MUÑEQUITO WHATSAPP C/ SONIDO', '8892', 'M/SONID', 20, 0, 0, '77.0', '190.0', 26, '2017-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1125, 'PELUCHE OSO ALGODONIS GRANDE', '7500181716040', 'ALGODONIS', 20, 0, 0, '129.0', '300.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1126, 'PELUCHE OSO ALGODONIS MED', '7500193164921', 'ALGO-MED', 20, 0, 0, '87.0', '217.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1127, 'PELUCHE OSO CHOKOPACHON GDE', '7500142617119', 'PACHONG', 20, 0, 0, '115.0', '360.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1128, 'PELUCHE OSO PATOCHO MED', '0611', 'PATOCHO', 20, 4, 0, '79.0', '189.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 316, 0, 0, 0, 0, ''),
(1129, 'PELUCHES BEBES GRANDES', '8888', 'BEBES', 20, 0, 0, '96.0', '260.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1130, 'PELUCHE JIRAFA NECKY  C/SONIDO', '7500124755815', 'NECK', 20, 0, 0, '115.0', '300.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1131, 'PELUCHE OSO FLAIS COOL ', '7500202106614', 'FLAIS', 20, 0, 0, '109.0', '238.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1132, 'PELUCHE OSO PANQUECITO MED', '7500203960628', 'PANQ', 20, 0, 0, '75.0', '187.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1133, 'PELUCHE OSO CHOKOPACHON MED', '7500142617102', 'CHOKOP', 20, 0, 0, '67.0', '188.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1134, 'PELUCHE OSO SONRIKY GDE', '7500133133710', 'RIKY', 20, 0, 0, '96.0', '230.0', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1135, 'RELOJ CLON CABALLERO FOSSIL', '1181', 'FOSSIL', 23, 0, 0, '150.0', '500.0', 26, '2018-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1136, 'PELUCHE OSO ROSA CORAZON CON SONIDO JUMBO', '3566', 'P-ROS', 20, 0, 0, '339.0', '650.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1137, 'PELUCHE OSO CORAZON GLITER GRANDE', '3559', 'OSO-GRA', 20, 0, 0, '650.0', '1200.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1138, 'PELUCHE OSO BRANDON MEDIANO', '2232', 'BODO', 20, 1, 0, '251.0', '550.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 251, 0, 0, 0, 0, ''),
(1139, 'PELUCHE PERROS HERMOSOS GRANDES', '1421', 'HERM', 20, 0, 0, '406.0', '799.0', 0, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1140, 'PELUCHE OSO HUELLIPAW JUMBO', '7718', 'PAW', 20, 0, 0, '229.0', '450.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1141, 'PELUCHE BORREGO BORRIS CON SONIDO ', '4793', 'BORRIS', 20, 0, 0, '145.0', '300.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1142, 'PELUCHE PERRITOS HERMOSOS MEDIANOS', '1076', 'P-HERM', 20, 0, 0, '116.0', '299.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1143, 'PELUCHE PERRA CHIHUAGUIS C/SONIDO CHICO ', '7017', 'CHIHUAGUIS', 20, 1, 0, '109.0', '218.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 109, 0, 0, 0, 0, ''),
(1144, 'PELUCHE JIRAFA FLAUTICA CHICA', '8139', 'FLAU', 20, 0, 0, '41.0', '145.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1145, 'PELUCHE PATA PIKORINA GRANDE ', '7511', 'PIKO', 20, 0, 0, '106.0', '300.0', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1146, 'MINIATURA UNICORNIO', '1172', 'M-UNICOR', 27, 0, 0, '32.0', '64.0', 26, '2018-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1147, 'PELUCHE PANDA PANCHINY GDE', '7500225182282', 'PANCHINY', 20, 0, 0, '99.0', '238.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1148, 'PELUCHE OSITO CHOKOLONO GDE', '3931', 'CHOKOLONO', 20, 0, 0, '139.0', '278.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1149, 'PELUCHE PUERCORRIQUEÑO MEDIANO', '7500140872794', 'PUERCORRIQUEÑO', 20, 0, 0, '75.0', '190.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1150, 'PELUCHE PERRO DALMATA MEDIANO', '7500226185695', 'DALMATA', 20, 0, 0, '129.0', '270.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1151, 'PELUCHE OSO CHOCORROLO MEDIANO', '3527', 'CHOCORROLO', 20, 4, 0, '89.0', '199.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 356, 0, 0, 0, 0, ''),
(1152, 'PELUCHE OSITOS MOLIZ CLASIC MEDIANO', '7500216170212', 'MOLIZ', 20, 0, 0, '89.0', '218.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1153, 'PELUCHE PERRITA PARISINA GDE CON SONIDO', '7500232929221', 'PARISINA', 20, 1, 0, '99.0', '270.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 99, 0, 0, 0, 0, ''),
(1154, 'PELUCHE OSO CACHITO MEDIANO', '7500237618625', 'CACHITO', 20, 0, 0, '69.0', '179.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1155, 'PELUCHE OSITOS MOLIZ BABY MEDIANO', '7500216170229', 'MOLIZ BABY', 20, 0, 0, '89.0', '218.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1156, 'PELUCHE ANIMALES GAFIKY GDE', '7500181829177', 'GAFIKY', 20, 1, 0, '119.0', '265.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 119, 0, 0, 0, 0, ''),
(1157, 'PELUCHE PUERQUITA PALANKETA CHICA', '7500237618113', 'PALANQUETA', 20, 0, 0, '39.0', '118.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1158, 'PELUCHE GATO COLOFUS CHICO', '7500159828515', 'COLOFUS', 20, 0, 0, '36.0', '118.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1159, 'PELUCHE OSO CACHETONY CHICO', '7500212541214', 'CACHETONY', 20, 0, 0, '36.0', '118.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1160, 'PELUCHE OSO CURY CHICO', '7500159771392', 'CURY', 20, 0, 0, '36.0', '140.0', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1161, 'PANTUMFLA UNICORNIO CHICA ', '8147', 'PANTU-CH', 22, 0, 0, '50.0', '110.0', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1162, 'PANTUMFLA UNICORNIO MEDIANA ', '8148', 'PAMTU-MED', 22, 0, 0, '55.0', '138.0', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1163, 'PANTUMFLA DIFERENTES TALLAS', '8149', 'PANTU-GDE', 22, 2, 0, '100.0', '198.0', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(1164, 'BOLSO DAMA FASS', '8877', 'DOBLE', 23, 0, 0, '150.0', '300.0', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1165, 'MOCHILITA CONEJO LENTEJUELAS CHICA', '9181', 'LENTEJUELAS', 22, 0, 0, '130.0', '250.0', 26, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1166, 'BOLSO COOL DAMA DIFERENTE COLORES', '9117', 'BOLSO-COOL', 23, 0, 0, '110.0', '200.0', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1167, 'BOLSO HEHE DAMA CHICO', '9411', 'HEHE-CH', 23, 2, 0, '210.0', '400.0', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 420, 0, 0, 0, 0, ''),
(1168, 'BOLSO OH DAMA CHICO', '9412', 'OH', 23, 0, 0, '110.0', '300.0', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1169, 'BOLSO SIRENA CHIC GLAMUR', '1515', 'B-CHIC', 23, 0, 0, '160.0', '320.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1170, 'MOCHILA BUO CHIC GLAMUR', '1616', 'M-CHIC', 23, 0, 0, '290.0', '600.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1171, 'MOCHILA ANGEL CHIC GLAMUR', '1717', 'A-GLAMUR', 23, 0, 0, '200.0', '590.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1172, 'LAMPARA UNICORNIO CHIC GLAMUR', '1818', 'LM-CHIC', 23, 0, 0, '125.0', '350.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1173, 'MOCHILA MICKY MAUS', '1919', 'MAUS', 23, 0, 0, '120.0', '270.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1174, 'MOCHILA CHIC CONEJO CON CORREA PROTECCION', '1414', 'CHIC-CONEJ', 23, 0, 0, '100.0', '250.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1175, 'MALETIN UNICORNIO CHICO', '1112', 'MALETIN-CH', 23, 0, 0, '70.0', '150.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1176, 'MALETIN UNICORNIO MEDIANO', '1212', 'MALETIN-M', 23, 1, 0, '100.0', '150.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(1177, 'MALETIN UNICORNIO GRANDE', '1313', 'MALETIN-G', 23, 1, 0, '110.0', '187.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, 0, ''),
(1178, 'COSMETIQUERAS CHIP 3 PIEZAS', '1817', 'COSM-CHIP', 23, 1, 0, '70.0', '218.0', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(1179, 'COSMETIQUERA CHIP', '1615', 'COS-CHP', 23, 0, 0, '60.0', '190.0', 26, '2019-01-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1180, 'ALMOHADA BLANCA SAN VALENTIN ', '1411', 'AL-SANVALENTIN', 20, 0, 0, '65.0', '180.0', 26, '2019-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1181, 'PELUCHE STICHIS SUPER', '8816', 'STICHIS-S', 20, 0, 0, '530.0', '1400.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1182, 'PELUCHE AGELA GRANDE', '8817', 'ANGELA-G', 20, 0, 0, '200.0', '650.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1183, 'PELUCHE STICHIS MEDIANO ', '8815', 'STIC-M', 20, 2, 0, '250.0', '499.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 500, 0, 0, 0, 0, ''),
(1184, 'PELUCHE STICHIS BEBE CHICOS', '8812', 'STIC-BB-CH', 20, 6, 0, '130.0', '280.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 780, 0, 0, 0, 0, ''),
(1185, 'PELUCHE BB NANI CHICO', '8813', 'NANI-BB-CH', 20, 0, 0, '280.0', '499.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1186, 'PELUCHE STICHS BB MEDIANO', '8814', 'STICH-BB-M', 20, 0, 0, '120.0', '390.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1187, 'PELUCHE BB NANI MEDIANO', '8818', 'NANI-BB-M', 20, 0, 0, '350.0', '700.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1188, 'PELUCHE BB STICHIS GRANDE', '8819', 'STICHIS-BB-G', 20, 0, 0, '400.0', '850.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1189, 'PELUCHE BB  NANI GRANDE', '8810', 'NANI-BB-G', 20, 0, 0, '400.0', '850.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1190, 'PELUCHE STICHIS Y ANGELA GRANDES', '7711', 'BBS-STICHIS', 20, 2, 0, '350.0', '750.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 700, 0, 0, 0, 0, ''),
(1191, 'PELUCHE BEBES STICHIS CHICO', '7712', 'BEBES-CH', 20, 0, 0, '50.0', '180.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1192, 'COJIN BEBE INCREIBLE', '7713', 'BB-INCREIBLE', 20, 0, 0, '100.0', '270.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1193, 'PELUCHE BB INCREIBLE MEDIANO', '7714', 'BB-INCRE', 20, 0, 0, '70.0', '200.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1194, 'COJIN DE DONA EXPLOWORT', '7715', 'DONA', 20, 4, 0, '144.0', '300.0', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 576, 0, 0, 0, 0, ''),
(1195, 'PALETA FIGURA DE BOMBOM', '712', 'TREVOL', 27, 8, 0, '14.0', '28.0', 29, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 112, 0, 0, 0, 0, ''),
(1196, 'LAPICERO LOVE ', '715', 'L-LOVE', 27, 0, 0, '7.0', '15.0', 26, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1197, 'PELUCHE OSITO SAN VALENTIN DECORADO', '718', 'SAN-VALE', 20, 1, 0, '70.0', '160.0', 26, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(1198, 'PELUCHE PERRITA DECORADA', '7716', 'PERRIT', 20, 0, 0, '119.0', '295.0', 24, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1199, 'PULCERA CABALLERO FASSION', '7719', 'P-FASS', 23, 0, 0, '28.0', '120.0', 27, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1200, 'PELUCHE OSITOS CAJA SORPRESA', '719', 'P-SORPRESA', 20, 0, 0, '120.0', '300.0', 26, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1201, 'MINIATURA MUÑECA BALETT', '771', 'BALLET', 27, 3, 0, '40.0', '110.0', 26, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1202, 'PELUCHE OSO MI CORAZON LATE CON SONIDO JUMBO', '1757', 'P-LATE', 20, 2, 0, '339.0', '599.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 678, 0, 0, 0, 0, ''),
(1203, 'PELUCHE OSO CHAKIRIN JUMBO', '7500107574167', 'P-CHAKI', 20, 0, 0, '368.0', '700.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1204, 'PELUCHE OSO MI CORAZON LATE C/ SONIDO GRANDE', '7500107573535', 'LATE-G', 20, 0, 0, '232.0', '395.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1205, 'PELUCHE OSO CORAZON TE AMO JUMBO', '4143', 'T-AMO', 20, 1, 0, '368.0', '700.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 368, 0, 0, 0, 0, ''),
(1206, 'PELUCHE OSO CORAZON DIAMANTE JUMBO', '7500107574235', 'P-DIAMANTE', 20, 0, 0, '349.0', '700.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1207, 'PELUCHE OSO HUGS AND KISSES', '7500107574204', 'P-KISS', 20, 0, 0, '368.0', '700.0', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1208, 'PELUCHE OSO CORAZON DIAMANTE GRANDE', '7500107574228', 'DIAMAN-G', 20, 0, 0, '232.0', '395.0', 24, '2019-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1209, 'PELUCHE OSO PANCHO GRANDE', '7500226185619', 'PANCHO', 20, 0, 0, '145.0', '300.0', 24, '2019-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1210, 'MOCHILAS MIKO YAMAS Y UNICORNIO ', '7780', 'M-MIKO', 25, 2, 0, '190.0', '380.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, 0, ''),
(1211, 'MOCHILA YAMAS PRIMARIA', '7781', 'M-YAMS', 25, 1, 0, '160.0', '300.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, 0, ''),
(1212, 'MOCHILA UNICORNIO PRIMARIA (ECO)', '7782', 'UNICOR', 25, 0, 0, '120.0', '200.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1213, 'MOCHILA UNICORNIO ', '7783', 'M-UNI', 25, 1, 0, '130.0', '290.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, 0, ''),
(1214, 'MOCHILA NIÑA PRIMARIA FASHIONBACK', '7784', 'M-BACK', 25, 4, 0, '110.0', '350.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, 0, ''),
(1215, 'MOCHILA COLOR NIÑO', '7785', 'COLOR', 25, 1, 0, '110.0', '300.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, 0, ''),
(1216, 'MOCHILA CORAZON GLITER PRIMARIA', '7786', 'GLITER', 25, 2, 0, '220.0', '450.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, 0, ''),
(1217, 'MOCHILA BUOS  UNICORNIO LEONCITO Y BATMAN PRIMARIA', '7788', 'PRIMA', 25, 3, 0, '200.0', '400.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, 0, ''),
(1218, 'MOCHILA NEGRA ', '7789', 'NEGRA', 25, 1, 0, '120.0', '350.0', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1219, 'MOCHILA UNIKER ', '7790', 'UNIKER', 25, 7, 0, '230.0', '450.0', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 1610, 0, 0, 0, 0, ''),
(1220, 'MOCHILA PANDA SNOPPY Y UNICORNIO', '7791', 'M-NEGRA', 25, 6, 0, '145.0', '300.0', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 870, 0, 0, 0, 0, ''),
(1221, 'LAPICERA SABONIS A-1', '1117', 'A-1', 25, 0, 0, '70.0', '140.0', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1222, 'LAPICERA SABONIS TUBO A-2', '1118', 'A-2', 25, 4, 0, '50.0', '100.0', 0, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(1223, 'LAPICERA SABONIS PLANA A-3', '1119', 'A-3', 25, 8, 0, '50.0', '115.0', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, 0, ''),
(1224, 'LAPICERA SABONIS A-4', '1116', 'A-4', 25, 2, 0, '60.0', '110.0', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1225, 'BOLSITO P/ NIÑA (MUÑEQUITOS)', '7795', 'OSITO', 23, 0, 0, '55.0', '120.0', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1226, 'MOCHILA NIKE MOD-1', '7792', 'NIKE-1', 25, 3, 0, '125.0', '250.0', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 375, 0, 0, 0, 0, ''),
(1227, 'LLAVERO GARZA DIAMANTE', '1902', 'DIAMNA', 23, 0, 0, '40.0', '138.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1228, 'LLAVERO POTASIO BB', '1914', 'POTASIOO', 23, 4, 0, '55.0', '140.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, 0, ''),
(1229, 'PELUCHE ANIMALES TE AMO C/ SONIDOS', '1716', 'ANIMALES-TAM', 20, 0, 0, '160.0', '390.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1230, 'ALMOHADA MANTA COSTALITO NEGRO', '7151', 'COSTAL', 20, 3, 0, '90.0', '170.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 270, 0, 0, 0, 0, ''),
(1231, 'ALMOHADA MANTA CUADRADA GRANDE', '7152', 'MANTA-G', 20, 0, 0, '80.0', '230.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1232, 'ALMOHADA MANTA CUADRADA MEDIANA', '7153', 'MANTA-M', 20, 4, 0, '70.0', '150.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, 0, ''),
(1233, 'ALMOHADA MANTA PINTADA CHICA ', '7154', 'MANTA-CH', 20, 1, 0, '60.0', '110.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, 0, ''),
(1234, 'PELUCHE OSO DAUGLAS CHICO', '4323', 'DAUGLAS-C', 20, 0, 0, '69.0', '179.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1235, 'PELUCHE OSA  SAN VALENTIN MEDIANO', '3428', 'VALEN-M', 20, 8, 0, '180.0', '385.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 1440, 0, 0, 0, 0, ''),
(1236, 'PELUCHE GATITO MIAU C/ SONIDO MED', '0129', 'MIUA-MED', 20, 0, 0, '99.0', '228.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1237, 'PELUCHE PERRITA POLETIKA MED', '1928', 'POLETIKA-M', 20, 0, 0, '79.0', '195.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1238, 'PELUCHE GATO RAYUFU   C/ SONIDO GDE', '0176', 'RAYUF-G', 20, 0, 0, '119.0', '280.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1239, 'PELUCHE OSO KINGDOM GDE', '6713', 'KING-GDE', 20, 0, 0, '149.0', '290.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1240, 'PELUCHE ELEFANTE ELEFANTONI GDE', '8124', 'ELEF-GDE', 20, 0, 0, '99.0', '300.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1241, 'PELUCHE PERRO CACHORRIS MED', '5615', 'CACHORRIS-M', 20, 1, 0, '89.0', '220.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 89, 0, 0, 0, 0, ''),
(1242, 'PELUCHE PERRITA CHIUACHIS MED', '5212', 'CHIHUACHIS-M', 20, 1, 0, '64.0', '189.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 64, 0, 0, 0, 0, ''),
(1243, 'PELUCHE OSO CHOKORRORRO GDE', '6027', 'CHOCORR', 20, 0, 0, '129.0', '260.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1244, 'PELUCHE CONEJA BRICOLIN GDE', '1037', 'BRINCO-G', 20, 0, 0, '109.0', '350.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1245, 'PELUCHE OSO POLAR CHICO', '9626', 'PE-PO', 20, 1, 0, '79.0', '189.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 79, 0, 0, 0, 0, ''),
(1246, 'PELUCHE OSO CORAZON LOVE C/SONIO EX GDE', '2245', 'LOVE-EX-G', 20, 0, 0, '149.0', '380.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1247, 'PELUCHE OSO CORAZONADA C/SONIDO EX GRANDE', '3573', 'CORAZONADA-EXG', 20, 0, 0, '199.0', '450.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1248, 'PELUCHE OSO TIBET GDE', '0411', 'TIBET', 20, 4, 0, '159.0', '385.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 636, 0, 0, 0, 0, ''),
(1249, 'PELUCHE OREJOLOS GDE', '3238', 'OREJO-GDE', 20, 1, 0, '129.0', '379.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, 0, ''),
(1250, 'BOLSITO OSOS MONEDERO PLASTICO', '7779', 'MONED-PLAS', 23, 2, 0, '38.0', '97.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 76, 0, 0, 0, 0, ''),
(1251, 'PELUCHE MINIE BB', '1412', 'MINI-BB', 20, 0, 0, '60.0', '149.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1252, 'PELUCHE D-J CHICO', '1413', 'D.J.CH', 20, 0, 0, '50.0', '200.0', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1253, 'COJIN PANDA UNICORNIO GDE', '1415', 'PANDA-GDE', 20, 0, 0, '120.0', '350.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1254, 'COJIN PANDA UNICORNIO  MEDIANA', '1416', 'PANDA-M', 20, 0, 0, '100.0', '279.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1255, 'CAJA SORPRESA MOD-1', '1711', 'MOD.1', 1, 0, 0, '20.0', '35.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1256, 'CAJA SORPRESA MOD-2', '1712', 'MOD.2', 1, 0, 0, '35.0', '65.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1257, 'CAJA SORPRESA MOD-3', '1713', 'MOD.3', 1, 0, 0, '45.0', '85.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1258, 'CAJA SORPRESA MOD-4', '1714', 'MOD.4', 1, 0, 0, '55.0', '110.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1259, 'CAJA SORPRESA MOD-5', '1718', 'MOD.5', 1, 0, 0, '75.0', '145.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1260, 'CAJA SORPRESA MOD-6', '1719', 'MOD.6', 1, 0, 0, '105.0', '195.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1261, 'CAJA SORPRESA MOD-7', '1720', 'MOD.7', 1, 0, 0, '95.0', '170.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1262, 'CAJA SORPRESA MOD-8', '1721', 'MOD.8', 1, 0, 0, '125.0', '250.0', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1263, 'ROSAS C/ CHOCOLATE', '1516', 'ROSAS-CHO', 27, 0, 0, '12.0', '25.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1264, 'GOMA UNICORNIO Y TRANSFORME', '7087', 'GOMA', 26, 1, 0, '18.0', '45.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 18, 0, 0, 0, 0, ''),
(1265, 'MINI GOMAS CORAZON', '1820', 'GOMAS-MINI', 26, 0, 0, '9.0', '10.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1266, 'LIBRETA MINIE Y KITY LENTEJUELAS', '7502', 'LENTEJ', 26, 0, 0, '75.0', '165.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1267, 'DIARIOS UNICORNIO FROSEN LOL LEIDY PIKMI', '7866', 'DIARIOS.', 26, 0, 0, '75.0', '160.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1268, 'PLUMA SQUISHIES ', '1819', 'SQUIS', 26, 8, 0, '8.0', '20.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 64, 0, 0, 0, 0, ''),
(1269, 'PLUMA UNICORNIO AGUITA C/BRILLO', '1517', 'PLUM-C/BRI', 26, 4, 0, '5.0', '25.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 20, 0, 0, 0, 0, ''),
(1270, 'PLUMA ESCANDALOSO ', '5278', 'ESCANDALOS', 26, 0, 0, '5.0', '15.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1271, 'PLUMA SANVALENTIN', '7811', 'PLUMA-SAN', 26, 4, 0, '6.0', '15.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 24, 0, 0, 0, 0, ''),
(1272, 'GOMAS DONITAS', '1476', 'DONITS', 26, 3, 0, '15.0', '45.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(1273, 'PLUMA MULTICOLOR  UNICORNIO', '1908', 'MULTI', 26, 9, 0, '4.0', '20.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 36, 0, 0, 0, 0, ''),
(1274, 'SET PLUMAS DE GEL', '7315', 'ST-PLU', 26, 0, 0, '70.0', '189.0', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1275, 'CAJA CHOCOLATE BEYLES', '1821', 'CHOCO-C', 22, 0, 0, '40.0', '130.0', 29, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1276, 'BOTELLA C/ DULCE MEDIANA', '2110', 'BOTELLA-M', 27, 8, 0, '51.0', '116.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 408, 0, 0, 0, 0, ''),
(1277, 'ARREGLO C/ PELUCHE PARA MAMA', '2111', 'A-PELUCHE', 20, 0, 0, '12000.0', '35000.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `productos` (`id`, `nombre`, `codigo`, `nombre_generico`, `id_categoria`, `stock`, `stock_minimo`, `costo`, `precio`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `inventariable`, `imagen`) VALUES
(1278, 'ARREGLO PARA MAMA C/ BUCHANAS ', '2112', 'BUCHANAS', 20, 0, 0, '600.0', '850.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1279, 'OSITO EN LATA ', '2113', 'LATA', 27, 0, 0, '35.0', '50.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1280, 'PALETA FLOR DE BOMBOM', '2114', 'BOMM', 22, 0, 0, '10.0', '25.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1281, 'BROCHETA DE BOMBOM', '2115', 'BOMBOM', 22, 59, 0, '2.0', '5.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 118, 0, 0, 0, 0, ''),
(1282, 'TAZA SAN VALENTIN', '2116', 'TAZA-MA', 27, 23, 0, '35.0', '110.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 805, 0, 0, 0, 0, ''),
(1283, 'BOBONERA PARA MAMA', '2117', 'BON', 22, 0, 0, '15.0', '35.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1284, 'PANERA PARA MAMA', '2118', 'PANERA', 22, 0, 0, '25.0', '50.0', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1285, 'MOCHILA NIKE MOD-2', '7793', 'NIKE-2', 25, 2, 0, '120.0', '220.0', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 240, 0, 0, 0, 0, ''),
(1286, 'MOCHILA NIKE MOD-3', '7794', 'NIKE-3', 25, 2, 0, '120.0', '199.0', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 240, 0, 0, 0, 0, ''),
(1287, 'MINIATURA GLOBO AEROESTATICO', '7011', 'AERO', 27, 0, 0, '43.0', '115.0', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1288, 'MINIATURA OSO CANASTA MINI', '7111', 'CANASTA', 27, 0, 0, '44.0', '75.0', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1289, 'CAJA CAMICERA GRANE', '8890', 'C-CAMICERA', 1, 3, 0, '40.0', '118.0', 26, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1290, 'PELUCHE OSO CORAZON TE AMO GRANDE', '7500107574136', 'EX-CORA', 20, 0, 0, '259.0', '450.0', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1291, 'PELUCHE UNICORNIO PLATZY GRANDE', '7500236643833', 'PLATZY-GDE', 20, 0, 0, '169.0', '385.0', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1292, 'PELUCHE UNICORNIO PLATZY MEDIANO', '75002366438', 'PLAT-M', 20, 0, 0, '129.0', '240.0', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1293, 'PELUCHE OSO ROSEDAL CHICO', '7500216170168', 'ROSE', 20, 0, 0, '89.0', '218.0', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1294, 'PELUCHE OSO CHOCORROLO GDE', '7500194853633', 'CHOCORRL', 20, 0, 0, '106.0', '260.0', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1295, 'PELUCHE  GATO CHOMPY C/ SONIDO GDE', '7500202106027', 'GATO-SHOM', 20, 0, 0, '139.0', '350.0', 27, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1296, 'PELUCHE DINO BEBE', '7710', 'P-D-BB', 20, 0, 0, '100.0', '198.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1297, 'PELUCHE DINO REX CHICO', '6987005101014', 'P-REX', 20, 0, 0, '75.0', '150.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1298, 'PELUCHE UNICORNIO BEBE', '10104', 'UNI-BB', 20, 0, 0, '78.0', '199.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1299, 'PELUCHE UNICORNIO BB LENTEJUELAS', '1944', 'UNI-M1', 20, 2, 0, '68.0', '185.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 136, 0, 0, 0, 0, ''),
(1300, 'PELUCHE CERDITO OVEROL CHICO', '1144', 'CER-CH', 20, 0, 0, '68.0', '190.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1301, 'PELUCHE CERDITO OVEROL MEDIANO', '1115', 'CER-M', 20, 0, 0, '68.0', '210.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1302, 'PELUCHE ELEFANTE BB OVEROL', '1016', 'ELE-OVERL', 20, 0, 0, '68.0', '190.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1303, 'PELUCHE PERRO BB SUAVE', '1017', 'PERR-BB', 20, 0, 0, '68.0', '199.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1304, 'PELUCHE GATITA BB', '1943', 'GAT-BB', 20, 0, 0, '68.0', '190.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1305, 'PELUCHE TIGRITTO BB', '2080', 'TIGRI-BB', 20, 2, 0, '68.0', '190.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 136, 0, 0, 0, 0, ''),
(1306, 'PELUCHE OSOS ESCANDALOSOS', '1958', 'ESCANDALOSO', 20, 1, 0, '93.0', '250.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 93, 0, 0, 0, 0, ''),
(1307, 'PELUCHE ELEFANTE BB', '10214', 'ELEF-BB', 20, 0, 0, '68.0', '199.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1308, 'PELUCHE PANDA BB', '10059', 'PANDA-BB', 20, 0, 0, '68.0', '195.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1309, 'PELUCHE PERRO BOLA GANDE', '2096', 'BOLA', 20, 0, 0, '108.0', '300.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1310, 'PELUCHE ELEFANTE CORY GRANDE', '2087', 'P-CORY', 20, 0, 0, '108.0', '300.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1311, 'PELUCHE PERRO HUSKY SOFT GRANDE', '2138', 'HUSKY', 20, 0, 0, '108.0', '300.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1312, 'PELUCHE MARSMELLO DJ GRANDE', '2016', 'P-DJ', 20, 1, 0, '150.0', '400.0', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, 0, ''),
(1313, 'PELUCHE GATO TERNURA GRANDE', '3202', 'TERNURA-G', 20, 1, 0, '175.0', '380.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 175, 0, 0, 0, 0, ''),
(1314, 'PELUCHE RATON CLEVER MEDIANO', '193301', 'CLEVER', 20, 0, 0, '75.0', '218.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1315, 'PELUCHE OSA PRICESA C/ CORONA CHICA', '1922', 'PRINCE', 20, 0, 0, '75.0', '219.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1316, 'PELUCHES SERIE ESCANDALOSOS CHICO', '1957', 'SCANDALO', 20, 0, 0, '60.0', '180.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1317, 'PELUCHE UNICORNIO RISUEÑO CHICO', '192311', 'RISUEÑO', 20, 0, 0, '68.0', '190.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1318, 'PELUCHE TIERNO UNICORNIO BEBE', '1903', 'UNICORNIO-BB', 20, 0, 0, '90.0', '230.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1319, 'PELUCHE UNICORNIO FLORES GRANDE', '1940', 'P-FLORES', 20, 2, 0, '265.0', '570.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 530, 0, 0, 0, 0, ''),
(1320, 'PELUCHE PANDA BEBE', '1923', 'BB-PANDA', 20, 0, 0, '100.0', '250.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1321, 'PELUCHE ANGELA MEDIANA', '1617', 'ANGELA-M', 20, 0, 0, '110.0', '270.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1322, 'PELUCHE RATONES TOTO GRANDES', '4829', 'TOTO-G', 20, 1, 0, '220.0', '499.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, 0, ''),
(1323, 'PELUCHE MONOS MANOS LARGAS ', '6019', 'MANOS-L', 20, 4, 0, '290.0', '700.0', 24, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 1160, 0, 0, 0, 0, ''),
(1324, 'PELUCHE ELEFANTE PRINCESA C/ CORONA', '2616', 'ELEF-CORONA', 20, 0, 0, '135.0', '280.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1325, 'PELUCHE RATON PIJAMA CHICO', '0504', 'RATON-CH', 20, 1, 0, '125.0', '250.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, 0, ''),
(1326, 'PELUCHE RATONA C/ MOÑO CHICA', '1910', 'RATONA-M', 20, 0, 0, '68.0', '199.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1327, 'COJIN C/ LENTEJUELA CUADRADO', '1715', 'C-LENTEJ', 20, 3, 0, '120.0', '200.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, 0, ''),
(1328, 'PELUCHE UNICORNIO BOLITA GRANDE', '3602', 'BOLITA -G', 20, 3, 0, '250.0', '499.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 750, 0, 0, 0, 0, ''),
(1329, 'PELUCHE UNICORNIO BOLITA MEDIANO', '2801', 'BOLITA-M', 20, 1, 0, '155.0', '360.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 155, 0, 0, 0, 0, ''),
(1330, 'PELUCHE UNICORNIO BOLITA CHICO', '2006', 'BOLITA-CH', 20, 0, 0, '80.0', '190.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1331, 'PELUCHE UNICORNIO C/ TRENSA  CHICO', '1932', 'TRENSA-CH ', 20, 0, 0, '68.0', '185.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1332, 'PELUCHE UNICORNIO CHIKY CHICO', '1916', 'CHICO-CH', 20, 0, 0, '125.0', '239.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1333, 'PELUCHE UNICORNIO CHIKY MEDIANO ', '1917', 'CHIKY-M', 20, 0, 0, '180.0', '380.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1334, 'PELUCHE UNICORNIO RISUEÑO MAGICO GRANDE', '3820', 'RISUEÑO-G', 20, 2, 0, '265.0', '650.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 530, 0, 0, 0, 0, ''),
(1335, 'PELUCHE OSO SANTY ESPECIAL MEDIANO', '3010', 'SANTY', 20, 1, 0, '110.0', '300.0', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, 0, ''),
(1336, 'PELUCHE PUERQUITO C/ BATA CHICO ', '5105', 'PUERQT-CH', 20, 0, 0, '145.0', '399.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1337, 'PELUCHE PUERQUITA C/ BATA MEDIANA', '5106', 'BATA-M', 20, 0, 0, '230.0', '650.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1338, 'PELUCHE PUERQUITA C/ BATA GRANDE', '4119', 'BATA-G', 20, 0, 0, '235.0', '700.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1339, 'PELUCHE OSITOS OFITOS MEDIANO', '2702', 'OFITOS', 20, 1, 0, '120.0', '280.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1340, 'COJIN SUPER PANDA Y GATO ', '4191', 'PANDA', 20, 9, 0, '140.0', '370.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 1260, 0, 0, 0, 0, ''),
(1341, 'LLAVERO GARZA ARCOIRIS', '1901', 'LLA-ARCO', 23, 2, 0, '50.0', '145.0', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(1342, 'COLLARES FASION MANZANA', '2119', 'MANZANA', 23, 6, 0, '150.0', '199.0', 27, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 900, 0, 0, 0, 0, ''),
(1343, 'ARREGLO GLOBO AEROSTOTICO', '2120', 'AEROSTATICO', 22, 0, 0, '100.0', '150.0', 29, '2020-08-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1344, 'PULCERA CHIC GLAMUR PIEDRA', '2122', 'PIE', 23, 17, 0, '40.0', '89.0', 29, '2020-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 680, 0, 0, 0, 0, ''),
(1345, 'PULCERA CHIC GLAMUR NIÑA', '2123', 'GLAMR', 23, 0, 0, '20.0', '40.0', 29, '2020-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1346, 'PELUCHITOS LETREROS DE AMOR', '2121', 'LETRER', 27, 9, 0, '40.0', '179.0', 26, '2020-09-08 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, 0, ''),
(1347, 'PULCERA EN CAJA DAMA', '7411', 'P.OFERTA', 23, 1, 0, '35.0', '100.0', 27, '2020-12-04 00:00:00', '', 0, 0, NULL, NULL, 0, 35, 0, 0, 0, 0, ''),
(1348, 'CARGA DE ELIO 30 CM LATEX ', '70', 'LATEX-30', 30, 20, 0, '10.0', '25.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(1349, 'CARGA DE ELIO 44 CM', '71', 'C-44', 30, 14, 0, '15.0', '30.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 210, 0, 0, 0, 0, ''),
(1350, 'CARGA DE ELIO 50 CM', '72', 'C-50', 30, 22, 0, '15.0', '40.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 330, 0, 0, 0, 0, ''),
(1351, 'CARGA DE ELIO 76 CM', '73', 'C-76', 30, 26, 0, '20.0', '50.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 520, 0, 0, 0, 0, ''),
(1352, 'CARGA DE ELIO 80 CM', '74', 'C-80', 30, 27, 0, '25.0', '70.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 675, 0, 0, 0, 0, ''),
(1353, 'CARGA DE ELIO 90 CM', '75', 'C-90', 30, 24, 0, '25.0', '80.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, 0, ''),
(1354, 'CARGA DE ELIO 100 CM', '76', 'C-100', 30, 28, 0, '30.0', '150.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 840, 0, 0, 0, 0, ''),
(1355, 'CARGA DE ELIO LATEX JUMBO', '77', 'LATEX-J', 30, 30, 0, '50.0', '250.0', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1500, 0, 0, 0, 0, ''),
(1356, 'CARGA DE ELIO LATEX EX JUMBO', '78', 'LATEX -EX', 30, 30, 0, '60.0', '300.0', 26, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1800, 0, 0, 0, 0, ''),
(1357, 'PELUCHE MI PEQUEÑO DRAGON', '4411', 'DRAGON', 20, 1, 0, '95.0', '195.0', 24, '2020-12-24 00:00:00', '', 0, 0, NULL, NULL, 0, 95, 0, 0, 0, 0, ''),
(1358, 'PELUCHE PULPITO REVERSIBLE GRANDE', '1731', 'PUL-GRANDE', 20, 0, 0, '130.0', '260.0', 26, '2021-01-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1359, 'PELUCHE PULPITO REVERSIBLE MEDIANO', '1730', 'PULP-MED', 20, 0, 0, '110.0', '210.0', 26, '2021-01-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1360, 'PELUCHE AMONGO MEDIANO', '1147', 'AMONG-M', 20, 0, 0, '88.0', '200.0', 26, '2021-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1361, 'PELUCHE BABY YODA MEDIANO', '1141', 'YODA', 20, 3, 0, '150.0', '300.0', 26, '2021-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, 0, ''),
(1362, 'PELUCHE  BEBE YODA ', '1816', 'YODA-BB', 20, 1, 0, '200.0', '400.0', 26, '2021-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, 0, ''),
(1363, 'PELUCHE OSO PATCHOS CHICO', '0123', 'PATCHO', 20, 2, 0, '119.0', '240.0', 24, '2021-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 238, 0, 0, 0, 0, ''),
(1364, 'PELUCHE OSO AMIGUITO CHICO', '3020', 'AMIGUIT', 20, 2, 0, '99.0', '218.0', 24, '2021-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 198, 0, 0, 0, 0, ''),
(1365, 'PELUCHE OSO ESPONJOSITO GRANDE', '3175', 'ESPONJO', 20, 2, 0, '99.0', '278.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 198, 0, 0, 0, 0, ''),
(1366, 'PELUCHE PERRO ARRUGOCHOKO GRANDE', '1106', 'ARRUGO', 20, 2, 0, '139.0', '318.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 278, 0, 0, 0, 0, ''),
(1367, 'PELUCHE BOLIBOY MED', '1613', 'BOLI', 20, 4, 0, '89.0', '199.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 356, 0, 0, 0, 0, ''),
(1368, 'PELUCHE OSO NUTELY MED', '4231', 'NUTEL', 20, 1, 0, '99.0', '218.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 99, 0, 0, 0, 0, ''),
(1369, 'PELUCHE CHOCOLETO MED', '0021', 'CHOCOLET', 20, 2, 0, '74.0', '180.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 148, 0, 0, 0, 0, ''),
(1370, 'PELUCHE OSO PASTELOSITOS GDE', '9325', 'PASTELOSIT', 20, 2, 0, '119.0', '260.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 238, 0, 0, 0, 0, ''),
(1371, 'PELUCHE PERRO BAGUETTE GDE', '1839', 'BAGUET', 20, 1, 0, '119.0', '270.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 119, 0, 0, 0, 0, ''),
(1372, 'PELUCHE PERRO FELICIANO GRANDE C/ SONIDO', '1134', 'FELICIANO', 20, 1, 0, '129.0', '360.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, 0, ''),
(1373, 'PELUCHE OSO BEIGE PACHOFLO GDE', '0182', 'PACHOFLO', 20, 0, 0, '109.0', '260.0', 24, '2021-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1374, 'BOLSA EX JUMBO COLOR', '1618', 'COLOR-EXJ', 1, 16, 0, '35.0', '93.0', 26, '2021-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 560, 0, 0, 0, 0, ''),
(1375, 'BOLSA JUMBO COLORS', '1614', 'COLORS-J', 1, 18, 0, '35.0', '80.0', 26, '2021-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 630, 0, 0, 0, 0, ''),
(1376, 'MINI DONITAS', '1811', 'MINI-D', 22, 0, 0, '10.0', '25.0', 29, '2021-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1377, 'CAJA BOMBONERA ', '1875', 'BOM', 22, 0, 0, '30.0', '118.0', 29, '2021-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1378, 'PELUCHE TIGGER DETALLES D', '7501917248248', 'P.TIGG.DETALL.D', 20, 0, 0, '109.0', '291.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1379, 'PELUCHE EEYORE CLASICO D', '7506223706109', 'P.EEYOR.CLASIC.D', 20, 0, 0, '109.0', '300.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1380, 'PELUCHE EEYORE AVIADOR D ', '7506223749694', 'P.EEYOR.AVIADOR.D', 20, 0, 0, '169.0', '300.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1381, 'PELUCHE POOH CLASICO D1', '7506223706062', 'P.CLASICO.D1', 20, 0, 0, '109.0', '280.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1382, 'PELUCHE POOH SUPER DETECTIVE E ', '7501917248729', 'P.SUPER.DETEC', 20, 0, 0, '300.0', '599.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1383, 'PELUCHE MICKEY HIGH SCHOOL MUSICAL D', '7501917237730', 'P.MICKEY.HSM', 20, 0, 0, '109.0', '250.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1384, 'PELUCHE TIGGER C/ IMPERMEABLE D', '7501917214298', 'P.IMPERM.D', 20, 0, 0, '109.0', '229.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1385, 'PELUCHE DAFFY JARDINERO E', '7501917221036', 'P.JARDINERO.E', 20, 0, 0, '200.0', '370.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1386, 'PELUCHE RITO C/ IMPERMEABLE D', '7501917215646', 'P.RITO.D', 20, 0, 0, '109.0', '281.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1387, 'PELUCHE TIGGER TEXTURAS D', '75018', 'P.TEXTURAS.D', 20, 0, 0, '109.0', '300.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1388, 'PELUCHE TIGGER FLOPPY D', '7501917227038', 'P.FLOPPY.D', 20, 0, 0, '109.0', '200.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1389, 'PELUCHE TIGGER FENSI C', '7501917240556', 'P.FENSI.C', 20, 0, 0, '82.0', '160.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1390, 'PELUCHE EEYORE DETALLES D', '7501917248279', 'P.EEYOR.DET.D', 20, 0, 0, '109.0', '250.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1391, 'PELUCHE PIGLET CLASICO D', '7501917213130', 'P.PIGLET.CLAS.D', 20, 0, 0, '109.0', '200.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1392, 'PELUCHE MICKEY MAMELUCO', '7506223786286', 'P.MAMELUCO', 20, 0, 0, '82.0', '160.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1393, 'PELUCHE PIOLIN BEISBOLISTA D', '7501917228288', 'P.PIOLIN.BEIS.D', 20, 0, 0, '109.0', '270.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1394, 'PELUCHE BALOO CLASICO D', '7501917270072', 'P.BALOO.D', 20, 0, 0, '109.0', '250.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1395, 'PELUCHE TIGGER CLASICO MED', '7506223706123', 'P.TIGGER.MED', 20, 0, 0, '90.0', '199.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1396, 'PELUCHE GOOFY DESFILE D', '7501917259282', 'P.GOOFY.DESF.D', 20, 0, 0, '109.0', '200.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1397, 'PELUCHE DAFFY PANA C', '7501917230335', 'P.DAFFY.C', 20, 0, 0, '82.0', '164.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1398, 'PELUCHE EEYORE DORMILON D', '7501917235095', 'P.DORMILON.D', 20, 0, 0, '109.0', '200.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1399, 'PELUCHE OSO BRANDONN GRANDE IMPORTACION', '00605', 'P-BRANN', 20, 0, 0, '892.0', '1700.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1400, 'PELUCHE BORLITAS GRANDE ', '00589', 'P.BORLITAS', 20, 0, 0, '150.0', '391.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1401, 'PAPEL DE REGALO  ( EXCEDENTE )', '00602', 'EXCED', 1, 4, 0, '1.0', '8.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 4, 0, 0, 0, 0, ''),
(1402, 'TARJETA FIZZY MOON SPECIAL', '7502209338142', 'T.FIZZY.ESPECIAL', 21, 0, 0, '35.0', '49.0', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1403, 'TARJETA FUZZY FIZZY ESPECIAL', '8159', 'T.FUZZY', 21, 2, 0, '35.0', '40.0', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, 0, ''),
(1404, 'TARJETA FIZZY MOON AMOR', '00591', 'T.MOON', 21, 0, 0, '18.0', '36.0', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1405, 'TARJETA DIPLOMA ', '7502209335226', 'T.DIPLOMA', 21, 0, 0, '20.0', '58.0', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1406, 'TARJETA FUNNY CARD EXPLOWORLD', '7502209333086', 'T.FUNNY', 21, 0, 0, '24.0', '49.0', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1407, 'PELUCHE SHARPEI GRANDE', '4021', 'SHARPEI', 20, 1, 0, '600.0', '1700.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, 0, ''),
(1408, 'COJINNETE TUBI LOI EXPLOWORLD GRANDE', '00496', 'C.TUBI', 20, 0, 0, '100.0', '199.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1409, 'COJINNETE THE PELOX FAMILY', '7501111218221', 'C.FAMILY', 20, 0, 0, '90.0', '199.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1410, 'COJINNETE TORTILLITA EX LARGO ', '00547', 'C.TORTILLITA', 20, 0, 0, '80.0', '200.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1411, 'PORTA RETRATO KIUT 1', '00700', 'P.R.KIUT', 29, 0, 0, '145.0', '290.0', 25, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1412, 'RECADITO KIUT ', '00703', 'R.KIUT', 29, 0, 0, '45.0', '100.0', 25, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1413, 'PELUCHE MINIUM CHICO', '00573', 'MINIU-C', 20, 0, 0, '28.0', '130.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1414, 'PANTUMFLAS ONIX', '00018', 'P.ONIX', 22, 0, 0, '250.0', '298.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1415, 'COJIN CILINDRO PLANETART CHICO ', '00584', 'C.PLANETR.CH', 20, 0, 0, '80.0', '160.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1416, 'COJIN RECTANGULAR PLANETART', '00588', 'C.RECT.PLANET', 20, 0, 0, '85.0', '190.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1417, 'COJIN EX LARGO POLIESFERA ', '00801', 'C.EX.POLIESF', 20, 0, 0, '100.0', '250.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1418, 'COJIN CUADRADO PLANETART', '00586', 'C.CUADRAD.PLANET', 20, 0, 0, '110.0', '230.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1419, 'COJIN HUESO JIRZ', '00722', 'HUESO-J', 20, 0, 0, '139.0', '300.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1420, 'COJIN CUADRADO COMICS GRANDE', '00571', 'C.COMICS', 20, 0, 0, '190.0', '380.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1421, 'COJIN CILINDRO  CALAVERA ROSA ', '00522', 'C.CALAVERA', 20, 0, 0, '90.0', '115.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1422, 'COJIN CUELLERA PEPA POLIESFERA', '00549', 'C.CUELLERA .', 20, 0, 0, '75.0', '199.0', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1423, 'COJIN RECTANGULAR 2 PLANETART', '00587', 'C.RECT2.PLANET', 20, 0, 0, '100.0', '230.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1424, 'COJIN ESTRELLA GRANDE ', '00459', 'C.ESTRELLA.G ', 20, 0, 0, '60.0', '140.0', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1425, 'GORRA AERO ENGINE CABALLERO (DIFERENTES MODELOS)', '00087', 'G.AERO.ENG', 23, 9, 0, '40.0', '180.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, 0, ''),
(1426, 'GORRA POLO ', '00182', 'G.P/CABALLERO', 23, 4, 0, '65.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 260, 0, 0, 0, 0, ''),
(1427, 'PERFUME SET DE PARIS HILTON CABALLERO ', '608940541845', 'P.PARIS.H', 24, 0, 0, '400.0', '700.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1428, 'PERFUME JUST SEXY 90210 CABALLERO ', '827669002554', 'P.JUST.SEX', 24, 0, 0, '100.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1429, 'PERFUME FEEL SEXY 90210 CABALLERO ', '827669002561', 'P.FEEL.SEX', 24, 0, 0, '100.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1430, 'PERFUME PERRY MAN CABALLERO ', '844061000728', 'P.PERRI.MAN', 24, 0, 0, '250.0', '600.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1431, 'PERFUME LACOSTE BOOSTER CABALLERO ', '3355800001793', 'P.BOOSTER', 24, 0, 0, '350.0', '700.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1432, 'RELOJ CABALLERO ( CK)', '00473', 'CK', 23, 0, 0, '95.0', '300.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1433, 'RELOJ DAMA TUBULAR', '00511', 'RELOJ-C', 23, 0, 0, '140.0', '350.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1434, 'RELOR CASIO.3 CABALLERO ', '00512', 'R.CASIO.3', 23, 0, 0, '100.0', '299.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1435, 'ANILLO ACERO INOXIDABLE CABALLERO ', '00254', 'A.AC.INOX', 23, 1, 0, '10.0', '57.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 10, 0, 0, 0, 0, ''),
(1436, 'CARRO DE COLECCION ', '00058', 'COLECCION', 23, 0, 0, '170.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1437, 'PULCERA DE ASERO INOXIDABLE CABALLERO ', '00255', 'P.ACE.INOX', 23, 0, 0, '25.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1438, 'DIJE DE ACERO INOXIDABLE C/ COLLAR', '00054', 'D.ACERO.INOX', 23, 0, 0, '25.0', '57.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1439, 'MOTOSICLETA DE COLECION ', '00071', 'M.COLECCION', 23, 0, 0, '70.0', '150.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1440, 'CINTURON DE CABALLERO (TELA )', '00079', 'C.TELA', 23, 0, 0, '40.0', '50.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1441, 'RELOJ DE CABALLERO SPORT', '00531', 'R.SPORT', 23, 3, 0, '100.0', '350.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, 0, ''),
(1442, 'BOLSO CILINDRO TOUCHS', '00184', 'B-CILIN', 23, 0, 0, '80.0', '190.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1443, 'CARTERA ECKO CABALLERO ', '012', 'ECKO', 23, 8, 0, '70.0', '170.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 560, 0, 0, 0, 0, ''),
(1444, 'LENTE P/ CABALLERO OXIGEN ', '00427', 'L.OXIGEN', 23, 0, 0, '30.0', '87.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1445, 'LENTE P/ DAMA', '00073', 'L.P/CABALL', 23, 0, 0, '25.0', '50.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1446, 'LLAVEROS DIFERENTE MODELO', '00525', 'LL-TORRE', 23, 1, 0, '45.0', '120.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(1447, 'PERFUME MEDITERRANEAN DAMA ', '085805063665', 'P.MEDITERRANE', 24, 0, 0, '300.0', '600.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1448, 'PERFUME PERRY WOMAN DAMA ', '844061000704', 'P.PEERY.W', 24, 0, 0, '270.0', '600.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1449, 'PERFUME 5TH AVENIDA AFTER FIVE DAMA', '085805043476', 'P.5TH.AVE', 24, 0, 0, '270.0', '600.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1450, 'PERFUME  TOUS H2O DAMA', '8436038833266', 'P.TOUS.H2O', 24, 0, 0, '500.0', '1000.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1451, 'PERFUME IGNITION WOMEN DAMA', '037361006334', 'P.IGNITION', 24, 0, 0, '200.0', '499.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1452, 'PERFUME IN WHITE J.DEL POZO DAMA ', '8431754392011', 'P.IN WHITE', 24, 0, 0, '300.0', '700.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1453, 'PERFUME SET LETS PLAY PINK DAMA ', '6936711890583', 'P.SET.LETS', 24, 0, 0, '200.0', '500.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1454, 'PERFUME SET 360 RED PERRY ELLIS DAMA ', '844061000063', 'P.SET.360.D', 24, 0, 0, '350.0', '750.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1455, 'PERFUME SET 360 RED PERRY ELLIS CABALLERO ', '844061002197', 'P.SET.360.C', 24, 0, 0, '300.0', '670.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1456, 'MINIATURA VIRGEN', '00519', 'M-VIRGEN', 27, 0, 0, '59.0', '120.0', 26, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1457, 'CARTERA MK DAMA EKOO', '00278', 'EKOO', 23, 1, 0, '45.0', '200.0', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, 0, ''),
(1458, 'MOCHILA RUSS PRIMARIA', '00111', 'M.PRIMA', 25, 1, 0, '269.0', '400.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 269, 0, 0, 0, 0, ''),
(1459, 'LAPICERAS RUSS DIFERENTES MODELOS', '00141', 'LAPI', 25, 0, 0, '76.0', '150.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1460, 'MOCHILA CHENSON SNOOPY PROMOCION DE 280 A 199', '7509048139909', 'M.SNOOPY', 25, 0, 0, '120.0', '199.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1461, 'TARJETA FUZZY ESPECIAL', '7502209338180', 'T.FUZZ.ESP', 21, 0, 0, '35.0', '49.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1462, 'MOCHILA HANNAH MONT C/DESCUENTO $199 A $100', '875598371456', 'M.HANNAH', 25, 0, 0, '100.0', '100.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1463, 'MOCHILA RUSS KINDER', '00109', 'M.KIND', 25, 0, 0, '220.0', '380.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1464, 'MOCHILA GUSANITO', '00486', 'M.GUS', 25, 0, 0, '150.0', '351.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1465, 'MOCHILA TINKER BEEL', '7506179337532', 'M.TINK', 25, 0, 0, '150.0', '300.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1466, 'MOCHILA CAMP ROK DE 300 A 150', '7506179337051', 'M.ROK', 25, 0, 0, '150.0', '150.0', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1467, 'PELUCHE OSO PANDA SUPER', '00108', 'P.SUPER', 20, 0, 0, '1000.0', '2000.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1468, 'PELUCHE  OSO LOVE GRANDE ', '00354', 'P-LOVE', 20, 0, 0, '270.0', '700.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1469, 'PELUCHE CHANGO MONY MONKY MED', '2011091629023', 'P.MONY', 20, 0, 0, '80.0', '199.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1470, 'PELUCHE OSO PEKAS GRANDE', '00600', 'P-PEKAS', 20, 0, 0, '240.0', '600.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1471, 'JUGUETE CARROS DE BOMBERO', '00336', 'J-BOMBER', 26, 0, 0, '100.0', '200.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1472, 'PELUCHE TIGRE REMOLINOS ROSA', '091671728560', 'P.REMOLINOS', 20, 0, 0, '109.0', '251.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1473, 'PELUCHE HIPPOPOTAMO PASTIZZETA', '2009081556244', 'P.PASTIZZET', 20, 0, 0, '109.0', '311.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1474, 'PELUCHE OSITA GREENTY GDE', '2011051540153', 'P.GREENTY', 20, 0, 0, '109.0', '299.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1475, 'COJINNETE LOONEY TUNES ', '7502209334083', 'C.LOONEY', 20, 0, 0, '100.0', '150.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1476, 'PELUCHE TRISTESA DE INTENSAMENTE', '00574', 'TRISTESA', 20, 0, 0, '80.0', '250.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1477, 'COJIN SEÑALES COMICS', '00577', 'C.SEÑALES', 20, 0, 0, '80.0', '165.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1478, 'COJIN COMICS CUADRADO MEZCLILLA', '00572', 'C-COMIC', 20, 0, 0, '149.0', '350.0', 28, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1479, 'COJIN PIZZARRON COMICS', '00575', 'C.PIZZA', 20, 0, 0, '70.0', '150.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1480, 'COJIN TRAPOS', '00592', 'TRAPOS', 20, 1, 0, '120.0', '270.0', 28, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, 0, ''),
(1481, 'MINIATURA PERGAMINO MADERA ', '00106', 'M-MADERA', 27, 0, 0, '40.0', '89.0', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1482, 'PELUCHES OSA DORMILONA SUPER', '00607', 'DORMILONA', 20, 0, 0, '400.0', '1000.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1483, 'PELUCHE CATARINA KATHY GDE', '90946', 'P.CATARINA', 20, 0, 0, '109.0', '270.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1484, 'PELUCHE BABY TOY STORY PAK 3', '60913', 'P.BABY', 20, 0, 0, '200.0', '499.0', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1485, 'JUGUETE PIANO DE ANIMALES ( PROMOCION )', '00139', 'PIANOO', 26, 0, 0, '20.0', '50.0', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1486, 'PORTA RETRATO HAPPY HOUSE ', '00415', 'P.HAPPY', 28, 0, 0, '40.0', '100.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1487, 'PORTA RETRATO HAPPY HOUSE DODLE FOTO', '00414', 'P.HAPPY-DOBLE', 28, 0, 0, '70.0', '151.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1488, 'BOLSA SAN VALENTIN GRANDE', '00406', 'SAN-G', 1, 0, 0, '9.0', '27.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1489, 'CUADRO OSITOS 1', '00212', 'C.OSITOS-1', 22, 0, 0, '30.0', '75.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1490, 'RELOJ DE CASITA C/ PENDULO', '00050', 'PENDULO', 22, 0, 0, '53.0', '140.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1491, 'GLOBO CHICO TODA OCACION', '01', 'GLOBO.1', 30, 57, 0, '10.0', '25.0', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 570, 0, 0, 0, 0, ''),
(1492, 'PORTA RETRATO KIUT 2', '00701', 'P.KIUT-2', 29, 0, 0, '110.0', '200.0', 25, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1493, 'TAZA PROFESIONISTAS', '00702', 'TAZA-PROF', 27, 3, 0, '69.0', '185.0', 26, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 207, 0, 0, 0, 0, ''),
(1494, 'ACRILICOS KIUT', '00704', 'A.KIUT', 29, 0, 0, '70.0', '140.0', 25, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1495, 'BOLSA CHICA GRABA IMAGEN', '00300', 'B.CH.GRABA', 1, 38, 0, '10.0', '21.0', 21, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, 0, ''),
(1496, 'CRUZ MI ANGELITO DE KIUT', '00705', 'C.KIUT', 29, 0, 0, '125.0', '200.0', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1497, 'KORCHO KIUT', '00706', 'KORCHO', 29, 0, 0, '130.0', '270.0', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1498, 'PORTA RETRATO KIUT 4', '00707', 'P.KIUT-4', 29, 0, 0, '145.0', '300.0', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1499, 'PORTA RETRATO KIUT 5', '00708', 'P.KIUT-5', 29, 0, 0, '75.0', '160.0', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1500, 'RELOJ FLEXIBLE DAMA 2', '00500', 'FLEX2', 23, 0, 0, '100.0', '100.0', 27, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1501, 'CAJA ENVUELTAS CHICA ', '470', 'C-CH', 1, 0, 0, '10.0', '26.0', 26, '2012-08-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1502, 'MOCHILA DE RUEDAS NIÑA', '00501', 'M.RUEDAS.Ñ', 25, 0, 0, '150.0', '380.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1503, 'MOCHILA RUEDAS KINDER DE 290 A 200', '00503', 'M.RUEDAS.KINR', 25, 0, 0, '150.0', '200.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1504, 'MOCHILA LOI WOOPS 2', '00504', 'M.LOIWOOPS-2', 25, 0, 0, '120.0', '300.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1505, 'MOCHILA MONSTER TEAM ', '00502', 'M.MONSTER', 25, 0, 0, '110.0', '220.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1506, 'MOCHILA MIKO CLUB 2 C/DESCUENTO $270 A $199', '00505', 'M-MIKO-2', 25, 0, 0, '140.0', '199.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1507, 'MOCHILA MIKO CLUB 3 C/DESCUENTO $280 A $ 200', '00506', 'M.MIKO-3', 25, 0, 0, '140.0', '200.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1508, 'MOCHILA GARFIEL DE 280 A 250', '00507', 'M.GARF', 25, 0, 0, '110.0', '250.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1509, 'MOCHILA GARFIEL PORTAF ', '00508', 'M.GARFF.XT.FOLIO', 25, 1, 0, '100.0', '250.0', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(1510, 'LAPICERA CHENSON DOBLE Y TRIPLE ', '00509', 'LAP-CHENSON', 25, 0, 0, '79.0', '150.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1511, 'LAPICERA BORLITA ', '00510', 'LAP-BORLITA', 25, 0, 0, '50.0', '120.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1512, 'LAPICERA BORLITA DOBLE CIERRE ', '00513', 'LAP-DOBLE', 25, 0, 0, '75.0', '160.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1513, 'LAPICERA BETTY BOO Y PUCA', '00514', 'BETY-PUCA', 25, 0, 0, '30.0', '79.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1514, 'MARIQUERA TOMY ', '00515', 'M-TOMY', 23, 4, 0, '80.0', '210.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 320, 0, 0, 0, 0, ''),
(1515, 'MOCHILA HELLO KITTY KINDER', '7500247085592', 'M-KITTY', 25, 0, 0, '190.0', '319.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1516, 'MOCHILA BOLSO MONSTER', '7500351029857', 'M-MONSTER', 25, 0, 0, '168.0', '336.0', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1517, 'PEINETA C/ PIEDRERIA ', '00709', 'PEINET', 23, 7, 0, '20.0', '75.0', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, 0, ''),
(1518, 'CARTERA PARIS DAMA', '00710', 'C-PARIS', 23, 0, 0, '55.0', '180.0', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1519, 'CARTERA JAKEUDRIN DAMA', '00711', 'CHAROOL', 23, 0, 0, '160.0', '350.0', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1520, 'PELUCHE MASCOTAS EN CAJA', '7509025300032', 'P.MASCOTAS', 20, 0, 0, '100.0', '230.0', 24, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1521, 'PELUCHE OSO MORTON GRANDE ', '2011091108153', 'P.MORTON', 20, 0, 0, '91.0', '250.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1522, 'PELUCHE OSO TOLYN GRANDE ', '2011102420182', 'P.TOLYN', 20, 0, 0, '107.0', '267.0', 27, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1523, 'PELUCHE OSA NILY MEDIANA ', '2011198619866', 'P.NILY', 20, 0, 0, '82.0', '199.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1524, 'PELUCHE PERRA CEREBRITO MEDIANA', '2010123280027', 'P.CEREBRITO', 20, 0, 0, '66.0', '150.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1525, 'PELUCHE CHANGUITO COCOMONGO GRANDE ', '2009123453005', 'P.COCOMONGO-G', 20, 0, 0, '100.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1526, 'PELUCHE OSO CHISPY GRANDE ', '2011091311577', 'P.CHISPY-G', 20, 0, 0, '82.0', '200.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1527, 'PELUCHE OSO CARIÑOSO GRANDE ', '2011900590308', 'P.CARIÑOSO-G', 20, 0, 0, '91.0', '230.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1528, 'PELUCHE PERRITA CHATYS GRANDE ', '2011174217352', 'P.CHATYS-G', 20, 0, 0, '107.0', '260.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1529, 'PELUCHE OSO CLIKY GRANDE ', '2011051527055', 'P.CLIKY-G', 20, 0, 0, '107.0', '280.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1530, 'PELUCHE BORREGA LANNY MEDIANA ', '010020', 'P.LANNY-M', 20, 0, 0, '82.0', '200.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1531, 'PELUCHE BORREGO MIDAS GRANDE ', '2009092112606', 'P.MIDAS-G', 20, 0, 0, '85.0', '200.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1532, 'PELUCHE PERRITO CON BUFANDA CHICO', '833004010634', 'P.BUFANDA-CH', 20, 0, 0, '32.0', '81.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1533, 'PELUCHE OSITO PELUDITO CHICO', '833004000185', 'P.PELUDITO-CH', 20, 0, 0, '21.0', '70.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1534, 'PELUCHE PERRO CANELO CHICO', '851785054012', 'P.CANELO-CH', 20, 0, 0, '53.0', '140.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1535, 'PELUCHE OSO GRANDON HUELLAS SUPER', '00712', 'P-LIZ-M', 20, 0, 0, '900.0', '1500.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1536, 'PELUCHE OSO CON COBIJA MUSICAL GRANDE', '606982081930', 'P.COBIJ-G', 20, 0, 0, '116.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1537, 'PELUCHE OSA RONQUIDOS GRANDE', '606982047028', 'P.RONQUIDOS-G', 20, 0, 0, '107.0', '280.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1538, 'PELUCHE PERRO ANGEL CON MOVIMIENTO GRANDE', '606982061703', 'P.ANGEL-G', 20, 0, 0, '132.0', '350.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1539, 'PELUCHE OSO BUFANDA MEDIANO', '800010700354', 'P.BUFANDA-M', 20, 0, 0, '57.0', '140.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1540, 'PELUCHE PERRO CACHECOLOR GRANDE ', '7509008268083', 'P.CACHE-G', 20, 0, 0, '66.0', '180.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1541, 'PELUCHE POOH DETALLES D', '7501917248217', 'P.DETALLES.D', 20, 0, 0, '109.0', '299.0', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1542, 'PELUCHE JIRAFA MERENGUE GRANDE', '7509008268335', 'P.MERENGUE-G', 20, 0, 0, '66.0', '180.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1543, 'COJIN FLOR TREBOLINA GRANDE ', '2009154231573', 'C.TREBOL-G', 20, 0, 0, '75.0', '199.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1544, 'PELUCHE GUSANO LARGO BABY', '911528', 'P.GUS-BABY', 20, 0, 0, '128.0', '350.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1545, 'PELUCHE LEON GREÑITAS GRANDE ', '7509013625017', 'P.GREÑITAS-G', 20, 0, 0, '91.0', '200.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1546, 'PELUCHE POOH MELENUDO E', '7501917248347', 'P.MELENUDO-E', 20, 0, 0, '250.0', '480.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1547, 'PELUCHE PANDA FUT-BOLISTA', '60916', 'PAND-BB', 20, 0, 0, '125.0', '350.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1548, 'PELUCHE GUSANO FLORYCOLOR ', '7509002746723', 'P.FLORY', 20, 0, 0, '100.0', '210.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1549, 'PELUCHE POOH REGALOS G', '7506223760330', 'P.POOH-REGALOS', 20, 0, 0, '145.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1550, 'PELUCHE EEYORE REGALOS G', '7506223760354', 'P.EEYORE-REGALOS', 20, 0, 0, '169.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1551, 'PELUCHE EEYORE VAQUERO G', '7506223749816', 'P.VAQUERO-G', 20, 0, 0, '145.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1552, 'PELUCHE TIGGER VAQUERO A', '7506223749823', 'P.VAQ-A', 20, 0, 0, '169.0', '300.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1553, 'PELUCHE MINNIE BOUTIQUE A', '7506223799484', 'P.BOUTIQ-A', 20, 0, 0, '141.0', '290.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1554, 'PELUCHE MINNIE BAILARINA A', '7506223799477', 'P.BAILARINA', 20, 0, 0, '141.0', '290.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1555, 'PELUCHE MINNIE EN BATA A', '7500247013618', 'P.BATA-A', 20, 0, 0, '141.0', '290.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1556, 'PELUCHE MICKEY CHALECO G', '7506223760095', 'P.CHALECO-G', 20, 0, 0, '125.0', '270.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1557, 'PELUCHE OSO BRANDON C/ COJIN SUPER', '00713', 'P-SUPER', 20, 1, 0, '690.0', '2000.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 690, 0, 0, 0, 0, ''),
(1558, 'PELUCHE OSA CORAZON SUPER (IMPORTACION)', '00714', 'P-IMPOR', 20, 0, 0, '550.0', '1200.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1559, 'PELUCHE STITCH CHICO', '00715', 'STITCH', 20, 0, 0, '50.0', '185.0', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1560, 'PAPEL DE REGALO ', '00601', 'PAPEL', 1, 104, 0, '4.0', '12.0', 21, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 416, 0, 0, 0, 0, ''),
(1561, 'MOÑO METALICO MEDIANO ', '00603', 'M-1', 1, 0, 0, '1.0', '10.0', 21, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1562, 'MOÑO TODA OCACION GRANDE ', '00604', 'M-B-GDE', 1, 229, 0, '5.0', '25.0', 29, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 1145, 0, 0, 0, 0, ''),
(1563, 'RELOJ DE DAMA CARTISI', '00301', 'CARTISI', 23, 5, 0, '95.0', '300.0', 21, '2012-10-05 00:00:00', '', 0, 0, NULL, NULL, 0, 475, 0, 0, 0, 0, ''),
(1564, 'MOÑO CHICO NAVIDAD', '00608', 'M-B-M', 1, 25, 0, '4.0', '15.0', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, 0, ''),
(1565, 'CAJITA P/ JOYERIA BRAZALETE', '00610', 'JOYE X', 1, 0, 0, '6.0', '20.0', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1566, 'CAJA MINI P/ANILLO', '00611', 'MINI', 1, 35, 0, '4.0', '15.0', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, 0, ''),
(1567, 'CAJITA P/ RELOJ', '00612', 'JOYE', 1, 34, 0, '11.0', '25.0', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 374, 0, 0, 0, 0, ''),
(1568, 'MINIATURA VAQUITA C/ PIEDRA', '00613', 'PIEDRA', 27, 0, 0, '30.0', '70.0', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, ''),
(1569, 'BOTELLA C/DULCE CHICA', '00614', 'BOTELL-CH', 27, 5, 0, '41.0', '79.0', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 205, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo_inicial_caja`
--

CREATE TABLE `saldo_inicial_caja` (
  `id` int(11) NOT NULL,
  `importe` decimal(9,1) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `saldo_inicial_caja`
--

INSERT INTO `saldo_inicial_caja` (`id`, `importe`, `fecha`, `usuario`) VALUES
(1, '500.0', '2021-02-05 11:18:32', 'admin'),
(2, '333.0', '2021-02-02 11:50:53', 'admin'),
(3, '777.0', '2021-06-19 23:30:13', 'admin'),
(4, '415.0', '2021-06-20 12:07:02', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `nombre`) VALUES
(1, 'canta-bar'),
(2, 'terraza'),
(3, 'píso 13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `username_or_email_on_hold`
--

CREATE TABLE `username_or_email_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(342590530, 'admin', '', 9, '0', '$2y$11$y58v9bL.aVA.PPbjOftdDOCkMXBdNVC7xTeZHMNLYfs6Nzs1WluM6', NULL, NULL, '2021-02-02 10:26:18', '2021-06-21 04:04:48', '2021-01-21 19:24:54', '2021-06-21 04:04:48'),
(3173561088, 'diana', '3301270205', 1, '0', '$2y$11$tDheUMMKwfbualnbJibgeeQP1LjORPaDdyoxu.WaxNc.7zuiQ8Lte', NULL, NULL, '2021-06-20 21:49:57', '2021-06-21 02:50:09', '2021-02-02 20:27:48', '2021-06-21 02:50:09');

--
-- Disparadores `users`
--
DELIMITER $$
CREATE TRIGGER `ca_passwd_trigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF ((NEW.passwd <=> OLD.passwd) = 0) THEN
        SET NEW.passwd_modified_at = NOW();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL DEFAULT '1',
  `id_usuario` varchar(50) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `id_usuario`, `id_mesa`, `pagada`, `fecha`) VALUES
(1, 0, 'admin', 0, 1, '2021-06-20 20:48:30'),
(2, 0, 'diana', 0, 1, '2021-06-20 21:54:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_a_credito`
--

CREATE TABLE `ventas_a_credito` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`ai`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `acl_categories`
--
ALTER TABLE `acl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD UNIQUE KEY `category_desc` (`category_desc`);

--
-- Indices de la tabla `auth_sessions`
--
ALTER TABLE `auth_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cocina`
--
ALTER TABLE `cocina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denied_access`
--
ALTER TABLE `denied_access`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `login_errors`
--
ALTER TABLE `login_errors`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saldo_inicial_caja`
--
ALTER TABLE `saldo_inicial_caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas_a_credito`
--
ALTER TABLE `ventas_a_credito`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acl`
--
ALTER TABLE `acl`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  MODIFY `action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acl_categories`
--
ALTER TABLE `acl_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denied_access`
--
ALTER TABLE `denied_access`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_errors`
--
ALTER TABLE `login_errors`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1570;

--
-- AUTO_INCREMENT de la tabla `saldo_inicial_caja`
--
ALTER TABLE `saldo_inicial_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas_a_credito`
--
ALTER TABLE `ventas_a_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acl`
--
ALTER TABLE `acl`
  ADD CONSTRAINT `acl_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `acl_actions` (`action_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acl_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD CONSTRAINT `acl_actions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `acl_categories` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
