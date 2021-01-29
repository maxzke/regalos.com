-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2021 a las 22:54:18
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

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
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('aefl858q7doh4362pupd4j60seb1a011', 342590530, '2021-01-29 20:14:19', '2021-01-29 19:20:15', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('a5a1pohbh5lj2gq2i0b1rg6bddvjd0ip', 342590530, '2021-01-29 20:10:39', '2021-01-29 19:10:39', '::1', 'Chrome 87.0.4280.141 on Android'),
('qef8b0c6e033lpghqmkme3lmuh32d5gf', 342590530, '2021-01-29 20:02:26', '2021-01-29 19:07:58', '::1', 'Chrome 87.0.4280.141 on Android'),
('nrq7gu6c7pjm36gsp45r4vg3hjsqni02', 342590530, '2021-01-29 19:48:03', '2021-01-29 18:56:33', '::1', 'Chrome 87.0.4280.141 on Android'),
('n1d4gqulthovcasmvq9lkr1bm4i12gvv', 342590530, '2021-01-29 19:08:46', '2021-01-29 18:47:28', '::1', 'Chrome 87.0.4280.141 on Android'),
('l0jf6h7of8u2cqvo83726qbumvue7m69', 342590530, '2021-01-29 18:49:06', '2021-01-29 18:02:23', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('26v381o6vdlae2mkhhipjk6alihtmghq', 342590530, '2021-01-29 17:25:04', '2021-01-29 17:37:10', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('mjki8kpm9v464v5a9kbnvuq9tgm8nmvf', 342590530, '2021-01-29 16:18:30', '2021-01-29 16:24:37', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('ba6fkqegepp7kb0pj7ej89te7g1odsjc', 342590530, '2021-01-29 16:17:59', '2021-01-29 15:17:59', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('0eca222jberp23fm7j96hs46g8pe7vmk', 342590530, '2021-01-28 16:14:57', '2021-01-28 15:14:57', '::1', 'Chrome 88.0.4324.96 on Windows 10'),
('dsv2rk0coitvhilfnhj9fghe6hb7el70', 342590530, '2021-01-28 16:42:07', '2021-01-28 22:02:13', '::1', 'Chrome 88.0.4324.96 on Windows 10'),
('5bao3u9bo44retftu79pm5ruq8276jbn', 342590530, '2021-01-29 20:20:31', '2021-01-29 19:20:31', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('22s1pu2akuqa9i8i7oqndvskjrevlicg', 342590530, '2021-01-29 20:21:45', '2021-01-29 21:08:33', '::1', 'Chrome 87.0.4280.141 on Windows 10'),
('jutmcf8bbn7obv17722ot49sk9g6rgkb', 342590530, '2021-01-29 22:08:49', '2021-01-29 21:08:49', '::1', 'Chrome 87.0.4280.141 on Android'),
('o9b7k6mn4u9442bal8spgb2p1ojhmfb1', 342590530, '2021-01-29 22:12:58', '2021-01-29 21:12:58', '::1', 'Chrome 87.0.4280.141 on Android'),
('3r2a2i1kfjsns1va9trp9pdkef8j1eaa', 342590530, '2021-01-29 22:16:46', '2021-01-29 21:53:21', '::1', 'Chrome 87.0.4280.141 on Android');

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
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
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
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `mesa` varchar(90) NOT NULL,
  `status` int(90) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT 0
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
(150, 75, 'GQW29CQT8HC - Ray', 1, '8302.4', '8302.4', '0.0'),
(151, 75, 'BRL29HJU5EF - Kenneth', 1, '275.7', '275.7', '0.0'),
(152, 76, 'GQW29CQT8HC - Ray', 1, '8302.4', '8302.4', '0.0'),
(153, 76, 'BRL29HJU5EF - Kenneth', 1, '275.7', '275.7', '0.0'),
(154, 77, 'GQW29CQT8HC - Ray', 1, '8302.4', '8302.4', '0.0'),
(155, 77, 'BRL29HJU5EF - Kenneth', 1, '275.7', '275.7', '0.0');

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
(18, 'vicky', '::1', '2021-01-29 20:02:01');

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
  `alto` int(11) NOT NULL DEFAULT 60,
  `ancho` int(11) NOT NULL DEFAULT 60
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
(2, 'debito'),
(3, 'Efectivo'),
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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_venta`, `id_metodo`, `importe`, `fecha`) VALUES
(61, 68, 1, '1207.9', '2021-01-29 20:29:23'),
(62, 69, 1, '2648.7', '2021-01-29 20:42:19'),
(63, 70, 1, '2648.7', '2021-01-29 20:48:13'),
(64, 71, 1, '2648.7', '2021-01-29 21:01:42'),
(65, 72, 1, '2648.7', '2021-01-29 21:02:45'),
(66, 73, 1, '8302.4', '2021-01-29 21:29:51'),
(67, 74, 1, '8302.4', '2021-01-29 21:31:54'),
(68, 75, 1, '8302.4', '2021-01-29 21:32:26'),
(69, 76, 1, '8578.1', '2021-01-29 21:40:45'),
(70, 77, 1, '8578.1', '2021-01-29 21:53:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(9,1) NOT NULL,
  `costo` decimal(9,1) NOT NULL,
  `imagen` varchar(120) NOT NULL,
  `inventariable` tinyint(1) DEFAULT 0,
  `stock` int(11) NOT NULL,
  `id_categoria` int(255) DEFAULT NULL,
  `stock_minimo` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `costo`, `imagen`, `inventariable`, `stock`, `id_categoria`, `stock_minimo`) VALUES
(1, 'GQW29CQT8HC', 'Ray', '8302.4', '0.0', '', 0, -1, NULL, 0),
(2, 'EEM41CMK4IN', 'Hoyt', '952.1', '0.0', '', 0, 4, NULL, 0),
(3, 'GPL67USK4BC', 'Alexander', '550.2', '0.0', '', 0, 3, NULL, 0),
(4, 'WPT72WAA5LI', 'Richard', '997.3', '0.0', '', 0, 1, NULL, 0),
(5, 'OFF65ORV7PN', 'Basil', '400.2', '0.0', '', 0, 8, NULL, 0),
(6, 'CCB34QRF1MT', 'Adrian', '115.7', '0.0', '', 0, 7, NULL, 0),
(7, 'SQV70MEB5QW', 'Emerson', '61.3', '0.0', '', 0, 8, NULL, 0),
(8, 'XTV36APZ7VK', 'Isaac', '425.8', '0.0', '', 0, 4, NULL, 0),
(9, 'ARS21MUM9MY', 'Howard', '466.1', '0.0', '', 0, 20, NULL, 0),
(10, 'USS59NGG6EI', 'Jonas', '305.4', '0.0', '', 0, 10, NULL, 0),
(11, 'GWH37ART5IB', 'Erasmus', '837.0', '0.0', '', 0, 8, NULL, 0),
(12, 'ZIE67KTR8SV', 'Jacob', '784.0', '0.0', '', 0, 4, NULL, 0),
(13, 'NVE05DZS6NG', 'Flynn', '913.4', '0.0', '', 0, 5, NULL, 0),
(14, 'MAN84GDV7JQ', 'Samuel', '665.5', '0.0', '', 0, 8, NULL, 0),
(15, 'RCW80GEG4FP', 'Isaac', '744.2', '0.0', '', 0, 4, NULL, 0),
(16, 'VHX41XLG8TS', 'Ralph', '773.3', '0.0', '', 0, 2, NULL, 0),
(17, 'WXS22SYE7WI', 'Leonard', '258.9', '0.0', '', 0, 1, NULL, 0),
(18, 'EKY55CQI6JL', 'Colt', '90.7', '0.0', '', 0, 9, NULL, 0),
(19, 'TNZ80IHA7ZL', 'Arthur', '416.1', '0.0', '', 0, 6, NULL, 0),
(20, 'FEW37WTK0SC', 'Rooney', '690.0', '0.0', '', 0, 112, NULL, 0),
(21, 'TES84ICW7NH', 'Ezekiel', '351.2', '0.0', '', 0, 7, NULL, 0),
(22, 'ZIR60RBU1NW', 'Buckminster', '890.8', '0.0', '', 0, 1, NULL, 0),
(23, 'GAX21IEB0OA', 'Dean', '911.0', '0.0', '', 0, 33, NULL, 0),
(24, 'LMC98GUI5ZQ', 'Barrett', '955.6', '0.0', '', 0, 7, NULL, 0),
(25, 'HQF10HLH1QZ', 'Sebastian', '858.8', '0.0', '', 0, 6, NULL, 0),
(26, 'VTP54RZD9NL', 'Amal', '770.7', '0.0', '', 0, 3, NULL, 0),
(27, 'VXC96JFF0SB', 'Maxwell', '660.1', '0.0', '', 0, 3, NULL, 0),
(28, 'GCC99LXR8ES', 'Cruz', '621.7', '0.0', '', 0, 15, NULL, 0),
(29, 'JBL54YGZ8KB', 'Stephen', '205.6', '0.0', '', 0, 2, NULL, 0),
(30, 'QZK18NAI6XG', 'Harper', '829.9', '0.0', '', 0, 5, NULL, 0),
(31, 'VBH03OLG1HM', 'Finn', '598.8', '0.0', '', 0, 1, NULL, 0),
(32, 'IUF82PXK7FR', 'Adrian', '422.8', '0.0', '', 0, 10, NULL, 0),
(33, 'YUE96GHA3JT', 'David', '263.5', '0.0', '', 0, 1, NULL, 0),
(34, 'EOX41MTR0KL', 'Jack', '717.8', '0.0', '', 0, 4, NULL, 0),
(35, 'JGH90AVL3GT', 'Joel', '343.2', '0.0', '', 0, 7, NULL, 0),
(36, 'EFU18LMP9ZV', 'Caleb', '348.3', '0.0', '', 0, 2, NULL, 0),
(37, 'DNR50MMT5QX', 'Hamilton', '365.1', '0.0', '', 0, 4, NULL, 0),
(38, 'IYZ04KFJ0WM', 'Amir', '620.7', '0.0', '', 0, 4, NULL, 0),
(39, 'NAB28XGN3JZ', 'Brent', '861.1', '0.0', '', 0, 4, NULL, 0),
(40, 'LFD60ITZ2QS', 'Samson', '633.1', '0.0', '', 0, 4, NULL, 0),
(41, 'GDA71BIV5XQ', 'Raphael', '697.4', '0.0', '', 0, 3, NULL, 0),
(42, 'XVR05WOZ9QJ', 'Rooney', '235.5', '0.0', '', 0, 10, NULL, 0),
(43, 'LQU16AZR7UF', 'Jonas', '880.0', '0.0', '', 0, 1, NULL, 0),
(44, 'TYJ08SDU1BB', 'Ezra', '641.3', '0.0', '', 0, 3, NULL, 0),
(45, 'STP56OFX4FV', 'Cairo', '960.6', '0.0', '', 0, 4, NULL, 0),
(46, 'LST11CZC3OI', 'Harper', '463.5', '0.0', '', 0, 4, NULL, 0),
(47, 'QQE70HUH0YU', 'Branden', '877.2', '0.0', '', 0, 4, NULL, 0),
(48, 'CUK46HSF5IP', 'David', '689.4', '0.0', '', 0, 10, NULL, 0),
(49, 'IRT21ETK2QA', 'Ulysses', '302.3', '0.0', '', 0, 2, NULL, 0),
(50, 'VLH92WWP3BH', 'Logan', '204.2', '0.0', '', 0, 9, NULL, 0),
(51, 'UGA59SOO8DD', 'Sebastian', '372.9', '0.0', '', 0, 7, NULL, 0),
(52, 'YNE79ZQY8ZZ', 'Nash', '958.5', '0.0', '', 0, 10, NULL, 0),
(53, 'UEE45WYK6WM', 'Jesse', '649.7', '0.0', '', 0, 3, NULL, 0),
(54, 'DEE15ERB0KR', 'Valentine', '817.8', '0.0', '', 0, 5, NULL, 0),
(55, 'QKD44GPO5EE', 'Benedict', '970.5', '0.0', '', 0, 7, NULL, 0),
(56, 'GJX26IXI5HA', 'Ray', '994.7', '0.0', '', 0, 5, NULL, 0),
(57, 'ELU76ZNU8KT', 'Jonas', '964.3', '0.0', '', 0, 5, NULL, 0),
(58, 'PQL59NMW7TQ', 'Carter', '588.8', '0.0', '', 0, 9, NULL, 0),
(59, 'DCR88ANR9AF', 'Dane', '974.7', '0.0', '', 0, 10, NULL, 0),
(60, 'KPJ98TJO5SJ', 'Owen', '858.7', '0.0', '', 0, 2, NULL, 0),
(61, 'MOD06HOO8RP', 'Xander', '726.3', '0.0', '', 0, 6, NULL, 0),
(62, 'UOA22PHH1AE', 'Marsden', '457.8', '0.0', '', 0, 5, NULL, 0),
(63, 'WLV00EQI2OG', 'Rahim', '143.1', '0.0', '', 0, 6, NULL, 0),
(64, 'ZHZ38LZI0VW', 'Kadeem', '556.7', '0.0', '', 0, 10, NULL, 0),
(65, 'ZZF82PBN3SO', 'Wade', '315.8', '0.0', '', 0, 8, NULL, 0),
(66, 'FOE06FIS4HY', 'Dieter', '738.5', '0.0', '', 0, 2, NULL, 0),
(67, 'NTE81UAZ3OQ', 'Dustin', '532.6', '0.0', '', 0, 1, NULL, 0),
(68, 'PNB86HPV6PV', 'Herrod', '510.8', '0.0', '', 0, 2, NULL, 0),
(69, 'TYU18LRP0GR', 'Graham', '488.6', '0.0', '', 0, 20, NULL, 0),
(70, 'QKP98NXK0YS', 'Dominic', '753.1', '0.0', '', 0, 9, NULL, 0),
(71, 'EOY26QUG5KR', 'Zeph', '329.3', '0.0', '', 0, 9, NULL, 0),
(72, 'TSH05ZOR6MR', 'Oleg', '220.7', '0.0', '', 0, 2, NULL, 0),
(73, 'IAF91WVE3UZ', 'Orlando', '541.6', '0.0', '', 0, 10, NULL, 0),
(74, 'NQZ68RUA7JJ', 'Carson', '449.2', '0.0', '', 0, 10, NULL, 0),
(75, 'MST19PRS5JP', 'Galvin', '912.5', '0.0', '', 0, 1, NULL, 0),
(76, 'ETJ22GWM0LO', 'Jonas', '923.8', '0.0', '', 0, 5, NULL, 0),
(77, 'TRX45FFH9XT', 'Cade', '964.2', '0.0', '', 0, 1, NULL, 0),
(78, 'TGO97NYW5RO', 'Elmo', '122.4', '0.0', '', 0, 9, NULL, 0),
(79, 'WBF24QKF1ZI', 'Bruno', '975.7', '0.0', '', 0, 9, NULL, 0),
(80, 'KKL45NEK6TE', 'Brendan', '364.1', '0.0', '', 0, 2, NULL, 0),
(81, 'RHZ26XPF9LV', 'Gannon', '605.3', '0.0', '', 0, 7, NULL, 0),
(82, 'PUM50YHJ6TR', 'Marvin', '996.9', '0.0', '', 0, 23, NULL, 0),
(83, 'TGR14QQB8VQ', 'Lionel', '879.3', '0.0', '', 0, 1, NULL, 0),
(84, 'YZQ80IJN6HX', 'Cullen', '893.3', '0.0', '', 0, 8, NULL, 0),
(85, 'MWY95FHN4LO', 'Josiah', '250.1', '0.0', '', 0, 8, NULL, 0),
(86, 'LAD03LWI9SZ', 'Benedict', '424.4', '0.0', '', 0, 6, NULL, 0),
(87, 'JVC92PSS1TJ', 'Dale', '385.9', '0.0', '', 0, 1, NULL, 0),
(88, 'AKL44KNF4QU', 'Chaney', '309.4', '0.0', '', 0, 16, NULL, 0),
(89, 'IAX38IHR9FP', 'Fulton', '373.4', '0.0', '', 0, 9, NULL, 0),
(90, 'NCE20YMR0MY', 'Gabriel', '37.5', '0.0', '', 0, 5, NULL, 0),
(91, 'LOX97HQH1WO', 'Xavier', '124.8', '0.0', '', 0, 9, NULL, 0),
(92, 'HCW91UZT8WV', 'Allistair', '365.8', '0.0', '', 0, 3, NULL, 0),
(93, 'XSQ33NEV2MK', 'Blaze', '839.8', '0.0', '', 0, 9, NULL, 0),
(94, 'BRL29HJU5EF', 'Kenneth', '275.7', '0.0', '', 0, 1, NULL, 0),
(95, 'TTT12DHM4JU', 'Alvin', '130.7', '0.0', '', 0, 5, NULL, 0),
(96, 'YPR09ZYS8EB', 'Oleg', '627.4', '0.0', '', 0, 6, NULL, 0),
(97, 'TEM20JTH5LR', 'Erich', '527.5', '0.0', '', 0, 15, NULL, 0),
(98, 'KPJ97SQN0OK', 'Asher', '165.8', '0.0', '', 0, 1, NULL, 0),
(99, 'PCB79OHL6GN', 'Sean', '687.2', '0.0', '', 0, 5, NULL, 0),
(100, 'GFM43IEV6JN', 'Alan', '187.8', '0.0', '', 0, 4, NULL, 0);

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
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(342590530, 'admin', '2858917904', 9, '0', '$2y$11$nMPfY6t3y7i.K3XcM1K.Uu8gqK6TT8k0QdDJmU61Pcx2ZAFIOvlnC', NULL, NULL, NULL, '2021-01-29 22:16:46', '2021-01-21 19:24:54', '2021-01-29 21:16:46'),
(743025774, 'mesero', '463188333', 6, '0', '$2y$11$1EJfJxkEVrkz0rfl3WF18uLTHcyP6qAY7edzazsI19oFG.a3/eTBW', NULL, NULL, NULL, '2020-12-18 20:07:49', '2020-12-16 21:56:28', '2020-12-18 19:07:49'),
(2080928695, 'cocina', '2597816839', 1, '0', '$2y$11$wZ6gQGBiEM.FKpqB4CEtKub1suxlno.IgUv1Qqjqk7XP6nKqUoS3.', NULL, NULL, NULL, '2021-01-21 19:00:46', '2020-12-16 21:44:04', '2021-01-21 18:00:46'),
(2300056648, 'david', 'ramzdave3@gmail.com', 9, '0', '$2y$11$EeCnEviLPuhyQed2Prq8guCHiz4.sS5i2q0iaSqs85iQH35SwPGlS', NULL, NULL, NULL, '2021-01-21 19:03:57', '2020-10-20 19:52:27', '2021-01-21 18:03:57');

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
  `id_cliente` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `pagada` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `id_usuario`, `id_mesa`, `pagada`, `fecha`) VALUES
(75, 0, 0, 0, 0, '2021-01-29 21:32:26'),
(76, 0, 0, 0, 1, '2021-01-29 21:40:45'),
(77, 0, 0, 0, 1, '2021-01-29 21:53:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_a_credito`
--

CREATE TABLE `ventas_a_credito` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas_a_credito`
--

INSERT INTO `ventas_a_credito` (`id`, `id_venta`) VALUES
(21, 73),
(22, 74),
(23, 75);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `denied_access`
--
ALTER TABLE `denied_access`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_errors`
--
ALTER TABLE `login_errors`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `ventas_a_credito`
--
ALTER TABLE `ventas_a_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
