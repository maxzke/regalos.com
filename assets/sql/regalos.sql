-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-06-2021 a las 03:44:54
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
('4is5tlk7unohakt5304an6uv1tff3mf0', 3173561088, '2021-06-21 02:50:09', '2021-06-21 03:00:26', '127.0.0.1', 'Chrome 91.0.4472.106 on Windows 10'),
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
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(9,1) DEFAULT NULL,
  `costo` decimal(9,1) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT '0',
  `stock_minimo` int(11) DEFAULT NULL,
  `nombre_generico` varchar(50) DEFAULT NULL,
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
  `imagen` varchar(120) NOT NULL,
  `inventariable` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `stock`, `id_categoria`, `stock_minimo`, `nombre_generico`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `imagen`, `inventariable`) VALUES
(1, '8412', 'PORTA RETRATO REPUJADO ', '27.0', '10.0', 0, 27, 0, 'P.REPUJADO', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(2, '039915253096', 'PORTA RETRATO RUSS 1', '100.0', '50.0', 0, 27, 0, 'P.RUSS.1', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(3, '039915256622', 'PORTA RETRATO RUSS 2', '200.0', '80.0', 0, 27, 0, 'P.RUSS.2', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(4, '00291', 'CAJITA PARA JOYERIA LARGA', '28.0', '7.0', 24, 1, 0, 'C.JOY.L', 21, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 217, 0, 0, 0, '', 0),
(5, '00594', 'COJIN CORAZON COMICS AMOR', '270.0', '129.0', 0, 20, 0, 'C.COMICS.MANT', 28, '2012-07-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(6, '00112', 'CARTERA GRACE PELUCHE DAMA', '218.0', '95.0', 0, 23, 0, 'PELUCH', 27, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(7, '00576', 'COJIN IPHONE LOVEYOU JUMBO', '250.0', '108.0', 0, 20, 0, 'C.IPHONE', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(8, '00578', 'MINIATURA RANIRA C/ CORAZON', '48.0', '23.0', 0, 27, 0, 'RANITA', 26, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(9, '00358', 'MINIATURA VITRAL COMICS GRANDE', '58.0', '30.0', 0, 27, 0, 'M.COMICS.G', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(10, '7502209450066', 'MINIATURA VITRAL COMICS MEDIANO ', '40.0', '18.0', 0, 27, 0, 'M.VITRAL', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(11, '00121', 'PERGAMINO COMICS', '240.0', '95.0', 4, 22, 0, 'P.COMICS', 28, '2012-07-07 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, '', 0),
(12, '7501917232759', 'PELUCHE GOOFFY STANDARD ', '187.0', '100.0', 0, 20, 0, 'P.GOFFY', 24, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(13, '7506111762491', 'MOCHILA TOY STORY DE 350 A 199', '199.0', '100.0', 0, 25, 0, 'M.DESCUENTO', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(14, '00123', 'LAMPARA DE LAVA', '250.0', '100.0', 0, 22, 0, 'L.LAVA', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(15, '00213', 'CUADRO DE EYORE GRANDE', '250.0', '100.0', 0, 22, 0, 'C.EEYORE', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(16, '00214', 'RELOJ UNISET CABALLERO', '250.0', '75.0', 0, 23, 0, 'PUMAS', 27, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(17, '00215', 'CUADRO DE POOH FAMILIAR ', '150.0', '70.0', 1, 22, 0, 'C.FAMILI', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(18, '079522681318', 'CUADRO BB ROSA', '100.0', '50.0', 0, 22, 0, 'C.ROSA', 26, '2012-07-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(19, '00379', 'MINIATURA CUADRO REPUJADO ', '40.0', '7.0', 1, 27, 0, 'MINI.CUADRI', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 7, 0, 0, 0, '', 0),
(20, '00175', 'BOTE CON DULCE MEDIANA ', '79.0', '30.0', 1, 27, 0, 'BOTELL-M', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(21, '00039', 'BOTELLA C/ DULCE GRANDE', '100.0', '48.0', 1, 27, 0, 'BOTELL-G', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, '', 0),
(22, '00367', 'MINIATURA ANIMALES CAJITA SORPRESA', '49.0', '25.0', 0, 27, 0, 'AMIGA', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(23, '00370', 'MINIATURA TRONCO PANDA Y LEON', '79.0', '38.0', 0, 27, 0, 'TRON', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(24, '00366', 'TAZA MENSAJES DETALLES DE AMOOR', '110.0', '40.0', 8, 27, 0, 'TAZ-DETALL', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 320, 0, 0, 0, '', 0),
(25, '00536', 'RECADITO RUSS CORAZON', '81.0', '30.0', 0, 28, 0, 'REC.RUSS', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(26, '00417', 'RECADITO RUSS CHEER UP', '61.0', '20.0', 0, 28, 0, 'REC.CHEER-UP', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(27, '0011', 'BOLSA MEDIANA DIPAK ', '27.0', '14.0', 20, 1, 0, 'M-DIPAK', 22, '2014-10-02 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, '', 0),
(28, '00122', 'COJIN CARITA WHATSAPP CHANGO ', '270.0', '120.0', 0, 20, 0, 'WHATS', 23, '2015-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(29, '00541', 'BOLSA GRANDE GRABA IMAGEN ', '31.0', '13.0', 16, 1, 0, 'B.IMAGEN GRANDE', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 208, 0, 0, 0, '', 0),
(30, '00543', 'BOLSA BUTIC MEDIANA GRABA IMAGEN ', '25.0', '10.0', 2, 1, 0, 'B.IMAGEN MEDIANA ', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 20, 0, 0, 0, '', 0),
(31, '7501091801406', 'BOLSA DIPAK EX JUMBO TODA OCACION ', '39.0', '19.0', 0, 1, 0, 'B.DIPAK JUMBO', 22, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(32, '7500311002296', 'BOLSA ELEGANS MEDIANA ', '29.0', '15.0', 0, 1, 0, 'B.ELEGANS MED', 21, '2012-06-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(33, '7501091899052', 'BOLSA DISNEY ADAS MEDIANA ', '18.0', '8.0', 0, 1, 0, 'B.DISNEY ADAS', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(34, '7501091899212', 'BOLSA DISNEY POOH MEDIANA ', '18.0', '8.0', 0, 1, 0, 'B.DISNEY POOH', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(35, '7501091825235', 'BOLSA DIPAK GRANDE AMOR (SAN VALENTIN )', '26.0', '13.0', 0, 1, 0, 'B.DIPAK FLORES', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(36, '7501091825037', 'BOLSA DIPAK NOVIAS BAUTIZO Y COMUNION GRANDE', '20.0', '10.0', 0, 1, 0, 'B.DIPAK NOVIAS', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(37, '00606', 'SOMBRAS SHE CHERRY CREAM SODA', '18.0', '7.0', 0, 23, 0, 'SOMBRA', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(38, '7501064303937', 'CAJA FRANJAS GRANDE ', '40.0', '29.0', 0, 1, 0, 'C.FRANJAS GDE', 21, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(39, '00203', 'CAJA IMAGEN PRINTS GRANDE', '105.0', '49.0', 73, 1, 0, 'C.LUNARES GRD', 21, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 3773, 0, 0, 0, '', 0),
(40, '00583', 'COJIN EX LARGO PLANETART ', '300.0', '150.0', 0, 20, 0, 'C.EX PLANETART', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(41, '7501917228370', 'PELUCHE TIGEER DETECTIVE E', '380.0', '200.0', 0, 20, 0, 'P.DETECTIVE E', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(42, '7501917239079', 'PELUCHE PIGLET PEQ LETF D', '199.0', '99.0', 0, 20, 0, 'P.LETF D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(43, '7501917219200', 'PELUCHE TIGGER BEISVOLISTA E', '350.0', '199.0', 0, 20, 0, 'P.BEIS.E', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(44, '7506223749687', 'PELUCHE POOH AVIADOR D', '300.0', '145.0', 0, 20, 0, 'P.AVIADOR.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(45, '7506223799576', 'PELUCHE EEYORE JARDINERO D ', '299.0', '109.0', 0, 20, 0, 'P.JARDINERO.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(46, '7506223712773', 'PELUCHE POOH CLASICO D', '299.0', '109.0', 0, 20, 0, 'P.CLASICO.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(47, '0014', 'MOCHILITA  AMONGO ', '140.0', '50.0', 11, 22, 0, 'M-AMONGGO', 26, '2014-10-02 00:00:00', '', 0, 0, NULL, NULL, 0, 550, 0, 0, 0, '', 0),
(48, '0016', 'BOLSA CHICA DIPAK TODA OCACION ', '10.0', '8.0', 0, 1, 0, 'DIPAK-C', 22, '2014-10-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(49, '00568', 'COJIN CORAZON ROMPECABEZA', '170.0', '140.0', 1, 20, 0, 'ROMPECABEZA', 26, '2014-10-04 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, '', 0),
(50, '2009030317520', 'PELUCHE PANDA COSTURINI MED', '180.0', '70.0', 0, 20, 0, 'PAN-DA', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(51, '2010055251317', 'PELUCHE VACA MALTEADA MED', '199.0', '80.0', 0, 20, 0, 'MAL-TEADA', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(52, '4611', 'PELUCHE CHANGO Y OSO SUAVECITO GRANDE ', '799.0', '370.0', 0, 20, 0, 'P-SUAVECITO', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(53, '7501917222477', 'PELUCHE SPEEDY GONZALES 16\"', '199.0', '90.0', 0, 20, 0, 'SPEEDY', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(54, '0013', 'MINIATURA ANIMALITO EN TROCO', '64.0', '30.0', 0, 27, 0, 'M-TRON', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(55, '1170', 'MINIATURA BUUO', '58.0', '30.0', 0, 27, 0, 'BUO', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(56, '00422', 'ANILLO P/ DAMA FASION ', '40.0', '100.0', 0, 23, 0, 'A.FASION', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(57, '00056', 'RELOJ  P/ DAMA FASION', '180.0', '68.0', 1, 23, 0, 'R-FLORS', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 68, 0, 0, 0, '', 0),
(58, '00609', 'BRAZALETE P/ DAMA FASION', '100.0', '50.0', 2, 23, 0, 'B.FASION', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(59, '00528', 'BRAZALETE P/ DAMA PLATA Y DORADO', '100.0', '80.0', 2, 23, 0, 'B.P/DAMA', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, '', 0),
(60, '00228', 'RELOJ DE VIRGEN ', '199.0', '100.0', 0, 23, 0, 'R. VIRGEN', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(61, '00347', 'DIJE DE ACERO INOXIDABLE C/ CAUCHO ', '120.0', '40.0', 0, 23, 0, 'D.INOX.CAUCH', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(62, '00386', 'DIJE ACERO INOXIDABLE CRUZ C/ CAUCHO ', '170.0', '60.0', 0, 23, 0, 'D.CRUZ', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(63, '7506024859035', 'COSMETIQUERA  YAALI', '100.0', '50.0', 0, 23, 0, 'C.YAALI', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(64, '001791', 'CINTURON P/DAMA BRILLIT', '100.0', '40.0', 0, 23, 0, 'C.BRILLIT', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(65, '00013', 'LENTES UNIXE', '70.0', '28.0', 1, 23, 0, 'UNIX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 28, 0, 0, 0, '', 0),
(66, '00979', 'MONEDERO FLO YAALI', '100.0', '40.0', 0, 23, 0, 'M.FLO', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(67, '00284', 'BOLSO FASION DAMA LUNARES', '170.0', '45.0', 1, 23, 0, 'B.FASS', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, '', 0),
(68, '00537', 'PELUCHE SULY Y PERRO AMARILLO POLIESFERA ', '150.0', '85.0', 0, 20, 0, 'P-SULY', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(69, '00137', 'COJIN STITCH GRANDE', '350.0', '120.0', 0, 20, 0, 'STICHIS', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(70, '00115', 'MONEDERO DE METAL DISNEY GRANDE ', '59.0', '27.0', 0, 22, 0, 'ALCAN.B.G', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(71, '716', 'BOTE CON DULCE CURATIVOS', '100.0', '55.0', 1, 27, 0, 'CURA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 55, 0, 0, 0, '', 0),
(72, '00113', 'PELUCHE ALCANCIA ', '265.0', '120.0', 1, 20, 0, 'ALCAN.B.CH', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(73, '00131', 'CIGARRERAS', '190.0', '75.0', 1, 23, 0, 'CIGA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 75, 0, 0, 0, '', 0),
(74, '00102', 'MOTO DE METAL', '200.0', '75.0', 0, 22, 0, 'MOTT', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(75, '00136', 'TERMO AMOR Y AMISTAD', '250.0', '129.0', 1, 27, 0, 'TERMO', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, '', 0),
(76, '00144', 'TOCADO PARA DAMA', '140.0', '70.0', 1, 23, 0, 'TOCADO', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(77, '00026', 'FIGURA DISNEY CON MOVIMIENTO DAFFYB Y PIOLIN', '110.0', '70.0', 0, 22, 0, 'FIG.DISNEY', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(78, '00126', 'BIG BEN LONDON METAL', '300.0', '135.0', 0, 22, 0, 'MET', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(79, '00128', 'LONCHERA DISNEY LAMIN ', '140.0', '60.0', 0, 22, 0, 'LONCH.DISNEY', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(80, '00400', 'MINIATURA FLOR C/ MACETA ', '64.0', '31.0', 0, 27, 0, 'FLO', 26, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(81, '00380', 'MUSICO ADA DE METAL ', '198.0', '65.0', 0, 23, 0, 'MUSI', 27, '2016-10-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(82, '00148', 'PORTA LAPICERO MUSICOS', '150.0', '55.0', 0, 22, 0, 'XTA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(83, '00434', 'ALBUN PIRATAS DEL CARIBE ', '78.0', '35.0', 0, 22, 0, 'ALBN.PIRATAS', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(84, '00297', 'LONCHERA DISNEY', '118.0', '45.0', 0, 22, 0, 'LONCH.PIOLIN', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(85, '00107', 'ALBUN SENCILLO 2', '27.0', '15.0', 0, 22, 0, 'ALBUN.2', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(86, '00116', 'CORONITA INFANTIL', '110.0', '40.0', 3, 23, 0, 'CORONA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(87, '00100', 'CARPETA DE POOH ', '10.0', '5.0', 0, 22, 0, 'CARP-POOH', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(88, '00101', 'TANQUE MILITAR DE COLECCION ', '250.0', '125.0', 0, 22, 0, 'TANQUE', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(89, '00534', 'DIARIO C/ CANDADO DIFERENTES MODELOS', '40.0', '20.0', 0, 22, 0, 'DIAR.', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(90, '00118', 'LONCHERA TERMICA FORTUNIKS', '150.0', '49.0', 0, 25, 0, 'FORTU', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(91, '00119', 'CUADRO DE MADERA CON PENSAMIENTO', '230.0', '115.0', 1, 22, 0, 'CUADRO', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 115, 0, 0, 0, '', 0),
(92, '00403', 'PORTA CLIP RICH', '40.0', '25.0', 0, 22, 0, 'PORT.RICH', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(93, '7184', 'CARTERITA DE PELUCHE ANIMALITOS', '118.0', '52.0', 2, 22, 0, 'C-NIÃ‘A', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 104, 0, 0, 0, '', 0),
(94, '7512', 'SEPARADOR GUSANITO', '7.0', '3.0', 41, 22, 0, 'SEPARA.GUS', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 123, 0, 0, 0, '', 0),
(95, '751214221964', 'SEPARADOR DE POOH', '7.0', '3.0', 0, 22, 0, 'SEPARA .POOH', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(96, '1030', 'LLAVERO CORAZON PARIS', '120.0', '40.0', 0, 22, 0, 'LL.BETTY', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(97, '00493', 'MOCHILA PORTAFOLIO GUSANITO', '300.0', '200.0', 1, 25, 0, 'M.POTAF.CHEN', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(98, '00488', 'MOCHILA MK ', '299.0', '130.0', 1, 25, 0, 'M-K', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, '', 0),
(99, '00558', 'MOCHILA DE VIRGEN ', '311.0', '110.0', 0, 25, 0, 'M.VIRGEN', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(100, '00556', 'MOCHILA LOI WOOPS DE 360 A 150', '150.0', '150.0', 0, 25, 0, 'M-LOIWOOPS', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(101, '00559', 'MOCHILA TOY STORY Y JACK C/DESCUENTO $350 A $250', '250.0', '120.0', 0, 25, 0, 'M.TOY.JACK', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(102, '00484', 'MOCHILA SHREK C/ DESCUENTO $310 A 150', '150.0', '120.0', 0, 25, 0, 'M.SHR', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(103, '00553', 'BOLSITO SIRENA DORADA', '200.0', '100.0', 0, 23, 0, 'DORADA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(104, '7509048099203', 'LONCHERA CHENSON COWCO', '160.0', '80.0', 0, 25, 0, 'LONCH.COWCO', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(105, '7509048154711', 'MOCHILA FULANITOS RUEDAS ', '380.0', '150.0', 0, 25, 0, 'M.RUEDAS', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(106, '7509048151871', 'MOCHILA FULANITOS CHENSON DE 300 A 180', '180.0', '120.0', 0, 25, 0, 'M.FULAN.CHENS', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(107, '00557', 'MOCHILA LOI WOOPS CHICA', '300.0', '100.0', 0, 25, 0, 'M.LOI-WOOPS', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(108, '7509048140455', 'MOCHILA CHENSON FULANITO C/DESCUENTO $150 A$100', '100.0', '80.0', 0, 25, 0, 'M.FUL', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(109, '00456', 'MOCHILA MIKO CLUB 1', '231.0', '100.0', 0, 25, 0, 'M.MIKO', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(110, '840716050131', 'MOCHILA SPIDERMAN CHICA', '199.0', '100.0', 0, 25, 0, 'M.SPIDER', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(111, '81165', 'PELUCHE BABY MADEQUITOS ', '251.0', '109.0', 0, 20, 0, 'P.MADEQUITOS', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(112, '00472', 'PELUCHE STUPID FACTORY ', '200.0', '100.0', 0, 20, 0, 'P.STUPIC', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(113, '7501917230465', 'PELUCHE PIOLIN PANA D', '250.0', '109.0', 0, 20, 0, 'P.P.PANA', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(114, '7501917222514', 'PELUCHE PETUNIA', '200.0', '109.0', 0, 20, 0, 'P.COCHI', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(115, '7501917220909', 'PELUCHE PIOLIN MOCHILA ', '199.0', '90.0', 0, 20, 0, 'P.P.MOCHILA', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(116, '7501917220220', 'PELUCHE DAFFY ', '200.0', '100.0', 0, 20, 0, 'P.DAFFY', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(117, '1371', 'PELUCHE AGUACATE MEDIANO', '300.0', '120.0', 8, 20, 0, 'AGUACATE-M', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 960, 0, 0, 0, '', 0),
(118, '7501917270089', 'PELUCHE REY LOOI', '200.0', '109.0', 0, 20, 0, 'P-REY', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(119, '7501917232117', 'PELUCHE BOMBON CHICAS SUPER PODEROSAS', '200.0', '109.0', 0, 20, 0, 'P.BOMBON', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(120, '7501917232032', 'PELUCHE BELLOTA CHICAS SUPER PODEROSAS ', '200.0', '109.0', 0, 20, 0, 'P.BELLOTA', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(121, '7501917230380', 'PELUCHE SYLVESTRE PANA D', '250.0', '109.0', 0, 20, 0, 'P.SYLVES.P', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(122, '00019', 'PELUCHE MARCH SIMPSONS', '150.0', '100.0', 0, 20, 0, 'P.MARCH', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(123, '7501917271505', 'PELUCHE ENANO DORMILON BB', '97.0', '40.0', 0, 20, 0, 'P-DORM.BB', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(124, '7501917222149', 'PELUCHE MARC ANTONY BB', '50.0', '40.0', 0, 20, 0, 'P.ANTONY.BB', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(125, '831029737093', 'PELUCHE DADO BB', '49.0', '20.0', 0, 20, 0, 'P.DADO', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(126, '00149', 'ORGANIZADOR  HELLO KITTY', '110.0', '45.0', 0, 22, 0, 'OR-HELLO', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(127, '7501064303913', 'CAJA FRANJAS CHICA ', '27.0', '8.0', 0, 1, 0, 'C.FRAN.CH', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(128, '00200', 'CAJA IMAGEN PRINTS CHICA', '40.0', '15.0', 9, 1, 0, 'C.LUNARS.CH', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 135, 0, 0, 0, '', 0),
(129, '7501064303920', 'CAJA FRANJAS MEDIANA', '49.0', '16.0', 0, 1, 0, 'C.FRANJS.MEDIANA', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(130, '00201', 'CAJA IMAGEN PRINTS MEDIANA ', '62.0', '29.0', 0, 1, 0, 'C.LUNARS.MEDIANA', 21, '2012-06-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(131, '00104', 'CARTERA CABALLERO DIFERENTES MARCAS', '300.0', '68.0', 16, 23, 0, 'C-YAALI', 27, '2012-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 1088, 0, 0, 0, '', 0),
(132, '00567', 'COJINNETTE EXPLOWORLD DIFERENTES MODELOS ', '100.0', '90.0', 1, 20, 0, 'C.EXPLOW', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 90, 0, 0, 0, '', 0),
(133, '1487', 'CAJA DE REGALOS THE CAT GRANDE', '95.0', '37.0', 6, 1, 0, 'THE CAT-G', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 222, 0, 0, 0, '', 0),
(134, '00105', 'MINIATURA PERGAMINO GRANDE', '119.0', '58.0', 0, 27, 0, 'PERG-G', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(135, '00564', 'VELERO DE METAL COLECCION ', '180.0', '65.0', 0, 22, 0, 'VELERO', 27, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(136, '00563', 'BALANCE P/ OFICINA ', '170.0', '67.0', 0, 22, 0, 'BALANCE', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(137, '00110', 'VELADORA RUSS', '100.0', '50.0', 4, 27, 0, 'VELA.RUSS', 26, '2012-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(138, '01000', 'EXIBIDOR PARA RELOJ DAMA', '35.0', '10.0', 34, 23, 0, 'EXIBI', 27, '2015-09-18 00:00:00', '', 0, 0, NULL, NULL, 0, 340, 0, 0, 0, '', 0),
(139, '00392', 'MINIATURA VAQUITA Y RANITA', '54.0', '26.0', 0, 27, 0, 'PAÃ‘UEL', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(140, '7500107573528', 'PELUCHE OSO CORAZON METALICO C/ SONIDO JUMBO', '650.0', '289.0', 0, 20, 0, 'METALICO', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(141, '00717', 'PELUCHE PERRO CON CORBATA GRANDE', '600.0', '210.0', 0, 20, 0, 'P.CORBATA', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(142, '00718', 'PELUCHE OSO TEDY GRANDE', '370.0', '140.0', 0, 20, 0, 'TEDY-G', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(143, '00719', 'PELUCHE OSOS KIMI', '215.0', '98.0', 0, 20, 0, 'KIMI', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(144, '00720', 'PELUCHE OSA BLANQUITA CON MOÑO GRANDE ', '1100.0', '520.0', 0, 20, 0, 'OSA.ESTR', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(145, '00721', 'PELUCHE PERRO PEKAS GRANDE', '780.0', '350.0', 0, 20, 0, 'P.PERRIT.PK', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(146, '3116', 'PELUCHE OSO RELOJ GRANDE', '750.0', '320.0', 0, 20, 0, 'RELOJ', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(147, '2012702418630', 'PELUCHE 0S0 CARACOLIN EXTRA GRANDE', '390.0', '125.0', 0, 20, 0, 'P.CARACOLIN.EXG', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(148, '2012702418333', 'PELUCHE OSA CARACOLINY EXTRA GRANDE ', '390.0', '125.0', 0, 20, 0, 'P.CARACOLINY.EXG', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(149, '2011098230024', 'PELUCHE OSO BELENGUE GRANDE ', '260.0', '89.0', 0, 20, 0, 'P.BELENGUE', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(150, '1644', 'PELUCHE OSO CORAZON DORADO GRANDE ', '1100.0', '650.0', 0, 20, 0, 'DORADO', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(151, '2012070241830', 'PELUCHE OSA CORACOLINY GRANDE ', '280.0', '119.0', 0, 20, 0, 'P.CARACILINY.G', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(152, '800010700347', 'PELUCHE OSO SENTADO CON BUFANDA GRANDE ', '350.0', '119.0', 0, 20, 0, 'P.BUFANDA.G', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(153, '2011091424185', 'PELUCHE OSO GARABATOSO GRANDE ', '280.0', '119.0', 0, 20, 0, 'P.GARABATOS.G', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(154, '2011091214175', 'PELUCHE OSO GARABATOSO MEDIANO ', '199.0', '89.0', 0, 20, 0, 'P.GARABATOSO.M', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(155, '2010112696266', 'PELUCHE PERRITA NECTAR MEDIANA', '199.0', '69.0', 0, 20, 0, 'P.NECTAR.M', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(156, '2010109007259', 'PELUCHE OSA GALLY MEDIANO ', '180.0', '89.0', 0, 20, 0, 'P.GALLY.M', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(157, '00779', 'COJIN CARITA UNICORNIO MEDIANO', '280.0', '120.0', 0, 20, 0, 'C-UNICOR', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(158, '00723', 'PELUCHE AMONGAS POLIESFERA ', '250.0', '80.0', 5, 20, 0, 'AAMONG', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, '', 0),
(159, '00724', 'ALMOHADA GRANDE MANTA PINTADA ', '400.0', '200.0', 0, 20, 0, 'AL.MANTA', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(160, '7150', 'ALMOHADA MEDIANA MANTA PINTADA ', '270.0', '100.0', 7, 20, 0, 'AL.MANTT', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 700, 0, 0, 0, '', 0),
(161, '00726', 'ALMOHADA HUESO BEST FRIENDS SUPER', '400.0', '190.0', 0, 20, 0, 'AL.BEST', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(162, '00727', 'ALMOHADA BALON EQUIPOS', '110.0', '75.0', 1, 20, 0, 'AL.BALON', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 75, 0, 0, 0, '', 0),
(163, '00728', 'PELUCHE MUÑECA WOODY TOYS GRANDE', '280.0', '140.0', 0, 20, 0, 'P.MUÃ‘.G', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(164, '00729', 'PELUCHE JIRAFA BEBE MUSICAL', '270.0', '135.0', 0, 20, 0, 'P-JIRAF.BB', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(165, '851785039002', 'PELUCHE MUÑECA WOODY TOYS CHICA ', '140.0', '68.0', 0, 20, 0, 'P.MUÃ‘.CH', 24, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(166, '00730', 'PERGAMINO GRANDE AMOR', '395.0', '199.0', 0, 22, 0, 'PERG.G', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(167, '1733', 'CAJA DE REGALOS DEDICADA JUMBO', '145.0', '65.0', 10, 1, 0, 'DEDICADA-J', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 650, 0, 0, 0, '', 0),
(168, '00734', 'CAJA DE REGALOS LUNARES 1883 MED', '79.0', '35.0', 0, 1, 0, '1883-M', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(169, '1735', 'CAJA DE REGALOS DEDICADA CHICA', '50.0', '25.0', 10, 1, 0, 'DEDICADA-CH', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 250, 0, 0, 0, '', 0),
(170, '1736', 'CAJA DE REGALOS DEDICADA MEDIANA', '80.0', '40.0', 8, 1, 0, 'DEDICADA-M', 21, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 320, 0, 0, 0, '', 0),
(171, '1737', 'CAJA DE REGALOS DEDICADA GRANDE', '120.0', '50.0', 9, 1, 0, 'DEDICADA-G', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, '', 0),
(172, '00738', 'CAJA DE REGALOS LUNARES JUMBO', '128.0', '55.0', 3, 1, 0, 'LUNARES-J', 26, '2012-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 165, 0, 0, 0, '', 0),
(173, '00739', 'CAJA DE REGALO C/ MOÑO GDE', '115.0', '40.0', 1, 1, 0, '1883-G', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(174, '00740', 'CAJA DE REGALOS LUNARES 2463 MEDIANA ', '79.0', '40.0', 0, 1, 0, '2463-M', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(175, '00741', 'CAJA DE REGALOS LUNARES 2463 CH', '55.0', '30.0', 0, 1, 0, '2463-CH', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(176, '00747', 'CAJITA ALAJERO CHICA NO.01', '36.0', '7.0', 0, 1, 0, 'C.ALA.01', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(177, '00748', 'PELUCHE ANIMALES PATONES', '229.0', '112.0', 0, 20, 0, 'C.MINI.PELUCH', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(178, '00749', 'CAJITA DE REGALO CUADRO CORAZON MINI', '18.0', '2.6', 0, 1, 0, 'C.CORAZ', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(179, '00742', 'COJINNETTE MINI EXPLOWORLD NAVIDAD ', '70.0', '28.0', 0, 20, 0, 'C.MINI.EXPLOW', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(180, '7502209338012', 'TARJETA NAVIDAD FIZZY MOON', '36.0', '15.0', 0, 21, 0, 'T.FIZZY.NAV', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(181, '38005', 'TARJETA NAVIDAD FIZZY MOON 1', '38.0', '15.0', 7, 21, 0, 'T.FIZZY.1', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 105, 0, 0, 0, '', 0),
(182, '3371', 'TARJETA PARA MAMA', '10.0', '5.0', 45, 21, 0, 'T.MAMA', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 225, 0, 0, 0, '', 0),
(183, '7206', 'PELUCHE SHARPEI MEDIANO ', '250.0', '105.0', 0, 20, 0, 'SHARPEI-M', 24, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(184, '0002', 'TARJETA NAVIDAD DISNEY', '27.0', '12.0', 0, 21, 0, 'T.NAVI', 26, '2012-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 12, 0, 0, 0, '', 0),
(185, '00751', 'CARTERA GRACE DAMA ', '250.0', '70.0', 0, 23, 0, 'GRACE', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(186, '00750', 'CARTERA DE DAMA PROMOCION', '100.0', '50.0', 0, 23, 0, 'PRO', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(187, '00753', 'CARTERA DAMA LARGA GRACE', '200.0', '70.0', 0, 23, 0, 'C.POLO', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(188, '00754', 'CARTERA DAMA LEMON', '150.0', '60.0', 0, 23, 0, 'LEMON', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(189, '00752', 'CARTERA GRACE FASHION SINCE1996', '230.0', '100.0', 0, 23, 0, 'GRACEE', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(190, '00731', 'CARRO DE COLECCION DIFERENTES MARCAS', '500.0', '300.0', 0, 23, 0, 'COLEC', 27, '2015-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(191, '00743', 'RELOJ TOUCHS DAMA ', '250.0', '95.0', 0, 23, 0, 'TOUHS', 27, '2012-11-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(192, '00755', 'RELOJ PARA DAMA BRAZALETE ', '180.0', '50.0', 0, 23, 0, 'BRAZALET-B1', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(193, '00756', 'RELOJ P/ DAMA BRIYITT', '218.0', '65.0', 0, 23, 0, 'R-BRIYIT', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(194, '00757', 'BRAZALETE DAMA ANALIE', '70.0', '10.0', 0, 23, 0, 'ANALIE', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(195, '00758', 'BRAZALETE FASHION ', '150.0', '100.0', 1, 23, 0, 'BRA-FASH', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(196, '00759', 'BRAZALETE PARA DAMA NO.1', '151.0', '50.0', 0, 23, 0, 'BRA.1', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(197, '00760', 'BRAZALETE DAMA BRILLANTE', '140.0', '35.0', 0, 23, 0, 'BRA-2', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(198, '00761', 'CARTERA LARGA DAMA POVI-POMI', '160.0', '50.0', 0, 23, 0, 'POMI', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(199, '00762', 'DEODORANTE CABALLERO ', '100.0', '50.0', 0, 23, 0, 'DEO', 27, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(200, '00763', 'BOLSA GRANDE IMAGEN PRINTS NAVIDAD', '26.0', '10.0', 0, 1, 0, 'PRINS-G', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(201, '00764', 'BOLSA GRANDE S NAVIDAD BEST FOR', '37.0', '10.0', 0, 1, 0, 'PRINTS-J', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(202, '00765', 'BOLSA JUMBO IMAGEN PRINTS (BODA)', '39.0', '19.0', 0, 1, 0, 'PRINTS-BODA', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(203, '00766', 'BOLSA MEDIANA IMAGEN PRINTS NAVIDAD', '18.0', '7.0', 0, 1, 0, 'PRINTS-M', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(204, '00767', 'BOLSA CHICA IMAGEN PRINTS NAVIDAD ', '16.0', '6.0', 0, 1, 0, 'PRINTS-CH', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(205, '717', 'BOTELLA CON DULCE GRANDE', '119.0', '70.0', 3, 27, 0, 'BOTELLA', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 210, 0, 0, 0, '', 0),
(206, '00769', 'PAPEL DE REGALO (NAVIDA)', '13.0', '4.0', 28, 1, 0, 'PAPEL-N', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 112, 0, 0, 0, '', 0),
(207, '6915288154045', 'CAJA DULCE NAVIDAD ', '15.0', '5.0', 6, 1, 0, 'C.DULCE', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(208, '6915288154052', 'CAJA MINI PELUCHERA (NAVIDAD)', '13.0', '4.0', 0, 1, 0, 'MINI-PELUC', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(209, '1317', 'CAJA PELUCHERA CHICA', '75.0', '18.0', 10, 1, 0, 'C.P.NAV', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 180, 0, 0, 0, '', 0),
(210, '7501091899847', 'BOLSA GRANDE CELEBRATE (NAVIDAD)', '26.0', '10.0', 0, 1, 0, 'B-CELEB', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(211, '7501091855232', 'BOLSA GRANDE DIPAK (NAVIDAD)', '28.0', '10.0', 0, 1, 0, 'NAV.DIPAK', 22, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(212, '7501091899816', 'BOLSA CHICA CELEBRATE (NAVIDAD)', '16.0', '5.0', 0, 1, 0, 'CELEBRA-CH', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(213, '884118133009', 'BOLSA DE PAPEL TAMAÑO GIGANTE NAVIDAD ', '70.0', '25.0', 0, 1, 0, 'B.GIGANT', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(214, '00770', 'PELUCHE CHIHUAHUA GRANDE', '230.0', '68.0', 0, 20, 0, 'CHIHUA', 26, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(215, '7501091855829', 'CAJA TORRE NAVIDAD', '35.0', '20.0', 0, 1, 0, 'C.TORRE', 21, '2012-11-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(216, '00771', 'CAJA KIUT CHICA', '200.0', '130.0', 0, 29, 0, 'C.KIUT.C', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(217, '00772', 'CAJA KIUT MEDIANA ', '250.0', '140.0', 1, 29, 0, 'C.KIUT-M', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, '', 0),
(218, '00773', 'SILUETA LOVE DE KIUT', '230.0', '110.0', 0, 29, 0, 'LOVE', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(219, '00774', 'PORTA RETRATO KIUT 6', '190.0', '95.0', 0, 29, 0, 'KIUT-6', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(220, '00775', 'PORTA RETRATO KIUT BABY', '200.0', '120.0', 0, 29, 0, 'P-BABY', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(221, '00776', 'PORTA RETRATO CORAZON KIUT (PARED)', '200.0', '110.0', 0, 29, 0, 'P-PARET', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(222, '00777', 'PULCERA KIUT', '15.0', '6.0', 0, 29, 0, 'PULCERA-K', 25, '2012-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(223, '00778', 'CAJA KIUT GRANDE', '350.0', '160.0', 1, 29, 0, 'C.KIUTT', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, '', 0),
(224, '00780', 'CRUZ HOGAR KIUT', '250.0', '140.0', 0, 29, 0, 'HOGAR', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(225, '00781', 'PORTA RETRATO KIUT NOVIOS (PARED)', '230.0', '110.0', 0, 29, 0, 'P.PARED', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(226, '00782', 'PORTA RETRATO KIUT LOVE YOU (PARED)', '200.0', '130.0', 0, 29, 0, 'P.LOVE', 25, '2012-12-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(227, '00783', 'PORTA RETRATO KIUT 7 ', '200.0', '100.0', 1, 29, 0, 'PORTA-7', 25, '2012-12-29 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(228, '00784', 'COJIN CORAZON SAN VALENTIN', '180.0', '79.0', 4, 20, 0, 'C-VALENTIN', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 316, 0, 0, 0, '', 0),
(229, '00785', 'COJIN CUELLERA POLIESFERA ( HABLANDO SOLA )', '200.0', '95.0', 0, 20, 0, 'CUELLRA', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(230, '00786', 'COJIN MINIUMS BOOT Y STICHIS', '250.0', '90.0', 0, 20, 0, 'C-REDONDO', 26, '2013-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(231, '00787', 'COJIN CORAZON TRIMANIX MEDIANO', '190.0', '92.0', 0, 20, 0, 'CRZN-TRIMANX', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(232, '00788', 'ALMOHADA  BLANCA MICKEY MOUSE', '350.0', '150.0', 0, 20, 0, 'C-MOU', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(233, '00789', 'COJIN CORAZON SUPER TRIMANIX ', '700.0', '350.0', 0, 20, 0, 'C-SUPER', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(234, '00790', 'COJIN CORAZON GRANDE TRIMANIX', '350.0', '255.0', 0, 20, 0, 'C-TRIMAN', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(235, '00791', 'COJIN NEGRO MEDIANO TRIMANIX', '180.0', '65.0', 0, 20, 0, 'C-NEGRO', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(236, '00792', 'ALMOHADA PINTADA CORAZON GRANDE', '350.0', '170.0', 0, 20, 0, 'AL-CORAZ', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(237, '00793', 'ALMOHADA LARGA GRANDE', '350.0', '150.0', 0, 20, 0, 'MANTA', 26, '2013-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(238, '02', 'GLOBO MEDIANO SAN VALENTIN', '60.0', '21.0', 0, 30, 0, 'GLOBO-1', 26, '2013-02-02 00:00:00', '', 0, 0, NULL, NULL, 0, 525, 0, 0, 0, '', 0),
(239, '03', 'GLOBO GRANDE CORAZON ESPIRAL', '150.0', '40.0', 10, 30, 0, 'GLOBO-3', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 480, 0, 0, 0, '', 0),
(240, '04', 'GLOBO MEDIANO ALARGADO', '70.0', '22.0', 32, 30, 0, 'GLOBO-4', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 726, 0, 0, 0, '', 0),
(241, '05', 'GLOBO EX GRANDE TODA OCACION ', '150.0', '40.0', 15, 30, 0, 'GLOBO-5', 26, '2013-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 640, 0, 0, 0, '', 0),
(242, '00794', 'REKADITO KIUT (SILUETAS )', '130.0', '50.0', 0, 29, 0, 'REKA', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(243, '00795', 'SILUETAS  KIUT 1', '140.0', '70.0', 0, 29, 0, 'SILUET-1', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(244, '00796', 'PORTA RETRATO KIUT LARGO ', '230.0', '110.0', 0, 29, 0, 'KIUTT', 25, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(245, '00797', 'PELUCHE DIEGO ( ICE AGE 3)', '399.0', '150.0', 0, 20, 0, 'HIELO', 24, '2013-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(246, '00798', 'ALMOHADA LARGA  TRIMANIX GRANDE', '399.0', '220.0', 0, 20, 0, 'LARGA', 26, '2013-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(247, '00799', 'CARTERA DAMA LARGA LEMON ', '240.0', '100.0', 0, 23, 0, 'CHAROLL', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(248, '00800', 'CARTERA DAMA MONA LISA', '200.0', '50.0', 2, 23, 0, 'MONA', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(249, '00802', 'CARTERA DAMA LARGA XOXO', '200.0', '100.0', 0, 23, 0, 'XOXO', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(250, '00803', 'RELOJ JUVENIL TRANSPARENTE', '120.0', '50.0', 3, 23, 0, 'JEVENIL', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, '', 0),
(251, '00804', 'RELOJ INFANTIL  ', '60.0', '19.0', 0, 23, 0, 'INFAN', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(252, '00805', 'RELOJ UNIXEE BLANCO', '170.0', '65.0', 0, 23, 0, 'UNI', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(253, '00806', 'PULCERA CABALLERO PIEL', '170.0', '40.0', 3, 23, 0, 'PULC', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(254, '00807', 'CAJA CAMISERA MEDIANA', '89.0', '35.0', 0, 1, 0, 'CAMISERA', 26, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(255, '00808', 'PULCERA DE CABALLERO IMANTADA', '250.0', '100.0', 0, 23, 0, 'ACERO', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(256, '00809', 'LLAVEROS EN ( OFERTA )', '20.0', '35.0', 0, 23, 0, 'FASH', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(257, '00810', 'CINTURON P/ CABALLERO DIFERENTES MARCAS', '50.0', '40.0', 0, 23, 0, 'CINTO', 27, '2013-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(258, '7501091825273', 'BOLSA JUMBO DIPAK AMOR ( SAN VALENTIN )', '40.0', '20.5', 0, 1, 0, 'SANN', 22, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(259, '7501091825228', 'BOLSA MEDIANA DIPAK AMOR', '18.0', '9.5', 0, 1, 0, 'AMORR', 22, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(260, '00811', 'BOLSA JUMBO IMAGEN PRINTS ', '58.0', '35.0', 0, 1, 0, 'JUM', 21, '2013-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(261, '337', 'CAJA ENVUELTA TIPO CARTERA', '28.0', '10.0', 0, 1, 0, 'C-CARTE', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(262, '368', 'CAJA CORBATA GRANDE', '49.0', '20.0', 3, 1, 0, 'C-CUAD', 29, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, '', 0),
(263, '351', 'CAJA ENVUELTA  MEDIANA', '37.0', '10.0', 0, 1, 0, 'C-MED', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(264, '320', 'CAJA ENVOLTURA MED 2', '40.0', '15.0', 0, 1, 0, 'C-MED2', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(265, '313', 'CAJA SMOKIN GRANDE', '48.0', '20.0', 8, 1, 0, 'SMOKIN', 21, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 180, 0, 0, 0, '', 0),
(266, '344', 'CAJA COLORS GRANE ', '40.0', '20.0', 2, 1, 0, 'C-GRD1', 29, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(267, '1', 'BOLSA CELOFAN GRANDE', '25.0', '8.0', 0, 1, 0, 'CELO-1', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(268, '2', 'BOLSA CELOFAN JUMBO', '35.0', '8.0', 0, 1, 0, 'CELO2', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(269, '3', 'BOLSA CELOFAN EX JUMBO', '37.0', '15.0', 0, 1, 0, 'CELO3', 26, '2013-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(270, '00812', 'CAJA CRAF EX JUMBO ', '160.0', '60.0', 0, 1, 0, 'CAJA-EXJ', 29, '2013-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(271, '00813', 'CAJA CRAF GRANDE MOD2', '100.0', '32.0', 0, 1, 0, 'CRAF-2', 29, '2013-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(272, '06', 'GLOBO BABY SHOWER', '50.0', '15.0', 81, 30, 0, 'G-BABY', 26, '2013-04-26 00:00:00', '', 0, 0, NULL, NULL, 0, 1215, 0, 0, 0, '', 0),
(273, '00814', 'PERGAMINO MANTA MEDIANO', '245.0', '135.0', 3, 22, 0, 'PERGAMINO-MED', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 405, 0, 0, 0, '', 0),
(274, '00815', 'ALMOHADA NEGRA TRIMANIX JUMBO', '450.0', '195.0', 3, 20, 0, 'CIJIN-TRI', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 585, 0, 0, 0, '', 0),
(275, '00816', 'COJIN TRIMANIX CHICO', '78.0', '48.0', 1, 20, 0, 'TRIMANIX-CH', 26, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, '', 0),
(276, '00985', 'PELUCHE SERPIENTE MUSICAL', '199.0', '70.0', 0, 20, 0, 'SERP', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(277, '851785052612', 'PELUCHE OSO CON PLAYERA GRANDE', '350.0', '106.0', 0, 20, 0, 'PLAYERA', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(278, '2011091360865', 'PELUCHE RANA BOSHITA MEDIANA ', '210.0', '87.0', 0, 20, 0, 'BOSHITA', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(279, '7500813001223', 'PELUCHE TRENECITO ROSA CON SONIDO ', '270.0', '106.0', 0, 20, 0, 'TRENECITO', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(280, '7500107573559', 'PELUCHE OSO ROSAS CORAZON CON SONIDO ', '389.0', '179.0', 0, 20, 0, 'ROSAS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(281, '7500107431651', 'PELUCHE KIKAMONKIKA CON SONIDO GRANDE ', '310.0', '135.0', 0, 20, 0, 'KIKA', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(282, '7500601129078', 'PELUCHE OSO MANGOCHO GDE', '199.0', '77.0', 0, 20, 0, 'MANGOCHO', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(283, '00828', 'MARIQUERA DE BUO', '100.0', '40.0', 0, 23, 0, 'B-UO', 27, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(284, '00829', 'COJIN MEDIANO AMOR Y AMISTAD ', '180.0', '40.0', 10, 20, 0, 'C-BB', 24, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, '', 0),
(285, '00830', 'CAJITA DE JOYERIA PARA ARETES', '23.0', '6.0', 0, 1, 0, 'ARETES', 22, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(286, '00831', 'CAJA DE REGALOS LUNARES 2463 CHICA', '49.0', '25.0', 0, 1, 0, '2463-C', 26, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(287, '00832', 'MOÑO CHICO', '15.0', '3.0', 43, 1, 0, 'MOÃ‘O-M', 21, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, '', 0),
(288, '00833', 'MOÑO MEDIANO TODA OCACION', '20.0', '3.0', 10, 1, 0, 'MOÃ‘O-G', 26, '2013-06-29 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(289, '00834', 'MOCHILA BOLSO C/DESCUENTO $130 A $100', '100.0', '45.0', 0, 25, 0, 'M-BOLSO', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(290, '00835', 'BOLSO LUNARES MEDIANO', '140.0', '60.0', 0, 23, 0, 'LUN-M', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(291, '7500351012781', 'MOCHILA LOS PITUFOS ATM ', '350.0', '200.0', 0, 25, 0, 'M-PITUF', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(292, '7509048231450', 'MOCHILA FULANITOS CHENSON 1', '350.0', '175.0', 0, 25, 0, 'M-FULA', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(293, '7500247138663', 'MOCHILA CHOCOCAT RUZ', '370.0', '225.0', 0, 25, 0, 'M-CHOCO', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(294, '7509048231252', 'MOCHILA FULANITOS CHENSON 2', '350.0', '180.0', 0, 25, 0, 'M-FUL-2', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(295, '7500247200834', 'MOCHILA HELLO KITTY C/DESCUENTO $300 A $250', '250.0', '160.0', 0, 25, 0, 'B-HELLO', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(296, '7500247138762', 'MOCHILA TOTE CHOCOCAT C/DESCUENTO $300 A $250', '250.0', '160.0', 0, 25, 0, 'B-TOTE', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(297, '7504024768227', 'MOCHILA ANGRY TARGMEX C/DESCUENTO $380 A$300', '300.0', '225.0', 0, 25, 0, 'ANGRY-1', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(298, '7504024768234', 'MOCHILA ANGRY TARGMEX 2 / DESCUENTO $380 A $200', '200.0', '225.0', 1, 25, 0, 'ANGRY-2', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 225, 0, 0, 0, '', 0),
(299, '7500247200889', 'MOCHILA BOLSO HELLO KITTY 2', '350.0', '180.0', 0, 25, 0, 'M-HELLO-2', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(300, '7500247200865', 'MOCHILA HELLO KITTY 3 C/DESCUENTO $350 A$300', '300.0', '180.0', 0, 25, 0, 'HELLO-3', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(301, '7500247138014', 'MOCHILA  HELLO KITTY C/ DESCUENTO $399 A $200', '200.0', '150.0', 0, 25, 0, 'M-TOTE', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(302, '7500247200872', 'MOCHILA HELLO KITTY 4 C/DESCUENTO $300 A$200', '200.0', '160.0', 0, 25, 0, 'HELLO-4', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(303, '7500247200858', 'MOCHILA BOLSO HELLO KITTY RUS 5', '300.0', '160.0', 0, 25, 0, 'HELLO-5', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(304, '7506223749786', 'PELUCHE MINI MOUSE VAQUERA', '300.0', '159.0', 0, 20, 0, 'MOUSE', 24, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(305, '7500247041710', 'PELUCHE MINI PIJAMA', '300.0', '149.0', 0, 20, 0, 'M-PIJAMA', 24, '2013-05-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(306, '3134', 'PELUCHE PINGUINO  GRANDE', '380.0', '140.0', 0, 20, 0, 'PINGUNO', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(307, '7500107431323', 'PELUCHE OSITO PINKILIN CORAZON MEDIANO', '210.0', '89.0', 0, 20, 0, 'PINKILIN-M', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(308, '7500107432221', 'PELUCHE PERRO DADY GRANDE', '289.0', '129.0', 0, 20, 0, 'DADY-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(309, '2011098227659', 'PELUCHE PERRO CHIPO GRANDE ', '280.0', '96.0', 0, 20, 0, 'CHIPO-G', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(310, '7500124440308', 'PELUCHE OSO CHONCHITO GRANDE ', '300.0', '129.0', 0, 20, 0, 'CHONCHI-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(311, '2012070241847', 'PELUCHE OSO CARACOLITO GRANDE', '250.0', '109.0', 0, 20, 0, 'CARACOLITO-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(312, '2012070241632', 'PELUCHE RANA LINDA GRANDE ', '260.0', '119.0', 0, 20, 0, 'RANALINDA-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(313, '7500107266420', 'PELUCHE PATA PRIMAVERA KUA KUA GRANDE ', '230.0', '99.0', 0, 20, 0, 'PATA-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(314, '2011098230017', 'PELUCHE PATO PUCHOLO MEDIANO', '199.0', '59.0', 0, 20, 0, 'PATO-M', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(315, '4585', 'PELUCHE CONEJA TEDY GRANDE', '360.0', '140.0', 0, 20, 0, 'CONEJA-T', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(316, '7500105304711', 'PELUCHE OSO ECHADO CHOKOROL GRANDE', '250.0', '129.0', 0, 20, 0, 'CHOKO-G', 24, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(317, '00817', 'LLAVERO COLECCION SIX', '110.0', '45.0', 0, 23, 0, 'SIX', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(318, '00818', 'CARTERA DAMA ZIMD', '200.0', '70.0', 0, 23, 0, 'PLAYBOY', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `stock`, `id_categoria`, `stock_minimo`, `nombre_generico`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `imagen`, `inventariable`) VALUES
(319, '00819', 'CARTERA FOREVER YOUNG DAMA', '300.0', '145.0', 0, 23, 0, 'FOREVER', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(320, '00820', 'CARTERA BOLSO COOL', '200.0', '50.0', 0, 23, 0, 'C-BOLSO', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(321, '00821', 'CARTERA FASHION GRACE DAMA', '250.0', '100.0', 1, 23, 0, 'C-FASHION', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(322, '00822', 'CARTERA MONEDERO GRACE ', '180.0', '60.0', 0, 23, 0, 'C-GRACE', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(323, '00823', 'COSMETIQUERA GRACE', '118.0', '50.0', 0, 23, 0, 'COMET-GRAC', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(324, '00824', 'COSMETIQUERA MICHAEL MICHELLE', '130.0', '59.0', 0, 23, 0, 'COSMET', 27, '2013-05-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(325, '7501091800188', 'BOLSA CHICA DIPAK FLORES', '16.0', '7.0', 0, 1, 0, 'FLORES', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(326, '7501091826096', 'BOLSA EX JUMBO DIPAK FLORES', '59.0', '23.0', 0, 1, 0, 'B-FLORES', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(327, '7501091800348', 'BOLSA JUMBO DIPAK FLORES ', '40.0', '20.0', 0, 1, 0, 'B-JUM-FLORES', 22, '2013-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(328, '00825', 'MINIATURA ANIMALES C/ PERGAMINO', '100.0', '46.0', 0, 27, 0, 'ANIMA', 26, '2013-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(329, '00826', 'RELOJ TACTIL UNISEX', '199.0', '65.0', 0, 23, 0, 'UNISEX', 26, '2013-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(330, '00986', 'PELUCHE ELEFANTE KIMI', '400.0', '180.0', 0, 20, 0, 'ELE-KIMI', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(331, '3274870122569', 'PERFUME GIVENCHY CABALLERO', '700.0', '350.0', 0, 24, 0, 'GIVEN', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(332, '3457460203354', 'PERFUME ARSENAL CABALLERO', '400.0', '150.0', 0, 24, 0, 'ARSENAL', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(333, '031655471709', 'PERFUME BLACK KENNETH COLE DAMA', '500.0', '200.0', 0, 24, 0, 'BLACK', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(334, '00827', 'CENICERO', '35.0', '15.0', 0, 22, 0, 'CENI', 27, '2013-06-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(335, '7500247040829', 'PELUCHE MINNIE TENISTA ', '300.0', '145.0', 0, 20, 0, 'TENNIS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(336, '7500247013700', 'PELUCHE POOH JARDINERO ', '300.0', '145.0', 0, 20, 0, 'JARDINERO-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(337, '7506223799569', 'PELUCHE POOH CON FLOR MEDIANO', '300.0', '145.0', 0, 20, 0, 'FLOR-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(338, '7500247013717', 'PELUCHE EEYORE JARDINERO MEDIANO', '300.0', '145.0', 0, 20, 0, 'JARDI-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(339, '7506223799507', 'PELUCHE MINNIE MEDIANA FLORES', '300.0', '145.0', 0, 20, 0, 'FLORES-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(340, '7506223799392', 'PELUCHE MICKEY CORAZONES MEDIANO ', '300.0', '145.0', 0, 20, 0, 'CORAZON-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(341, '7500247042267', 'PELUCHE MICKEY IMPERMEABLE MEDIANO ', '300.0', '145.0', 0, 20, 0, 'IMPER', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(342, '7506223743821', 'PELUCHE POOH IMPERMEABLE MEDIANO', '300.0', '145.0', 0, 20, 0, 'IMPERR', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(343, '7500247013694', 'PELUCHE TIGGER JARDINERO MEDIANO ', '300.0', '145.0', 0, 20, 0, 'T.JARDI-M', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(344, '7500247115992', 'PELUCHE AGENTE P MEDIANO', '300.0', '145.0', 0, 20, 0, 'AGE-P', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(345, '7506223761085', 'PELUCHE MINIE MAMELUCO CHICA', '149.0', '70.0', 0, 20, 0, 'MAMELUCO', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(346, '2009154230606', 'COJIN FLOR MAGNOLIAS GRANDE', '230.0', '97.0', 0, 20, 0, 'MAGNOLIAS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(347, '2011052850114', 'PELUCHE JIRAFA GOGYS', '250.0', '96.0', 0, 20, 0, 'GOGYS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(348, '1138', 'PELUCHE  AGUACATE JUMBO', '400.0', '180.0', 8, 20, 0, 'AGUACATE-JUM', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 1440, 0, 0, 0, '', 0),
(349, '7500247177570', 'PELUCHE MIKE MONSTER UNIVERSITARIO ', '250.0', '145.0', 0, 20, 0, 'MIKE', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(350, '7500247177587', 'PELUCHE RANDALL MONSTER UNIVERSITY', '250.0', '145.0', 0, 20, 0, 'RANDALL', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(351, '851785542618', 'PELUCHE RANA MOÑO', '350.0', '135.0', 0, 20, 0, 'MOÃ‘O', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(352, '851785281920', 'PELUCHE RANA IPOPOTAMO PACHONES', '250.0', '115.0', 0, 20, 0, 'PACHONS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(353, '7500123121901', 'PELUCHE PESCADITO BLUPIZ GRANDE ', '290.0', '106.0', 0, 20, 0, 'BLUPIZ', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(354, '2011091340676', 'PELUCHE JIRAFA BARRICHONCHIS EX GRANDE ', '300.0', '125.0', 0, 20, 0, 'BARRI', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(355, '7500124576427', 'PELUCHE BORREGUITA LUKINA C/ SONIDO ', '260.0', '116.0', 0, 20, 0, 'LUKINA', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(356, '2011091740681', 'PELUCHE VACA RUMMYNA ', '250.0', '106.0', 0, 20, 0, 'RUMMYNA', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(357, '2011091540663', 'PELUCHE LEON PUNKYS GRANDE ', '250.0', '106.0', 0, 20, 0, 'PUNKYS', 24, '2013-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(358, '7500247172513', 'MOCHILA BOLSO MINNIE C/DESCUENTO $350 A$250', '250.0', '180.0', 0, 25, 0, 'B-MINNIE', 27, '2013-06-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(359, '7501091817094', 'BOLSA EX JUMBO DIPAK TODA OCACION ', '57.0', '23.0', 0, 1, 0, 'EX', 22, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(360, '7501091817070', 'BOLSA JUMBO DIPAK TODA OCACION', '39.0', '22.0', 0, 1, 0, 'B-DIPAK', 22, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(361, '00836', 'SET DE SIRENITA', '150.0', '65.0', 0, 22, 0, 'SET-SIRENI', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(362, '00837', 'LIBRETA HELLO KITTY', '110.0', '50.0', 0, 22, 0, 'LIBRETA', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(363, '00838', 'DIARIO DISTROLLER', '79.0', '35.0', 0, 22, 0, 'DIARIOS', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(364, '00839', 'DIARIO CON PLUMA ', '79.0', '35.0', 0, 22, 0, 'DIAR/PLU', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(365, '00840', 'SET DE LAPICEROS DE GEL', '89.0', '43.0', 0, 22, 0, 'SET/GEL', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(366, '00841', 'SET DIARIO C/ PLUMA DIFERENTES PERSONAJES ', '145.0', '65.0', 0, 22, 0, 'SET-', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(367, '00842', 'SET C/ ASA DIFERENTES PERSONAJES ', '165.0', '75.0', 0, 22, 0, 'SET-ASA', 27, '2013-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(368, '1443', 'CAJITA DE REGALOS THE CAT  MINI', '27.0', '12.0', 6, 1, 0, 'THE CAT-MN', 26, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 72, 0, 0, 0, '', 0),
(369, '00844', 'CAJITA FOREVER AND ALWAYS CHICA', '35.0', '10.0', 0, 1, 0, 'FOREVER-CH', 23, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(370, '00845', 'MOCHILA BOLSO POLO C/DESCUENTO $250 A $199', '199.0', '130.0', 1, 25, 0, 'POLO', 27, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, '', 0),
(371, '00846', 'LAPICEROS DE GEL', '7.0', '10.0', 0, 22, 0, 'GEL', 26, '2013-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(372, '00847', 'MOCHILA DE RUEDAS C/RUEDAS $400 A $350', '350.0', '200.0', 0, 25, 0, 'M-PRIMARIA', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(373, '00848', 'LONCHERA TERMICA ANGRY C/DESCUENTO $310 A $200', '200.0', '180.0', 0, 25, 0, 'LONCHSS', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(374, '00849', 'MOCHILA ANGRY BIRDS C/ DESCUENTO $350 A$300', '300.0', '180.0', 0, 25, 0, 'M-ANGRY', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(375, '00850', 'MOCHILA RUEDAS KINDER', '150.0', '70.0', 0, 25, 0, 'M-KINDER', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(376, '00851', 'MOCHILA DOBLE CIERRE (LZL) ', '250.0', '110.0', 4, 25, 0, 'ECO', 27, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, '', 0),
(377, '00852', 'PELUCHE POCOYO MEDIANO', '180.0', '85.0', 0, 20, 0, 'P-POCOYO', 24, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(378, '00853', 'PELUCHE MI VILLANO FAVORITO ', '200.0', '80.0', 0, 20, 0, 'VILLANO', 24, '2013-08-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(379, '00854', 'GANCHOS EXHIBIDORES ', '10.0', '5.0', 167, 23, 0, 'G-EXHIB', 0, '2013-09-14 00:00:00', '', 0, 0, NULL, NULL, 0, 835, 0, 0, 0, '', 0),
(380, '00855', 'MALLAS EXHIBIDORAS', '16000.0', '10000.0', 0, 23, 0, 'R-EXHIBI', 0, '2013-09-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(381, '6940350806638', 'PELUCHE OSO TED SUPER ', '870.0', '320.0', 0, 20, 0, 'P-SUPER-TED', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(382, '6940350806775', 'PELUCHE OSA CON CRIA SUPER ', '1400.0', '480.0', 0, 20, 0, 'CRIA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(383, '8066', 'PELUCHE OSO TEDY SUPER', '400.0', '140.0', 0, 20, 0, 'P-TED- SUPR', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(384, '6940350805884', 'PELUCHE OSO ROSA CON MOÑO', '200.0', '65.0', 0, 20, 0, 'P-OSOMOÃ‘O', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(385, '6940350806010', 'PELUCHE OSO ROSA CON MOÑO CHICO', '130.0', '45.0', 0, 20, 0, 'P-OSO-CH', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(386, '00857', 'PELUCHE SUAVE BEBE UNICORNIO JUMBO', '700.0', '330.0', 2, 20, 0, 'SUAVE', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, '', 0),
(387, '00858', 'PELUCHE BOB ESPONJA GRANDE', '350.0', '220.0', 0, 20, 0, 'P-BOB', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(388, '68131', 'PELUCHE PANDA MOÑO ROJO GRANDE ', '600.0', '185.0', 0, 20, 0, 'P-PANDA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(389, '00859', 'PELUCHE OSA CON MOÑO GRANDE', '989.0', '500.0', 0, 20, 0, 'P-ROSA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(390, '00860', 'PELUCHE CHANGO SUPER ', '350.0', '100.0', 0, 20, 0, 'P-CHANGO', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(391, '00861', 'PELUCHE RENO NAVIDEÑO GRANDE', '415.0', '188.0', 0, 20, 0, 'RENO', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(392, '6041', 'PELUCHE PERRO OREJON CON MOÑO SUPER', '900.0', '280.0', 0, 20, 0, 'P-OREJON', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(393, '6940350806102', 'PELUCHE PERRO RESORTIN', '250.0', '85.0', 0, 20, 0, 'P-RESORTIN', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(394, '6940350805976', 'PELUCHE PERRO ROSA OREJON', '250.0', '80.0', 0, 20, 0, 'PERRO-ROS', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(395, '6940350806089', 'PELUCHE OSO BLANCO CON MOÑO', '230.0', '75.0', 0, 20, 0, 'P-BLANK', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(396, '00862', 'PELUCHE ZOMBIE JUMBO ', '350.0', '245.0', 0, 20, 0, 'ZOMBIE', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(397, '00863', 'PELUCHE LOS MINION ', '280.0', '80.0', 0, 20, 0, 'P-MINION', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(398, '00864', 'PELUCHE LOS MINIONS 1', '200.0', '80.0', 0, 20, 0, 'P-MINIONS', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(399, '00865', 'PELUCHE MINIUMS MEDIANO', '380.0', '130.0', 0, 20, 0, 'MINIUM-C', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(400, '00866', 'PELUCHE SULLY MONTER UNIVERSE SUPER', '500.0', '300.0', 0, 20, 0, 'P-MONSTER-S', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(401, '00867', 'PELUCHE SULLY MONSTER UNIVERCITY MED', '350.0', '175.0', 0, 20, 0, 'P-MONSTER', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(402, '7500202106911', 'PELUCHE PERRO CHOMPY CON SONIDO ', '350.0', '139.0', 1, 20, 0, 'CHOMPY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 139, 0, 0, 0, '', 0),
(403, '00869', 'PELUCHE GUDY Y YESSI ( VAQUEROS)', '260.0', '140.0', 0, 20, 0, 'P-GUDY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(404, '00870', 'PELUCHE BUU C/ SONIDO ', '250.0', '145.0', 0, 20, 0, 'P-BUU', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(405, '00871', 'PELUCHE JAK ', '300.0', '120.0', 0, 20, 0, 'P-JAK', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(406, '7500107452236', 'PELUCHE PERRO BOMBY C/ SONIDO', '250.0', '96.0', 0, 20, 0, 'P-BOMBY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(407, '7500107451727', 'PELUCHE CONEJA BOMBY C/SONIDO ', '270.0', '96.0', 0, 20, 0, 'P-BOMB', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(408, '00872', 'PELUCHE OSO MAI-TOI CHICO', '199.0', '70.0', 0, 20, 0, 'P-MAI', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(409, '7509008269240', 'PELUCHE OSO SPONCHIS MED', '200.0', '77.0', 0, 20, 0, 'P-SPONC', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(410, '2012070280013', 'PELUCHE OSO CUADRIKOS GDE ', '240.0', '96.0', 0, 20, 0, 'P-CUADRI', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(411, '851785281746', 'PELUCHE OSO WOODY TOYS CHICO', '180.0', '67.0', 0, 20, 0, 'P-WOODY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(412, '7500107156820', 'PELUCHE ELEFANTE ELIZ GRANDE C/ SONIDO', '350.0', '125.0', 0, 20, 0, 'P-ELIZ', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(413, '7500713110117', 'PELUCHE PERRITA TRISKIS MED', '200.0', '77.0', 0, 20, 0, 'P-TRIS', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(414, '7500110286484', 'PELUCHE PERRO CACHORRYKY MED', '199.0', '57.0', 0, 20, 0, 'P-CACHORRY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(415, '7500140872787', 'PELUCHE OSOS BEBUKOS GRANDES', '299.0', '139.0', 0, 20, 0, 'BEBUKOS', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(416, '7506223706000', 'PELUCHE MINNIE CLASICA MED', '300.0', '145.0', 0, 20, 0, 'P-CLAS', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(417, '7500247023525', 'PELUCHE POOH SUDADERA MED', '300.0', '145.0', 0, 20, 0, 'P-SUDADERA', 0, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(418, '7500247051481', 'PELUCHE POOH BATA MED', '300.0', '145.0', 0, 20, 0, 'P-BATA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(419, '7500247051504', 'PELUCHE EEYORE BATA MED ', '300.0', '145.0', 0, 20, 0, 'P-BATTA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(420, '00874', 'PELUCHE PEPA GRANDE', '300.0', '120.0', 0, 20, 0, 'PEPA-G', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(421, '00875', 'COJIN CORAZON LOVE GRAND POLIESFERA', '218.0', '70.0', 0, 20, 0, 'LOVV', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(422, '00876', 'COJIN KITY MEDIANA ', '250.0', '85.0', 0, 20, 0, 'C-KITTY', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(423, '00877', 'COJIN SOY LUNA', '250.0', '100.0', 0, 20, 0, 'LUNA', 24, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(424, '00878', 'COJIN NEGRO TRIMANIX CHICO', '180.0', '65.0', 0, 20, 0, 'TRIMA', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(425, '00879', 'COJIN NEGRO TRIMANIX MEDIANO', '250.0', '95.0', 0, 20, 0, 'C-COLORS', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(426, '00880', 'COJIN CUBO TRIMANIX GRANDE ', '399.0', '215.0', 0, 20, 0, 'CUBO', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(427, '00881', 'PELUCHE MI VILLANO FAVORITOO', '350.0', '110.0', 0, 20, 0, 'P-VILLANO', 23, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(428, '00882', 'LAMPARA DE LAVA Y GLITTER', '350.0', '125.0', 1, 22, 0, 'GLITTER', 27, '2013-10-19 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, '', 0),
(429, '00883', 'PERGAMINO NEGRO MEDIANO', '250.0', '185.0', 1, 22, 0, 'PER', 23, '2013-10-20 00:00:00', '', 0, 0, NULL, NULL, 0, 185, 0, 0, 0, '', 0),
(430, '00884', 'RELOJ UNISEX', '250.0', '65.0', 0, 23, 0, 'RELOJJ', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(431, '00885', 'MOÑO DE TIRA GRANDE', '25.0', '2.0', 0, 1, 0, 'MOÃ‘O-J', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(432, '00886', 'BRAZALETE DAMA BRIYITT', '100.0', '20.0', 0, 23, 0, 'BRIYITT', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(433, '00887', 'CARRO MUSIC CAR', '390.0', '160.0', 0, 23, 0, 'CAR', 27, '2013-10-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(434, '00888', 'MARIQUERAS RUZ DIFERENTES MODELOS', '200.0', '100.0', 0, 25, 0, 'MARYQ', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(435, '00889', 'LAPICERA (EKO)', '78.0', '25.0', 0, 25, 0, 'EKO', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(436, '00890', 'SET DE COLORES CHICO', '78.0', '35.0', 0, 22, 0, 'SET-CHI', 27, '2013-12-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(437, '00891', 'BOLSITO PELUCHE GATO LENTEJUELAS', '140.0', '50.0', 4, 23, 0, 'B-LENT', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(438, '00892', 'BOLSITO ANIMALES C/ LENTEJUELA', '150.0', '65.0', 4, 22, 0, 'BOL', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 260, 0, 0, 0, '', 0),
(439, '00893', 'MARIQUERA DAMA', '200.0', '90.0', 0, 23, 0, 'M-DAMA', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(440, '00894', 'CAJA PARA COLLAR ', '40.0', '16.0', 8, 1, 0, 'JOYERIA', 26, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 128, 0, 0, 0, '', 0),
(441, '00895', 'BOLSA DE REGALOS LOVE MOONS MINI', '18.0', '3.0', 0, 1, 0, 'LOVEE', 26, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(442, '00896', 'BOLSO MICHAEL KORS ', '280.0', '140.0', 9, 23, 0, 'B-MICHAEL', 27, '2013-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1260, 0, 0, 0, '', 0),
(443, '00897', 'MUÑECAS MOXIE GIRLS', '87.0', '27.0', 0, 26, 0, 'MOXIE', 26, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(444, '00898', 'CINTURON CABALLERO SALVADORE FERAGAMO', '300.0', '150.0', 7, 23, 0, 'CINNTO', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 1650, 0, 0, 0, '', 0),
(445, '00899', 'CARTERA CABALLERO BY ALBA', '200.0', '65.0', 1, 23, 0, 'BY-ALBA', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 65, 0, 0, 0, '', 0),
(446, '00900', 'BARNIS DE UÑAS', '25.0', '13.0', 1, 23, 0, 'BARNIS', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 13, 0, 0, 0, '', 0),
(447, '00901', 'RUBOR BLUSH SHE', '38.0', '14.0', 0, 23, 0, 'BLUSH', 27, '2013-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(448, '00903', 'PULSERA DAMA1', '79.0', '8.0', 0, 23, 0, 'PULSER', 27, '2013-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(449, '00902', 'PULSERA DAMA 2', '30.0', '7.0', 12, 23, 0, 'PUL-2', 27, '2013-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 84, 0, 0, 0, '', 0),
(450, '00904', 'CARTERA DAMA XOXO COLLECTION', '200.0', '130.0', 1, 23, 0, 'XOX', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, '', 0),
(451, '00905', 'MONEDERO YAALI', '100.0', '21.0', 0, 23, 0, 'YAAALI', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(452, '00906', 'COJIN DE4 MANTA ', '110.0', '50.0', 0, 20, 0, 'CILIND', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(453, '00907', 'COJIN PAREJA MICKEY MOUSE', '450.0', '220.0', 0, 20, 0, 'C-MICK', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(454, '2012703581494', 'PELUCHE PERRO LADRILLITO SENTADO MEDIANO ', '140.0', '51.0', 0, 20, 0, 'LADRILL', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(455, '2011111411218', 'PELUCHE OSO CREPY MED', '197.0', '77.0', 0, 20, 0, 'CREPY', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(456, '7500124573112', 'PELUCHE PERRO KOKETO C/ SONIDO ', '250.0', '99.0', 0, 20, 0, 'KOKET', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(457, '7500107432122', 'PELUCHE PERRO HUESOKO GRANDE', '250.0', '106.0', 0, 20, 0, 'HUESOKO', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(458, '090211', 'PELUCHE OSO MELOSO GRANDE ', '250.0', '106.0', 0, 20, 0, 'MELO', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(459, '7500247177563', 'PELUCHE SULY DE MONSTERS UNIVERSITY', '250.0', '145.0', 0, 20, 0, 'MONSTER', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(460, '6940', 'COJIN SIRENA GRANDE', '350.0', '140.0', 0, 20, 0, 'SIRENA', 27, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(461, '00908', 'COJIN  KITY GRANDE ', '360.0', '140.0', 2, 20, 0, 'KITT', 26, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, '', 0),
(462, '00910', 'PELUCHE SPIDERMAN MARIO PANDA CUPKEY POLIESFERA ', '218.0', '90.0', 7, 20, 0, 'POLI', 24, '2013-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 630, 0, 0, 0, '', 0),
(463, '7501091851296', 'BOLSA EX JUMBO DIPAK NAVIDAD', '57.0', '23.0', 0, 1, 0, 'EX-NAVIDAD', 22, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(464, '00911', 'MUÑECA BOO', '140.0', '75.0', 0, 20, 0, 'M-BOO', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(465, '00912', 'MUÑECO SULIBAN', '220.0', '130.0', 0, 20, 0, 'SULY', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(466, '00913', 'PELUCHE PEPA Y PAPA CERDITO CHICA', '120.0', '40.0', 0, 20, 0, 'PEPAA', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(467, '00914', 'ALMOHADA MINIUMS SUPER', '270.0', '110.0', 0, 20, 0, 'AL-MINIU', 26, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(468, '00915', 'PELUCHE MINIUNS SUPER', '400.0', '190.0', 0, 20, 0, 'SUPER', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(469, '6952938368001', 'PELUCHE OSO MOÑO ROJO GRANDE', '300.0', '95.0', 0, 20, 0, 'M-ROJO', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(470, '6940350806713', 'PELUCHE OSO BRANDONN C/ MOÑO', '360.0', '90.0', 0, 20, 0, 'BRAN', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(471, '00916', 'PELUCHE KITY GRANDE', '250.0', '85.0', 0, 20, 0, 'P-KITY', 24, '2013-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(472, '00191', 'CAJA DE REGALO EXPLOWORLD MEDIANA', '49.0', '20.0', 0, 1, 0, 'EXPLOW', 28, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(473, '00918', 'BOLSA COUCHE MEDIANA GRABA IMAGEN', '27.0', '12.0', 89, 1, 0, 'COUCHE-M', 21, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 1068, 0, 0, 0, '', 0),
(474, '00919', 'BOLSA KAMKIO GRANDE ', '22.0', '10.0', 0, 1, 0, 'KAM-GRANDE', 27, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(475, '00920', 'BOLSA KAMKIO CHICA ', '25.0', '8.0', 0, 1, 0, 'KAM-CHICA', 26, '2014-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(476, '00921', 'RELOJ TACTIL CABALLERO NEGRO Y BLANCO', '240.0', '45.0', 0, 23, 0, 'TACTIL', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(477, '00922', 'BRAZALETE DAMA PLATA Y DORADO', '145.0', '100.0', 0, 23, 0, 'BRAZ', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(478, '00923', 'CARTERA LOI WOOPS', '149.0', '50.0', 0, 23, 0, 'LOIWW', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(479, '00924', 'COLLAR FASHION DAMA', '70.0', '8.0', 0, 23, 0, 'FASHION', 27, '2014-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(480, '00925', 'PELUCHE OSO BRANDON SUPER IMPORTACION', '3500.0', '1400.0', 0, 20, 0, 'P-IMPORT', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(481, '00927', 'PELUCHE PERRO LOVE SUPER', '2000.0', '950.0', 0, 20, 0, 'P-BUFF', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(482, '00928', 'PELUCHE OSA C/ VESTIDO SUPER ', '900.0', '350.0', 0, 20, 0, 'P-VESTID', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(483, '6952938385817', 'PELUCHE OSA C/ VESTIDO GRANDE ', '699.0', '260.0', 0, 20, 0, 'P-VESTI', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(484, '00929', 'PELUCHE PERRO CORAZON ', '900.0', '280.0', 0, 20, 0, 'P-CORAZON', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(485, '00930', 'COJIN CUADRADO EXPLOWORT', '370.0', '149.0', 1, 20, 0, 'EXPLO', 26, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 149, 0, 0, 0, '', 0),
(486, '1931', 'COJIN GRANDE PANDA CERDITO Y GATO', '200.0', '65.0', 12, 20, 0, 'C-KIT', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 780, 0, 0, 0, '', 0),
(487, '6940350806683', 'PELUCHE OSO MOÑO CHICO', '199.0', '60.0', 0, 20, 0, 'P-MOÃ‘', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(488, '6952938368100', 'PELUCHE OSO CORAZON ROSA GRANDE ', '350.0', '95.0', 0, 20, 0, 'P-CORAZ', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(489, '00933', 'PELUCHE BELLO UNICORNIO JUMBO', '750.0', '350.0', 2, 20, 0, 'BELLO-UNI', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 700, 0, 0, 0, '', 0),
(490, '6940350806287', 'PELUCHE PERRO CORAZON LOVE YOU', '300.0', '90.0', 0, 20, 0, 'P-LOV', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(491, '6940350885916', 'PELUCHE OSOS BUFANDA', '250.0', '75.0', 0, 20, 0, 'BUF', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(492, '6940350805792', 'PELUCHE OSO PARCHE C/ BUFANDA', '280.0', '75.0', 0, 20, 0, 'P-PARCHE', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(493, '6952938373654', 'PELUCHE OSO CORAZON TRIPLE', '300.0', '100.0', 0, 20, 0, 'P-TRIPLE', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(494, '6952938373586', 'PELUCHE OSO CORAZON GRIS LOVE YUO', '300.0', '95.0', 0, 20, 0, 'P-GRIS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(495, '6940350805891', 'PELUCHE OSO CORAZON SULEET', '250.0', '85.0', 0, 20, 0, 'P-SULEET', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(496, '00621', 'ESTUCHE  DE LAPICEROS', '79.0', '32.0', 0, 23, 0, 'ESTUCHE', 27, '2014-11-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(497, '00917', 'PELUCHE OSA DORMILONA SUPER', '1000.0', '430.0', 0, 20, 0, 'OSA-DORMI', 24, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(498, '00926', 'PELUCHE OSO C/ MOÑO SUPER ', '2400.0', '1180.0', 0, 20, 0, 'P-MOÃ‘O-S', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(499, '6940350806027', 'PELUCHE PERRO ROSA ', '230.0', '80.0', 0, 20, 0, 'P-ROSS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(500, '6952938385862', 'PELUCHE PERRO SNOPY', '250.0', '65.0', 0, 20, 0, 'P-SNOPY', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(501, '6952938378369', 'PELUCHE PERRITA FRENCHS', '390.0', '120.0', 0, 20, 0, 'P-FRENCH', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(502, '6940350806980', 'PELUCHE OSO CORAZON LOVE GRANDE ', '450.0', '120.0', 0, 20, 0, 'LOV', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(503, '6940350806577', 'PELUCHE OSO GLOBO KISS ME', '400.0', '110.0', 0, 20, 0, 'KISS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(504, '00932', 'PELUCHE OSA VESTIDO MEDIANA ', '350.0', '140.0', 0, 20, 0, 'P-VESTIDO', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(505, '00396', 'PELUCHE OSO BRANDON IMPORTACION', '650.0', '190.0', 0, 20, 0, 'P-BRAN', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(506, '6940350806355', 'PELUCHE PERRO C/ HUESO GRANDE', '400.0', '120.0', 0, 20, 0, 'P-HUESO', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(507, '6952938386401', 'PELUCHE OSO CORAZON I LOVE YOU GRANDE', '350.0', '95.0', 0, 20, 0, 'P-I.LOV', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(508, '00934', 'PELUCHE OSOS PATONES GRANDE', '470.0', '190.0', 0, 20, 0, 'PATONES', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(509, '610059970119', 'PELUCHE OSO C/ MOÑO CHICO', '189.0', '75.0', 0, 20, 0, 'MOÃ‘', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(510, '6121', 'PELUCHE OSA CORAZON GLITER GRANDE', '1000.0', '400.0', 0, 20, 0, 'CORAZ', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(511, '610059968017', 'PELUCHE OSITA CORAZON LOVE CHICA', '238.0', '85.0', 0, 20, 0, 'LOOV', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(512, '610059966815', 'PELUCHE PERRO CORAZON LOVE CHICA ', '250.0', '89.0', 0, 20, 0, 'LOV-C', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(513, '6904085800033', 'PELUCHE OSO TEDDY JASPIA GRANDE', '400.0', '150.0', 0, 20, 0, 'JASPIA', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(514, '848931080629', 'PELUCHE OSITO CORAZON BESOS Y ABRASOS ', '228.0', '79.0', 0, 20, 0, 'BESOS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(515, '610059761281', 'PELUCHE OSITA CORAZON MINI', '130.0', '49.0', 0, 20, 0, 'OSIT-MINI', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(516, '610059967911', 'PELUCHE OSITA CORAZON MUSICAL', '270.0', '115.0', 0, 20, 0, 'MUSI-1', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(517, '848931085099', 'PELUCHE OSO LISTON CHICO', '187.0', '62.0', 0, 20, 0, 'P-LISTON', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(518, '610059739686', 'PELUCHE OSITO CORAZON LOVE', '130.0', '45.0', 0, 20, 0, 'LOVVE', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(519, '848931000214', 'PELUCHE ANIMALES DE PANA ', '231.0', '69.0', 0, 20, 0, 'PANA', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(520, '693379113008', 'PELUCHE OSITO DORMILON MINI', '120.0', '44.0', 0, 20, 0, 'DORMI', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(521, '00935', 'PELUCHE OSITA ESTRELLA MUSICAL', '350.0', '109.0', 0, 20, 0, 'P-ESTRELLA', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(522, '610059620823', 'PELUCHE OSO PATAS LARGAS ', '200.0', '75.0', 0, 20, 0, 'PATAS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(523, '610059970416', 'PELUCHE OSITA C/ SOMBRERO ', '240.0', '85.0', 0, 20, 0, 'SOMBRERO', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(524, '610059636008', 'PELUCHE PERRITA FRENCHS CHICA', '300.0', '99.0', 0, 20, 0, 'FRENCHS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(525, '610059970218', 'PELUCHE OSITA C/ SOMBRERO MUSICAL', '220.0', '105.0', 0, 20, 0, 'MUSI-2', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(526, '610059360606', 'PELUCHE OSO CORAZON LOVE YOU MUSICAL ', '350.0', '119.0', 0, 20, 0, 'MUSI-3', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(527, '00936', 'PELUCHE OSITO CHINOS BLANCO', '170.0', '50.0', 0, 20, 0, 'P-CHIN', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(528, '00937', 'COJIN CORAZON ROSA Y ROJO LOVE', '199.0', '80.0', 1, 20, 0, 'C-ROSA', 26, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, '', 0),
(529, '845263020668', 'COJIN FLOR CUADRADO', '250.0', '99.0', 0, 20, 0, 'FLOR', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(530, '610059026410', 'COJIN CUADRADO CORAZON (MI ANGELITO )', '230.0', '99.0', 0, 20, 0, 'TQM', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(531, '7500247023532', 'PELUCHE EYORE SUDADERA ', '300.0', '145.0', 0, 20, 0, 'SUDADE', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(532, '7506223743838', 'PELUCHE EYORE PONCHO MED', '300.0', '145.0', 0, 20, 0, 'P-PONCH', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(533, '7506223705980', 'PELUCHE MICKEY CLASICO MED', '250.0', '145.0', 0, 20, 0, 'CLAS', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(534, '7506223799637', 'PELUCHE EYORE CORAZON TE AMO', '300.0', '145.0', 0, 20, 0, 'EYO-TEAMO', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(535, '7506223799620', 'PELUCHE POOH CORAZON TE AMO', '300.0', '145.0', 0, 20, 0, 'POOH-TE AMO', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(536, '2009090910778', 'PELUCHE PERRO STARKY GRANDE', '350.0', '129.0', 0, 20, 0, 'STARKY', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(537, '7500107430128', 'PELUCHE OSO SILVER CORAZON GRANDE', '300.0', '125.0', 0, 20, 0, 'P-SILVER', 24, '2014-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(538, '2010055260326', 'PELUCHE OSO BOGGY BABY GRANDE ', '300.0', '116.0', 0, 20, 0, 'P-BOGGY', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(539, '2012703581357', 'PELUCHE PERRO LADRILLITO ECHADO MED', '189.0', '58.0', 0, 20, 0, 'LADRILLIT', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(540, '00938', 'MUÑECA KIMI KOKO PATAS LARGAS ', '250.0', '141.0', 0, 20, 0, 'KIMI-G', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(541, '00939', 'MUÑECA LILI MEDIANA', '310.0', '105.0', 0, 20, 0, 'LILI', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(542, '00940', 'MUÑECA  LILI CHICA', '210.0', '85.0', 0, 20, 0, 'LILII', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(543, '00941', 'ALMOHADA C/ MOÑO LARGA', '300.0', '100.0', 0, 20, 0, 'AL-MOÃ‘O', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(544, '00942', 'MUÑECA MOCHILA MONSTER', '280.0', '120.0', 0, 20, 0, 'M-MONST', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(545, '00943', 'MUÑECA NIÑA VILLANO LUJO', '380.0', '190.0', 0, 20, 0, 'NIÃ‘A-LUJ', 24, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(546, '00944', 'RELOJ GI COLLECTIONS ', '210.0', '90.0', 1, 23, 0, 'R-GI', 27, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 90, 0, 0, 0, '', 0),
(547, '00945', 'RELOJ EPOZZ 2', '180.0', '70.0', 0, 23, 0, 'EPOZZ-2', 27, '2014-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(548, '07', 'GLOBO ESTRELLA GRANDE', '130.0', '40.0', 7, 30, 0, 'ESTRE', 26, '2014-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, '', 0),
(549, '00946', 'CAJITA PAPEL CORRUGADO CHICA AMARILLA', '39.0', '10.0', 0, 1, 0, 'CORRU-1', 29, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(550, '00947', 'CAJITA PAPEL CORRUGADO ( 38 )', '38.0', '10.0', 0, 1, 0, 'CORRU-2', 29, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(551, '00948', 'CAJA DE REGALOS LUNARES 2398 CHICA', '58.0', '30.0', 0, 1, 0, '2398-C', 27, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(552, '0700', 'MINIATURA ARBOL DE NAVIDAD', '60.0', '30.0', 0, 27, 0, 'ARBOL', 26, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(553, '0010', 'HOJA DECORADA ', '2.0', '1.0', 70, 1, 0, 'HOJA', 26, '2014-03-01 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(554, '00949', 'CAJA DE REGALOS LUNARES 2398 GDE', '105.0', '50.0', 0, 1, 0, '2398-G', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(555, '00950', 'CAJA DE REGALOS LUNARES 2398 MEDIANA', '89.0', '40.0', 0, 1, 0, '2398-M', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(556, '00951', 'CAJA DE REGALOS 2478  XG', '170.0', '60.0', 0, 1, 0, '2478-XG', 29, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(557, '1152', 'CAJA DE REGALOS THE CAT CHICA', '39.0', '19.0', 6, 1, 0, 'THE CAT-CH', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 114, 0, 0, 0, '', 0),
(558, '00953', 'CAJA DE REGALOS PARIS MEDIANA', '100.0', '30.0', 1, 1, 0, '2478-M', 26, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(559, '5414666010016', 'PERFUME ACE OF SPADES CABALLERO', '400.0', '200.0', 0, 24, 0, 'P-SPA', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(560, '895589100858', 'PERFUME L.A.DREAMS DAMA', '300.0', '150.0', 0, 24, 0, 'P-DREA', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(561, '994206120320', 'PERFUME SEX IN THE CITY 2 DAMA', '200.0', '100.0', 0, 24, 0, 'SEX-1', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(562, '8002135046412', 'PERFUME FERRARI CABALLERO', '450.0', '250.0', 0, 24, 0, 'P-FERRA', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(563, '715387780314', 'PERFUME BENETTON SPORT CABALLERO ', '450.0', '200.0', 0, 24, 0, 'P-BENETT', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(564, '5425017732884', 'PERFUME CUBA CABALLERO', '100.0', '50.0', 0, 24, 0, 'P-CUBA', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(565, '3137370301356', 'PERFUME NINA RICCI DAMA', '450.0', '250.0', 0, 24, 0, 'P-NINA', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(566, '895589200015', 'PERFUME BE DAZZLED DAMA ', '450.0', '200.0', 0, 24, 0, 'P-DAZZ', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(567, '00954', 'PERFUME SEX IN THE CITY DAMA ( SET)', '500.0', '250.0', 0, 24, 0, 'P-SET', 27, '2014-03-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(568, '00961', 'RELOJ DESPERTADOR DIFERENTES MODELOS ', '70.0', '25.0', 0, 22, 0, 'DESP-D', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(569, '00962', 'RELOJ DESPERTADOR C/ CAMPANA ', '150.0', '65.0', 0, 22, 0, 'R-CAM', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(570, '00955', 'PORTA RETRATO LOVE REDONDO', '75.0', '20.0', 0, 22, 0, 'P-5*7', 26, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(571, '00956', 'PELUCHE HOMBRE ARAÑA GRANDE ', '400.0', '220.0', 0, 20, 0, 'P-ARAÃ‘A', 24, '2014-03-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(572, '00957', 'MINIATURA MINI VAQUITA', '45.0', '22.0', 0, 27, 0, 'M-VAQ', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(573, '00958', 'BOLSA COLORS CUMPLEAÑOS MEDIANA ', '37.0', '20.0', 25, 1, 0, 'COLORS-M2', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 500, 0, 0, 0, '', 0),
(574, '00959', 'BOLSA COUCHE JUMBO GRABA IMAGEN', '54.0', '26.0', 0, 1, 0, 'COUCHE-J', 21, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(575, '00960', 'BOLSA REYES JUMBO', '59.0', '20.0', 4, 1, 0, 'REYES -JUM', 26, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, '', 0),
(576, '00963', 'BOLSA COUCHE CHICA GRABA IMAGEN', '17.0', '7.0', 2, 1, 0, 'COUCHE-CH', 21, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 14, 0, 0, 0, '', 0),
(577, '5414666009973', 'PERFUME PURE BLACK CABALLERO ', '300.0', '100.0', 0, 24, 0, 'PURE', 27, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(578, '00964', 'AGENDA P/ CABALLERO ', '150.0', '70.0', 0, 23, 0, 'AGE', 27, '2014-03-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(579, '1015', 'TIEMPO', '10.0', '5.0', 0, 19, 0, 'TIE', 29, '2014-03-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(580, '00965', 'BOLSA CHICA ELEGANS', '15.0', '4.0', 0, 1, 0, 'B-GS', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(581, '00987', 'PELUCHE PERRO NAVIDEÑO MUSICAL', '199.0', '80.0', 0, 20, 0, 'P-NAVI', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(582, '00988', 'PELUCHE LEONSITO BB', '110.0', '40.0', 0, 20, 0, 'LEON-SIT', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(583, '1977', 'BOTELLA LECHERA C/ DULCE', '135.0', '61.0', 10, 27, 0, 'B-BOTELL', 26, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 610, 0, 0, 0, '', 0),
(584, '4364', 'BOLSA CRAF MEDIANA', '27.0', '10.0', 0, 1, 0, 'B-CRAF', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(585, '00967', 'BOLSA ROMBOS Y CORAZONES GRANDE ', '31.0', '14.0', 0, 1, 0, 'ROMBOS', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(586, '00968', 'BOLSA MEDIANA EKO MODELOS ', '14.0', '6.0', 0, 1, 0, 'B-MED', 21, '2014-05-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(587, '00969', 'BOLSA LISA C/ PAPEL CORRUGADO ', '24.0', '9.0', 0, 1, 0, 'B-LISA', 21, '2014-05-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(588, '7501091899649', 'BOLSA CELEBRATE  NOVIAS GRANDE', '29.0', '12.0', 0, 1, 0, 'B-CELEB-G', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(589, '7501091899632', 'BOLSA CELEBRATE MEDIANA TODA OCACIOIN', '24.0', '10.0', 0, 1, 0, 'B-CELEB-M', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(590, '6475', 'BOLSA REYES EX GRANDE', '75.0', '20.0', 11, 1, 0, 'BOMSA-M', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, '', 0),
(591, '742099005039', 'BOLSA SUICH GRANDE ', '28.0', '10.0', 0, 1, 0, 'B-SUICH', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(592, '00970', 'BOLSA DREAMS ART GRANDE', '29.0', '10.0', 0, 1, 0, 'DREAMS-G', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(593, '013429789548', 'BOLSA DREAMS MEDIANA ', '20.0', '8.0', 0, 1, 0, 'DREAMS-M', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(594, '4023', 'BOLSA CRAF GRANDE', '29.0', '10.0', 0, 1, 0, 'B-COLOR', 21, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(595, '7501091826072', 'BOLSA DIPAK JUMBO FLORES', '39.0', '15.0', 0, 1, 0, 'B-FLOR-J', 22, '2014-05-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(596, '00973', 'BOLSA D\"NOVAC GRANDE ', '38.0', '17.0', 0, 1, 0, 'NOVAC-G', 21, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(597, '00974', 'BOLSA DIPAK ESPECIAL  NAVIDAD GRANDE ', '28.0', '15.0', 7, 1, 0, 'ESPEC', 22, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 105, 0, 0, 0, '', 0),
(598, '00975', 'BOLSA DIPAK ESPECIAL MEDIANA', '21.0', '11.0', 0, 1, 0, 'ESPE-M', 22, '2014-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(599, '00976', 'BOLSA BUTIC IMPRESIONES MEDIANA ', '14.0', '11.0', 1, 1, 0, 'B-COLORS', 26, '2014-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 11, 0, 0, 0, '', 0),
(600, '00977', 'RELOJ CK- DAMA', '300.0', '95.0', 0, 23, 0, 'BRAZZ', 27, '2014-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(601, '00978', 'BRAZALETE DE PIEDRERIA', '250.0', '150.0', 0, 23, 0, 'PIEDRE', 27, '2014-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(602, '00980', 'CARTERA PARIS CIERRE', '198.0', '75.0', 0, 23, 0, 'PROM', 27, '2014-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(603, '00981', 'CARTERA CABALLERO MARCAS', '200.0', '55.0', 8, 23, 0, 'PRO-2', 27, '2014-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, '', 0),
(604, '7501917250210', 'PELUCHE MICKEY JARDINERO 16\"', '200.0', '105.0', 0, 20, 0, 'JAR-16\"', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(605, '7501917211532', 'PELUCHE TIGGER D STANDART', '300.0', '105.0', 0, 20, 0, 'TIG-D', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(606, '00989', 'PELUCHE BORREGUINA PATAS LARGAS', '110.0', '50.0', 0, 20, 0, 'BORRE', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(607, '00990', 'PELUCHE CERDITA PIG GRANDE', '350.0', '140.0', 0, 20, 0, 'PIG', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(608, '00971', 'BOLSA COUCHE GRANDE GRABA IMAGEN', '31.0', '18.0', 73, 1, 0, 'COUCHE-G', 21, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 1314, 0, 0, 0, '', 0),
(609, '7501917259275', 'PELUCHE MINNIE DESFILE 16\"', '250.0', '105.0', 0, 20, 0, 'DESF-16\"', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(610, '7501917237853', 'PELUCHE PLUTO HIGH SCHOOL MUSICA D', '250.0', '110.0', 0, 20, 0, 'HIGH-D', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(611, '75019', 'PELUCHE DAFFY STANDAR 16\"', '160.0', '100.0', 0, 20, 0, 'DAFF-16\"', 24, '2014-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(612, '00982', 'MOCHILA EKO ', '100.0', '50.0', 0, 25, 0, 'M-EKO', 27, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(613, '00983', 'MOCHILA EKO 1', '160.0', '50.0', 0, 25, 0, 'M-EKO1', 27, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(614, '00984', 'RELOJ DE PARED DISNEY ', '90.0', '30.0', 0, 22, 0, 'RE-DISN', 26, '2014-08-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(615, '00991', 'PELUCHE RANA MUSICAL', '210.0', '100.0', 0, 20, 0, 'RANA-MUSI', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(616, '00992', 'PELUCHE HOMERO SIMSOMS', '110.0', '40.0', 0, 20, 0, 'P-HOME', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(617, '00993', 'PELUCHE GONZO  PLAZA SESAMO', '170.0', '70.0', 0, 20, 0, 'P-GONZ', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(618, '00994', 'PELUCHE ENRIQUE BB PLZA SESAMO', '100.0', '40.0', 0, 20, 0, 'P-ENRIQ', 24, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(619, '00117', 'ENCENDEDOR BOOSS Y CALVIN KLEIN', '140.0', '45.0', 0, 23, 0, 'ENCEN', 27, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(620, '00996', 'BOLSA DE REGALOS BABY Y CUMPLEAÑOS GRANDE', '36.0', '14.0', 0, 1, 0, 'BABY', 26, '2014-10-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(621, '00997', 'ARRACADA FASHION MOD-1', '110.0', '55.0', 0, 23, 0, 'FAS-M1', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(622, '00998', 'ARRACADA FASHION MOD-2', '89.0', '40.0', 0, 23, 0, 'FAS-M2', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(623, '00999', 'ARETE FASHION ', '79.0', '39.0', 0, 23, 0, 'ARE-FAS', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(624, '00615', 'ESPEJO FASHION ', '75.0', '20.0', 0, 23, 0, 'ESP-FAS', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(625, '00616', 'COLLAR CHIC GLAMUR', '100.0', '40.0', 9, 23, 0, 'GLAMUR', 29, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, '', 0),
(626, '00617', 'COLLAR  FASHION ELEGANS', '160.0', '40.0', 1, 23, 0, 'FASH-', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(627, '00618', 'ARRACADA FASIHION ECO', '30.0', '10.0', 0, 23, 0, 'ARRA-ECO', 27, '2014-10-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(628, '00125', 'PELUCHE OSA Y OSO OVEROL', '360.0', '95.0', 0, 20, 0, 'OVEROL', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(629, '00127', 'PELUCHE OSO RELOJ MEDIANO', '370.0', '170.0', 0, 20, 0, 'REJOJ-M', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(630, '00129', 'JUGUETE SHOE PHONE TELEFONO', '160.0', '70.0', 0, 26, 0, 'SHOE', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(631, '00130', 'PELUCHE MAFALDA MEDIANA ', '250.0', '120.0', 0, 20, 0, 'MAFALD', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(632, '00132', 'JUGUETE BARBYE CHIC', '85.0', '40.0', 0, 26, 0, 'CHIC', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(633, '00133', 'JUGUETE BARBIE FASHION', '95.0', '40.0', 0, 26, 0, 'J-FASH', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(634, '00134', 'JUGUETE MINI COMPUTADORA ', '75.0', '30.0', 0, 26, 0, 'MINI-COM', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(635, '00135', 'JUGUETE HIPOPOTAMO INTERACTIVO', '150.0', '70.0', 0, 26, 0, 'IPO', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(636, '00138', 'PELUCHE PELOTIN DIFERENTE MODELOS', '190.0', '82.0', 0, 20, 0, 'PELOTIN', 24, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(637, '00124', 'LAMPARAS DE LAVA ( BLANCAS )', '400.0', '150.0', 1, 22, 0, 'LAM-BLAN', 27, '2017-04-07 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, '', 0);
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `stock`, `id_categoria`, `stock_minimo`, `nombre_generico`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `imagen`, `inventariable`) VALUES
(638, '00140', 'JUEGO DE MESA MONOPOLY', '200.0', '80.0', 0, 26, 0, 'MONOP', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(639, '00142', 'PORTA RETRATO AMOR DETALLES.COM', '238.0', '115.0', 4, 29, 0, 'DETALL.COM', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 460, 0, 0, 0, '', 0),
(640, '00143', 'VALERINA BEBE', '35.0', '7.0', 3, 23, 0, 'VALE', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 21, 0, 0, 0, '', 0),
(641, '1418', 'CAJA PELUCHERA MEDIANA', '87.0', '20.0', 23, 1, 0, 'C-BOMSA', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 460, 0, 0, 0, '', 0),
(642, '00145', 'BOMBONERA CORAZON MINI', '25.0', '10.0', 0, 27, 0, 'BOM-MINI', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(643, '00146', 'BOMBONERA CHICA ', '40.0', '15.0', 0, 27, 0, 'BOM-CH', 26, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(644, '00619', 'COLLAR BOUTIQUE COLLECION ', '85.0', '40.0', 7, 23, 0, 'BOUTIC', 27, '2014-10-20 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, '', 0),
(645, '00620', 'MARIQUERA MINNIE ', '100.0', '35.0', 0, 23, 0, 'MINNIEE', 26, '2014-11-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(646, '00622', 'SANDALIA NIÑA  CHICA', '130.0', '65.0', 0, 23, 0, '14/16', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(647, '00623', 'SANDALIA NIÑA MEDIANA', '140.0', '70.0', 0, 23, 0, '17/20', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(648, '00624', 'SANDALIA NIÑA GRANDE', '148.0', '50.0', 0, 23, 0, '21/26', 21, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(649, '00625', 'DENTISTA DE METAL COLECCION', '300.0', '155.0', 0, 22, 0, 'DENTIS', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(650, '00626', 'BATERIA MUSICAL DE METAL COLECCION ', '350.0', '155.0', 0, 23, 0, 'BATERIA', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(651, '00627', 'PATINADOR DE METAL COLECCION ', '300.0', '125.0', 1, 23, 0, 'PATINA', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, '', 0),
(652, '00628', 'FUTBOLISTA DE METAL COLECCION ', '300.0', '115.0', 0, 23, 0, 'FUT', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(653, '00629', 'PAREJA VALLET METAL COLECCION', '178.0', '65.0', 0, 23, 0, 'VALLET', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(654, '00630', 'BISICLETA DE METAL COLECCION', '190.0', '75.0', 0, 23, 0, 'BISI', 26, '2014-11-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(655, '7500110287078', 'PELUCHE OSA ROMBY GRANDE ', '280.0', '106.0', 0, 20, 0, 'O-ROMBY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(656, '7500124461372', 'PELUCHE PERRO PERRYCOLORS GRANDE C/ SONIDO', '350.0', '141.0', 0, 20, 0, 'PERRY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(657, '7500107425421', 'PELUCHE OSA RAMBLI GRANDE ', '280.0', '109.0', 0, 20, 0, 'O-RAMBLI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(658, '7500107013314', 'PELUCHE OSA ESTRELLIN GRANDE C/ SONIDO', '330.0', '135.0', 0, 20, 0, 'O-ESTRELN', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(659, '2012250719869', 'PELUCHE OSA NILY GRANDE ', '350.0', '116.0', 0, 20, 0, 'O-NILY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(660, '7500110286491', 'PERRO CACHORRYKY GRANDE ', '250.0', '96.0', 0, 20, 0, 'P-CACHORY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(661, '7500113177222', 'PELUCHE PERRO JAPONES EX GRANDE ', '380.0', '154.0', 0, 20, 0, 'P-JAPONES', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(662, '7500110287108', 'PELUCHE CONEJA ROMBY GRANDE ', '280.0', '106.0', 0, 20, 0, 'C-ROMBY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(663, '7500107629126', 'PELUCHE BORREGO BIKO COLORIN C/ SONIDO', '230.0', '96.0', 0, 20, 0, 'B-BIKO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(664, '1628', 'PELUCHE PULPITO REVERSIBLE CHICO', '160.0', '79.0', 42, 20, 0, 'PULPO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 3318, 0, 0, 0, '', 0),
(665, '7500813002527', 'PELUCHE OSO DORMILON C/ SONIDO ', '318.0', '125.0', 0, 20, 0, 'P-DORMI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(666, '7500813002510', 'PELUCHE OSA DORMILONA C/ SONIDO', '318.0', '125.0', 0, 20, 0, 'P-DORMIL', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(667, '7500107156813', 'PELUCHE ELEFANTE ELIZ MEDIANO C/ SONIDO ', '200.0', '87.0', 0, 20, 0, 'E-ELIZ', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(668, '606982082425', 'PELUCHE OSO CON  FRAZADA Y SONIDO', '300.0', '119.0', 0, 20, 0, 'P-FRAZAD', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(669, '7500120061330', 'PELUCHE CHANGA MONKYTINA MED C/ SONIDO', '300.0', '106.0', 0, 20, 0, 'C-MONKY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(670, '7500120061309', 'PELUCHE CHANGO MONKYTIN MED C/ SONIDO', '250.0', '106.0', 0, 20, 0, 'C-MONK', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(671, '7500130149356', 'PELUCHE OSITO TEDDIKY CHICO', '100.0', '35.0', 0, 20, 0, 'O-TEDD', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(672, '7500130140445', 'PELUCHE PUERQUITA MARIMAR CHICA ', '130.0', '38.0', 0, 20, 0, 'P-MARI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(673, '7500136161710', 'PELUCHE COCHILINDA CHICA ', '140.0', '42.0', 0, 20, 0, 'P-COCHILINDA', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(674, '7500130140490', 'PELUCHE COCODRILO COLMILLIN CHICO', '130.0', '42.0', 0, 20, 0, 'COLMILLIN', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(675, '8429760093794', 'PELUCHE VACA COJIN GRANDE ', '300.0', '139.0', 0, 20, 0, 'C-VACA', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(676, '7500106222526', 'PELUCHE PERRITA PODKY GDE C/ SONIDO', '300.0', '106.0', 0, 20, 0, 'P-PODKY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(677, '7500107441834', 'PELUCHE OSA FLORECHITA EX GRANDE ', '350.0', '145.0', 0, 20, 0, 'FLORECHI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(678, '7500107456272', 'PELUCHE VACA RUMYS GDE C/ SONIDO', '318.0', '135.0', 0, 20, 0, 'V-RUMYS', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(679, '7500105139726', 'PELUCHE PUERQUITA BICO BABY MED', '200.0', '87.0', 0, 20, 0, 'P-BICO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(680, '7500105139528', 'PELUCHE CONEJITA BICO BABY MED ', '200.0', '87.0', 0, 20, 0, 'C-BIKOO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(681, '7534', 'PELUCHE ELEFANTE TEDY GRANDE ', '400.0', '140.0', 0, 20, 0, 'ELEFANTE-G', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(682, '7500121209533', 'PELUCHE VACA MAKUKYS C/ SONIDO GDE', '250.0', '106.0', 0, 20, 0, 'V-MAKU', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(683, '2012370783474', 'PELUCHE PERRO CACHETOWER GDE', '300.0', '129.0', 0, 20, 0, 'P-CACHE', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(684, '7500123130125', 'PELUCHE CABALLITO KUAKO GDE C/ SONIDO', '280.0', '116.0', 0, 20, 0, 'KUAKO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(685, '7500105130327', 'PELUCHE RATIKAS PATIFLAIS GDE ', '250.0', '96.0', 0, 20, 0, 'RATIKAS', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(686, '7500120260849', 'PELUCHE PUERQUITA BOLUNITTA  MED', '200.0', '87.0', 0, 20, 0, 'BOLUNIT', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(687, '7500247060902', 'PELUCHE TIGGER PLAY SUIT', '210.0', '145.0', 0, 20, 0, 'PLAY', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(688, '7509012330134', 'PELUCHE SABUESSY FASHION GDE', '270.0', '99.0', 0, 20, 0, 'SABUESS', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(689, '7500107431125', 'PELUCHE OSA FLORIKY GDE', '300.0', '125.0', 0, 20, 0, 'FLORIK', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(690, '7509001818506', 'PELUCHE PERRO HUESIBODOKY GDE', '250.0', '99.0', 0, 20, 0, 'HUESI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(691, '00631', 'PELUCHE OSOS MOJADOS GDE', '250.0', '99.0', 0, 20, 0, 'MOJADO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(692, '7500120169623', 'PELUCHE CHANGA CHIMICHANGA C/ SONIDO', '230.0', '99.0', 0, 20, 0, 'CHIMI', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(693, '7500120260856', 'PELUCHE LEONCITO BOLUNITTA MED', '197.0', '87.0', 0, 20, 0, 'LEO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(694, '7500120061408', 'PELUCHE LEON LEOPOLDO GDE C/ SONIDO', '210.0', '96.0', 0, 20, 0, 'LEOPOLD', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(695, '7500120783553', 'PELUCHE RANA C/ SONIDO MED', '200.0', '77.0', 0, 20, 0, 'P-RANA', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(696, '7500813000110', 'PELUCHE OSITA BABY COMETA C/ CUERDA MUSICAL', '210.0', '87.0', 0, 20, 0, 'COMETA ', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(697, '851785961754', 'PELUCHE PERRO BULL CON HUESO MOV Y SONIDO', '350.0', '145.0', 0, 20, 0, 'BULL', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(698, '800000700524', 'PELUCHE PERRO BERTO', '330.0', '96.0', 0, 20, 0, 'BERTO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(699, '00632', 'PELUCHE OSITA ROMBIKOS GDE', '250.0', '106.0', 0, 20, 0, 'ROM', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(700, '00633', 'PELUCHE OSO CHOKORROKO GDE', '250.0', '99.0', 0, 20, 0, 'CHOKO', 24, '2014-11-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(701, '00634', 'COJIN BOB ESPONJA', '200.0', '90.0', 0, 20, 0, 'BOB', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(702, '00635', 'PELUCHE PEPA  YORS Y PAPA GRANDE', '250.0', '120.0', 0, 20, 0, 'P-PEPA', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(703, '00636', 'PELUCHE PUERCO ROY GRANDE ', '370.0', '135.0', 0, 20, 0, 'ROY', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(704, '00637', 'PELUCHE ELMO ( PLAZA SESAMO )', '250.0', '100.0', 0, 20, 0, 'ELMO', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(705, '00638', 'PELUCHE SULY  Y PEPA POLIESFERA ', '150.0', '85.0', 0, 20, 0, 'SUL', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(706, '00639', 'COJIN PEPA Y FROSEN ', '210.0', '90.0', 0, 20, 0, 'FROSS', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(707, '00640', 'PELUCHE KITY BEBE', '250.0', '75.0', 0, 20, 0, 'KITY-BB', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(708, '00641', 'PELUCHE ANIMALES OJONES', '198.0', '79.0', 0, 20, 0, 'P-OJONES', 26, '2014-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(709, '08', 'GLOBO TE AMO DECORACION SIN HELIO', '100.0', '15.0', 8, 30, 0, 'G-MINI', 26, '2014-12-03 00:00:00', '', 0, 0, NULL, NULL, 0, 135, 0, 0, 0, '', 0),
(710, '00642', 'PELUCHES ANIMALES EN CAJA MINI ', '115.0', '23.0', 0, 20, 0, 'P-CAJA', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(711, '00643', 'PELUCHE ANIMALES CUELLO FLEXIBLE ', '118.0', '34.0', 0, 20, 0, 'P-FLEX', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(712, '00644', 'PELUCHE PERRITA MINI FRENCH', '110.0', '38.0', 0, 20, 0, 'MINI-FRE', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(713, '00645', 'PELUCHE PAREJA DE ANIMALES SOBRE CORAZON ', '145.0', '44.0', 0, 20, 0, 'P-PAREJA', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(714, '00646', 'PELUCHE MINI ANIMALES ', '84.0', '23.0', 0, 20, 0, 'P-MINI', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(715, '00647', 'PELUHE MINI CHIHUAHUA ', '118.0', '35.0', 0, 20, 0, 'MINI-CHIHUA', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(716, '00648', 'PELUCHE ANIMALES DE LA SELVA ', '138.0', '43.0', 0, 20, 0, 'P-SELVA', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(717, '00649', 'PELUCHE LEON TIERNO MEDIANO', '210.0', '88.0', 0, 20, 0, 'P-TIERNO', 26, '2014-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(718, '00650', 'RELOJ DE PARET BABY', '110.0', '30.0', 0, 22, 0, 'R-BABY', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(719, '001001', 'COLLAR FASHION MOD-1', '190.0', '55.0', 3, 23, 0, 'MOD-1', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 165, 0, 0, 0, '', 0),
(720, '00651', 'RELOJ DE PARET REDONDO', '130.0', '30.0', 0, 22, 0, 'R-PARET', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(721, '00652', 'PORTA RETRATO  DETALLES DE AMOR', '170.0', '79.0', 0, 29, 0, 'P-AMOR', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(722, '00653', 'PORTA RETRATO POOH SUPERDETECTIVE ', '100.0', '30.0', 0, 22, 0, 'DETEC', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(723, '00654', 'PORTA RETRATO CORAZO DETALLES', '118.0', '49.0', 2, 29, 0, 'P-DETLL', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 98, 0, 0, 0, '', 0),
(724, '00656', 'RELOJ DESPERTADOR DE VACA ', '85.0', '20.0', 0, 22, 0, 'D-VACA', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(725, '00657', 'PORTA RETRATO PAREJA', '110.0', '30.0', 0, 22, 0, 'PAREJA', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(726, '00658', 'AGENDA POOH C/ PLUMA (OFERTA)', '20.0', '15.0', 0, 22, 0, 'POH-AGE', 26, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(727, '00659', 'QUITA ESMALTE NAIL LACQUER', '20.0', '7.0', 0, 23, 0, 'Q-NAIL', 27, '2014-12-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(728, '0015', 'BOLSA CHICA FUDI SAN VALENTIN', '25.0', '8.0', 58, 1, 0, 'B-FUDI', 26, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 472, 0, 0, 0, '', 0),
(729, '09975', 'BOLSA MEDIANA NAVIDAD DIPAK', '22.0', '9.0', 0, 1, 0, 'BM-DIPAK', 22, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(730, '0017', 'BOLSA BOTELLERA IMAGEN PRINTS', '27.0', '9.0', 3, 1, 0, 'BOTELL', 21, '2015-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 27, 0, 0, 0, '', 0),
(731, '00661', 'MARIQUERA PUMA CABALLERO ', '260.0', '120.0', 0, 23, 0, 'PUMA-M1', 27, '2015-01-31 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(732, '00150', 'PORTA LAPICERO MUSICOS EN BISI', '145.0', '65.0', 0, 22, 0, 'P-BISI', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(733, '00660', 'PORTA LAPICEROS MUSICOS RESORTE', '180.0', '78.0', 0, 22, 0, 'P-MUSIC', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(734, '00662', 'GOLFISTA DE METAL', '210.0', '125.0', 0, 22, 0, 'GOOLF', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(735, '00663', 'TAZOTA AMOR (ARTESANIA MEXICANA)', '245.0', '145.0', 0, 27, 0, 'TAZOOT', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(736, '00664', 'TAZA AMOR (ARTESANIA MEXICANA )', '270.0', '145.0', 6, 22, 0, 'TZA', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 870, 0, 0, 0, '', 0),
(737, '1665', 'TAZA ORO FRASES DE AMOR', '230.0', '115.0', 8, 27, 0, 'T-ORO', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 920, 0, 0, 0, '', 0),
(738, '00666', 'TAZOTA SUPER DETALLE.COM', '278.0', '139.0', 0, 27, 0, 'T-AMOR', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(739, '00667', 'MARIQUERA FERRARI CABALLERO', '240.0', '125.0', 0, 23, 0, 'FERR', 27, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(740, '00668', 'LONAS MENSAJE DE AMOR ', '150.0', '65.0', 0, 22, 0, 'LONAS', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(741, '00669', 'PORTA RETRATO  DETALLES .COM', '160.0', '75.0', 0, 28, 0, 'DETALL', 26, '2015-02-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(742, '00670', 'PULCERA CABALLERO', '150.0', '40.0', 2, 23, 0, 'P-CABALL', 27, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, '', 0),
(743, '00671', 'RELOJ CLONES  DAMA', '400.0', '130.0', 4, 23, 0, 'CLON', 27, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 520, 0, 0, 0, '', 0),
(744, '00673', 'LLAVERO PERSONAJES', '35.0', '8.0', 0, 23, 0, 'Y-PERSO', 26, '2015-02-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(745, '714', 'DULCERO SANVALENTIN ', '25.0', '10.0', 0, 27, 0, 'CARAMELO', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(746, '7500110286996', 'PELUCHE  OSA FRESITA GDE', '250.0', '89.0', 0, 20, 0, 'P-FRES', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(747, '7500121996136', 'PELUCHE OSA CHOCOBOLOCHIS GDE', '350.0', '139.0', 0, 20, 0, 'P-CHOCO', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(748, '00655', 'PELUCHE TIRO AL BLANCO', '350.0', '180.0', 0, 20, 0, 'P-BLANCO', 24, '2016-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(749, '7509012297727', 'PELUCHE OSA RONKIKI GDE', '250.0', '109.0', 0, 20, 0, 'P-RONKI', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(750, '7500106121188', 'PELUCHE PERRO KOKETINES C/ SONIDO GDE', '230.0', '109.0', 0, 20, 0, 'P-KOKETINES', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(751, '7500120814011', 'PELUCHE OSA C/ CORAZON Y SONIDO GDE', '370.0', '129.0', 0, 20, 0, 'P-OSA', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(752, '9888820122994', 'ALMOHADA OSO PARCHES GDE', '250.0', '80.0', 0, 20, 0, 'ALMOHA', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(753, '00672', 'COJIN CORAZON ROSA C/ MOÑO', '250.0', '70.0', 0, 20, 0, 'C/MOÃ‘O', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(754, '00674', 'COJIN GABI TOY BEBE', '300.0', '150.0', 0, 20, 0, 'TOY-BB', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(755, '00675', 'COJIN MUSICAL BEBE', '260.0', '130.0', 0, 20, 0, 'C-MUS-BB', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(756, '00676', 'PELUCHE  CHIHUAHUA MEDIANO', '170.0', '57.0', 0, 20, 0, 'P-CHIHUA', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(757, '00677', 'PELUCHE CHANGO OJON CHICO', '140.0', '48.0', 0, 20, 0, 'P-CHANG', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(758, '00678', 'PELUCHE CHANGO OJON MEDIANO ', '180.0', '60.0', 0, 20, 0, 'CHANG', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(759, '00679', 'PELUCHE TORTUGA PACHONA', '350.0', '110.0', 0, 20, 0, 'P-TORTUGA', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(760, '00680', 'PORTA LAPICERO DE PELUCHE ', '70.0', '19.0', 0, 22, 0, 'P-LUCHE', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(761, '7500107574112', 'PELUCHE OSO CORAZON FLOR GRANDE', '300.0', '197.0', 0, 20, 0, 'OSOFLOR', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(762, '00682', 'PELUCHE PEGAZO BEBE ', '185.0', '40.0', 0, 20, 0, 'P-PEGAZO', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(763, '00683', 'PELUCHE GATO ENOJON', '180.0', '68.0', 0, 20, 0, 'P-GAT', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(764, '00684', 'PELUCHE OSOS CORAZON I YOU', '170.0', '58.0', 0, 20, 0, 'IYOU', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(765, '7500107573580', 'PELUCHE OSO CORAZONADA CON SONIDO JUMBO', '600.0', '259.0', 1, 20, 0, 'CORAZONADA', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 259, 0, 0, 0, '', 0),
(766, '00686', 'PELUCHE OSO JAZPIADO GRANDE', '370.0', '128.0', 0, 20, 0, 'P-JAZ', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(767, '00687', 'PELUCHE PERRO BOXER C/ COLLAR', '218.0', '90.0', 0, 20, 0, 'P/COLLAR', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(768, '00688', 'PELUCHE VACA FELPA CHICA', '150.0', '58.0', 0, 20, 0, 'P-FELP', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(769, '00689', 'PELUCHE VACA ECHEDA CHICA ', '160.0', '48.0', 0, 20, 0, 'P-ECHADA', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(770, '00690', 'PELUCHE RANA ROSA GRANDE ', '350.0', '68.0', 0, 20, 0, 'RANA-ROSS', 24, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(771, '00691', 'COJIN POLIESFERA CORAZON LOVE CHICO', '185.0', '50.0', 0, 20, 0, 'POLIESF', 26, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(772, '00692', 'MARIQUERA P/ CABALLERO GRANDE', '250.0', '120.0', 0, 23, 0, 'MARIK', 27, '2015-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(773, '00693', 'PELUCHE OSOS CORAZON LOVE', '385.0', '174.0', 0, 20, 0, 'P-LOVVE', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(774, '00694', 'PELUCHE PERRO I HUFF YOU', '250.0', '90.0', 0, 20, 0, 'P-HUFF', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(775, '00695', 'PELUCHE VACA T.Q.M GDE', '430.0', '180.0', 0, 20, 0, 'P.TQM', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(776, '00696', 'PELUCHE RANA LOVE YOU GDE', '500.0', '190.0', 0, 20, 0, 'R-LOV', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(777, '00697', 'PELUCHE RANA LOVE YOU SUPER', '750.0', '340.0', 0, 20, 0, 'RANA-SUP', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(778, '00698', 'PELUCHE OSO PETALO GDE', '600.0', '240.0', 0, 20, 0, 'P-PETALO', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(779, '00699', 'PELUCHE OSA T.Q.M.  SUPER', '1000.0', '450.0', 0, 20, 0, 'T.Q.M', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(780, '00530', 'PELUCHE OSO BRANDON HUELLAS GRANDE', '1500.0', '432.0', 1, 20, 0, 'UELLAS', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 432, 0, 0, 0, '', 0),
(781, '00532', 'PELUCHE OSO BRANDON HUELLAS MEDIANO', '399.0', '170.0', 0, 20, 0, 'P-HUELLAS', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(782, '00533', 'PELUCHE TIERNO UNICORNIO EX GRANDE', '700.0', '290.0', 0, 20, 0, 'TIER-UNI', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(783, '00535', 'PELUCHE OSO HUELLAS DORADAS ', '400.0', '150.0', 0, 20, 0, 'P-HUELL', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(784, '00539', 'PELUCHE PANDA CON SUDADERA GDE', '385.0', '148.0', 0, 20, 0, 'SUDADERA', 24, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(785, '00540', 'BOLSA BUTIC GRANDE IMAGEN PRINTS', '39.0', '14.0', 0, 1, 0, 'BUTIC-G', 21, '2015-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(786, '00202', 'PELUCHE GARFIEL AMOR GDE', '370.0', '150.0', 0, 20, 0, 'P-GARF', 26, '2015-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(787, '00204', 'CAJA DECORADA CHICA C/ CORDON ', '110.0', '25.0', 1, 1, 0, 'CODON-CH', 26, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 25, 0, 0, 0, '', 0),
(788, '00205', 'CAJA DECORADA C/ CORDON MEDIANA', '145.0', '35.0', 1, 1, 0, 'CORDON-M', 29, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 35, 0, 0, 0, '', 0),
(789, '00206', 'CAJA CAMICERA CHICA ', '79.0', '30.0', 0, 1, 0, 'CAMICERA', 26, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(790, '00207', 'BOLSA EX JUMBO SAN VALENTIN ', '79.0', '30.0', 0, 1, 0, 'B-EX', 22, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(791, '00208', 'PASTELILLO DE BOMBOM', '25.0', '13.0', 0, 22, 0, 'PASTEL', 29, '2015-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(792, '00209', 'CAJA DECORADA C/ CORDON GRANDE', '170.0', '40.0', 0, 1, 0, 'CORDON-G', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(793, '00210', 'CONO DE CHOCOLATE', '20.0', '10.0', 0, 22, 0, 'CONO', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(794, '00211', 'CAJITA CORAZON DE CHOCOLATE ', '20.0', '10.0', 0, 22, 0, 'C-CHOCO', 29, '2015-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(795, '09', 'GLOBO MEDIANO ECONOMICO', '35.0', '3.0', 0, 30, 0, 'PERS', 26, '2015-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(796, '001000', 'BOTA  TEQUILERA ', '75.0', '10.0', 0, 23, 0, 'BOTA', 27, '2015-03-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(797, '001002', 'COLLAR FASHION MOD-2', '230.0', '85.0', 2, 23, 0, 'MOD-2', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 170, 0, 0, 0, '', 0),
(798, '001003', 'COLLAR FASHION MOD-3', '175.0', '40.0', 0, 23, 0, 'MOD-3', 27, '2015-05-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(799, '7500115157734', 'PELUCHE OSO GIN GRANDE', '300.0', '143.0', 0, 20, 0, 'P-GIN', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(800, '7500115157642', 'PELUCHE OSA BLUBLU GRANDE', '300.0', '143.0', 0, 20, 0, 'P-BLU', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(801, '2012072015750', 'PELUCHE OSA NORA GRANDE ', '350.0', '143.0', 0, 20, 0, 'P-NORA ', 24, '2015-05-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(802, '00045', 'MINIATURA PASTELITO ', '59.0', '29.0', 0, 27, 0, 'PASTELIT', 26, '2015-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(803, '00302', 'CAJA DE REGALOS 2396 GRANDE', '120.0', '50.0', 0, 1, 0, '2396-G', 26, '2015-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(804, '00303', 'CAJA DE REGALOS 2396 MEDIANA ', '80.0', '40.0', 0, 1, 0, '2396-M', 26, '2015-06-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(805, '00538', 'PELUCHE OSO CHOCOLATE GDE', '750.0', '320.0', 0, 20, 0, 'P-CHOCOLAT', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(806, '00304', 'CARTERA CABALLERO ADIDAS Y PUMA', '300.0', '80.0', 14, 23, 0, 'EQUIP', 27, '2015-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 1120, 0, 0, 0, '', 0),
(807, '00305', 'PELUCHE OLAS POLIESFERA ', '250.0', '95.0', 0, 20, 0, 'OLAS', 24, '2015-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(808, '00306', 'COJIN CARITA WHATSAPP', '210.0', '80.0', 0, 20, 0, 'WHAT', 24, '2015-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(809, '00307', 'MARIQUERA  DAVICHI PORTAFOLIO', '350.0', '100.0', 0, 23, 0, 'MARI-M', 27, '2015-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(810, '00308', 'MARIQUERA P/ CABALLERO CHICA ', '195.0', '80.0', 0, 23, 0, 'MARI-C', 27, '2015-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(811, '00309', 'PELUCHE MINNIE SUPER', '1600.0', '650.0', 0, 20, 0, 'P-MICK', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(812, '7500247142363', 'PELUCHE SULY MONSTERS INC', '330.0', '165.0', 0, 20, 0, 'SULYY', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(813, '00351', 'MUÑECA KIMI KOKO MEDIANA', '218.0', '98.0', 0, 20, 0, 'KIMI-M', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(814, '00310', 'MUÑECA ROSITA PATAS LARGAS ', '350.0', '138.0', 0, 20, 0, 'ROSITA', 24, '2015-07-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(815, '00311', 'PARAGUA CHICO ', '40.0', '20.0', 0, 23, 0, 'PARAG', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(816, '00312', 'PARAGUA CHICO FILTRA SOL', '60.0', '25.0', 0, 23, 0, 'PARAG-F', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(817, '00313', 'PARAGUA MEDIANO', '85.0', '40.0', 0, 23, 0, 'PARA.M', 27, '2015-07-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(818, '00371', 'ROBOT DE METAL ', '210.0', '70.0', 0, 23, 0, 'ROBOT', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(819, '00372', 'MUSICOS PAREJA EN COLUMPIOS DE METAL', '200.0', '75.0', 0, 23, 0, 'COLUM', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(820, '00373', 'JINETE A CABALLO DE METAL', '140.0', '55.0', 0, 23, 0, 'JINET', 23, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(821, '00374', 'D\"J DE METAL', '280.0', '135.0', 0, 23, 0, 'DJ', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(822, '00375', 'MUSICO DE METAL ', '140.0', '65.0', 0, 22, 0, 'MUS', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(823, '00376', 'TORRE DE PARIS CHICA', '120.0', '45.0', 0, 23, 0, 'PARIS', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(824, '00377', 'CARTERA DE EQUIPO ', '100.0', '69.0', 0, 23, 0, 'EQUI', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(825, '00378', 'LLAVERO DE EQUIPO', '78.0', '33.0', 0, 23, 0, 'EQUIPO', 27, '2015-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(826, '00381', 'MARIQUERA DAVICHI CHICA', '190.0', '80.0', 0, 23, 0, 'DAVICHI-C', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(827, '00382', 'MARIQUERA DAVICHI MEDIANA ', '200.0', '110.0', 0, 23, 0, 'DAVICHI-M', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(828, '00383', 'MARIQUERA DAVICHI GRANDE ', '300.0', '115.0', 0, 23, 0, 'DAVICHI-G', 27, '2015-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(829, '00384', 'MONEDERO METAL DISNEY CHICO ', '38.0', '17.0', 0, 22, 0, 'M-MET', 26, '2015-09-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(830, '0010001', 'EXIBIDOR PARA RELOJ DE CABALLERO', '30.0', '8.0', 16, 23, 0, 'EXII', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 128, 0, 0, 0, '', 0),
(831, '0010003', 'EXIBIDOR PARA SANDALIAS', '15.0', '4.0', 23, 23, 0, 'EXIB', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 92, 0, 0, 0, '', 0),
(832, '00391', 'MONEDERO VIVIAN YAALI', '120.0', '38.0', 0, 23, 0, 'M-VIVIAN', 27, '2015-10-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(833, '7500110581886', 'PELUCHE OSO C/ PLAYERA ESTRELLITA MEDIANO', '190.0', '79.0', 0, 20, 0, 'ESTRE-M', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(834, '00151', 'PORTA LAPICERA BISI DE METAL', '145.0', '55.0', 0, 23, 0, 'L-BISI', 27, '2016-10-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(835, '7500107440202', 'PELUCHE OSITO ROMBIKOS GRANDE ', '260.0', '106.0', 0, 20, 0, 'ROMBY', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(836, '2012070204187', 'PELUCHE PERRO SPOTY GRANDE ', '250.0', '106.0', 0, 20, 0, 'SPOTY', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(837, '7500107440189', 'PELUCHE OSO GREKIS GDE', '250.0', '109.0', 0, 20, 0, 'GREKIS', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(838, '2012270785004', 'PELUCHE CHANGO PLATANOSKY GRANDE ', '200.0', '116.0', 0, 20, 0, 'PLATANOSK', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(839, '7500107456821', 'PELUCHE RANA CHIPYS MED C/ SONIDO ', '280.0', '106.0', 0, 20, 0, 'CHIPYS', 24, '2015-10-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(840, '00216', 'CAJA DE REGALOS LUNARES 1897 GDE', '119.0', '55.0', 0, 1, 0, '1897-G', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(841, '00217', 'CAJA DE REGALOS LUNARES 1897 MEDIANA ', '86.0', '40.0', 0, 1, 0, '1897-M', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(842, '00218', 'CAJA DE REGALOS LUNARES 1897 CHICA', '59.0', '30.0', 0, 1, 0, '1897-C', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(843, '00219', 'CAJA DE REGALOS LUNARES MEDIANA', '50.0', '25.0', 3, 1, 0, 'LUNARES-M', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 75, 0, 0, 0, '', 0),
(844, '00220', 'CAJA DE REGALOS LUNARES GRANDE', '95.0', '40.0', 3, 1, 0, 'LUNARES-G', 26, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(845, '00221', 'CAJA DE REGALOS LUNARES CHICA', '30.0', '15.0', 1, 1, 0, 'LUNAR-CH', 21, '2015-10-15 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, '', 0),
(846, '00314', 'CARTERA ENOSH', '250.0', '140.0', 0, 23, 0, 'ENOSH', 27, '2015-10-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(847, '00316', 'CARITA WHATSAPP CHICA ', '130.0', '50.0', 0, 20, 0, 'WHAT-C', 26, '2015-11-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(848, '00317', 'PELUCHE OSO CORAZON LOVE MEDIANO', '370.0', '180.0', 0, 20, 0, 'P-LOVEE', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(849, '00318', 'PELUCHE OSA DULCE LOVE SUPER', '1800.0', '850.0', 0, 20, 0, 'DULCE', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(850, '00319', 'PELUCHE OSO LUNARES GDE', '400.0', '160.0', 0, 20, 0, 'P-LUNARES', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(851, '00321', 'PELUCHE OSO I LOVE YOU GRANDE', '390.0', '169.0', 0, 20, 0, 'P-ILOVE', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(852, '00322', 'PELUCHE PERO HUESO GDE', '600.0', '160.0', 0, 20, 0, 'HUESO', 24, '2015-11-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(853, '00323', 'CAJA DE REGALO C/ MOÑO CHICA', '75.0', '20.0', 2, 1, 0, 'CAJ-CH', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(854, '00324', 'CAJA DE REGALO C/ MOÑO MEDIANA', '89.0', '30.0', 2, 1, 0, 'CAJ-MED', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, '', 0),
(855, '00325', 'CAJA DE REGALOS LISA C/ MOÑO GRANDE ', '79.0', '25.0', 0, 1, 0, 'CAJ-GDE', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(856, '111', 'CAJA DE REGALOS NO-1 DE 10', '28.0', '7.0', 0, 1, 0, 'C-1', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(857, '112', 'CAJA DE REGALOS NO-2 DE 10 ', '35.0', '10.0', 0, 1, 0, 'C-2', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(858, '113', 'CAJA DE REGALOS NO-3 DE 10', '40.0', '15.0', 0, 1, 0, 'C-3', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(859, '114', 'CAJA DE REGALOS NO-4 DE 10', '58.0', '20.0', 0, 1, 0, 'C-4', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(860, '115', 'CAJA DE REGALOS NO-5 DE 10', '70.0', '25.0', 0, 1, 0, 'C-5', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(861, '00315', 'BOLSO PARISS LOVE TRAVEL', '210.0', '75.0', 0, 23, 0, 'TRAVEL', 27, '2016-07-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(862, '116', 'CAJA DE REGALOS NO-6 DE 10', '78.0', '28.0', 0, 1, 0, 'C-6', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(863, '117', 'CAJA DE REGALOS NO-7 DE 10', '85.0', '30.0', 0, 1, 0, 'C-7', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(864, '118', 'CAJA DE REGALOS NO-8 DE 10', '110.0', '35.0', 0, 1, 0, 'C-8', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(865, '119', 'CAJA DE REGALOS NO-9 DE 10', '130.0', '38.0', 0, 1, 0, 'C-9', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(866, '120', 'CAJA DE REGALOS NO-10 DE 10', '140.0', '40.0', 0, 1, 0, 'C-10', 26, '2015-12-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(867, '00326', 'PELUCHE PIRO AL BLANCO ', '280.0', '160.0', 0, 20, 0, 'P-TIRO', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(868, '1327', 'PELUCHE AGUACATE CHICO', '198.0', '90.0', 13, 20, 0, 'AGUACATE-CH', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 1170, 0, 0, 0, '', 0),
(869, '00320', 'PELUCHE MINIOMS CABERNICOLA CHICO', '145.0', '50.0', 0, 20, 0, 'P-CABERN', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(870, '00328', 'PELUCHE YORS CHICO', '130.0', '55.0', 0, 20, 0, 'P-YORS', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(871, '00329', 'PELUCHE SNOOPY MEDIANO', '360.0', '125.0', 0, 20, 0, 'P-SNOP', 26, '2015-12-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(872, '7500120258235', 'PELUCHE OSO BIKO GRANDE ', '250.0', '106.0', 0, 20, 0, 'P-BIKO', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(873, '7500120356917', 'PELUCHE OSO BERRICHIS MED', '189.0', '87.0', 0, 20, 0, 'P-BERRI', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(874, '7500107430937', 'PELUCHE OSO BENETTY EX GRANDE ', '300.0', '135.0', 0, 20, 0, 'P-BENET', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(875, '7500107456234', 'PELUCHE RANA MONSY C/ SONIDO ', '300.0', '135.0', 0, 20, 0, 'P-MONSY', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(876, '7500107452229', 'PELUCHE VACA BOMBY MED C/ SONIDO', '270.0', '96.0', 0, 20, 0, 'P-VAK BOM', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(877, '7500120356924', 'PELUCHE OSO BERRICHIS GRANDE', '250.0', '106.0', 0, 20, 0, 'P-BERRICS', 24, '2015-12-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(878, '00330', 'TORRE DE PARIS MINI', '110.0', '35.0', 0, 23, 0, 'TORRE-M', 27, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(879, '00331', 'JUGUETE TRUCK COMBINATION 36 +', '145.0', '50.0', 0, 26, 0, 'J-TRU', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(880, '00332', 'JUGUETE CONSTRUCTION 3 PZ', '179.0', '65.0', 0, 26, 0, 'J-CONS', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(881, '00333', 'JUGUETE VEHICLES 3+', '100.0', '28.0', 0, 26, 0, 'J-VEHI', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(882, '00334', 'JUGUETE VEHICLES SPEED CHALLENGE', '130.0', '38.0', 0, 26, 0, 'J-VEHIC', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(883, '00335', 'JUGUETE TOW MATER', '97.0', '40.0', 0, 26, 0, 'J-MATE', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(884, '00337', 'JUGUETE CONSTRUCTION MINI', '79.0', '25.0', 0, 26, 0, 'J-CONST', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(885, '00338', 'JUGUETE CASA FASHION FAMILY', '79.0', '25.0', 0, 26, 0, 'J-FAMI', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(886, '00339', 'JUGUETE CASA HAPPY HOUSE ', '140.0', '50.0', 0, 26, 0, 'J-HOUSE', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(887, '00340', 'JUGUETE TRANSFORMES ', '235.0', '110.0', 0, 26, 0, 'J-TRANS', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(888, '00341', 'JUGUETE PRETTY ANGELIA', '175.0', '85.0', 0, 26, 0, 'J-PRET', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(889, '00342', 'JUGUETE PRETTY ANGELIA SWEE', '160.0', '70.0', 0, 26, 0, 'J-ANGE', 26, '2015-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(890, '00343', 'JUGUETE TRAILER CARS', '140.0', '55.0', 0, 26, 0, 'J-TRAI', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(891, '00344', 'JUGUETE MAX STEEL', '140.0', '70.0', 0, 26, 0, 'J-MAX', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(892, '00345', 'MINIATURA POLLITOS BEBES', '54.0', '27.0', 0, 27, 0, 'M-POLL', 26, '2015-12-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(893, '00346', 'BOLSA MEDIANA NAVIDAD BEST FOR', '25.0', '8.0', 0, 1, 0, 'BEST-M', 26, '2015-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(894, '00348', 'BOLSA CHICA NAVIDAD BEST FOR', '21.0', '7.0', 0, 1, 0, 'BETS-C', 26, '2015-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(895, '00349', 'COJIN CARITA WHATSAPP EN CAJA ', '250.0', '79.0', 0, 20, 0, 'C-WHATS', 26, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(896, '7500120260825', 'PELUCHE PERRITO BOLUNITTA MEDIANA', '197.0', '89.0', 0, 20, 0, 'P-BOLU', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(897, '7500120814080', 'PELUCHE LEONCITOS BEBES C/ SONIDO', '200.0', '79.0', 0, 20, 0, 'P-LEO', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(898, '7500119154289', 'PELUCHE CHANGUITA CHUNGYS CH', '140.0', '42.0', 0, 20, 0, 'P-CHUN', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(899, '7500713111022', 'PELUCHE OSOS PANKEKE GRANDE ', '380.0', '159.0', 0, 20, 0, 'P-PANKEKE', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(900, '7500713112616', 'PELUCHE RANA CROQUE MADAME ', '380.0', '159.0', 0, 20, 0, 'P-MADAME', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(901, '813237020341', 'MUÑECA RESADORA ', '250.0', '118.0', 0, 20, 0, 'RESAD', 24, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(902, '00352', 'CUADRO NEGRO DETALLES', '140.0', '200.0', 0, 22, 0, 'CUAD', 26, '2015-12-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(903, '00353', 'PELUCHE SONAJA BEBE', '145.0', '65.0', 0, 20, 0, 'S-BB', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(904, '00355', 'PELUCHE ROBOT MOVIL MUSICAL', '260.0', '130.0', 0, 20, 0, 'P-ROBOT', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(905, '00356', 'PELUCHE PANDA SELVA GRANDE', '385.0', '98.0', 0, 20, 0, 'SELVA', 24, '2016-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(906, '00357', 'COJIN COSTALITO MANTA COMICS', '100.0', '85.0', 2, 20, 0, 'C-COSTA', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 170, 0, 0, 0, '', 0),
(907, '00359', 'COJIN LARGO PLUZ AMOR ', '350.0', '164.0', 0, 20, 0, 'C-PLUZ', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(908, '00360', 'COJIN WHATSAPEANDO ', '250.0', '125.0', 0, 20, 0, 'C-WHAT', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(909, '00361', 'COJIN CORAZON SUBLIMADO GRANDE', '370.0', '195.0', 0, 20, 0, 'C-SUBLI', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(910, '00362', 'COJIN CUADRADO QUE MONITOS CHICO', '110.0', '48.0', 1, 20, 0, 'C-MONITOS', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 48, 0, 0, 0, '', 0),
(911, '00363', 'COJIN CUADRADO GARABATOS ', '185.0', '69.0', 0, 20, 0, 'C-GARA', 28, '2016-01-22 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(912, '00364', 'PERGAMINO MANTA NEGRA ', '250.0', '99.0', 0, 22, 0, 'P-MANT', 26, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(913, '00365', 'PERGAMINO MANTA CHICO ', '140.0', '61.0', 0, 22, 0, 'P-MANTA', 26, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(914, '00368', 'ENCENDEDOR BROZE', '150.0', '38.0', 0, 23, 0, 'E-BRONZ', 27, '2016-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(915, '00385', 'FIGURA RANA DE METAL PORTA LAPICERO GRANDE', '195.0', '85.0', 0, 22, 0, 'F-RANA-G', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(916, '00387', 'FIGURA RANA DE METAL PORTA LAPICERO CHICO ', '130.0', '55.0', 0, 22, 0, 'F-RANA-CH', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(917, '00388', 'TORRE IFEL MEDIANA C/ PIEDRAS ', '179.0', '75.0', 0, 22, 0, 'IFEL-PIED', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(918, '00350', 'PELUCHE OSO HUELLAS CORAZON MED', '358.0', '106.0', 0, 20, 0, 'HUE', 27, '2018-02-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(919, '00389', 'TORRE IFEL GRANDE C/ PIEDRA ', '270.0', '130.0', 0, 22, 0, 'T-IFEL', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(920, '00390', 'LLAVERO PAREJAS ', '75.0', '15.0', 0, 23, 0, 'PAREJAS', 27, '2016-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(921, '00393', 'COJIN POPO EMOTICONES', '210.0', '100.0', 0, 20, 0, 'P-POPO', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(922, '9481954295925', 'PELUCHE OSO MOÑO ROJO 4908-2A', '380.0', '148.0', 0, 20, 0, 'P-4908-2A', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(923, '9481954295949', 'PELUCHE OSO MOÑO ROJO 4908-3A', '499.0', '189.0', 0, 20, 0, 'P-4908-3A', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(924, '6637541258016', 'PELUCHE OSO C/ CORAZON 4911-2AB', '395.0', '195.0', 0, 20, 0, 'P-4911-2AB', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(925, '9481954295642', 'PELUCHE OSO BUFANDA 5182-2BC', '400.0', '188.0', 0, 20, 0, 'P-5182-2BC', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(926, '5182', 'PELUCHE OSO BUFANDA 5182-3BC', '370.0', '170.0', 0, 20, 0, 'P-5182-3BC', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(927, '4925323329583', 'PELUCHE OSO C/MOÑO 4826-2C', '350.0', '128.0', 0, 20, 0, 'P-4826-2C', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(928, '2980375', 'PELUCHE GORILA 298-037S', '799.0', '250.0', 1, 20, 0, 'P-298-037S', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 250, 0, 0, 0, '', 0),
(929, '8517857400171', 'PELUCHE OSO C/ CAMISA ROSA 5154-40', '400.0', '185.0', 0, 20, 0, 'P-5154-40', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(930, '8517857400157', 'PELUCHE OSO C/ CORAZON ROSA 5107-1', '199.0', '89.0', 0, 20, 0, 'P-5107-1', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(931, '734689342341', 'PELUCHE OSO ESPIRAL 14-234S', '179.0', '78.0', 0, 20, 0, 'P-234S', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(932, '9481954295826', 'PELUCHE OSO C/CAMISA FUCSIA 4826-2C', '279.0', '128.0', 0, 20, 0, 'P4826-2C', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(933, '734689150076', 'PELUCHE PERRO SENTADO V1251', '180.0', '79.0', 0, 24, 0, 'P-V1251', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(934, '734689120512', 'PELUCHE OSO C/ CUPCAKE CHICO', '198.0', '79.0', 0, 20, 0, 'P-CUP CK', 30, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(935, '00394', 'PELUCHE OSA VESTIDO GRANDE ', '750.0', '260.0', 0, 20, 0, 'P-VES-G', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(936, '00395', 'PELUCHE OSO BRANDON HUELLAS ', '1000.0', '490.0', 0, 20, 0, 'P-BRAND', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(937, '00397', 'PELUCHE OSO NARIZ DE CORAZON GRANDE ', '400.0', '169.0', 0, 20, 0, 'P-NARIZ', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(938, '00398', 'PELUCHE OSO GARRAS GRANDE ', '450.0', '180.0', 0, 20, 0, 'P-GARRAS', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(939, '00399', 'PELUCHES OSO PARCHES C/ BUFANDA', '850.0', '400.0', 0, 20, 0, 'P-PARCH', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(940, '00401', 'PELUCHE OSO PLAYERA CARIÑO GRANDE', '380.0', '135.0', 0, 20, 0, 'P-CARIÃ‘O', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(941, '1511', 'PELUCHE PERRO HECHADO ', '400.0', '175.0', 0, 20, 0, 'P-HECHA', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(942, '152000086352', 'PELUCHE OSO HUELLAS CORAZON ', '220.0', '120.0', 0, 20, 0, 'P-HUEE', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(943, '86406', 'PELUCHE OSO HUELLA CON CORAZON MEDIANO', '385.0', '169.0', 0, 20, 0, 'HUELL', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(944, '154201501283', 'PELUCHE OSO XOXO GRANDE', '380.0', '150.0', 0, 20, 0, 'P-XOXO', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(945, '154201501290', 'PELUCHE OSO CORAZON XOXO MEDIANO', '250.0', '120.0', 0, 20, 0, 'P-XOX', 24, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(946, '142052090315', 'PELUCHE OSO C/ MOÑO VOLTIADO MED', '200.0', '88.0', 0, 20, 0, 'P-VOL', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(947, '152000050261', 'PELUCHE PERRO LENGUA CHICO', '179.0', '78.0', 0, 20, 0, 'P-LEN', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(948, '152000107231', 'PELUCHE OSO C/ CORAZON CHICO MUSICAL', '168.0', '80.0', 0, 20, 0, 'P-MUSI', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(949, '151169398306', 'PELUCHE OSA VESTIDO T.Q.M. MED', '250.0', '120.0', 0, 20, 0, 'P-VEZ', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(950, '9695888110692', 'PELUCHE OSA ROSA C/ MACETA MED', '280.0', '130.0', 0, 20, 0, 'P-MACET', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(951, '9695888110586', 'PELUCHE OSO CORAZON C/ LUZ ', '230.0', '110.0', 0, 20, 0, 'P-LUZ', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(952, '8811', 'PELUCHE OSA CON HELADO MEDIANA', '370.0', '170.0', 0, 20, 0, 'HELADO', 24, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(953, '00402', 'COJIN LOVE POLIESFERA ', '218.0', '100.0', 6, 20, 0, 'C-LOVE', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, '', 0),
(954, '00404', 'PELUCHE OSO BRANDON C/ CORAZON ROSA', '1500.0', '435.0', 0, 20, 0, 'BRAN/C', 26, '2016-02-08 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(955, '00405', 'CARTERA PARIS Y PAPRUM', '200.0', '100.0', 0, 23, 0, 'PAPRUM', 27, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(956, '00416', 'TAZA AMOOR Y AMISTADD', '218.0', '120.0', 4, 22, 0, 'T-AMOOR', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 480, 0, 0, 0, '', 0);
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `stock`, `id_categoria`, `stock_minimo`, `nombre_generico`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `imagen`, `inventariable`) VALUES
(957, '00407', 'PERGAMINO AMOR Y AMISTAD', '95.0', '35.0', 0, 22, 0, 'PERG-A', 26, '2016-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(958, '1140', 'TARJETA DETALLES DE AMOOR JUMBO ', '100.0', '39.0', 0, 21, 0, 'T-TON', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(959, '011818110348', 'TARJETA AMOR ZOTE JUMBO', '58.0', '25.0', 0, 21, 0, 'T-ZOTE', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(960, '7502209450479', 'TARJETA CUADRIPOP  TOON COMPANY', '79.0', '38.0', 0, 21, 0, 'T-CUADRI', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(961, '7502209452558', 'TARGETA DESDOBLABLE TOON COMPANY ', '58.0', '25.0', 0, 21, 0, 'T-DESDO', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(962, '00413', 'BOLSA SAN VALENTIN MEGA JUMBO', '95.0', '35.0', 0, 1, 0, 'MEGA-G', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(963, '00411', 'BOLSA SAN VALENTIN EX JUMBO ', '51.0', '17.0', 0, 1, 0, 'SAN-EXJ', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(964, '00412', 'BOLSA SAN VALENTIN MEGA ', '85.0', '29.0', 0, 1, 0, 'MEGA', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(965, '00409', 'BOLSA SAN VALENTIN EX GRANDE ', '40.0', '17.0', 0, 1, 0, 'SAN-EX', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(966, '00410', 'BOLSA SAN VALENTIN JUMBO', '54.0', '15.0', 45, 1, 0, 'SAN-JM', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 675, 0, 0, 0, '', 0),
(967, '00408', 'BOLSA CHICA SAN VALENTIN ', '24.0', '8.0', 0, 1, 0, 'SAN-CH', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(968, '00418', 'BOLSA SAN VALENTIN MEDIANA ', '39.0', '12.0', 55, 1, 0, 'SAN-M', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, '', 0),
(969, '00419', 'CAJA SAN VALENTIN MEDIANA ', '28.0', '8.0', 0, 1, 0, 'C-VALEM', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(970, '00420', 'CAJA SAN VALENTIN GRANDE ', '41.0', '9.0', 0, 1, 0, 'C-VALEG', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(971, '1417', 'CAJA PELUCHERA GRANNDE', '110.0', '25.0', 21, 1, 0, 'C-PELUC', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 525, 0, 0, 0, '', 0),
(972, '00423', 'PELUCHE OSO BRANDON EN CAJA', '150.0', '50.0', 0, 20, 0, 'P-CANAS', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(973, '00424', 'PELUCHE CORY UNICORNIO GRANDE', '580.0', '290.0', 0, 20, 0, 'CORY', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(974, '00425', 'PELUCHE BABY ANIMALES', '198.0', '79.0', 0, 20, 0, 'P-CAJA.CH', 26, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(975, '711', 'PALETA FLOR  DE BOMBOM ', '15.0', '5.0', 0, 27, 0, 'P-BOM', 29, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(976, '713', 'PALETA BROCHETA DE BOMBOM', '10.0', '3.0', 10, 27, 0, 'BROCHETA', 29, '2016-02-10 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(977, '00429', 'ALMOHADA CARTA TRIMANIX', '280.0', '135.0', 0, 20, 0, 'CARTA', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(978, '00430', 'COJIN TRIMANIX MINI', '100.0', '34.0', 0, 20, 0, 'C-MINIX', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(979, '00431', 'PELUCHES POLIESFERA', '300.0', '110.0', 5, 20, 0, 'MINI-P', 26, '2016-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 550, 0, 0, 0, '', 0),
(980, '00160', 'CARTERA DAMA PORTA CEL', '200.0', '55.0', 0, 23, 0, 'PRT-CEL', 24, '2016-03-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(981, '00161', 'MINIATURA CHOCO AMOR ', '35.0', '16.0', 0, 27, 0, 'CHOCO', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(982, '00162', 'MINIATURA PERRO Y GATO C/ COJIN ', '60.0', '30.0', 0, 27, 0, 'PER-GAT', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(983, '00163', 'MINIATURA EMOTICONES ', '54.0', '27.0', 1, 27, 0, 'EMOTI', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 27, 0, 0, 0, '', 0),
(984, '00164', 'MINIATURA SAGUESO C/ CERCA', '58.0', '29.0', 0, 27, 0, 'CERQIT', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(985, '00165', 'MINIATURA OVEJITA C/ CERCA', '62.0', '31.0', 0, 27, 0, 'OVEJI', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(986, '00166', 'MINIATURA CERQUITA GRANDE', '90.0', '42.0', 0, 27, 0, 'CERQ', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(987, '00167', 'MINIATURA PANDAS C/ LETRERO', '140.0', '70.0', 0, 27, 0, 'M-PANDA', 26, '2016-03-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(988, '00168', 'MINIATURA REGALITO SORPRESA ', '100.0', '39.0', 1, 27, 0, 'REGALIT', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 39, 0, 0, 0, '', 0),
(989, '00169', 'MINIATURA OSO LOVE EN BANQUITA ', '116.0', '58.0', 0, 27, 0, 'BANQ', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(990, '00170', 'MINIATURA OS0 AMOROSO C/ CORAZON', '87.0', '46.0', 0, 27, 0, 'OSO-C', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(991, '00171', 'MINIATURA NIÑA COQUETA', '75.0', '31.0', 1, 27, 0, 'NIÃ‘AA', 26, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 31, 0, 0, 0, '', 0),
(992, '00172', 'MARIQUERA PARIS DAMA', '238.0', '115.0', 0, 23, 0, 'PARISS', 27, '2016-03-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(993, '00176', 'BOLSA MINI IMPRECION ', '17.0', '3.0', 0, 1, 0, 'B-BB', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(994, '00177', 'BOLSO DAMA HEHE', '400.0', '170.0', 6, 23, 0, 'HEHE', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 1020, 0, 0, 0, '', 0),
(995, '00178', 'BOLSO LETIAN DAMA', '140.0', '45.0', 0, 23, 0, 'LETIAN', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(996, '00179', 'CARTERA DAMA UNDER ARMOUR (CLON)', '300.0', '100.0', 4, 23, 0, 'UNDER', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, '', 0),
(997, '00180', 'CARTERA DAMA MK LARGA', '250.0', '70.0', 3, 23, 0, 'K-LARG', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 210, 0, 0, 0, '', 0),
(998, '00181', 'CARTERA DAMA MK WILLIS', '299.0', '70.0', 3, 23, 0, 'WILLIS', 27, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 210, 0, 0, 0, '', 0),
(999, '00183', 'CARTERA DAMA MK (MONEDERO)', '198.0', '60.0', 0, 23, 0, 'MONEDERO', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1000, '00185', 'COSMETIQUERA DAMA MICHAELKORS', '180.0', '100.0', 1, 23, 0, 'MICHAEL', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(1001, '00186', 'MONEDERO LENTES', '100.0', '47.0', 0, 23, 0, 'MONE', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1002, '00187', 'CARTERA FLORES ( ECO )', '100.0', '30.0', 0, 23, 0, '( ECO )', 26, '2016-03-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1003, '00188', 'MOÑO EX GRANDE', '60.0', '10.0', 0, 1, 0, 'BODA', 29, '2016-04-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1004, '00189', 'PELUCHE BRANDON C/ CORAZON ROJO GDE', '1100.0', '350.0', 0, 20, 0, 'BRAND', 24, '2016-04-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1005, '00190', 'COJIN PASTEL DE AMOR', '100.0', '65.0', 2, 20, 0, 'C-DULCE', 24, '2016-04-06 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, '', 0),
(1006, '6940350976805', 'PELUCHE BUUO GRANDE', '400.0', '110.0', 0, 20, 0, 'P-BUUO', 24, '2016-04-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1007, '010', 'GLOBO LATEX', '25.0', '3.0', 214, 30, 0, 'LATEX', 23, '2016-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 642, 0, 0, 0, '', 0),
(1008, '00193', 'MOÑO MEDIANO BODA', '15.0', '3.0', 0, 1, 0, 'M-BODA', 29, '2016-05-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1009, '00173', 'CARTERA PARIS DAMA PORTA CEL', '250.0', '75.0', 0, 23, 0, 'B-PARIS', 27, '2016-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1010, '00174', 'ZIPPO GASOLINA P/ ENCENDEDOR', '120.0', '45.0', 0, 23, 0, 'GAS', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1011, '00194', 'RECARGAS DE ZIPPO', '25.0', '5.0', 47, 23, 0, 'ZIPPO', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 235, 0, 0, 0, '', 0),
(1012, '00195', 'LAPICERO INDIVIDUAL', '100.0', '35.0', 0, 23, 0, 'IND', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1013, '00196', 'TORRE DE PARIS MEDIANA', '240.0', '90.0', 0, 23, 0, 'T-TORRE', 27, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1014, '00197', 'LONCHERA MINIUMS', '145.0', '40.0', 0, 25, 0, 'B-DISNEY', 26, '2016-07-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1015, '00198', 'MARIQUERA FASHION DAMA', '145.0', '50.0', 9, 23, 0, 'M-FASHION', 27, '2016-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, '', 0),
(1016, '00199', 'SANDALIA EN OFERTA', '100.0', '65.0', 0, 23, 0, 'OFERTA', 27, '2016-07-03 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1017, '00222', 'PELUCHE MINIE Y MICKY', '350.0', '220.0', 0, 20, 0, 'P-MYM', 24, '2016-07-10 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1018, '00230', 'CAJA DECORADA CHICA ', '60.0', '20.0', 0, 1, 0, 'CRAF-CH', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1019, '00231', 'CAJA DECORADA MEDIANA', '90.0', '25.0', 2, 1, 0, 'DECO-M', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 50, 0, 0, 0, '', 0),
(1020, '00232', 'CAJA DECORADA GRANDE', '125.0', '30.0', 3, 1, 0, 'DECO-G', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 90, 0, 0, 0, '', 0),
(1021, '00233', 'CAJA DECORADA JUMBO', '165.0', '40.0', 1, 1, 0, 'DECO-J', 26, '2016-07-11 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(1022, '00120', 'PELUCHE PANDA SUPER', '1800.0', '800.0', 0, 20, 0, 'PAND', 24, '2016-07-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1023, '00223', 'PELUCHE OSO GRADUACION', '180.0', '59.0', 0, 20, 0, 'P-GRADUA', 26, '2016-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1024, '00432', 'COJIN LOVE YOU ROSA Y ROJO', '300.0', '130.0', 0, 20, 0, 'C-YOU', 26, '2016-07-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1025, '00224', 'PELUCHE OSO C/ PERGAMINO Y ENVOLTURA ', '200.0', '100.0', 0, 20, 0, 'P-PERG', 26, '2016-07-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1026, '80001', 'MOCHILA 3D DIFERENTE MODELOS', '300.0', '300.0', 0, 25, 0, 'M-3D', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1027, '80002', 'MOCHILA PRIMARIA DIFERENTES MODELOS', '300.0', '250.0', 1, 25, 0, 'M-PRI', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 250, 0, 0, 0, '', 0),
(1028, '80003', 'MOCHILA PRIMARIA M2', '499.0', '305.0', 0, 25, 0, 'M-M2', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1029, '80004', 'MOCHILA KINDER 3D DIFERENTE MODELOS', '450.0', '280.0', 0, 25, 0, 'MK-3D', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1030, '80005', 'MOCHILA KINDER PEPA ', '418.0', '265.0', 0, 25, 0, 'MK-P', 26, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1031, '1197', 'CAJA DE REGALO THE CAT MEDIANA', '68.0', '27.0', 6, 1, 0, 'TE CAT-M', 26, '2016-12-21 00:00:00', '', 0, 0, NULL, NULL, 0, 162, 0, 0, 0, '', 0),
(1032, '80006', 'LONCHERA O BOLSO KINDER ', '299.0', '139.0', 1, 25, 0, 'LON-K', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 139, 0, 0, 0, '', 0),
(1033, '80007', 'LONCHERA CARS KINDER', '370.0', '220.0', 0, 25, 0, 'L-CARS', 26, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1034, '80008', 'LONCHERA KINDER LONCHS2', '250.0', '109.0', 0, 25, 0, 'LON-2', 27, '2016-08-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1035, '80011', 'MOCHILA KINDER RUEDAS', '580.0', '280.0', 0, 25, 0, 'MK-RUEDAS ', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1036, '80012', 'MOCHILA PRIMARIA RUEDAS ', '750.0', '345.0', 0, 25, 0, 'MP-RUEDAS ', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1037, '80013', 'MOCHILA KIT RUEDAS 3D', '1100.0', '67500.0', 0, 25, 0, 'M-K3D', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1038, '80014', 'MOCHILA KIT RUEDAS PRIMARIA', '995.0', '770.0', 0, 25, 0, 'M-KRP', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1039, '80010', 'LAPICERA DIFERENTES MODELOS ', '150.0', '95.0', 0, 25, 0, 'LAP', 27, '2016-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1040, '00234', 'TIARA DIFERENTE MODELOS ', '40.0', '20.0', 7, 23, 0, 'TIARA-BB', 26, '2016-08-27 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, '', 0),
(1041, '00235', 'COJIN CARA CHAMOY GRANDE', '300.0', '140.0', 0, 20, 0, 'C-CHAMOY', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1042, '00236', 'COJIN CHAMOY GRANDE', '280.0', '120.0', 0, 20, 0, 'J-CHAMOY', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1043, '00237', 'COJIN BEBE NEONATO', '250.0', '100.0', 0, 20, 0, 'C-NEONATO', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1044, '00238', 'COJIN CARITA BEBE NEONATO', '250.0', '100.0', 0, 20, 0, 'C-BB-NEO', 26, '2016-09-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1045, '00542', 'BOLSA BUTIC CHICA', '22.0', '9.0', 0, 1, 0, 'BK-CH', 21, '2016-10-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1046, '734689005413', 'PELUCHE OSOS KODAK MEDIANO', '300.0', '130.0', 0, 20, 0, 'P-KODAK', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1047, '734689600113', 'PELUCHE OSO JAZPIADO CHICO', '198.0', '100.0', 0, 20, 0, 'PJAZP-C', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1048, '734689164738', 'PELUCHE OSO JAKE MEDIANO', '300.0', '126.0', 0, 20, 0, 'JAK', 26, '2017-01-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1049, '7506406500326', 'PELUCHE OSO MOLT C/ BUFANDA', '900.0', '464.0', 0, 20, 0, 'P-MOLT', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1050, '7506406500388', 'PELUCHE OSOS BUBU SUPER', '1000.0', '492.0', 0, 20, 0, 'P-BUBU', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1051, '734689614431', 'PELUCHE OSO RIZADO MEDIANO', '350.0', '130.0', 0, 20, 0, 'P-RIZADO', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1052, '734689041633', 'PELUCHE PERRO RIZADO MEDIANO', '350.0', '130.0', 0, 20, 0, 'P-RIZZA', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1053, '734689165926', 'PELUCHE OSO YUNI HUELLAS GRANDE', '680.0', '250.0', 0, 20, 0, 'P-YUNI', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1054, '734689104338', 'PELUCHE OSO TACHIS GRANDES', '370.0', '130.0', 0, 20, 0, 'P-TACHIS', 26, '2017-01-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1055, '487698542', 'PERFUME HALLOWEEN DAMA', '850.0', '500.0', 0, 24, 0, 'HALLOWE', 24, '2017-02-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1056, '734689164745', 'PELUCHE PERRO NUR RIZADO', '300.0', '126.0', 0, 20, 0, 'P-NUR', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1057, '8897', 'PELUCHE PERROS COQUETOS', '185.0', '85.0', 0, 20, 0, 'P-COQUET', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1058, '734689173754', 'PELUCHE PERRO RIZADO C/ HUESO', '380.0', '149.0', 0, 20, 0, 'P-RIZZ', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1059, '734689164776', 'PELUCHE OSO KLIM GRANDE ', '500.0', '200.0', 0, 20, 0, 'P-KLIM', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1060, '8517857400379', 'PELUCHE KODAK SUPER', '850.0', '340.0', 0, 20, 0, 'P-KODA', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1061, '7506406500241', 'PELUCHE OSO WALDO SUPER ', '1200.0', '560.0', 0, 20, 0, 'P-WALDO', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1062, '851785770202', 'PELUCHE OSO VOTT T.Q.M SUPER', '1100.0', '475.0', 0, 20, 0, 'P-VOOT', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1063, '8896', 'PELUCHE PANDA Y POLAR GRANDE', '600.0', '204.0', 0, 20, 0, 'P-PAND', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1064, '734689164790', 'PELUCHE PANDA NINI GRANDE', '450.0', '204.0', 0, 20, 0, 'P-NINI', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1065, '818980013381', 'PELUCHE OSO HUELLAS GRANDE', '780.0', '390.0', 0, 20, 0, 'P-HUELLS', 24, '2017-02-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1066, '8899', 'CARITA WHATSAPP MINI', '110.0', '40.0', 2, 20, 0, 'C-MINI', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 80, 0, 0, 0, '', 0),
(1067, '8898', 'MUÑEQUITO WHATSAPP', '145.0', '50.0', 4, 20, 0, 'M-WHAT', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(1068, '8895', 'PELUCHE BUOS CHICO', '135.0', '38.0', 0, 20, 0, 'P-BUO', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1069, '8894', 'CUBO WHATSAPP ', '160.0', '71.0', 0, 20, 0, 'P-CUBO', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1070, '444', 'GLOBO SAN VALENTIN MEDIANO', '75.0', '25.0', 0, 30, 0, 'G-SAN', 26, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1071, '8891', 'CAJA CAMICERA JUMBO', '168.0', '45.0', 0, 1, 0, 'C-CAMIC', 26, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1072, '8881', 'PELUCHE OSO C/ RAMO', '550.0', '250.0', 0, 20, 0, 'P-RAMO', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1073, '8882', 'PELUCHE OSITA CORAZON FLORES CHICO', '170.0', '80.0', 0, 20, 0, 'FLORS', 24, '2017-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1074, '8884', 'PELUCHE OSA CORAZON PETALOS ', '600.0', '250.0', 0, 20, 0, 'P-PETALOS', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1075, '8883', 'PELUCHE OSO C/ PALETA GRANDE', '650.0', '290.0', 0, 20, 0, 'P-PALET', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1076, '8885', 'PELUCHE OSO BRANDON GRANDE', '900.0', '432.0', 0, 20, 0, 'P-GLOBO', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1077, '8886', 'PELUCHE OSO BRANDON PATON', '550.0', '250.0', 0, 20, 0, 'PATON', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1078, '8887', 'PELUCHE OSO BRANDON GLOBOS MEDIANO', '380.0', '170.0', 0, 20, 0, 'P-GLOBS', 24, '2017-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1079, '0111', 'LAMPARA INFANTIL CONEJITA- ZMLY305', '350.0', '158.0', 0, 22, 0, 'LMP-CONEJ', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1080, '0112', 'LAMPARA INFANTIL RANA Y OSO -ZMLY346', '280.0', '102.0', 0, 22, 0, 'LAM-RANI', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1081, '0113', 'LAMPARA INFANTIL PANDA -ZOECG094', '400.0', '175.0', 0, 22, 0, 'LAM-PAN', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1082, '0114', 'LAMPARA INFANTIL RANA- ZMLY306', '350.0', '158.0', 0, 22, 0, 'LAM-RAN', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1083, '0115', 'LAMPARA INFANTIL C/DESPERTADOR', '418.0', '190.0', 0, 22, 0, 'LAM-DESPER', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1084, '0116', 'PORTA RETRATO TARRO', '145.0', '62.0', 0, 22, 0, 'P-TARRO', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1085, '0117', 'PORTA RETRATO OSO BEAR ', '160.0', '66.0', 0, 29, 0, 'P-OSO', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1086, '0118', 'RELOJ DESPERTADOR ROBOTT', '160.0', '60.0', 0, 22, 0, 'R-ROBOTT', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1087, '1911', 'RELOJ DISNEY DIFERENTE MODELOS ', '400.0', '170.0', 4, 22, 0, 'R-DISNE', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 680, 0, 0, 0, '', 0),
(1088, '7500225183388', 'PELUCHE CONEJO PANTUMFLINES GDE', '235.0', '99.0', 0, 20, 0, 'PANTUMFLINES ', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1089, '0121', 'RELOJ DESPERTADOR OSO C/ PENDULO', '150.0', '60.0', 0, 22, 0, 'R-PENDULO', 26, '2017-04-19 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1090, '0122', 'RELOJ DE PARET SANTA MANIA ', '150.0', '56.0', 0, 22, 0, 'R-MANIA', 26, '2017-05-01 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1091, '00526', 'BOLSO HEHE DOBLE BOLSO', '600.0', '190.0', 0, 23, 0, 'B-HEHE', 27, '2017-06-21 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1092, '71618', 'MOCHILA FULANITO Y CHANGOLO CHENSON P/N', '600.0', '385.0', 0, 25, 0, 'MOCH-F', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1093, '71619', 'MOCHILA FULANITO ROSA CHENSON P/N', '700.0', '420.0', 0, 25, 0, 'FUL-ROS', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1094, '71617', 'MOCHILA CARRO CARS KINDER P/N', '470.0', '314.0', 0, 25, 0, 'CARS-K', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1095, '71616', 'MOCHILA CARRO CARS PRIMARIA P/N', '500.0', '380.0', 1, 25, 0, 'CARS-PR', 21, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, '', 0),
(1096, '71615', 'MOCHILA BARMAN Y MINIUM P/N', '480.0', '199.0', 0, 25, 0, 'BAT-MIN', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1097, '71614', 'MOCHILA BATMAN SERIE2 P/N', '350.0', '119.0', 0, 25, 0, 'BAT-2', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1098, '71613', 'SET MOCHILA LONCHERA Y LAPICERA P/N', '1300.0', '900.0', 0, 25, 0, 'SET-M', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1099, '71612', 'SET MOCHILA LONCHERA LAPICERA CARS', '1400.0', '950.0', 0, 25, 0, 'SET-CARS', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1100, '71611', 'MOCHILA DIFERENTES MODELOS P/N', '400.0', '120.0', 1, 25, 0, 'M-P/N', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1101, '71610', 'MOCHILA KINDER BATMAN', '300.0', '130.0', 0, 25, 0, 'KIN-BAT', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1102, '71609', 'MOCHILA KINDER DIFERENTES MODELOS P/N', '200.0', '100.0', 0, 25, 0, 'M-KINN', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1103, '71608', 'LONCHERA DIFERENTE MODELOS P/N', '300.0', '100.0', 3, 25, 0, 'P/N', 26, '2017-08-17 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, '', 0),
(1104, '71607', 'LAPICERA SERIE1  P/N', '190.0', '135.0', 0, 25, 0, 'SERIE1', 26, '2017-08-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1105, '71606', 'LAPICERA SERIE2  P/N', '160.0', '80.0', 0, 25, 0, 'S/2', 26, '2017-08-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1106, '71605', 'LAPICERA KIT', '190.0', '130.0', 0, 25, 0, 'L-KIT', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1107, '71604', 'LONCHERA KIT', '350.0', '270.0', 0, 25, 0, 'LON-KIT', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1108, '71603', 'MOCHILA RUEDAS', '700.0', '330.0', 2, 25, 0, 'M-KIT', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 660, 0, 0, 0, '', 0),
(1109, '71602', 'LAPICERA KIT CARS', '200.0', '130.0', 0, 25, 0, 'CARS', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1110, '71601', 'LONCHERA KIT CARS', '380.0', '270.0', 0, 25, 0, 'KIT-CARS', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1111, '71600', 'MOCHILA KIT CARS', '800.0', '550.0', 0, 25, 0, 'M-CARS', 26, '2017-08-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1112, '002000', 'EXIBIDOR PARA GORRAS ', '100.0', '25.0', 18, 23, 0, 'EX-GORRA', 26, '2017-09-24 00:00:00', '', 0, 0, NULL, NULL, 0, 450, 0, 0, 0, '', 0),
(1113, '0100', 'MINIATURA CERQUITA CHICA C/ RANITA', '68.0', '33.0', 0, 27, 0, 'M-CERQ', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1114, '1171', 'MINIATURA CORAZON VALENTINO', '70.0', '29.0', 0, 27, 0, 'VAALE', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1115, '1173', 'MINIATURA OVEJA JUMBO', '150.0', '65.0', 1, 27, 0, 'OVEJA-J', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 65, 0, 0, 0, '', 0),
(1116, '1174', 'MINIATURA OVEJA COLGANTE', '65.0', '29.0', 0, 27, 0, 'OVE-COLG', 26, '2017-11-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1117, '1175', 'RELOJ CLON CABALLERO CAJA', '400.0', '130.0', 6, 23, 0, 'R-CLON', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 780, 0, 0, 0, '', 0),
(1118, '1176', 'MOCHILA COOL IMPERMIABLE', '270.0', '130.0', 0, 23, 0, 'B-COOL', 26, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1119, '1177', 'BOLSO XR COOL DAMA', '470.0', '220.0', 0, 23, 0, 'XR-COOL', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1120, '1178', 'BOLSO VL-CH-MK-DAMA ', '250.0', '110.0', 8, 23, 0, 'C&L', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 880, 0, 0, 0, '', 0),
(1121, '1179', 'MARIQUERA OH CABALLERO', '300.0', '6.0', 0, 23, 0, 'M-OH', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1122, '1180', 'MARIQUERA LETIAN CABALLERO ', '250.0', '85.0', 0, 23, 0, 'M-LETY', 27, '2017-11-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1123, '8893', 'MUÑEQUITO WHATSAPP EN CAJA', '160.0', '67.0', 0, 20, 0, 'P-WHAT', 26, '2017-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1124, '8892', 'MUÑEQUITO WHATSAPP C/ SONIDO', '190.0', '77.0', 0, 20, 0, 'M/SONID', 26, '2017-11-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1125, '7500181716040', 'PELUCHE OSO ALGODONIS GRANDE', '300.0', '129.0', 0, 20, 0, 'ALGODONIS', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1126, '7500193164921', 'PELUCHE OSO ALGODONIS MED', '217.0', '87.0', 0, 20, 0, 'ALGO-MED', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1127, '7500142617119', 'PELUCHE OSO CHOKOPACHON GDE', '360.0', '115.0', 0, 20, 0, 'PACHONG', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1128, '7500203960611', 'PELUCHE OSO PATOCHO MED', '189.0', '79.0', 0, 20, 0, 'PATOCHO', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1129, '8888', 'PELUCHES BEBES GRANDES', '260.0', '96.0', 0, 20, 0, 'BEBES', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1130, '7500124755815', 'PELUCHE JIRAFA NECKY  C/SONIDO', '300.0', '115.0', 0, 20, 0, 'NECK', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1131, '7500202106614', 'PELUCHE OSO FLAIS COOL ', '238.0', '109.0', 0, 20, 0, 'FLAIS', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1132, '7500203960628', 'PELUCHE OSO PANQUECITO MED', '187.0', '75.0', 0, 20, 0, 'PANQ', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1133, '7500142617102', 'PELUCHE OSO CHOKOPACHON MED', '188.0', '67.0', 0, 20, 0, 'CHOKOP', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1134, '7500133133710', 'PELUCHE OSO SONRIKY GDE', '230.0', '96.0', 0, 20, 0, 'RIKY', 24, '2017-12-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1135, '1181', 'RELOJ CLON CABALLERO FOSSIL', '500.0', '150.0', 0, 23, 0, 'FOSSIL', 26, '2018-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1136, '3566', 'PELUCHE OSO ROSA CORAZON CON SONIDO JUMBO', '650.0', '339.0', 0, 20, 0, 'P-ROS', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1137, '3559', 'PELUCHE OSO CORAZON GLITER GRANDE', '1200.0', '650.0', 0, 20, 0, 'OSO-GRA', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1138, '2232', 'PELUCHE OSO BRANDON MEDIANO', '600.0', '251.0', 1, 20, 0, 'BODO', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 251, 0, 0, 0, '', 0),
(1139, '1421', 'PELUCHE PERROS HERMOSOS GRANDES', '799.0', '406.0', 0, 20, 0, 'HERM', 0, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1140, '7718', 'PELUCHE OSO HUELLIPAW JUMBO', '450.0', '229.0', 0, 20, 0, 'PAW', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1141, '4793', 'PELUCHE BORREGO BORRIS CON SONIDO ', '300.0', '145.0', 0, 20, 0, 'BORRIS', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1142, '1076', 'PELUCHE PERRITOS HERMOSOS MEDIANOS', '299.0', '116.0', 0, 20, 0, 'P-HERM', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1143, '7500202107017', 'PELUCHE PERRA CHIHUAGUIS  CON SONIDO CHICO ', '235.0', '109.0', 0, 20, 0, 'CHIHUAGUIS', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1144, '8139', 'PELUCHE JIRAFA FLAUTICA CHICA', '145.0', '41.0', 0, 20, 0, 'FLAU', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1145, '7511', 'PELUCHE PATA PIKORINA GRANDE ', '300.0', '106.0', 0, 20, 0, 'PIKO', 24, '2018-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1146, '1172', 'MINIATURA UNICORNIO', '64.0', '32.0', 0, 27, 0, 'M-UNICOR', 26, '2018-06-28 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1147, '7500225182282', 'PELUCHE PANDA PANCHINY GDE', '238.0', '99.0', 0, 20, 0, 'PANCHINY', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1148, '7500193163931', 'PELUCHE OSITO CHOKOLONO GDE', '290.0', '139.0', 0, 20, 0, 'CHOKOLONO', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1149, '7500140872794', 'PELUCHE PUERCORRIQUEÑO MEDIANO', '190.0', '75.0', 0, 20, 0, 'PUERCORRIQUEÃ‘O', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1150, '7500226185695', 'PELUCHE PERRO DALMATA MEDIANO', '270.0', '129.0', 0, 20, 0, 'DALMATA', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1151, '7500194853527', 'PELUCHE OSO CHOCORROLO MEDIANO', '218.0', '89.0', 0, 20, 0, 'CHOCORROLO', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1152, '7500216170212', 'PELUCHE OSITOS MOLIZ CLASIC MEDIANO', '218.0', '89.0', 0, 20, 0, 'MOLIZ', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1153, '7500232929221', 'PELUCHE PERRITA PARISINA GDE CON SONIDO', '270.0', '99.0', 1, 20, 0, 'PARISINA', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 99, 0, 0, 0, '', 0),
(1154, '7500237618625', 'PELUCHE OSO CACHITO MEDIANO', '179.0', '69.0', 0, 20, 0, 'CACHITO', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1155, '7500216170229', 'PELUCHE OSITOS MOLIZ BABY MEDIANO', '218.0', '89.0', 0, 20, 0, 'MOLIZ BABY', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1156, '7500181829177', 'PELUCHE ANIMALES GAFIKY GDE', '265.0', '119.0', 1, 20, 0, 'GAFIKY', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 119, 0, 0, 0, '', 0),
(1157, '7500237618113', 'PELUCHE PUERQUITA PALANKETA CHICA', '118.0', '39.0', 0, 20, 0, 'PALANQUETA', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1158, '7500159828515', 'PELUCHE GATO COLOFUS CHICO', '118.0', '36.0', 0, 20, 0, 'COLOFUS', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1159, '7500212541214', 'PELUCHE OSO CACHETONY CHICO', '118.0', '36.0', 0, 20, 0, 'CACHETONY', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1160, '7500159771392', 'PELUCHE OSO CURY CHICO', '140.0', '36.0', 0, 20, 0, 'CURY', 24, '2018-12-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1161, '8147', 'PANTUMFLA UNICORNIO CHICA ', '110.0', '50.0', 0, 22, 0, 'PANTU-CH', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1162, '8148', 'PANTUMFLA UNICORNIO MEDIANA ', '138.0', '55.0', 0, 22, 0, 'PAMTU-MED', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1163, '8149', 'PANTUMFLA DIFERENTES TALLAS', '198.0', '100.0', 2, 22, 0, 'PANTU-GDE', 26, '2018-12-20 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(1164, '8877', 'BOLSO DAMA FASS', '300.0', '150.0', 0, 23, 0, 'DOBLE', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1165, '9181', 'MOCHILITA CONEJO LENTEJUELAS CHICA', '250.0', '130.0', 0, 22, 0, 'LENTEJUELAS', 26, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1166, '9117', 'BOLSO COOL DAMA DIFERENTE COLORES', '200.0', '110.0', 0, 23, 0, 'BOLSO-COOL', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1167, '9411', 'BOLSO HEHE DAMA CHICO', '450.0', '210.0', 3, 23, 0, 'HEHE-CH', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 630, 0, 0, 0, '', 0),
(1168, '9412', 'BOLSO OH DAMA CHICO', '300.0', '110.0', 0, 23, 0, 'OH', 27, '2018-12-23 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1169, '1515', 'BOLSO SIRENA CHIC GLAMUR', '320.0', '160.0', 0, 23, 0, 'B-CHIC', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1170, '1616', 'MOCHILA BUO CHIC GLAMUR', '600.0', '290.0', 0, 23, 0, 'M-CHIC', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1171, '1717', 'MOCHILA ANGEL CHIC GLAMUR', '590.0', '200.0', 0, 23, 0, 'A-GLAMUR', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1172, '1818', 'LAMPARA UNICORNIO CHIC GLAMUR', '350.0', '125.0', 1, 23, 0, 'LM-CHIC', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 125, 0, 0, 0, '', 0),
(1173, '1919', 'MOCHILA MICKY MAUS', '270.0', '120.0', 0, 23, 0, 'MAUS', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1174, '1414', 'MOCHILA CHIC CONEJO CON CORREA PROTECCION', '250.0', '100.0', 0, 23, 0, 'CHIC-CONEJ', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1175, '1112', 'MALETIN UNICORNIO CHICO', '150.0', '70.0', 0, 23, 0, 'MALETIN-CH', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1176, '1212', 'MALETIN UNICORNIO MEDIANO', '150.0', '100.0', 1, 23, 0, 'MALETIN-M', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(1177, '1313', 'MALETIN UNICORNIO GRANDE', '187.0', '110.0', 1, 23, 0, 'MALETIN-G', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, '', 0),
(1178, '1817', 'COSMETIQUERAS CHIP 3 PIEZAS', '218.0', '70.0', 1, 23, 0, 'COSM-CHIP', 26, '2019-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(1179, '1615', 'COSMETIQUERA CHIP', '190.0', '60.0', 0, 23, 0, 'COS-CHP', 26, '2019-01-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1180, '1411', 'ALMOHADA BLANCA SAN VALENTIN ', '180.0', '65.0', 1, 20, 0, 'AL-SANVALENTIN', 26, '2019-02-07 00:00:00', '', 0, 0, NULL, NULL, 0, 65, 0, 0, 0, '', 0),
(1181, '8816', 'PELUCHE STICHIS SUPER', '1400.0', '530.0', 0, 20, 0, 'STICHIS-S', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1182, '8817', 'PELUCHE AGELA GRANDE', '650.0', '200.0', 0, 20, 0, 'ANGELA-G', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1183, '8815', 'PELUCHE STICHIS MEDIANO (ECO)', '360.0', '120.0', 0, 20, 0, 'STIC-M', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1184, '8812', 'PELUCHE STICHIS BEBE CHICOS', '499.0', '280.0', 0, 20, 0, 'STIC-BB-CH', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1185, '8813', 'PELUCHE BB NANI CHICO', '499.0', '280.0', 0, 20, 0, 'NANI-BB-CH', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1186, '8814', 'PELUCHE STICHS BB MEDIANO', '390.0', '120.0', 0, 20, 0, 'STICH-BB-M', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1187, '8818', 'PELUCHE BB NANI MEDIANO', '700.0', '350.0', 0, 20, 0, 'NANI-BB-M', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1188, '8819', 'PELUCHE BB STICHIS GRANDE', '850.0', '400.0', 0, 20, 0, 'STICHIS-BB-G', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1189, '8810', 'PELUCHE BB  NANI GRANDE', '850.0', '400.0', 0, 20, 0, 'NANI-BB-G', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1190, '7711', 'PELUCHE STICHIS BEBES GRANDES', '700.0', '320.0', 0, 20, 0, 'BBS-STICHIS', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1191, '7712', 'PELUCHE BEBES STICHIS CHICO', '180.0', '50.0', 0, 20, 0, 'BEBES-CH', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1192, '7713', 'COJIN BEBE INCREIBLE', '270.0', '100.0', 0, 20, 0, 'BB-INCREIBLE', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1193, '7714', 'PELUCHE BB INCREIBLE MEDIANO', '200.0', '70.0', 0, 20, 0, 'BB-INCRE', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1194, '7715', 'COJIN DE DONA EXPLOWORT', '300.0', '144.0', 6, 20, 0, 'DONA', 26, '2019-02-11 00:00:00', '', 0, 0, NULL, NULL, 0, 864, 0, 0, 0, '', 0),
(1195, '712', 'PALETA TREVOL DE BOMBOM', '10.0', '5.0', 0, 27, 0, 'TREVOL', 29, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1196, '715', 'LAPICERO LOVE ', '15.0', '7.0', 0, 27, 0, 'L-LOVE', 26, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1197, '718', 'PELUCHE OSITO SAN VALENTIN DECORADO', '160.0', '70.0', 1, 20, 0, 'SAN-VALE', 26, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(1198, '7716', 'PELUCHE PERRITA DECORADA', '295.0', '119.0', 0, 20, 0, 'PERRIT', 24, '2019-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1199, '7719', 'PULCERA CABALLERO FASSION', '120.0', '28.0', 0, 23, 0, 'P-FASS', 27, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1200, '719', 'PELUCHE OSITOS CAJA SORPRESA', '300.0', '120.0', 0, 20, 0, 'P-SORPRESA', 26, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1201, '771', 'MINIATURA MUÑECA BALETT', '110.0', '40.0', 2, 27, 0, 'BALLET', 26, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1202, '7500107573542', 'PELUCHE OSO MI CORAZON LATE CON SONIDO JUMBO', '680.0', '339.0', 2, 20, 0, 'P-LATE', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 678, 0, 0, 0, '', 0),
(1203, '7500107574167', 'PELUCHE OSO CHAKIRIN JUMBO', '700.0', '368.0', 0, 20, 0, 'P-CHAKI', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1204, '7500107573535', 'PELUCHE OSO MI CORAZON LATE C/ SONIDO GRANDE', '395.0', '232.0', 0, 20, 0, 'LATE-G', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1205, '7500107574143', 'PELUCHE OSO CORAZON TE AMO JUMBO', '750.0', '368.0', 1, 20, 0, 'T-AMO', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 368, 0, 0, 0, '', 0),
(1206, '7500107574235', 'PELUCHE OSO CORAZON DIAMANTE JUMBO', '700.0', '349.0', 0, 20, 0, 'P-DIAMANTE', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1207, '7500107574204', 'PELUCHE OSO HUGS AND KISSES', '700.0', '368.0', 0, 20, 0, 'P-KISS', 24, '2019-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1208, '7500107574228', 'PELUCHE OSO CORAZON DIAMANTE GRANDE', '395.0', '232.0', 0, 20, 0, 'DIAMAN-G', 24, '2019-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1209, '7500226185619', 'PELUCHE OSO PANCHO GRANDE', '300.0', '145.0', 0, 20, 0, 'PANCHO', 24, '2019-02-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1210, '7780', 'MOCHILAS MIKO YAMAS Y UNICORNIO ', '380.0', '190.0', 2, 25, 0, 'M-MIKO', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 380, 0, 0, 0, '', 0),
(1211, '7781', 'MOCHILA YAMAS PRIMARIA', '300.0', '160.0', 1, 25, 0, 'M-YAMS', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, '', 0),
(1212, '7782', 'MOCHILA UNICORNIO PRIMARIA (ECO)', '200.0', '120.0', 0, 25, 0, 'UNICOR', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1213, '7783', 'MOCHILA UNICORNIO ', '290.0', '130.0', 1, 25, 0, 'M-UNI', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 130, 0, 0, 0, '', 0),
(1214, '7784', 'MOCHILA NIÑA PRIMARIA FASHIONBACK', '350.0', '110.0', 4, 25, 0, 'M-BACK', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, '', 0),
(1215, '7785', 'MOCHILA COLOR NIÑO', '300.0', '110.0', 1, 25, 0, 'COLOR', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, '', 0),
(1216, '7786', 'MOCHILA CORAZON GLITER PRIMARIA', '450.0', '220.0', 2, 25, 0, 'GLITER', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 440, 0, 0, 0, '', 0),
(1217, '7788', 'MOCHILA BUOS  UNICORNIO LEONCITO Y BATMAN PRIMARIA', '400.0', '200.0', 3, 25, 0, 'PRIMA', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, '', 0),
(1218, '7789', 'MOCHILA NEGRA ', '350.0', '120.0', 1, 25, 0, 'NEGRA', 27, '2019-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1219, '7790', 'MOCHILA UNIKER ', '450.0', '230.0', 7, 25, 0, 'UNIKER', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 1610, 0, 0, 0, '', 0),
(1220, '7791', 'MOCHILA PANDA SNOPPY Y UNICORNIO', '300.0', '145.0', 6, 25, 0, 'M-NEGRA', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 870, 0, 0, 0, '', 0),
(1221, '1117', 'LAPICERA SABONIS A-1', '140.0', '70.0', 0, 25, 0, 'A-1', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1222, '1118', 'LAPICERA SABONIS TUBO A-2', '100.0', '50.0', 4, 25, 0, 'A-2', 0, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(1223, '1119', 'LAPICERA SABONIS PLANA A-3', '115.0', '50.0', 8, 25, 0, 'A-3', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 400, 0, 0, 0, '', 0),
(1224, '1116', 'LAPICERA SABONIS A-4', '110.0', '60.0', 2, 25, 0, 'A-4', 27, '2019-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1225, '7795', 'BOLSITO P/ NIÑA (MUÑEQUITOS)', '120.0', '55.0', 1, 23, 0, 'OSITO', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 55, 0, 0, 0, '', 0),
(1226, '7792', 'MOCHILA NIKE MOD-1', '250.0', '125.0', 3, 25, 0, 'NIKE-1', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 375, 0, 0, 0, '', 0),
(1227, '1902', 'LLAVERO GARZA DIAMANTE', '138.0', '40.0', 0, 23, 0, 'DIAMNA', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1228, '1914', 'LLAVERO ANIMALITOS ', '50.0', '25.0', 0, 23, 0, 'ANIMAL', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1229, '1716', 'PELUCHE ANIMALES TE AMO C/ SONIDOS', '390.0', '160.0', 1, 20, 0, 'ANIMALES-TAM', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 160, 0, 0, 0, '', 0),
(1230, '7151', 'ALMOHADA COSTALITO NEGRO', '190.0', '90.0', 3, 20, 0, 'COSTAL', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 270, 0, 0, 0, '', 0),
(1231, '7152', 'ALMOHADA MANTA CUADRADA GRANDE', '230.0', '80.0', 0, 20, 0, 'MANTA-G', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1232, '7153', 'ALMOHADA MANTA CUADRADA MEDIANA', '210.0', '70.0', 4, 20, 0, 'MANTA-M', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 280, 0, 0, 0, '', 0),
(1233, '7154', 'ALMOHADA MANTA PINTADA CHICA ', '140.0', '60.0', 1, 20, 0, 'MANTA-CH', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 60, 0, 0, 0, '', 0),
(1234, '4323', 'PELUCHE OSO DAUGLAS CHICO', '179.0', '69.0', 0, 20, 0, 'DAUGLAS-C', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1235, '3428', 'PELUCHE OSA  BALERICA MED', '218.0', '99.0', 0, 20, 0, 'BALERIKA-MED', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1236, '0129', 'PELUCHE GATITO MIAU C/ SONIDO MED', '228.0', '99.0', 0, 20, 0, 'MIUA-MED', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1237, '1928', 'PELUCHE PERRITA POLETIKA MED', '195.0', '79.0', 0, 20, 0, 'POLETIKA-M', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1238, '0176', 'PELUCHE GATO RAYUFU   C/ SONIDO GDE', '280.0', '119.0', 0, 20, 0, 'RAYUF-G', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1239, '6713', 'PELUCHE OSO KINGDOM GDE', '290.0', '149.0', 0, 20, 0, 'KING-GDE', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1240, '8124', 'PELUCHE ELEFANTE ELEFANTONI GDE', '300.0', '99.0', 2, 20, 0, 'ELEF-GDE', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 198, 0, 0, 0, '', 0),
(1241, '5615', 'PELUCHE PERRO CACHORRIS MED', '220.0', '89.0', 1, 20, 0, 'CACHORRIS-M', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 89, 0, 0, 0, '', 0),
(1242, '5212', 'PELUCHE PERRITA CHIUACHIS MED', '189.0', '64.0', 1, 20, 0, 'CHIHUACHIS-M', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 64, 0, 0, 0, '', 0),
(1243, '6027', 'PELUCHE OSO CHOKORRORRO GDE', '260.0', '129.0', 0, 20, 0, 'CHOCORR', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1244, '1037', 'PELUCHE CONEJA BRICOLIN GDE', '350.0', '109.0', 0, 20, 0, 'BRINCO-G', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1245, '9626', 'PELUCHE OSO POLAR CHICO', '189.0', '79.0', 2, 20, 0, 'PE-PO', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 158, 0, 0, 0, '', 0),
(1246, '2245', 'PELUCHE OSO CORAZON LOVE C/SONIO EX GDE', '380.0', '149.0', 0, 20, 0, 'LOVE-EX-G', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1247, '3573', 'PELUCHE OSO CORAZONADA C/SONIDO EX GRANDE', '450.0', '199.0', 0, 20, 0, 'CORAZONADA-EXG', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1248, '0411', 'PELUCHE OSO TIBET GDE', '399.0', '159.0', 0, 20, 0, 'TIBET', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1249, '3238', 'PELUCHE OREJOLOS GDE', '379.0', '129.0', 1, 20, 0, 'OREJO-GDE', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 129, 0, 0, 0, '', 0),
(1250, '7779', 'BOLSITO OSOS MONEDERO PLASTICO', '97.0', '38.0', 2, 23, 0, 'MONED-PLAS', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 76, 0, 0, 0, '', 0),
(1251, '1412', 'PELUCHE MINIE BB', '149.0', '60.0', 0, 20, 0, 'MINI-BB', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1252, '1413', 'PELUCHE D-J CHICO', '200.0', '50.0', 0, 20, 0, 'D.J.CH', 24, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1253, '1415', 'COJIN PANDA UNICORNIO GDE', '350.0', '120.0', 0, 20, 0, 'PANDA-GDE', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1254, '1416', 'COJIN PANDA UNICORNIO  MEDIANA', '279.0', '100.0', 0, 20, 0, 'PANDA-M', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1255, '1711', 'CAJA SORPRESA MOD-1', '35.0', '20.0', 0, 1, 0, 'MOD.1', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1256, '1712', 'CAJA SORPRESA MOD-2', '65.0', '35.0', 0, 1, 0, 'MOD.2', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1257, '1713', 'CAJA SORPRESA MOD-3', '85.0', '45.0', 0, 1, 0, 'MOD.3', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1258, '1714', 'CAJA SORPRESA MOD-4', '110.0', '55.0', 0, 1, 0, 'MOD.4', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1259, '1718', 'CAJA SORPRESA MOD-5', '145.0', '75.0', 0, 1, 0, 'MOD.5', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1260, '1719', 'CAJA SORPRESA MOD-6', '195.0', '105.0', 0, 1, 0, 'MOD.6', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1261, '1720', 'CAJA SORPRESA MOD-7', '170.0', '95.0', 0, 1, 0, 'MOD.7', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1262, '1721', 'CAJA SORPRESA MOD-8', '250.0', '125.0', 0, 1, 0, 'MOD.8', 26, '2020-02-12 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1263, '1516', 'ROSAS C/ CHOCOLATE', '25.0', '12.0', 0, 27, 0, 'ROSAS-CHO', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1264, '7087', 'GOMA UNICORNIO Y TRANSFORME', '45.0', '18.0', 1, 26, 0, 'GOMA', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 18, 0, 0, 0, '', 0),
(1265, '1820', 'MINI GOMAS CORAZON', '10.0', '9.0', 0, 26, 0, 'GOMAS-MINI', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1266, '7502', 'LIBRETA MINIE Y KITY LENTEJUELAS', '165.0', '75.0', 0, 26, 0, 'LENTEJ', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1267, '7866', 'DIARIOS UNICORNIO FROSEN LOL LEIDY PIKMI', '160.0', '75.0', 0, 26, 0, 'DIARIOS.', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1268, '1819', 'PLUMA SQUISHIES ', '20.0', '8.0', 9, 26, 0, 'SQUIS', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 72, 0, 0, 0, '', 0),
(1269, '1517', 'PLUMA UNICORNIO AGUITA C/BRILLO', '25.0', '5.0', 6, 26, 0, 'PLUM-C/BRI', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 30, 0, 0, 0, '', 0),
(1270, '5278', 'PLUMA ESCANDALOSO ', '15.0', '4.0', 1, 26, 0, 'ESCANDALOS', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 4, 0, 0, 0, '', 0),
(1271, '7811', 'PLUMA SANVALENTIN', '15.0', '6.0', 6, 26, 0, 'PLUMA-SAN', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 36, 0, 0, 0, '', 0),
(1272, '1476', 'GOMAS DONITAS', '45.0', '15.0', 3, 26, 0, 'DONITS', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, '', 0),
(1273, '1908', 'PLUMA MULTICOLOR  UNICORNIO', '20.0', '4.0', 10, 26, 0, 'MULTI', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 40, 0, 0, 0, '', 0),
(1274, '7315', 'SET PLUMAS DE GEL', '189.0', '70.0', 0, 26, 0, 'ST-PLU', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1275, '1821', 'CAJA CHOCOLATERA ', '138.0', '55.0', 0, 1, 0, 'CHOCO-C', 26, '2020-02-13 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1276, '2110', 'BOTELLA C/ DULCE MEDIANA', '116.0', '51.0', 11, 27, 0, 'BOTELLA-M', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 561, 0, 0, 0, '', 0),
(1277, '2111', 'ARREGLO C/ PELUCHE PARA MAMA', '35000.0', '12000.0', 0, 20, 0, 'A-PELUCHE', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `stock`, `id_categoria`, `stock_minimo`, `nombre_generico`, `id_proveedor`, `PDate`, `Modelo`, `Exp`, `Descuento`, `FechaInicio`, `FechaFin`, `NivelOptimo`, `Saldo`, `CantidadDesc`, `ExisteAqui`, `Borrado`, `imagen`, `inventariable`) VALUES
(1278, '2112', 'ARREGLO PARA MAMA C/ BUCHANAS ', '850.0', '600.0', 0, 20, 0, 'BUCHANAS', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1279, '2113', 'OSITO EN LATA ', '50.0', '35.0', 0, 27, 0, 'LATA', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1280, '2114', 'PALETA FLOR DE BOMBOM', '25.0', '10.0', 0, 22, 0, 'BOMM', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1281, '2115', 'BROCHETA DE BOMBOM', '10.0', '5.0', 2, 22, 0, 'BOMBOM', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 10, 0, 0, 0, '', 0),
(1282, '2116', 'TAZA PARA MAMA', '118.0', '35.0', 0, 22, 0, 'TAZA-MA', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1283, '2117', 'BOBONERA PARA MAMA', '35.0', '15.0', 0, 22, 0, 'BON', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1284, '2118', 'PANERA PARA MAMA', '50.0', '25.0', 0, 22, 0, 'PANERA', 26, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1285, '7793', 'MOCHILA NIKE MOD-2', '220.0', '120.0', 2, 25, 0, 'NIKE-2', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 240, 0, 0, 0, '', 0),
(1286, '7794', 'MOCHILA NIKE MOD-3', '199.0', '120.0', 2, 25, 0, 'NIKE-3', 27, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 240, 0, 0, 0, '', 0),
(1287, '7011', 'MINIATURA GLOBO AEROESTATICO', '115.0', '43.0', 0, 27, 0, 'AERO', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1288, '7111', 'MINIATURA OSO CANASTA MINI', '75.0', '44.0', 0, 27, 0, 'CANASTA', 26, '2019-08-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1289, '8890', 'CAJA CAMICERA GRANE', '118.0', '40.0', 0, 1, 0, 'C-CAMICERA', 26, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1290, '7500107574136', 'PELUCHE OSO CORAZON TE AMO GRANDE', '450.0', '259.0', 0, 20, 0, 'EX-CORA', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1291, '7500236643833', 'PELUCHE UNICORNIO PLATZY GRANDE', '385.0', '169.0', 0, 20, 0, 'PLATZY-GDE', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1292, '75002366438', 'PELUCHE UNICORNIO PLATZY MEDIANO', '240.0', '129.0', 0, 20, 0, 'PLAT-M', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1293, '7500216170168', 'PELUCHE OSO ROSEDAL CHICO', '218.0', '89.0', 0, 20, 0, 'ROSE', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1294, '7500194853633', 'PELUCHE OSO CHOCORROLO GDE', '260.0', '106.0', 0, 20, 0, 'CHOCORRL', 24, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1295, '7500202106027', 'PELUCHE  GATO CHOMPY C/ SONIDO GDE', '350.0', '139.0', 0, 20, 0, 'GATO-SHOM', 27, '2019-12-18 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1296, '7710', 'PELUCHE DINO BEBE', '198.0', '100.0', 2, 20, 0, 'P-D-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(1297, '6987005101014', 'PELUCHE DINO REX CHICO', '150.0', '75.0', 0, 20, 0, 'P-REX', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1298, '10104', 'PELUCHE UNICORNIO BEBE', '199.0', '78.0', 0, 20, 0, 'UNI-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1299, '1944', 'PELUCHE UNICORNIO BB LENTEJUELAS', '185.0', '68.0', 3, 20, 0, 'UNI-M1', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 204, 0, 0, 0, '', 0),
(1300, '1144', 'PELUCHE CERDITO OVEROL CHICO', '190.0', '68.0', 0, 20, 0, 'CER-CH', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1301, '1115', 'PELUCHE CERDITO OVEROL MEDIANO', '210.0', '68.0', 0, 20, 0, 'CER-M', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1302, '1016', 'PELUCHE ELEFANTE BB OVEROL', '190.0', '68.0', 0, 20, 0, 'ELE-OVERL', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1303, '1017', 'PELUCHE PERRO BB SUAVE', '199.0', '68.0', 0, 20, 0, 'PERR-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1304, '1943', 'PELUCHE GATITA BB', '190.0', '68.0', 0, 20, 0, 'GAT-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1305, '2080', 'PELUCHE TIGRITTO BB', '190.0', '68.0', 3, 20, 0, 'TIGRI-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 204, 0, 0, 0, '', 0),
(1306, '1958', 'PELUCHE OSOS ESCANDALOSOS', '250.0', '93.0', 1, 20, 0, 'ESCANDALOSO', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 93, 0, 0, 0, '', 0),
(1307, '10214', 'PELUCHE ELEFANTE BB', '199.0', '68.0', 0, 20, 0, 'ELEF-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1308, '10059', 'PELUCHE PANDA BB', '195.0', '68.0', 0, 20, 0, 'PANDA-BB', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1309, '2096', 'PELUCHE PERRO BOLA GANDE', '300.0', '108.0', 0, 20, 0, 'BOLA', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1310, '2087', 'PELUCHE ELEFANTE CORY GRANDE', '300.0', '108.0', 0, 20, 0, 'P-CORY', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1311, '2138', 'PELUCHE PERRO HUSKY SOFT GRANDE', '300.0', '108.0', 0, 20, 0, 'HUSKY', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1312, '2016', 'PELUCHE MARSMELLO DJ GRANDE', '400.0', '150.0', 1, 20, 0, 'P-DJ', 24, '2020-01-05 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, '', 0),
(1313, '3202', 'PELUCHE GATO TERNURA GRANDE', '380.0', '175.0', 1, 20, 0, 'TERNURA-G', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 175, 0, 0, 0, '', 0),
(1314, '193301', 'PELUCHE RATON CLEVER MEDIANO', '218.0', '75.0', 0, 20, 0, 'CLEVER', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1315, '1922', 'PELUCHE OSA PRICESA C/ CORONA CHICA', '219.0', '75.0', 0, 20, 0, 'PRINCE', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1316, '1957', 'PELUCHES SERIE ESCANDALOSOS CHICO', '180.0', '60.0', 0, 20, 0, 'SCANDALO', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1317, '192311', 'PELUCHE UNICORNIO RISUEÑO CHICO', '190.0', '68.0', 0, 20, 0, 'RISUEÃ‘O', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1318, '1903', 'PELUCHE TIERNO UNICORNIO BEBE', '230.0', '90.0', 0, 20, 0, 'UNICORNIO-BB', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1319, '1940', 'PELUCHE UNICORNIO FLORES GRANDE', '570.0', '265.0', 2, 20, 0, 'P-FLORES', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 530, 0, 0, 0, '', 0),
(1320, '1923', 'PELUCHE PANDA BEBE', '250.0', '100.0', 1, 20, 0, 'BB-PANDA', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(1321, '1617', 'PELUCHE ANGELA MEDIANA', '270.0', '110.0', 0, 20, 0, 'ANGELA-M', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1322, '4829', 'PELUCHE RATONES TOTO GRANDES', '499.0', '220.0', 1, 20, 0, 'TOTO-G', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 220, 0, 0, 0, '', 0),
(1323, '6019', 'PELUCHE MONOS MANOS LARGAS ', '700.0', '290.0', 4, 20, 0, 'MANOS-L', 24, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 1160, 0, 0, 0, '', 0),
(1324, '2616', 'PELUCHE ELEFANTE PRINCESA C/ CORONA', '280.0', '135.0', 0, 20, 0, 'ELEF-CORONA', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1325, '0504', 'PELUCHE RATON PIJAMA CHICO', '250.0', '125.0', 2, 20, 0, 'RATON-CH', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 250, 0, 0, 0, '', 0),
(1326, '1910', 'PELUCHE RATONA C/ MOÑO CHICA', '199.0', '68.0', 0, 20, 0, 'RATONA-M', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1327, '1715', 'COJIN C/ LENTEJUELA CUADRADO', '200.0', '120.0', 3, 20, 0, 'C-LENTEJ', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 360, 0, 0, 0, '', 0),
(1328, '3602', 'PELUCHE UNICORNIO BOLITA GRANDE', '499.0', '250.0', 3, 20, 0, 'BOLITA -G', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 750, 0, 0, 0, '', 0),
(1329, '2801', 'PELUCHE UNICORNIO BOLITA MEDIANO', '360.0', '155.0', 1, 20, 0, 'BOLITA-M', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 155, 0, 0, 0, '', 0),
(1330, '2006', 'PELUCHE UNICORNIO BOLITA CHICO', '190.0', '80.0', 0, 20, 0, 'BOLITA-CH', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1331, '1932', 'PELUCHE UNICORNIO C/ TRENSA  CHICO', '185.0', '68.0', 0, 20, 0, 'TRENSA-CH ', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1332, '1916', 'PELUCHE UNICORNIO CHIKY CHICO', '239.0', '125.0', 0, 20, 0, 'CHICO-CH', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1333, '1917', 'PELUCHE UNICORNIO CHIKY MEDIANO ', '380.0', '180.0', 0, 20, 0, 'CHIKY-M', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1334, '3820', 'PELUCHE UNICORNIO RISUEÑO MAGICO GRANDE', '650.0', '265.0', 2, 20, 0, 'RISUEÃ‘O-G', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 530, 0, 0, 0, '', 0),
(1335, '3010', 'PELUCHE OSO SANTY ESPECIAL MEDIANO', '300.0', '110.0', 1, 20, 0, 'SANTY', 26, '2020-01-29 00:00:00', '', 0, 0, NULL, NULL, 0, 110, 0, 0, 0, '', 0),
(1336, '5105', 'PELUCHE PUERQUITO C/ BATA CHICO ', '399.0', '145.0', 0, 20, 0, 'PUERQT-CH', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1337, '5106', 'PELUCHE PUERQUITA C/ BATA MEDIANA', '650.0', '230.0', 0, 20, 0, 'BATA-M', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1338, '4119', 'PELUCHE PUERQUITA C/ BATA GRANDE', '700.0', '235.0', 0, 20, 0, 'BATA-G', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1339, '2702', 'PELUCHE OSITOS OFITOS MEDIANO', '280.0', '120.0', 1, 20, 0, 'OFITOS', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1340, '4191', 'COJIN SUPER PANDA Y GATO ', '370.0', '140.0', 9, 20, 0, 'PANDA', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 1260, 0, 0, 0, '', 0),
(1341, '1901', 'LLAVERO GARZA ARCOIRIS', '145.0', '50.0', 3, 23, 0, 'LLA-ARCO', 26, '2020-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 150, 0, 0, 0, '', 0),
(1342, '2119', 'COLLARES FASION MANZANA', '299.0', '150.0', 7, 23, 0, 'MANZANA', 27, '2020-05-09 00:00:00', '', 0, 0, NULL, NULL, 0, 1050, 0, 0, 0, '', 0),
(1343, '2120', 'ARREGLO GLOBO AEROSTOTICO', '150.0', '100.0', 0, 22, 0, 'AEROSTATICO', 29, '2020-08-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1344, '2122', 'PULCERA CHIC GLAMUR PIEDRA', '89.0', '40.0', 17, 23, 0, 'PIE', 29, '2020-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 680, 0, 0, 0, '', 0),
(1345, '2123', 'PULCERA CHIC GLAMUR NIÑA', '40.0', '20.0', 0, 23, 0, 'GLAMR', 29, '2020-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1346, '2121', 'PELUCHITOS LETREROS DE AMOR', '179.0', '40.0', 12, 27, 0, 'LETRER', 26, '2020-09-08 00:00:00', '', 0, 0, NULL, NULL, 0, 480, 0, 0, 0, '', 0),
(1347, '7411', 'PULCERA EN OFETA', '20.0', '10.0', 0, 23, 0, 'P.OFERTA', 27, '2020-12-04 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1348, '70', 'CARGA DE ELIO 30 CM LATEX ', '25.0', '10.0', 20, 30, 0, 'LATEX-30', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 200, 0, 0, 0, '', 0),
(1349, '71', 'CARGA DE ELIO 44 CM', '30.0', '15.0', 20, 30, 0, 'C-44', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 300, 0, 0, 0, '', 0),
(1350, '72', 'CARGA DE ELIO 50 CM', '40.0', '15.0', 27, 30, 0, 'C-50', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 405, 0, 0, 0, '', 0),
(1351, '73', 'CARGA DE ELIO 76 CM', '50.0', '20.0', 27, 30, 0, 'C-76', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 540, 0, 0, 0, '', 0),
(1352, '74', 'CARGA DE ELIO 80 CM', '70.0', '25.0', 28, 30, 0, 'C-80', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 700, 0, 0, 0, '', 0),
(1353, '75', 'CARGA DE ELIO 90 CM', '80.0', '25.0', 25, 30, 0, 'C-90', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 625, 0, 0, 0, '', 0),
(1354, '76', 'CARGA DE ELIO 100 CM', '150.0', '30.0', 28, 30, 0, 'C-100', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 840, 0, 0, 0, '', 0),
(1355, '77', 'CARGA DE ELIO LATEX JUMBO', '250.0', '50.0', 29, 30, 0, 'LATEX-J', 29, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1500, 0, 0, 0, '', 0),
(1356, '78', 'CARGA DE ELIO LATEX EX JUMBO', '300.0', '60.0', 30, 30, 0, 'LATEX -EX', 26, '2020-12-13 00:00:00', '', 0, 0, NULL, NULL, 0, 1800, 0, 0, 0, '', 0),
(1357, '4411', 'PELUCHE MI PEQUEÑO DRAGON', '195.0', '95.0', 2, 20, 0, 'DRAGON', 24, '2020-12-24 00:00:00', '', 0, 0, NULL, NULL, 0, 190, 0, 0, 0, '', 0),
(1358, '1731', 'PELUCHE PULPITO REVERSIBLE GRANDE', '260.0', '130.0', 4, 20, 0, 'PUL-GRANDE', 26, '2021-01-04 00:00:00', '', 0, 0, NULL, NULL, 0, 520, 0, 0, 0, '', 0),
(1359, '1730', 'PELUCHE PULPITO REVERSIBLE MEDIANO', '210.0', '110.0', 7, 20, 0, 'PULP-MED', 26, '2021-01-04 00:00:00', '', 0, 0, NULL, NULL, 0, 770, 0, 0, 0, '', 0),
(1360, '1147', 'PELUCHE AMONGO MEDIANO', '200.0', '88.0', 4, 20, 0, 'AMONG-M', 26, '2021-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 352, 0, 0, 0, '', 0),
(1361, '1141', 'PELUCHE BABY YODA MEDIANO', '300.0', '150.0', 4, 20, 0, 'YODA', 26, '2021-01-30 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, '', 0),
(1362, '7501917248248', 'PELUCHE TIGGER DETALLES D', '291.0', '109.0', 0, 20, 0, 'P.TIGG.DETALL.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1363, '7506223706109', 'PELUCHE EEYORE CLASICO D', '300.0', '109.0', 0, 20, 0, 'P.EEYOR.CLASIC.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1364, '7506223749694', 'PELUCHE EEYORE AVIADOR D ', '300.0', '169.0', 0, 20, 0, 'P.EEYOR.AVIADOR.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1365, '7506223706062', 'PELUCHE POOH CLASICO D1', '280.0', '109.0', 0, 20, 0, 'P.CLASICO.D1', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1366, '7501917248729', 'PELUCHE POOH SUPER DETECTIVE E ', '599.0', '300.0', 0, 20, 0, 'P.SUPER.DETEC', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1367, '7501917237730', 'PELUCHE MICKEY HIGH SCHOOL MUSICAL D', '250.0', '109.0', 0, 20, 0, 'P.MICKEY.HSM', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1368, '7501917214298', 'PELUCHE TIGGER C/ IMPERMEABLE D', '229.0', '109.0', 0, 20, 0, 'P.IMPERM.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1369, '7501917221036', 'PELUCHE DAFFY JARDINERO E', '370.0', '200.0', 0, 20, 0, 'P.JARDINERO.E', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1370, '7501917215646', 'PELUCHE RITO C/ IMPERMEABLE D', '281.0', '109.0', 0, 20, 0, 'P.RITO.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1371, '75018', 'PELUCHE TIGGER TEXTURAS D', '300.0', '109.0', 0, 20, 0, 'P.TEXTURAS.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1372, '7501917227038', 'PELUCHE TIGGER FLOPPY D', '200.0', '109.0', 0, 20, 0, 'P.FLOPPY.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1373, '7501917240556', 'PELUCHE TIGGER FENSI C', '160.0', '82.0', 0, 20, 0, 'P.FENSI.C', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1374, '7501917248279', 'PELUCHE EEYORE DETALLES D', '250.0', '109.0', 0, 20, 0, 'P.EEYOR.DET.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1375, '7501917213130', 'PELUCHE PIGLET CLASICO D', '200.0', '109.0', 0, 20, 0, 'P.PIGLET.CLAS.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1376, '7506223786286', 'PELUCHE MICKEY MAMELUCO', '160.0', '82.0', 0, 20, 0, 'P.MAMELUCO', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1377, '7501917228288', 'PELUCHE PIOLIN BEISBOLISTA D', '270.0', '109.0', 0, 20, 0, 'P.PIOLIN.BEIS.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1378, '7501917270072', 'PELUCHE BALOO CLASICO D', '250.0', '109.0', 0, 20, 0, 'P.BALOO.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1379, '7506223706123', 'PELUCHE TIGGER CLASICO MED', '199.0', '90.0', 0, 20, 0, 'P.TIGGER.MED', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1380, '7501917259282', 'PELUCHE GOOFY DESFILE D', '200.0', '109.0', 0, 20, 0, 'P.GOOFY.DESF.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1381, '7501917230335', 'PELUCHE DAFFY PANA C', '164.0', '82.0', 0, 20, 0, 'P.DAFFY.C', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1382, '7501917235095', 'PELUCHE EEYORE DORMILON D', '200.0', '109.0', 0, 20, 0, 'P.DORMILON.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1383, '00605', 'PELUCHE OSO BRANDONN GRANDE IMPORTACION', '1700.0', '892.0', 0, 20, 0, 'P-BRANN', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1384, '00589', 'PELUCHE BORLITAS GRANDE ', '391.0', '150.0', 0, 20, 0, 'P.BORLITAS', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1385, '00602', 'PAPEL DE REGALO  ( EXCEDENTE )', '8.0', '1.0', 12, 1, 0, 'EXCED', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 12, 0, 0, 0, '', 0),
(1386, '7502209338142', 'TARJETA FIZZY MOON SPECIAL', '49.0', '35.0', 0, 21, 0, 'T.FIZZY.ESPECIAL', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1387, '8159', 'TARJETA FUZZY FIZZY ESPECIAL', '40.0', '35.0', 2, 21, 0, 'T.FUZZY', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(1388, '00591', 'TARJETA FIZZY MOON AMOR', '36.0', '18.0', 0, 21, 0, 'T.MOON', 22, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1389, '7502209335226', 'TARJETA DIPLOMA ', '58.0', '20.0', 0, 21, 0, 'T.DIPLOMA', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1390, '7502209333086', 'TARJETA FUNNY CARD EXPLOWORLD', '49.0', '24.0', 0, 21, 0, 'T.FUNNY', 23, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1391, '4021', 'PELUCHE SHARPEI GRANDE', '499.0', '140.0', 0, 20, 0, 'SHARPEI', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1392, '00496', 'COJINNETE TUBI LOI EXPLOWORLD GRANDE', '199.0', '100.0', 0, 20, 0, 'C.TUBI', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1393, '7501111218221', 'COJINNETE THE PELOX FAMILY', '199.0', '90.0', 0, 20, 0, 'C.FAMILY', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1394, '00547', 'COJINNETE TORTILLITA EX LARGO ', '200.0', '80.0', 0, 20, 0, 'C.TORTILLITA', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1395, '00700', 'PORTA RETRATO KIUT 1', '290.0', '145.0', 0, 29, 0, 'P.R.KIUT', 25, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1396, '00703', 'RECADITO KIUT ', '100.0', '45.0', 0, 29, 0, 'R.KIUT', 25, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1397, '00573', 'PELUCHE MINIUM CHICO', '130.0', '28.0', 0, 20, 0, 'MINIU-C', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1398, '00018', 'PANTUMFLAS ONIX', '298.0', '250.0', 0, 22, 0, 'P.ONIX', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1399, '00584', 'COJIN CILINDRO PLANETART CHICO ', '160.0', '80.0', 0, 20, 0, 'C.PLANETR.CH', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1400, '00588', 'COJIN RECTANGULAR PLANETART', '190.0', '85.0', 0, 20, 0, 'C.RECT.PLANET', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1401, '00801', 'COJIN EX LARGO POLIESFERA ', '250.0', '100.0', 0, 20, 0, 'C.EX.POLIESF', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1402, '00586', 'COJIN CUADRADO PLANETART', '230.0', '110.0', 0, 20, 0, 'C.CUADRAD.PLANET', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1403, '00722', 'COJIN HUESO JIRZ', '300.0', '139.0', 1, 20, 0, 'HUESO-J', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 139, 0, 0, 0, '', 0),
(1404, '00571', 'COJIN CUADRADO COMICS GRANDE', '380.0', '190.0', 0, 20, 0, 'C.COMICS', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1405, '00522', 'COJIN CILINDRO  CALAVERA ROSA ', '115.0', '90.0', 0, 20, 0, 'C.CALAVERA', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1406, '00549', 'COJIN CUELLERA PEPA POLIESFERA', '199.0', '75.0', 0, 20, 0, 'C.CUELLERA .', 26, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1407, '00587', 'COJIN RECTANGULAR 2 PLANETART', '230.0', '100.0', 0, 20, 0, 'C.RECT2.PLANET', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1408, '00459', 'COJIN ESTRELLA GRANDE ', '140.0', '60.0', 0, 20, 0, 'C.ESTRELLA.G ', 23, '2012-06-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1409, '00087', 'GORRA AERO ENGINE CABALLERO (DIFERENTES MODELOS)', '180.0', '40.0', 15, 23, 0, 'G.AERO.ENG', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, '', 0),
(1410, '00182', 'GORRA P/CABALLERO EN (OFERTA)', '50.0', '35.0', 0, 23, 0, 'G.P/CABALLERO', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1411, '608940541845', 'PERFUME SET DE PARIS HILTON CABALLERO ', '700.0', '400.0', 0, 24, 0, 'P.PARIS.H', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1412, '827669002554', 'PERFUME JUST SEXY 90210 CABALLERO ', '200.0', '100.0', 0, 24, 0, 'P.JUST.SEX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1413, '827669002561', 'PERFUME FEEL SEXY 90210 CABALLERO ', '200.0', '100.0', 0, 24, 0, 'P.FEEL.SEX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1414, '844061000728', 'PERFUME PERRY MAN CABALLERO ', '600.0', '250.0', 0, 24, 0, 'P.PERRI.MAN', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1415, '3355800001793', 'PERFUME LACOSTE BOOSTER CABALLERO ', '700.0', '350.0', 0, 24, 0, 'P.BOOSTER', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1416, '00473', 'RELOJ CABALLERO ( CK)', '300.0', '95.0', 0, 23, 0, 'CK', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1417, '00511', 'RELOJ DAMA TUBULAR', '350.0', '140.0', 6, 23, 0, 'RELOJ-C', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 840, 0, 0, 0, '', 0),
(1418, '00512', 'RELOR CASIO.3 CABALLERO ', '299.0', '100.0', 0, 23, 0, 'R.CASIO.3', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1419, '00254', 'ANILLO ACERO INOXIDABLE CABALLERO ', '57.0', '10.0', 1, 23, 0, 'A.AC.INOX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 10, 0, 0, 0, '', 0),
(1420, '00058', 'CARRO DE COLECCION ', '200.0', '170.0', 0, 23, 0, 'COLECCION', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1421, '00255', 'PULCERA DE ASERO INOXIDABLE CABALLERO ', '200.0', '25.0', 0, 23, 0, 'P.ACE.INOX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1422, '00054', 'DIJE DE ACERO INOXIDABLE C/ COLLAR', '57.0', '25.0', 0, 23, 0, 'D.ACERO.INOX', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1423, '00071', 'MOTOSICLETA DE COLECION ', '150.0', '70.0', 0, 23, 0, 'M.COLECCION', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1424, '00079', 'CINTURON DE CABALLERO (TELA )', '50.0', '40.0', 0, 23, 0, 'C.TELA', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1425, '00531', 'RELOJ DE CABALLERO SPORT', '350.0', '100.0', 6, 23, 0, 'R.SPORT', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 600, 0, 0, 0, '', 0),
(1426, '00184', 'BOLSO CILINDRO TOUCHS', '190.0', '80.0', 0, 23, 0, 'B-CILIN', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1427, '00012', 'CARTERA ECKO CABALLERO ', '70.0', '30.0', 0, 23, 0, 'ECKO', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1428, '00427', 'LENTE P/ CABALLERO OXIGEN ', '87.0', '30.0', 0, 23, 0, 'L.OXIGEN', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1429, '00073', 'LENTE P/ DAMA', '50.0', '25.0', 0, 23, 0, 'L.P/CABALL', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1430, '00525', 'LLAVEROS DIFERENTE MODELO', '120.0', '45.0', 3, 23, 0, 'LL-TORRE', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 135, 0, 0, 0, '', 0),
(1431, '085805063665', 'PERFUME MEDITERRANEAN DAMA ', '600.0', '300.0', 0, 24, 0, 'P.MEDITERRANE', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1432, '844061000704', 'PERFUME PERRY WOMAN DAMA ', '600.0', '270.0', 0, 24, 0, 'P.PEERY.W', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1433, '085805043476', 'PERFUME 5TH AVENIDA AFTER FIVE DAMA', '600.0', '270.0', 0, 24, 0, 'P.5TH.AVE', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1434, '8436038833266', 'PERFUME  TOUS H2O DAMA', '1000.0', '500.0', 0, 24, 0, 'P.TOUS.H2O', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1435, '037361006334', 'PERFUME IGNITION WOMEN DAMA', '499.0', '200.0', 0, 24, 0, 'P.IGNITION', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1436, '8431754392011', 'PERFUME IN WHITE J.DEL POZO DAMA ', '700.0', '300.0', 0, 24, 0, 'P.IN WHITE', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1437, '6936711890583', 'PERFUME SET LETS PLAY PINK DAMA ', '500.0', '200.0', 0, 24, 0, 'P.SET.LETS', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1438, '844061000063', 'PERFUME SET 360 RED PERRY ELLIS DAMA ', '750.0', '350.0', 0, 24, 0, 'P.SET.360.D', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1439, '844061002197', 'PERFUME SET 360 RED PERRY ELLIS CABALLERO ', '670.0', '300.0', 0, 24, 0, 'P.SET.360.C', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1440, '00519', 'MINIATURA VIRGEN', '120.0', '59.0', 0, 27, 0, 'M-VIRGEN', 26, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1441, '00278', 'CARTERA MK DAMA EKOO', '200.0', '45.0', 1, 23, 0, 'EKOO', 27, '2012-06-09 00:00:00', '', 0, 0, NULL, NULL, 0, 45, 0, 0, 0, '', 0),
(1442, '00111', 'MOCHILA RUSS PRIMARIA', '400.0', '269.0', 1, 25, 0, 'M.PRIMA', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 269, 0, 0, 0, '', 0),
(1443, '00141', 'LAPICERAS RUSS DIFERENTES MODELOS', '150.0', '76.0', 0, 25, 0, 'LAPI', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1444, '7509048139909', 'MOCHILA CHENSON SNOOPY PROMOCION DE 280 A 199', '199.0', '120.0', 0, 25, 0, 'M.SNOOPY', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1445, '7502209338180', 'TARJETA FUZZY ESPECIAL', '49.0', '35.0', 0, 21, 0, 'T.FUZZ.ESP', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1446, '875598371456', 'MOCHILA HANNAH MONT C/DESCUENTO $199 A $100', '100.0', '100.0', 0, 25, 0, 'M.HANNAH', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1447, '00109', 'MOCHILA RUSS KINDER', '380.0', '220.0', 0, 25, 0, 'M.KIND', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1448, '00486', 'MOCHILA GUSANITO', '351.0', '150.0', 0, 25, 0, 'M.GUS', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1449, '7506179337532', 'MOCHILA TINKER BEEL', '300.0', '150.0', 0, 25, 0, 'M.TINK', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1450, '7506179337051', 'MOCHILA CAMP ROK DE 300 A 150', '150.0', '150.0', 0, 25, 0, 'M.ROK', 27, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1451, '00108', 'PELUCHE OSO PANDA SUPER', '2000.0', '1000.0', 0, 20, 0, 'P.SUPER', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1452, '00354', 'PELUCHE  OSO LOVE GRANDE ', '700.0', '270.0', 0, 20, 0, 'P-LOVE', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1453, '2011091629023', 'PELUCHE CHANGO MONY MONKY MED', '199.0', '80.0', 0, 20, 0, 'P.MONY', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1454, '00600', 'PELUCHE OSO PEKAS GRANDE', '600.0', '240.0', 0, 20, 0, 'P-PEKAS', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1455, '00336', 'JUGUETE CARROS DE BOMBERO', '200.0', '100.0', 0, 26, 0, 'J-BOMBER', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1456, '091671728560', 'PELUCHE TIGRE REMOLINOS ROSA', '251.0', '109.0', 0, 20, 0, 'P.REMOLINOS', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1457, '2009081556244', 'PELUCHE HIPPOPOTAMO PASTIZZETA', '311.0', '109.0', 0, 20, 0, 'P.PASTIZZET', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1458, '2011051540153', 'PELUCHE OSITA GREENTY GDE', '299.0', '109.0', 0, 20, 0, 'P.GREENTY', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1459, '7502209334083', 'COJINNETE LOONEY TUNES ', '150.0', '100.0', 0, 20, 0, 'C.LOONEY', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1460, '00574', 'PELUCHE TRISTESA DE INTENSAMENTE', '250.0', '80.0', 0, 20, 0, 'TRISTESA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1461, '00577', 'COJIN SEÑALES COMICS', '165.0', '80.0', 0, 20, 0, 'C.SEÃ‘ALES', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1462, '00572', 'COJIN COMICS CUADRADO MEZCLILLA', '350.0', '149.0', 0, 20, 0, 'C-COMIC', 28, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1463, '00575', 'COJIN PIZZARRON COMICS', '150.0', '70.0', 0, 20, 0, 'C.PIZZA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1464, '00592', 'COJIN TRAPOS', '270.0', '120.0', 1, 20, 0, 'TRAPOS', 28, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 120, 0, 0, 0, '', 0),
(1465, '00106', 'MINIATURA PERGAMINO MADERA ', '89.0', '40.0', 0, 27, 0, 'M-MADERA', 26, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1466, '00607', 'PELUCHES OSA DORMILONA SUPER', '1000.0', '400.0', 0, 20, 0, 'DORMILONA', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1467, '90946', 'PELUCHE CATARINA KATHY GDE', '270.0', '109.0', 0, 20, 0, 'P.CATARINA', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1468, '60913', 'PELUCHE BABY TOY STORY PAK 3', '499.0', '200.0', 0, 20, 0, 'P.BABY', 24, '2012-06-14 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1469, '00139', 'JUGUETE PIANO DE ANIMALES ( PROMOCION )', '50.0', '20.0', 0, 26, 0, 'PIANOO', 27, '2014-10-17 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1470, '00415', 'PORTA RETRATO HAPPY HOUSE ', '100.0', '40.0', 0, 28, 0, 'P.HAPPY', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1471, '00414', 'PORTA RETRATO HAPPY HOUSE DODLE FOTO', '151.0', '70.0', 0, 28, 0, 'P.HAPPY-DOBLE', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1472, '00406', 'BOLSA SAN VALENTIN GRANDE', '27.0', '9.0', 0, 1, 0, 'SAN-G', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1473, '00212', 'CUADRO OSITOS 1', '75.0', '30.0', 0, 22, 0, 'C.OSITOS-1', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1474, '00050', 'RELOJ DE CASITA C/ PENDULO', '140.0', '53.0', 0, 22, 0, 'PENDULO', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1475, '01', 'GLOBO CHICO TODA OCACION', '20.0', '10.0', 0, 30, 0, 'GLOBO.1', 26, '2012-07-25 00:00:00', '', 0, 0, NULL, NULL, 0, 70, 0, 0, 0, '', 0),
(1476, '00701', 'PORTA RETRATO KIUT 2', '200.0', '110.0', 0, 29, 0, 'P.KIUT-2', 25, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1477, '00702', 'TAZA PROFESIONISTAS', '185.0', '69.0', 3, 27, 0, 'TAZA-PROF', 26, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 207, 0, 0, 0, '', 0),
(1478, '00704', 'ACRILICOS KIUT', '140.0', '70.0', 0, 29, 0, 'A.KIUT', 25, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1479, '00300', 'BOLSA CHICA GRABA IMAGEN', '21.0', '10.0', 61, 1, 0, 'B.CH.GRABA', 21, '2012-07-27 00:00:00', '', 0, 0, NULL, NULL, 0, 610, 0, 0, 0, '', 0),
(1480, '00705', 'CRUZ MI ANGELITO DE KIUT', '200.0', '125.0', 0, 29, 0, 'C.KIUT', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1481, '00706', 'KORCHO KIUT', '270.0', '130.0', 0, 29, 0, 'KORCHO', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1482, '00707', 'PORTA RETRATO KIUT 4', '300.0', '145.0', 0, 29, 0, 'P.KIUT-4', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1483, '00708', 'PORTA RETRATO KIUT 5', '160.0', '75.0', 0, 29, 0, 'P.KIUT-5', 25, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1484, '00500', 'RELOJ FLEXIBLE DAMA 2', '100.0', '100.0', 0, 23, 0, 'FLEX2', 27, '2012-08-02 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1485, '470', 'CAJA ENVUELTAS CHICA ', '26.0', '10.0', 0, 1, 0, 'C-CH', 26, '2012-08-07 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1486, '00501', 'MOCHILA DE RUEDAS NIÑA', '380.0', '150.0', 0, 25, 0, 'M.RUEDAS.Ã‘', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1487, '00503', 'MOCHILA RUEDAS KINDER DE 290 A 200', '200.0', '150.0', 0, 25, 0, 'M.RUEDAS.KINR', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1488, '00504', 'MOCHILA LOI WOOPS 2', '300.0', '120.0', 0, 25, 0, 'M.LOIWOOPS-2', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1489, '00502', 'MOCHILA MONSTER TEAM ', '220.0', '110.0', 0, 25, 0, 'M.MONSTER', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1490, '00505', 'MOCHILA MIKO CLUB 2 C/DESCUENTO $270 A $199', '199.0', '140.0', 0, 25, 0, 'M-MIKO-2', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1491, '00506', 'MOCHILA MIKO CLUB 3 C/DESCUENTO $280 A $ 200', '200.0', '140.0', 0, 25, 0, 'M.MIKO-3', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1492, '00507', 'MOCHILA GARFIEL DE 280 A 250', '250.0', '110.0', 0, 25, 0, 'M.GARF', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1493, '00508', 'MOCHILA GARFIEL PORTAF ', '250.0', '100.0', 1, 25, 0, 'M.GARFF.XT.FOLIO', 27, '2012-08-15 00:00:00', '', 0, 0, NULL, NULL, 0, 100, 0, 0, 0, '', 0),
(1494, '00509', 'LAPICERA CHENSON DOBLE Y TRIPLE ', '150.0', '79.0', 0, 25, 0, 'LAP-CHENSON', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1495, '00510', 'LAPICERA BORLITA ', '120.0', '50.0', 0, 25, 0, 'LAP-BORLITA', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1496, '00513', 'LAPICERA BORLITA DOBLE CIERRE ', '160.0', '75.0', 0, 25, 0, 'LAP-DOBLE', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1497, '00514', 'LAPICERA BETTY BOO Y PUCA', '79.0', '30.0', 0, 25, 0, 'BETY-PUCA', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1498, '00515', 'MARIQUERA TOMY ', '210.0', '80.0', 4, 23, 0, 'M-TOMY', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 320, 0, 0, 0, '', 0),
(1499, '7500247085592', 'MOCHILA HELLO KITTY KINDER', '319.0', '190.0', 0, 25, 0, 'M-KITTY', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1500, '7500351029857', 'MOCHILA BOLSO MONSTER', '336.0', '168.0', 0, 25, 0, 'M-MONSTER', 27, '2012-08-16 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1501, '00709', 'PEINETA C/ PIEDRERIA ', '75.0', '20.0', 7, 23, 0, 'PEINET', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 140, 0, 0, 0, '', 0),
(1502, '00710', 'CARTERA PARIS DAMA', '180.0', '55.0', 0, 23, 0, 'C-PARIS', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1503, '00711', 'CARTERA JAKEUDRIN DAMA', '350.0', '160.0', 0, 23, 0, 'CHAROOL', 27, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1504, '7509025300032', 'PELUCHE MASCOTAS EN CAJA', '230.0', '100.0', 0, 20, 0, 'P.MASCOTAS', 24, '2012-08-24 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1505, '2011091108153', 'PELUCHE OSO MORTON GRANDE ', '250.0', '91.0', 0, 20, 0, 'P.MORTON', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1506, '2011102420182', 'PELUCHE OSO TOLYN GRANDE ', '267.0', '107.0', 0, 20, 0, 'P.TOLYN', 27, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1507, '2011198619866', 'PELUCHE OSA NILY MEDIANA ', '199.0', '82.0', 0, 20, 0, 'P.NILY', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1508, '2010123280027', 'PELUCHE PERRA CEREBRITO MEDIANA', '150.0', '66.0', 0, 20, 0, 'P.CEREBRITO', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1509, '2009123453005', 'PELUCHE CHANGUITO COCOMONGO GRANDE ', '300.0', '100.0', 0, 20, 0, 'P.COCOMONGO-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1510, '2011091311577', 'PELUCHE OSO CHISPY GRANDE ', '200.0', '82.0', 0, 20, 0, 'P.CHISPY-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1511, '2011900590308', 'PELUCHE OSO CARIÑOSO GRANDE ', '230.0', '91.0', 0, 20, 0, 'P.CARIÃ‘OSO-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1512, '2011174217352', 'PELUCHE PERRITA CHATYS GRANDE ', '260.0', '107.0', 0, 20, 0, 'P.CHATYS-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1513, '2011051527055', 'PELUCHE OSO CLIKY GRANDE ', '280.0', '107.0', 0, 20, 0, 'P.CLIKY-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1514, '010020', 'PELUCHE BORREGA LANNY MEDIANA ', '200.0', '82.0', 0, 20, 0, 'P.LANNY-M', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1515, '2009092112606', 'PELUCHE BORREGO MIDAS GRANDE ', '200.0', '85.0', 0, 20, 0, 'P.MIDAS-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1516, '833004010634', 'PELUCHE PERRITO CON BUFANDA CHICO', '81.0', '32.0', 0, 20, 0, 'P.BUFANDA-CH', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1517, '833004000185', 'PELUCHE OSITO PELUDITO CHICO', '70.0', '21.0', 0, 20, 0, 'P.PELUDITO-CH', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1518, '851785054012', 'PELUCHE PERRO CANELO CHICO', '140.0', '53.0', 0, 20, 0, 'P.CANELO-CH', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1519, '00712', 'PELUCHE OSO GRANDON HUELLAS SUPER', '1500.0', '900.0', 0, 20, 0, 'P-LIZ-M', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1520, '606982081930', 'PELUCHE OSO CON COBIJA MUSICAL GRANDE', '300.0', '116.0', 0, 20, 0, 'P.COBIJ-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1521, '606982047028', 'PELUCHE OSA RONQUIDOS GRANDE', '280.0', '107.0', 0, 20, 0, 'P.RONQUIDOS-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1522, '606982061703', 'PELUCHE PERRO ANGEL CON MOVIMIENTO GRANDE', '350.0', '132.0', 0, 20, 0, 'P.ANGEL-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1523, '800010700354', 'PELUCHE OSO BUFANDA MEDIANO', '140.0', '57.0', 0, 20, 0, 'P.BUFANDA-M', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1524, '7509008268083', 'PELUCHE PERRO CACHECOLOR GRANDE ', '180.0', '66.0', 0, 20, 0, 'P.CACHE-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1525, '7501917248217', 'PELUCHE POOH DETALLES D', '299.0', '109.0', 0, 20, 0, 'P.DETALLES.D', 24, '2012-06-06 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1526, '7509008268335', 'PELUCHE JIRAFA MERENGUE GRANDE', '180.0', '66.0', 0, 20, 0, 'P.MERENGUE-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1527, '2009154231573', 'COJIN FLOR TREBOLINA GRANDE ', '199.0', '75.0', 0, 20, 0, 'C.TREBOL-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1528, '911528', 'PELUCHE GUSANO LARGO BABY', '350.0', '128.0', 0, 20, 0, 'P.GUS-BABY', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1529, '7509013625017', 'PELUCHE LEON GREÑITAS GRANDE ', '200.0', '91.0', 0, 20, 0, 'P.GREÃ‘ITAS-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1530, '7501917248347', 'PELUCHE POOH MELENUDO E', '480.0', '250.0', 0, 20, 0, 'P.MELENUDO-E', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1531, '60916', 'PELUCHE PANDA FUT-BOLISTA', '350.0', '125.0', 0, 20, 0, 'PAND-BB', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1532, '7509002746723', 'PELUCHE GUSANO FLORYCOLOR ', '210.0', '100.0', 0, 20, 0, 'P.FLORY', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1533, '7506223760330', 'PELUCHE POOH REGALOS G', '300.0', '145.0', 0, 20, 0, 'P.POOH-REGALOS', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1534, '7506223760354', 'PELUCHE EEYORE REGALOS G', '300.0', '169.0', 0, 20, 0, 'P.EEYORE-REGALOS', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1535, '7506223749816', 'PELUCHE EEYORE VAQUERO G', '300.0', '145.0', 0, 20, 0, 'P.VAQUERO-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1536, '7506223749823', 'PELUCHE TIGGER VAQUERO A', '300.0', '169.0', 0, 20, 0, 'P.VAQ-A', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1537, '7506223799484', 'PELUCHE MINNIE BOUTIQUE A', '290.0', '141.0', 0, 20, 0, 'P.BOUTIQ-A', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1538, '7506223799477', 'PELUCHE MINNIE BAILARINA A', '290.0', '141.0', 0, 20, 0, 'P.BAILARINA', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1539, '7500247013618', 'PELUCHE MINNIE EN BATA A', '290.0', '141.0', 0, 20, 0, 'P.BATA-A', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1540, '7506223760095', 'PELUCHE MICKEY CHALECO G', '270.0', '125.0', 0, 20, 0, 'P.CHALECO-G', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1541, '00713', 'PELUCHE OSO BRANDON HUELLAS SUPER', '1900.0', '900.0', 0, 20, 0, 'P-SUPER', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1542, '00714', 'PELUCHE OSA CORAZON SUPER (IMPORTACION)', '1200.0', '550.0', 0, 20, 0, 'P-IMPOR', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1543, '00715', 'PELUCHE STITCH CHICO', '185.0', '50.0', 0, 20, 0, 'STITCH', 24, '2012-08-25 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1544, '00601', 'PAPEL DE REGALO ', '12.0', '4.0', 125, 1, 0, 'PAPEL', 21, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 500, 0, 0, 0, '', 0),
(1545, '00603', 'MOÑO METALICO MEDIANO ', '10.0', '1.0', 0, 1, 0, 'M-1', 21, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1546, '00604', 'MOÑO TODA OCACION GRANDE ', '25.0', '5.0', 246, 1, 0, 'M-B-GDE', 29, '2012-09-29 00:00:00', '', 0, 0, NULL, NULL, 0, 1230, 0, 0, 0, '', 0),
(1547, '00301', 'CAJA DE REGALOS 2396  XG', '170.0', '70.0', 0, 1, 0, '2396-XG', 21, '2012-10-05 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1548, '00608', 'MOÑO CHICO NAVIDAD', '15.0', '4.0', 46, 1, 0, 'M-B-M', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 184, 0, 0, 0, '', 0),
(1549, '00610', 'CAJITA P/ JOYERIA BRAZALETE', '20.0', '6.0', 0, 1, 0, 'JOYE X', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1550, '00611', 'CAJA MINI P/ANILLO', '15.0', '4.0', 48, 1, 0, 'MINI', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 192, 0, 0, 0, '', 0),
(1551, '00612', 'CAJITA P/ RELOJ', '25.0', '11.0', 1, 1, 0, 'JOYE', 21, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 11, 0, 0, 0, '', 0),
(1552, '00613', 'MINIATURA VAQUITA C/ PIEDRA', '70.0', '30.0', 0, 27, 0, 'PIEDRA', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, '', 0),
(1553, '00614', 'BOTELLA C/DULCE CHICA', '79.0', '41.0', 10, 27, 0, 'BOTELL-CH', 26, '2012-10-11 00:00:00', '', 0, 0, NULL, NULL, 0, 410, 0, 0, 0, '', 0);

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
(342590530, 'admin', '', 9, '0', '$2y$11$y58v9bL.aVA.PPbjOftdDOCkMXBdNVC7xTeZHMNLYfs6Nzs1WluM6', NULL, NULL, '2021-02-02 10:26:18', '2021-06-21 01:24:52', '2021-01-21 19:24:54', '2021-06-21 01:24:52'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1554;

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
