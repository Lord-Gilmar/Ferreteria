-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2023 a las 17:11:11
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27
CREATE database ferreteria;
use ferreteria;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `dni` int(45) DEFAULT NULL,
  `edad` date NOT NULL,
  `telefono` int(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) NOT NULL,
  `adicional` varchar(500) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `total` float NOT NULL,
  `id_estado_pago` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `det_cantidad` int(11) NOT NULL,
  `det_vencimiento` date NOT NULL,
  `id__det_lote` int(11) NOT NULL,
  `id__det_prod` int(11) NOT NULL,
  `lote_id_prov` int(255) NOT NULL,
  `id_det_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_pago`
--

INSERT INTO `estado_pago` (`id`, `nombre`) VALUES
(1, 'Cancelado'),
(2, 'No cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`id_laboratorio`, `nombre`, `avatar`, `estado`) VALUES
(1, 'Portugal', '5eb196b05b4aa-phpCoding.jpg', 'A'),
(2, 'Bois', '5eb195b7f2eba-Curva_sinuosa-1471556676359 (1).png', 'A'),
(3, 'Desconocido', '5eb1962dc7447-peatones.jpg', 'A'),
(4, 'A & C MARVEL', '5eb196d9060e0-normal_ian-symbol-positive.png', 'A'),
(5, 'A. MENARINI', 'lab_default.png', 'A'),
(6, 'ABBA S.A.C.', 'lab_default.png', 'A'),
(7, 'ABBOTT', 'lab_default.png', 'A'),
(8, 'ABBVIE', 'lab_default.png', 'A'),
(9, 'AC FARMA', 'lab_default.png', 'A'),
(10, 'ACCORD', 'lab_default.png', 'A'),
(11, 'ADVANCE', 'lab_default.png', 'A'),
(12, 'AG FARMA', 'lab_default.png', 'A'),
(13, 'AGRIPINO SARMIENTO', 'lab_default.png', 'A'),
(14, 'ALBIS', 'lab_default.png', 'A'),
(15, 'ALCON', 'lab_default.png', 'A'),
(16, 'ALKOFARMA', 'lab_default.png', 'A'),
(17, 'ALM', 'lab_default.png', 'A'),
(18, 'ALPHARMA', 'lab_default.png', 'A'),
(19, 'AMILPHARM', 'lab_default.png', 'A'),
(20, 'ANDINA DE SERVICIOS', 'lab_default.png', 'A'),
(21, 'ANDREU', 'lab_default.png', 'A'),
(22, 'ANSOLAT SOCIEDAD ANONIMA CERRADA', 'lab_default.png', 'A'),
(23, 'ARIAL PERU', 'lab_default.png', 'A'),
(24, 'ASCLEP', 'lab_default.png', 'A'),
(25, 'ASG', 'lab_default.png', 'A'),
(26, 'ASPEN', 'lab_default.png', 'A'),
(27, 'ASTRAZENECA', 'lab_default.png', 'A'),
(28, 'AVANX', 'lab_default.png', 'A'),
(29, 'AXA TEAM', 'lab_default.png', 'A'),
(30, 'AXON', 'lab_default.png', 'A'),
(31, 'BAGO', 'lab_default.png', 'A'),
(32, 'BAXTER', 'lab_default.png', 'A'),
(33, 'BAYER', 'lab_default.png', 'A'),
(34, 'BETA PHARMA', 'lab_default.png', 'A'),
(35, 'BIO REG', 'lab_default.png', 'A'),
(36, 'BIOGENERICOS', 'lab_default.png', 'A'),
(37, 'BIOLOGICS', 'lab_default.png', 'A'),
(38, 'BIOPAS', 'lab_default.png', 'A'),
(39, 'BIOS PERU', 'lab_default.png', 'A'),
(40, 'BIOSANA', 'lab_default.png', 'A'),
(41, 'BIOSYNTEC', 'lab_default.png', 'A'),
(42, 'BIOTEC', 'lab_default.png', 'A'),
(43, 'BIOTECH', 'lab_default.png', 'A'),
(44, 'BIOTEFAR', 'lab_default.png', 'A'),
(45, 'BIOTOSCANA', 'lab_default.png', 'A'),
(46, 'BMS', 'lab_default.png', 'A'),
(47, 'BOEHRINGER', 'lab_default.png', 'A'),
(48, 'BONAPHARM', 'lab_default.png', 'A'),
(49, 'BORSUAS', 'lab_default.png', 'A'),
(50, 'BOTICAS Y SALUD', 'lab_default.png', 'A'),
(51, 'BRAND AND MARKETING', 'lab_default.png', 'A'),
(52, 'BRATOM', 'lab_default.png', 'A'),
(53, 'BRAUN', 'lab_default.png', 'A'),
(54, 'BRISAFARMA', 'lab_default.png', 'A'),
(55, 'BRISTOL MYERS SQUIBB PERU S.A.', 'lab_default.png', 'A'),
(56, 'CADILLO S.A.C.', 'lab_default.png', 'A'),
(57, 'CAFERMA', 'lab_default.png', 'A'),
(58, 'CARDIO PERFUSION', 'lab_default.png', 'A'),
(59, 'CENTRUM', 'lab_default.png', 'A'),
(60, 'CFALAB PERU', 'lab_default.png', 'A'),
(61, 'CFARMA', 'lab_default.png', 'A'),
(62, 'CIBELLI', 'lab_default.png', 'A'),
(63, 'CIENPHARMA', 'lab_default.png', 'A'),
(64, 'CIFARMA', 'lab_default.png', 'A'),
(65, 'COMIWA', 'lab_default.png', 'A'),
(66, 'CONCEPT', 'lab_default.png', 'A'),
(67, 'CORP. FARMAC. MEDICAL SOLUTION', 'lab_default.png', 'A'),
(68, 'CORP. MARSOF SAC', 'lab_default.png', 'A'),
(69, 'CORP. PHARMA SOLUTIONS PERU SAC', 'lab_default.png', 'A'),
(70, 'CORPORACION PANTA', 'lab_default.png', 'A'),
(71, 'CORPORACION SAREPTA', 'lab_default.png', 'A'),
(72, 'CORVAL', 'lab_default.png', 'A'),
(73, 'COSMOGRACE', 'lab_default.png', 'A'),
(74, 'CRESPAL', 'lab_default.png', 'A'),
(75, 'D&M PHARMA', 'lab_default.png', 'A'),
(76, 'DANY', 'lab_default.png', 'A'),
(77, 'DELFARMA', 'lab_default.png', 'A'),
(78, 'DENT IMPORT', 'lab_default.png', 'A'),
(79, 'DEUTSCHE PHARMA', 'lab_default.png', 'A'),
(80, 'DICAR', 'lab_default.png', 'A'),
(81, 'DIGEMID', 'lab_default.png', 'A'),
(82, 'DISTRIBUIDORA CONTINENTAL 6 S.A.', 'lab_default.png', 'A'),
(83, 'D OLAPHARM', 'lab_default.png', 'A'),
(84, 'DRINTEFA', 'lab_default.png', 'A'),
(85, 'DROG. BIENESTAR INTEGRAL', 'lab_default.png', 'A'),
(86, 'DROG. COLBASIL', 'lab_default.png', 'A'),
(87, 'DROG. FARMA. ASOCIADOS', 'lab_default.png', 'A'),
(88, 'DROG. PERU S.A.C.', 'lab_default.png', 'A'),
(89, 'DROG. TOBAL', 'lab_default.png', 'A'),
(90, 'DROGUERIA FARMA DEL JMS', 'lab_default.png', 'A'),
(91, 'DROGUERIA PACIFICO', 'lab_default.png', 'A'),
(92, 'DROISA', 'lab_default.png', 'A'),
(93, 'DROKASA', 'lab_default.png', 'A'),
(94, 'DRONNVELS', 'lab_default.png', 'A'),
(95, 'DROPELD PHARMA', 'lab_default.png', 'A'),
(96, 'DROPESAC', 'lab_default.png', 'A'),
(97, 'DUBONP', 'lab_default.png', 'A'),
(98, 'E&A VERONA', 'lab_default.png', 'A'),
(99, 'E.S.C. PHARMED', 'lab_default.png', 'A'),
(100, 'ECKERD', 'lab_default.png', 'A'),
(101, 'ELI LILLY', 'lab_default.png', 'A'),
(102, 'ELIFARMA', 'lab_default.png', 'A'),
(103, 'ELIPTICA PHARMACEUTICALS S.A.C.', 'lab_default.png', 'A'),
(104, 'EMCURE', 'lab_default.png', 'A'),
(105, 'EMDIEX', 'lab_default.png', 'A'),
(106, 'EMP. MULTIN. DE IMP. Y EXP.', 'lab_default.png', 'A'),
(107, 'EMPRESARIAL LEON', 'lab_default.png', 'A'),
(108, 'ESKE', 'lab_default.png', 'A'),
(109, 'ESPECIALIDADES OFTALMOLOGICAS', 'lab_default.png', 'A'),
(110, 'EUROFARMA PERU', 'lab_default.png', 'A'),
(111, 'EXCELLAN PERU', 'lab_default.png', 'A'),
(112, 'EXELTIS', 'lab_default.png', 'A'),
(113, 'FAES FARMA', 'lab_default.png', 'A'),
(114, 'FARM. MEDICAL', 'lab_default.png', 'A'),
(115, 'FARMA PERU', 'lab_default.png', 'A'),
(116, 'FARMA VITA', 'lab_default.png', 'A'),
(117, 'FARMACEUTICA AMERICA', 'lab_default.png', 'A'),
(118, 'FARMACEUTICA BQ', 'lab_default.png', 'A'),
(119, 'FAMRACEUTICA CONTINENTAL', 'lab_default.png', 'A'),
(120, 'FARMACEUTICA OTARVASQ', 'lab_default.png', 'A'),
(121, 'FARMACEUTICO AMERICA', 'lab_default.png', 'A'),
(122, 'FARMACEUTICO PERUANO', 'lab_default.png', 'A'),
(123, 'FARMACHAL', 'lab_default.png', 'A'),
(124, 'FARMACOM', 'lab_default.png', 'A'),
(125, 'FARMADUAL', 'lab_default.png', 'A'),
(126, 'FARMAKONSUMA', 'lab_default.png', 'A'),
(127, 'FARMAQUIL', 'lab_default.png', 'A'),
(128, 'FARMASUR', 'lab_default.png', 'A'),
(129, 'FARMAVAL', 'lab_default.png', 'A'),
(130, 'FARMAMEDIC', 'lab_default.png', 'A'),
(131, 'FARMINDUSTRIA', 'lab_default.png', 'A'),
(132, 'FARMOR', 'lab_default.png', 'A'),
(133, 'FARVET', 'lab_default.png', 'A'),
(134, 'FERQUIM', 'lab_default.png', 'A'),
(135, 'FERRER', 'lab_default.png', 'A'),
(136, 'FLAVOR', 'lab_default.png', 'A'),
(137, 'FOOD GROUP', 'lab_default.png', 'A'),
(138, 'FRESENIUS', 'lab_default.png', 'A'),
(139, 'G & R', 'lab_default.png', 'A'),
(140, 'GABBLAN', 'lab_default.png', 'A'),
(141, 'GADOR', 'lab_default.png', 'A'),
(142, 'GADORPHARMA', 'lab_default.png', 'A'),
(143, 'GALENICUM', 'lab_default.png', 'A'),
(144, 'GEDEON', 'lab_default.png', 'A'),
(145, 'GEMEFAR', 'lab_default.png', 'A'),
(146, 'GENCOPHARMAC', 'lab_default.png', 'A'),
(147, 'GENEXXA', 'lab_default.png', 'A'),
(148, 'GENFAR', 'lab_default.png', 'A'),
(149, 'GENOMMA', 'lab_default.png', 'A'),
(150, 'GENZYME', 'lab_default.png', 'A'),
(151, 'GIANFARMA', 'lab_default.png', 'A'),
(152, 'GLAXO', 'lab_default.png', 'A'),
(153, 'GLENMARK', 'lab_default.png', 'A'),
(154, 'GLOBAL MED FARMA', 'lab_default.png', 'A'),
(155, 'GLOBAL PHARMA', 'lab_default.png', 'A'),
(156, 'GP PHARM', 'lab_default.png', 'A'),
(157, 'GREY', 'lab_default.png', 'A'),
(158, 'GRUNENTHAL', 'lab_default.png', 'A'),
(159, 'GRUPO 3B', 'lab_default.png', 'A'),
(160, 'GRUPO EMPRESARIAL CARPIO CUADROS', 'lab_default.png', 'A'),
(161, 'GRUPO MENDOZA', 'lab_default.png', 'A'),
(162, 'GSK', 'lab_default.png', 'A'),
(163, 'HANNAI', 'lab_default.png', 'A'),
(164, 'HB HUMAN BIOSCIENCE', 'lab_default.png', 'A'),
(165, 'HERSIL', 'lab_default.png', 'A'),
(166, 'HOSPIRA', 'lab_default.png', 'A'),
(167, 'HYNOSCHA', 'lab_default.png', 'A'),
(168, 'IEX MEDICAL', 'lab_default.png', 'A'),
(169, 'IMV/VILLA', 'lab_default.png', 'A'),
(170, 'INDAURA', 'lab_default.png', 'A'),
(171, 'INDUQUIMICA', 'lab_default.png', 'A'),
(172, 'INFARVAL', 'lab_default.png', 'A'),
(173, 'INFERMED', 'lab_default.png', 'A'),
(174, 'INNOVALAB', 'lab_default.png', 'A'),
(175, 'INRETAIL PHARMA', 'lab_default.png', 'A'),
(176, 'INTERNACIONAL FARMA', 'lab_default.png', 'A'),
(177, 'INTI', 'lab_default.png', 'A'),
(178, 'INTI PERU', 'lab_default.png', 'A'),
(179, 'INTIPHARMA', 'lab_default.png', 'A'),
(180, 'INTRADEVCO', 'lab_default.png', 'A'),
(181, 'INVERS. JPS', 'lab_default.png', 'A'),
(182, 'INVERSIONES FARMACOS DE LA SELVA', 'lab_default.png', 'A'),
(183, 'IQ FARMA', 'lab_default.png', 'A'),
(184, 'ITF FARMACEUTICA', 'lab_default.png', 'A'),
(185, 'J&M', 'lab_default.png', 'A'),
(186, 'JC.ROBRI', 'lab_default.png', 'A'),
(187, 'JOHNSON', 'lab_default.png', 'A'),
(188, 'JSP DISTRIBUCIONES', 'lab_default.png', 'A'),
(189, 'K. C. T. KLIVER', 'lab_default.png', 'A'),
(190, 'HEYFARM', 'lab_default.png', 'A'),
(191, 'KYAL', 'lab_default.png', 'A'),
(192, 'LA VICTORIA', 'lab_default.png', 'A'),
(193, 'LAB. OFTALMICOS', 'lab_default.png', 'A'),
(194, 'LABORATORIOS SERVIER', 'lab_default.png', 'A'),
(195, 'LABOT', 'lab_default.png', 'A'),
(196, 'LAFAGE', 'lab_default.png', 'A'),
(197, 'LAFAR', 'lab_default.png', 'A'),
(198, 'LAFARPE', 'lab_default.png', 'A'),
(199, 'LAFRANCOL', 'lab_default.png', 'A'),
(200, 'LANSIER', 'lab_default.png', 'A'),
(201, 'LAS AMERICAS', 'lab_default.png', 'A'),
(202, 'LAVIBI', 'lab_default.png', 'A'),
(203, 'LECRERC', 'lab_default.png', 'A'),
(204, 'LIDER PHARMA', 'lab_default.png', 'A'),
(205, 'LIPHARMA', 'lab_default.png', 'A'),
(206, 'LKM PERU', 'lab_default.png', 'A'),
(207, 'LOGISTICS', 'lab_default.png', 'A'),
(208, 'LOS ANDES', 'lab_default.png', 'A'),
(209, 'LUDBER', 'lab_default.png', 'A'),
(210, 'LUKOLL', 'lab_default.png', 'A'),
(211, 'LUNDBECK', 'lab_default.png', 'A'),
(212, 'LUSA', 'lab_default.png', 'A'),
(213, 'LUXOR', 'lab_default.png', 'A'),
(214, 'MAKAR', 'lab_default.png', 'A'),
(215, 'MAQUIFARMA', 'lab_default.png', 'A'),
(216, 'MARKOS', 'lab_default.png', 'A'),
(217, 'MASTER ENTERPRISES', 'lab_default.png', 'A'),
(218, 'MARTER FARMA', 'lab_default.png', 'A'),
(219, 'MAVER', 'lab_default.png', 'A'),
(220, 'MECOFARM', 'lab_default.png', 'A'),
(221, 'MED FARMA', 'lab_default.png', 'A'),
(222, 'MEDICAL', 'lab_default.png', 'A'),
(223, 'MEDIFARMA', 'lab_default.png', 'A'),
(224, 'MEDILINE', 'lab_default.png', 'A'),
(225, 'MEDISUR', 'lab_default.png', 'A'),
(226, 'MEDROCK', 'lab_default.png', 'A'),
(227, 'MEDSTYLE', 'lab_default.png', 'A'),
(228, 'MEGA C S.A.C', 'lab_default.png', 'A'),
(229, 'MEGA LABS', 'lab_default.png', 'A'),
(230, 'MEGA LIFESCIENCES', 'lab_default.png', 'A'),
(231, 'MERCK', 'lab_default.png', 'A'),
(232, 'MERK SHARP', 'lab_default.png', 'A'),
(233, 'MINSA', 'lab_default.png', 'A'),
(234, 'MKS UNIDOS', 'lab_default.png', 'A'),
(235, 'MSN LABS', 'lab_default.png', 'A'),
(236, 'MULTI MEDICAL SUPPLIES', 'lab_default.png', 'A'),
(237, 'NAT. Y GEN.', 'lab_default.png', 'A'),
(238, 'NATUR REGENERIERUNG', 'lab_default.png', 'A'),
(239, 'NATURGEN', 'lab_default.png', 'A'),
(240, 'NATURMEDIZIN', 'lab_default.png', 'A'),
(241, 'NEOLPHARMA PERU', 'lab_default.png', 'A'),
(242, 'NILSA SERVICIOS', 'lab_default.png', 'A'),
(243, 'NORDIC', 'lab_default.png', 'A'),
(244, 'NOVARTIS', 'lab_default.png', 'A'),
(245, 'NOVAX', 'lab_default.png', 'A'),
(246, 'NOVO LAB', 'lab_default.png', 'A'),
(247, 'NOVO NORDISK', 'lab_default.png', 'A'),
(248, 'NUTRI CARE', 'lab_default.png', 'A'),
(249, 'OCULAB LATINOAMERICA', 'lab_default.png', 'A'),
(250, 'ODONTOGAMA IMPOTACIONES', 'lab_default.png', 'A'),
(251, 'OFTALMICOS', 'lab_default.png', 'A'),
(252, 'OM PHARMA', 'lab_default.png', 'A'),
(253, 'PAK FARMA', 'lab_default.png', 'A'),
(254, 'PALMAGYAR', 'lab_default.png', 'A'),
(255, 'PEREDA', 'lab_default.png', 'A'),
(256, 'PERUFARMA', 'lab_default.png', 'A'),
(257, 'PERULAB', 'lab_default.png', 'A'),
(258, 'PERUVIAN DRUGS', 'lab_default.png', 'A'),
(259, 'PFIZER', 'lab_default.png', 'A'),
(260, 'PHARBAL', 'lab_default.png', 'A'),
(261, 'PHARMA C', 'lab_default.png', 'A'),
(262, 'PHARMA HOSTING', 'lab_default.png', 'A'),
(263, 'PHARMA PERU', 'lab_default.png', 'A'),
(264, 'PHARMA ROY', 'lab_default.png', 'A'),
(265, 'PHARMA UNO', 'lab_default.png', 'A'),
(266, 'PHARMACEUTICAL DISTOLOZA', 'lab_default.png', 'A'),
(267, 'PHARMACHECK', 'lab_default.png', 'A'),
(268, 'PHARMAGEN', 'lab_default.png', 'A'),
(269, 'PHARMARIS', 'lab_default.png', 'A'),
(270, 'PHARMAVIT', 'lab_default.png', 'A'),
(271, 'PHARMEX', 'lab_default.png', 'A'),
(272, 'PINT PHARMA PERU S.A.C.', 'lab_default.png', 'A'),
(273, 'PRAFLOLAB', 'lab_default.png', 'A'),
(274, 'PROCTER&GAMBLE', 'lab_default.png', 'A'),
(275, 'PROMETISA', 'lab_default.png', 'A'),
(276, 'PROTELD', 'lab_default.png', 'A'),
(277, 'Q PHARMA', 'lab_default.png', 'A'),
(278, 'QM PHARMA QUALITY', 'lab_default.png', 'A'),
(279, 'QUALIPHARM', 'lab_default.png', 'A'),
(280, 'QUALITY PHARMA', 'lab_default.png', 'A'),
(281, 'QUILAB', 'lab_default.png', 'A'),
(282, 'QUILLA PHARMA', 'lab_default.png', 'A'),
(283, 'QUIMFA', 'lab_default.png', 'A'),
(284, 'QUIMICA SUIZA', 'lab_default.png', 'A'),
(285, 'RANBAXY', 'lab_default.png', 'A'),
(286, 'RASMUSSEN', 'lab_default.png', 'A'),
(287, 'REFARCO', 'lab_default.png', 'A'),
(288, 'REP. CASTILLO', 'lab_default.png', 'A'),
(289, 'REP. DECO', 'lab_default.png', 'A'),
(290, 'REP. DIPHASAC', 'lab_default.png', 'A'),
(291, 'REYES', 'lab_default.png', 'A'),
(292, 'RHOVIC', 'lab_default.png', 'A'),
(293, 'RISO CORPORATIVO', 'lab_default.png', 'A'),
(294, 'ROCHE', 'lab_default.png', 'A'),
(295, 'ROEL', 'lab_default.png', 'A'),
(296, 'ROEMMERS', 'lab_default.png', 'A'),
(297, 'ROJAS PEREZ', 'lab_default.png', 'A'),
(298, 'ROKER PERU', 'lab_default.png', 'A'),
(299, 'ROMA', 'lab_default.png', 'A'),
(300, 'ROSTER', 'lab_default.png', 'A'),
(301, 'ROXFARMA', 'lab_default.png', 'A'),
(302, 'RUCEF', 'lab_default.png', 'A'),
(303, 'SAEF PHARMA', 'lab_default.png', 'A'),
(304, 'SAGITARIO', 'lab_default.png', 'A'),
(305, 'SANDERSON', 'lab_default.png', 'A'),
(306, 'SANOFI', 'lab_default.png', 'A'),
(307, 'SCHERING', 'lab_default.png', 'A'),
(308, 'SCIENTIA', 'lab_default.png', 'A'),
(309, 'SCOP', 'lab_default.png', 'A'),
(310, 'SEBAL', 'lab_default.png', 'A'),
(311, 'SERVICIOS PACIFICO', 'lab_default.png', 'A'),
(312, 'SEVEN', 'lab_default.png', 'A'),
(313, 'SHALOM', 'lab_default.png', 'A'),
(314, 'SHERFARMA', 'lab_default.png', 'A'),
(315, 'SIEGFRIED', 'lab_default.png', 'A'),
(316, 'SMART PHARMA', 'lab_default.png', 'A'),
(317, 'SOLTON', 'lab_default.png', 'A'),
(318, 'STENDHAL', 'lab_default.png', 'A'),
(319, 'SUN PHARMACEUTICAL', 'lab_default.png', 'A'),
(320, 'TAKEDA', 'lab_default.png', 'A'),
(321, 'TARRILLO BARBA', 'lab_default.png', 'A'),
(322, 'TECHSPHERE', 'lab_default.png', 'A'),
(323, 'TECNOFARMA', 'lab_default.png', 'A'),
(324, 'REOFARMA PERU', 'lab_default.png', 'A'),
(325, 'TERBOL', 'lab_default.png', 'A'),
(326, 'TEVA', 'lab_default.png', 'A'),
(327, 'THEFAR', 'lab_default.png', 'A'),
(328, 'TORRES PHARMA', 'lab_default.png', 'A'),
(329, 'TRADE PLUS', 'lab_default.png', 'A'),
(330, 'TROIKA', 'lab_default.png', 'A'),
(331, 'UNIDAS DEL PERU', 'lab_default.png', 'A'),
(332, 'UNIMED', 'lab_default.png', 'A'),
(333, 'UNITED PERU', 'lab_default.png', 'A'),
(334, 'VAG PHARMA', 'lab_default.png', 'A'),
(335, 'VALEANT', 'lab_default.png', 'A'),
(336, 'VANOCI', 'lab_default.png', 'A'),
(337, 'VARIFARMA', 'lab_default.png', 'A'),
(338, 'VIFARMA', 'lab_default.png', 'A'),
(339, 'VITA PHARMA', 'lab_default.png', 'A'),
(340, 'VITALINE', 'lab_default.png', 'A'),
(341, 'VITALIS', 'lab_default.png', 'A'),
(342, 'WEP PHARMA', 'lab_default.png', 'A'),
(343, 'WORWAG', 'lab_default.png', 'A'),
(344, 'ZENNIT FARMA', 'lab_default.png', 'A'),
(345, 'ZHAMIGLOBAL', 'lab_default.png', 'A'),
(346, 'OQ PHARMA', 'lab_default.png', 'A'),
(347, 'GENCOPHARMAC.', 'lab_default.png', 'A'),
(348, 'LECLERC', 'lab_default.png', 'A'),
(349, 'JPS DISTRIBUCIONES', 'lab_default.png', 'A'),
(358, '3M PERU', 'lab_default.png', 'A'),
(374, '12344', 'lab_default.png', 'A'),
(375, '123', 'lab_default.png', 'A'),
(376, 'prueba', 'lab_default.png', 'A'),
(377, 'ejemplo1', 'lab_default.png', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_lote` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `precio_compra` float NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lote`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_presentacion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id_presentacion`, `nombre`, `estado`) VALUES
(5, 'AEROSOL', 'A'),
(6, 'ANILLO', 'A'),
(7, 'CAPSULA', 'A'),
(8, 'CHAMPU', 'A'),
(9, 'CREMA', 'A'),
(10, 'EMULSION', 'A'),
(11, 'ENEMA', 'A'),
(12, 'ESPUMA', 'A'),
(13, 'GEL', 'A'),
(14, 'GRANULOS', 'A'),
(15, 'IMPLANTE', 'A'),
(16, 'INYECTABLE', 'A'),
(17, 'JABON', 'A'),
(18, 'JALEA', 'A'),
(19, 'LOCION', 'A'),
(20, 'OVULO', 'A'),
(21, 'PARCHE', 'A'),
(22, 'POLVO', 'A'),
(23, 'SISTEMA', 'A'),
(24, 'SOLUCION OFTALMICA', 'A'),
(25, 'SOLUCION OTICA', 'A'),
(26, 'SUPOSITORIO', 'A'),
(27, 'SUSPENSION', 'A'),
(28, 'SUSPENSION NASAL', 'A'),
(29, 'SUSPENSION OFTALMICA', 'A'),
(30, 'TABLETA', 'A'),
(31, 'UNGUENTO', 'A'),
(32, 'UNGUENTO OFTALMICO', 'A'),
(33, 'UNGUENTO VAGINAL', 'A'),
(34, 'SOLUCION', 'A'),
(35, 'prueba', 'A'),
(36, 'ejemplo3', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `concentracion` varchar(255) DEFAULT NULL,
  `adicional` varchar(255) DEFAULT NULL,
  `precio` float NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `prod_lab` int(11) NOT NULL,
  `prod_tip_prod` int(11) NOT NULL,
  `prod_present` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `concentracion`, `adicional`, `precio`, `avatar`, `estado`, `prod_lab`, `prod_tip_prod`, `prod_present`) VALUES
(12, 'A FOLIC', '0.5 mg', 'Caja Envase Blister Tabletas', 1, '5f21c63e68309-doctor.png', 'A', 183, 2, 30),
(13, 'AB AMBROMOX', '600 mg', 'Caja Vial', 2, 'prod_default.png', 'A', 131, 2, 16),
(29, 'AB AMBROMOX', '1 200 mg', 'Vial + Accesorios', 1, 'prod_default.png', 'A', 131, 2, 16),
(30, 'ACICLOVIR', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 2, 30),
(31, 'ACICLOVIR', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 2, 30),
(33, 'ACICLOVIR', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(34, 'ACICLOVIR', '800 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(35, 'ACICLOVIR', '5%', 'Caja tubo x 5g', 1, 'prod_default.png', 'A', 326, 3, 9),
(36, 'ACIDO FOLICO', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(37, 'ACLASTA', '5 mg/100 mL', 'Frasco x 100 mL', 1, 'prod_default.png', 'A', 244, 2, 16),
(38, 'ALBENDAZOL', '100 mg/5mL', 'Frasco x 20 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(39, 'ALBENDAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(40, 'ALBENDAZOL', '100 mg/5 mL', 'frasco x 20 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(41, 'ALBENDAZOL', '100 mg/5 mL', 'Caja Frasco x 20 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(42, 'ALERCET', '10 mg/mL', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 332, 2, 34),
(43, 'ALERCET', '1 mg/mL', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 332, 2, 34),
(45, 'ALMPRAZOLAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(46, 'ALMPRAZOLAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(47, 'AMBROMOX', '', 'Caja Envase Blister Capsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(48, 'AMIKACINA', '100 mg/2 mL', 'Ampolla x 2 mL', 1, 'prod_default.png', 'A', 76, 2, 16),
(49, 'AMIKACINA', '500 mg/2 mL', 'Ampolla x 2mL', 1, 'prod_default.png', 'A', 268, 2, 16),
(50, 'AMIKACINA', '100 mg/2 mL', 'Ampolla x 2 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(51, 'AMIKACINA', '500 mg/2 mL', 'Ampolla 2 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(52, 'AMITRIPTILINA', '25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(53, 'AMOXICILINA + ACIDO CLAVULANICO', '250 mg + 62.5 mg/5 mL', 'Frasco x 60 mL + Accesorio', 1, 'prod_default.png', 'A', 237, 3, 27),
(54, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(55, 'AMOXICILINA', '125 mg/5 mL', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 183, 3, 27),
(56, 'AMOXICILINA', '250 mg/5 mL', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 183, 3, 27),
(57, 'AMOXICLIN', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 315, 2, 30),
(58, 'AMOXICLIN DUO', '875 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 315, 2, 30),
(59, 'AMOXICLIN DUO RESPIRATORIO', '750 mg + 15 mg/5 mL', 'Frasco x 70mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(60, 'AMOXICLIN DUO RESPIRATORIO', '875 mg+ 60 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 315, 2, 30),
(61, 'AMOXIDAL DUO', '250 mg/5 mL', 'Frasco x 90 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(62, 'AMOXIDAL DUO 750', '750 mg/5 mL', 'Frasco x 70 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(63, 'AMOXIDAL RESPIRATORIO DUO', '750 mg+15 mg', 'Frasco x 70 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(64, 'AMPICILINA', '500 mg', 'Vial', 1, 'prod_default.png', 'A', 296, 3, 16),
(71, 'AMPICILINA', '1 g', 'Vial', 1, 'prod_default.png', 'A', 268, 3, 16),
(73, 'AMPICILINA + SULBACTAM', 'roe', 'Vial', 1, 'prod_default.png', 'A', 268, 3, 16),
(74, 'AMPICILINA', '1 g', 'Caja Vial', 1, 'prod_default.png', 'A', 76, 3, 16),
(75, 'AMPICILINA + SULBACTAM', '1g + 0.5g', 'Vial', 1, 'prod_default.png', 'A', 341, 3, 16),
(76, 'ANTALGINA', '250 mg/5 mL', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(77, 'ANTALGINA', '1 g /2 mL', 'Ampolla x 2 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(78, 'APRONAX', '125 mg/5 mL', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 33, 2, 27),
(79, 'APRONAX', '100 mg', 'Caja envase', 1, 'prod_default.png', 'A', 33, 2, 30),
(80, 'APRONAX', '275 mg ', 'Caja envase', 1, 'prod_default.png', 'A', 33, 2, 30),
(81, 'ARTICOX', '200 mg', 'Caja envase', 1, 'prod_default.png', 'A', 339, 2, 7),
(82, 'ATORVASTATINA', '20 mg', 'Caja envase', 1, 'prod_default.png', 'A', 171, 3, 30),
(83, 'ATORVASTATINA', '10 mg', 'Caja envase', 1, 'prod_default.png', 'A', 237, 3, 30),
(84, 'ATORVASTATINA', '20 mg', 'Caja envase', 1, 'prod_default.png', 'A', 237, 3, 30),
(85, 'AZITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(86, 'AZITROMICINA', '200 mg/5 mL', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(87, 'AZITROMICINA', '200 mg/5 mL', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 77, 3, 27),
(88, 'BACTRIM', '400 mg+ 80 mg', 'Comprimidos', 1, 'prod_default.png', 'A', 294, 2, 30),
(89, 'BACTRIM BALSAMICO', '200 mg + 40 mg + 50 mg/ 5mL', 'Frasco x 100 mL', 1, 'prod_default.png', 'A', 294, 2, 34),
(90, 'BACTRIM FORTE', '800 mg + 160 mg', 'Comprimidos', 1, 'prod_default.png', 'A', 294, 2, 30),
(91, 'BECLOMETASONA', '50 ug/Dosis', 'Frasco x 150 Dosis', 1, 'prod_default.png', 'A', 195, 3, 5),
(92, 'BECLOMETASONA', '250 ug/Dosis', 'Frasco x 150 Dosis', 1, 'prod_default.png', 'A', 195, 3, 5),
(93, 'PENICILINA G PROCAINICA', '1 000 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 195, 2, 16),
(94, 'BENCILPENICILINA SODICA', '1 000 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 76, 3, 16),
(95, 'BETACORT DEPOT', '5 mg + 2 mg', 'Jeringa prellenada x 1 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(96, 'BETAMETASONA', '0.05 %', 'Tubo X 20  mL', 1, 'prod_default.png', 'A', 284, 3, 9),
(97, 'BETAPLUSS', ' 0.05 %', 'caja tubo x 20 g', 1, 'prod_default.png', 'A', 1, 2, 9),
(98, 'BICARBONATO DE SODIO', '8.4 %', 'Ampolla x 20 mL', 1, 'prod_default.png', 'A', 305, 3, 16),
(99, 'BISMOSAN', '87.33 mg/5 mL', 'Frasco X 150 mL', 1, 'prod_default.png', 'A', 301, 2, 27),
(100, 'BISMUCAR ORAL SABOR A FRESA', '87.33 mg/5 mL', 'Frasco X 340 mL', 1, 'prod_default.png', 'A', 110, 2, 27),
(101, 'BISMUCAR ORAL SABOR A FRESA', '87.33 mg/5 mL', 'Frasco X 150 mL', 1, 'prod_default.png', 'A', 110, 2, 27),
(102, 'BRIXONAX 550', '550 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 94, 2, 30),
(103, 'BROMAZEPAM', '3 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(104, 'BRONCO AMOXIDIN', '125 mg + 150 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(105, 'BRONCO AMOXIDIN', '500 mg + 150 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(106, 'BRONCO MEDIMOX', '250 mg + 4 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(107, 'BRONCO MEDIMOX', '500 mg + 4 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(108, 'BRONCO MEDIMOX', '125 mg + 4 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(109, 'BRONCO PENAMOX DUO', '750 mg + 15 mg/5 mL', 'Frasco X 70 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(110, 'BRONCO PENAMOX DUO', '875 mg + 60 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(113, 'BRONCO AMOXICLIN', '500 mg + 8 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 315, 2, 30),
(114, 'BRONCOFLAM BALSAMICO', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 314, 2, 27),
(115, 'BRONCOPHAR PLUS', '', 'Caja Dispensadora X 60 Monodosis', 1, 'prod_default.png', 'A', 133, 2, 34),
(116, 'BRONCOPHAR PLUS', '', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 133, 2, 34),
(117, 'BRONPAMOX', '250 mg + 15 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(118, 'BUSCAPINA', '20 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 47, 2, 16),
(128, 'CADITAR', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 3, 2, 30),
(130, 'CAPTOPRIL', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(131, 'CAPTOPRIL', '25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(132, 'CAPTOPRIL', '25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(133, 'MULTI BIOTICOS SABOR A MENTOL/EUCALIPTOL', '0.25 mg + 10 mg', 'Caja Sobre Tabletas', 1, 'prod_default.png', 'A', 131, 2, 7),
(134, 'CARBAMAZEPINA', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(135, 'CEFACROL IV', '250 mg', 'Vial', 1, 'prod_default.png', 'A', 223, 2, 16),
(136, 'CEFACROL IV', '500 mg', 'Vial', 1, 'prod_default.png', 'A', 223, 2, 16),
(137, 'CEFADROXILO', '250 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(138, 'CEFALEXINA', '250 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(139, 'CINARIZINA', '75 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(140, 'CETIRIZINA', '5 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 171, 3, 34),
(141, 'CETIRIZINA', '5 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(142, 'CETIRIZINA', '5 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 326, 3, 34),
(143, 'CIPROFLOXACINO', 'Ampolla X 20 mL', '200 mg/20 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(144, 'CIPROFLOXACINO', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(145, 'CIPROFLOXACINO', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(146, 'CIPROFLOXACINO', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(147, 'CLARITROMICINA', '250 mg/5 mL', 'Caja Frasco X 50 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(148, 'CLARITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(149, 'CLARITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(150, 'CLARITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(151, 'CLARITROMICINA', '250 mg/5 mL', 'Frasco X 50 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(152, 'CLAVUMOX 12 HORAS', '400 mg + 57 mg', 'Frasco X 70 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(153, 'CLAVUMOX 12 HORAS', '875 mg + 125 mg', 'Frasco Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(154, 'CLINDA C', '300 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 77, 2, 7),
(155, 'CLINDAMICINA', '600 mg/4 mL', 'Ampolla x 4 mL', 1, 'prod_default.png', 'A', 76, 3, 16),
(156, 'CLINDAMICINA', '600 mg/4 mL', 'Caja Ampolla x 4 mL', 1, 'prod_default.png', 'A', 131, 3, 16),
(157, 'CLINDAMICINA', '600 mg/4 mL', 'Caja Ampolla X 4 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(158, 'CLOBETASOL', '0.05 %', 'Tubo X 25 g', 1, 'prod_default.png', 'A', 131, 3, 9),
(159, 'CLOBETASOL', '0.05 %', 'Tubo X 25 g', 1, 'prod_default.png', 'A', 131, 3, 31),
(160, 'CLOBETASOL', '0.05 %', 'Envase X 20 g', 1, 'prod_default.png', 'A', 326, 3, 9),
(161, 'CLORANFENICOL', '125 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(162, 'CLORANFENICOL', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 237, 3, 7),
(163, 'CLORFENAMINA MALEATO', '10 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 212, 3, 16),
(164, 'CLORFENAMINA MALEATO', '2 mg/5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(165, 'CLORFENAMINA MALEATO', '2 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(166, 'CLORFENAMINA MALEATO', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(167, 'CLORFENAMINA MALEATO', '4 mg', '', 1, 'prod_default.png', 'A', 171, 3, 30),
(168, 'CLORFENAMINA MALEATO', '2 mg/5 mL', 'Caja Dispensadora X 60 Monodosis', 1, 'prod_default.png', 'A', 133, 3, 34),
(169, 'CLORFENAMINA MALEATO', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(170, 'CLORURO DE SODIO', '0.9 %', 'Envase X 1 L', 1, 'prod_default.png', 'A', 53, 3, 16),
(171, 'CLORURO DE SODIO', '0.9 %', 'Envase X 100 mL', 1, 'prod_default.png', 'A', 53, 3, 16),
(172, 'CLOTRIMAZOL', '500 mg', 'Caja Envase Blister Ovulos', 1, 'prod_default.png', 'A', 171, 3, 20),
(173, 'CLOTRIMAZOL', '500 mg', 'Caja Envase Blister Ovulos', 1, 'prod_default.png', 'A', 237, 3, 20),
(174, 'CLOTRIMAZOL', '1%', 'Tubo X 20 g', 1, 'prod_default.png', 'A', 284, 3, 9),
(175, 'CLOTRIMAZOL', '1%', 'Caja Tubo X 20 g', 1, 'prod_default.png', 'A', 1, 3, 9),
(176, 'CLOTRIMAZOL', '1%', 'Caja Frasco X 20 mL', 1, 'prod_default.png', 'A', 1, 3, 5),
(177, 'CLOTRIMAZOL', '1%', 'Tubo X 40 g', 1, 'prod_default.png', 'A', 148, 3, 9),
(178, 'CLOTRIMAZOL', '1%', 'Tubo X 4 g + Accesorio', 1, 'prod_default.png', 'A', 148, 3, 9),
(179, 'CORDIAX D FORTE', '80 mg + 12.5 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 2, 30),
(180, 'CORTIFLEX', '0.025 %', 'Caja Tubo x 60 g', 1, 'prod_default.png', 'A', 9, 2, 9),
(181, 'CORTIFLEX', '0.025 %', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 9, 2, 19),
(182, 'CORTIFLEX', '50 mg/5 mL', 'Caja Vial X 5 mL', 1, 'prod_default.png', 'A', 9, 2, 16),
(183, 'DAYFLU', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 332, 2, 7),
(184, 'DENCORUB ARTRIT', '', 'Tubo X 33.5 g', 1, 'prod_default.png', 'A', 131, 2, 9),
(185, 'DENCORUB EXTRA FORTE', '', 'Pote X 100 g', 1, 'prod_default.png', 'A', 131, 2, 31),
(186, 'DENCORUB FORTE', '', 'Tubo X 33.5 g', 1, 'prod_default.png', 'A', 131, 2, 31),
(187, 'DESINFLAM', '550 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(188, 'DEXACORT', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(189, 'DEXACORT', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(190, 'DEXACORT', '4 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(191, 'DEXACORT', '8 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(192, 'DEXACORT', '0.5 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(193, 'DEXAMETASONA', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(194, 'DEXAMETASONA', '0.5 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 326, 3, 30),
(195, 'DEXAMETASONA', '4 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(196, 'DEXAMETASONA', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(197, 'DEXAMETASONA', '1 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(198, 'DEXAMETASONA', '4 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 131, 3, 16),
(199, 'DEXAMETASONA', '8 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 148, 3, 16),
(200, 'DEXAMETASONA', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(201, 'DEXAVET', '1 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 133, 2, 30),
(202, 'DEXTROMETORFANO BROMHIDRATO', '15 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 165, 3, 34),
(203, 'DEXTROMETORFANO BROMHIDRATO', '15 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 223, 3, 34),
(204, 'DEXTROMETORFANO', '15 mg/5 mL', 'Caja Envase Aerosol X 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(205, 'DEXTROMETORFANO BROMHIDRATO', '15 mg/5 mL', 'Caja Dispensadora X 60 Monodosis', 1, 'prod_default.png', 'A', 133, 3, 34),
(206, 'DEXTROSA', '5%', 'Envase X 500 mL', 1, 'prod_default.png', 'A', 53, 3, 16),
(207, 'DEXTROSA', '5%', 'Envase X 100 mL', 1, 'prod_default.png', 'A', 53, 3, 16),
(208, 'DEXTROSA', '10%', 'Envase X 100 mL', 1, 'prod_default.png', 'A', 53, 3, 16),
(209, 'DEXTROSA', '33.3 %', 'Caja Ampolla x 20 mL', 1, 'prod_default.png', 'A', 305, 3, 16),
(210, 'DEXTROSA', '5%', 'Frasco X 500 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(211, 'DEXTROSA', '5%', 'Frasco x 1 L', 1, 'prod_default.png', 'A', 223, 3, 16),
(212, 'DIAZEPAM', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(213, 'DIAZEPAM', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(214, 'DIBROLAX', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(215, 'DICLO K', '9 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(216, 'DICLOFENACO', '1%', 'Tubo X 20 g', 1, 'prod_default.png', 'A', 1, 3, 18),
(217, 'DICLOFENACO', '1%', 'Caja Tubo X 50 g', 1, 'prod_default.png', 'A', 1, 3, 18),
(218, 'DICLOFENACO', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(219, 'DICLOFENACO', '75 mg/3 mL', 'Ampolla X 3 mL', 1, 'prod_default.png', 'A', 165, 3, 16),
(220, 'DICLOFENACO SODICO', '75 mg/3 mL', 'Ampolla X 3 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(221, 'DICLOFENACO SODICO', '75 mg/3 mL', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 305, 3, 16),
(222, 'DICLOXACILINA', '250 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 183, 3, 27),
(223, 'DIGRAVIN', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 14, 2, 30),
(224, 'DILTIAZEM', '60 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(225, 'DILTIAZEM', '60 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(226, 'DIMENHIDRINATO', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 3, 30),
(227, 'DIMENHIDRINATO', '50 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 284, 3, 30),
(228, 'DOBESILATO CALCICO', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 326, 3, 7),
(229, 'DOLATRIM BALSAMICO', '200 mg + 40 mg + 75 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 83, 2, 27),
(230, 'DOLNIX', '10 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 2, 30),
(231, 'DOLNIX FORTE', '25 mg + 10 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(232, 'DOLNIX SL', '10 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 2, 30),
(233, 'DOLNIX SL', '30 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 2, 30),
(234, 'DOLO ANEURIN', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 14, 2, 30),
(235, 'DOLO LIVIOLEX FORTE', '500 mg + 50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(236, 'DOLO LIVIOLEX FORTE', '2%', 'Caja Tubo X 30 g', 1, 'prod_default.png', 'A', 326, 2, 18),
(237, 'DOLO NEUROVIT', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(238, 'DOLO QUIMAGESICO C 50', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(239, 'DOLO QUIMAGESICO', '1%', 'Frasco atomizador x 85 mL', 1, 'prod_default.png', 'A', 131, 2, 5),
(240, 'DOLO QUIMAGESICO', '75 mg/3 mL', 'Ampolla X 3 mL + Accesorios', 1, 'prod_default.png', 'A', 131, 2, 16),
(241, 'DOLO QUIMAGESICO VIT', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(242, 'DOLOFARMALAN 25', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(243, 'DOLOFARMALAN FORTE', '500 mg + 50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(244, 'DOLOMAX', '100 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(245, 'DOLONET', '200 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 332, 2, 7),
(246, 'DOLORAL', '5%', 'Tubo X 20 g', 1, 'prod_default.png', 'A', 165, 2, 18),
(247, 'DOLOTRINEURAL', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 326, 2, 7),
(248, 'DOLXICAM', '15 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 77, 2, 30),
(249, 'DORIXINA FAST', '125 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 296, 2, 7),
(250, 'DOXICICLINA HICLATO', '100 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 284, 3, 7),
(251, 'DOXICLIN', '100 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 39, 2, 7),
(252, 'ENALAPRIL', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 3, 30),
(253, 'ENALAPRIL', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(254, 'ENALAPRIL', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(255, 'ENALAPRIL', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(256, 'ENALAPRIL', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(257, 'ENALAPRIL', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(259, 'ENTEROGERMINA', '2000 millones 2 millardos/5', 'Caja Ampolla x 5 mL', 1, 'prod_default.png', 'A', 306, 2, 27),
(260, 'ENTEROPHAR FORTE', '50 mg/5 mL', 'Caja Dispensadora X 60 Monodosis', 1, 'prod_default.png', 'A', 133, 2, 27),
(261, 'ENTEROPHAR FORTE', '50 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 133, 2, 27),
(262, 'ERITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(263, 'ERITROMICINA', '250 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 131, 3, 27),
(264, 'EVACUOL', '', 'Frasco X 130 mL', 1, 'prod_default.png', 'A', 223, 2, 11),
(265, 'EVACUOL', '', 'Frasco X 250 mL', 1, 'prod_default.png', 'A', 223, 2, 11),
(266, 'EVACUOL PEDIATRICO', '', 'Frasco X 65 mL', 1, 'prod_default.png', 'A', 223, 2, 11),
(267, 'EVACUOL F', '', 'Caja Frasco X 45 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(268, 'FAMIDAL', '', 'Caja Envase Blister Ovulos', 1, 'prod_default.png', 'A', 158, 2, 20),
(269, 'FAMIDAL DUAL OVULOS Y CREMA', '', 'Caja Envase Blister Ovulos + Tubo X 20 g', 1, 'prod_default.png', 'A', 158, 2, 9),
(270, 'FEBRAX', '275 mg +300 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 158, 2, 30),
(271, 'FENILEFRINA', '10%', 'Frasco X 5 mL', 1, 'prod_default.png', 'A', 200, 3, 24),
(272, 'FENITOINA SODICA', '100 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 76, 3, 16),
(273, 'FLAMADOL', '100 mg/5 mL', 'Frasco X 50 mL', 1, 'prod_default.png', 'A', 39, 2, 27),
(274, 'FLAMADOL', '600 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 39, 2, 30),
(275, 'FLAMADOL', '800 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 39, 2, 30),
(276, 'FLOGODISTEN', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 31, 2, 30),
(277, 'FLORIL NUEVA FORMULA', '0.03 %', 'Frasco X 15 mL', 1, 'prod_default.png', 'A', 200, 2, 24),
(278, 'FLORIL NUEVA FORMULA', '0.03 %', 'Frasco X 8 mL', 1, 'prod_default.png', 'A', 200, 2, 24),
(279, 'FLUCONAZOL', '150 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 165, 3, 7),
(280, 'FLUCONAZOL', '150 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 183, 3, 7),
(281, 'FLUCONAZOL', '150 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 326, 3, 7),
(282, 'FLUCONAZOL', '150 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 7),
(283, 'FLUCONAZOL', '150 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 284, 3, 7),
(284, 'FLUCONAZOL', '200 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(285, 'FRUTENZIMA', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(286, 'FURAZOLIDONA', '50 mg/15 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(287, 'FUROSEMIDA', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(289, 'FUROXONA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(290, 'FUROXONA FORTE', '50 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(291, 'GAMALATE B6', '', 'Frasco X 80 mL', 1, 'prod_default.png', 'A', 14, 2, 34),
(292, 'GASEOVET', '80 mg/mL', 'Frasco X 15 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(293, 'GASEOVET', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(294, 'GASEOVET', '80 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(295, 'GEMFIBROZILO', '600 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 3, 30),
(296, 'GEMFIBROZILO', '600 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(297, 'GEMFIBROZILO', '600 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(298, 'GENTAMICINA', '80 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 148, 3, 16),
(299, 'GENTAMICINA', '0.3 %', 'Tubo X 3.5 g', 1, 'prod_default.png', 'A', 200, 3, 32),
(300, 'GENTAMICINA', '160 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 326, 3, 16),
(301, 'GLIBENCLAMIDA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(302, 'GLIBENCLAMIDA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(303, 'GLIDIABET', '5 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 14, 2, 30),
(304, 'GRAVOL', '12.5 mg', 'Caja Supositorios', 1, 'prod_default.png', 'A', 223, 2, 26),
(305, 'GRAVOL', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(306, 'CHAO', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 149, 2, 30),
(307, 'HEMORRODIL® COMPUESTO NF', '', 'Caja Envase Tira Supositorios', 1, 'prod_default.png', 'A', 131, 2, 26),
(308, 'HEMORRODIL COMPUESTO NF', '', 'Tubo X 28 g', 1, 'prod_default.png', 'A', 131, 2, 31),
(309, 'HIOSCINA BUTILBROMURO', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(310, 'HIPOGLOS', 'Tubo X 20 g', '', 1, 'prod_default.png', 'A', 158, 2, 31),
(311, 'HIPOGLOS', 'Tubo X 35 g', '', 1, 'prod_default.png', 'A', 158, 2, 31),
(312, 'HIPOGLOS', '', 'Tubo X 60 g', 1, 'prod_default.png', 'A', 158, 2, 31),
(313, 'HISALER D', '', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 31, 2, 34),
(314, 'HISALER D', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 31, 2, 34),
(315, 'HONGOCID', '', 'Pote x 50 g', 1, 'prod_default.png', 'A', 284, 2, 22),
(316, 'HONGOCID', '', 'Pote X 100 g', 1, 'prod_default.png', 'A', 284, 2, 22),
(317, 'HONGOCID UÑAS', '25%', 'Frasco X 12 mL + Accesorios', 1, 'prod_default.png', 'A', 284, 2, 5),
(318, 'HONGOCID', '12 g + 6 g + 1000 g + 0.1 g', 'Tubo X 20 g', 1, 'prod_default.png', 'A', 284, 2, 31),
(319, 'HONGOCID', '12 g + 6 g + 1000 g + 0.1 g', 'Tubo X 15 g', 1, 'prod_default.png', 'A', 284, 2, 31),
(320, 'IBUPROFENO', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(321, 'IBUPROFENO', '600 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(322, 'IBUPROFENO', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 3, 30),
(323, 'IBUPROFENO', '100 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(324, 'IBUPROFENO', '800 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(325, 'IBUPROFENO', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(326, 'IRRIGOR', '10 mg', 'Vial X 50 mL', 1, 'prod_default.png', 'A', 323, 2, 16),
(327, 'IRRIGOR FORTE', '60 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 323, 2, 30),
(328, 'KETOCONAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 3, 30),
(329, 'KETOCONAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(330, 'KETOCONAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(331, 'KETOCONAZOL', '2%', 'Tubo X 20 g', 1, 'prod_default.png', 'A', 1, 3, 9),
(332, 'KETOCONAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(333, 'KETOCONAZOL', '2%', 'Tubo x 10 g', 1, 'prod_default.png', 'A', 131, 3, 9),
(334, 'KETOCONAZOL', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(335, 'KETOPROFENO', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(336, 'KETOPROFENO', '100 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 305, 3, 16),
(337, 'KETOPROFENO', '2.5 %', 'Gel X 60 g', 1, 'prod_default.png', 'A', 148, 3, 18),
(338, 'KETOPROFENO', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(339, 'KETOPROFENO', '100 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 148, 3, 16),
(340, 'KETOPROFENO', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(341, 'KETOROLACO', '30 mg/mL', 'Vial', 1, 'prod_default.png', 'A', 76, 3, 16),
(342, 'KETOROLACO', '60 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 76, 3, 16),
(343, 'KETOROLACO', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(344, 'KETOROLACO', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(345, 'KETOROLACO', '30 mg', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 326, 3, 16),
(346, 'KETOROLACO', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(347, 'LANSOPRAZOL', '30 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 171, 3, 7),
(348, 'LANSOPRAZOL', '30 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 284, 3, 7),
(349, 'LAXULOSA', '3.33 g/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 301, 3, 34),
(350, 'LECHE DE MAGNESIA PHILLIPS SABOR CEREZA', '400 mg/5 mL', 'Frasco X 360 mL', 1, 'prod_default.png', 'A', 223, 2, 29),
(351, 'LECHE DE MAGNESIA PHILLIPS SABOR CEREZA', '400 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(352, 'LEVOFLOXACINO', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(353, 'LIDOCAINA', '2%', 'Ampolla X 20 mL', 1, 'prod_default.png', 'A', 212, 3, 16),
(354, 'LIDOCAINA', '5%', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 212, 3, 16),
(355, 'LORATADINA', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(356, 'LORATADINA', '5 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 1, 3, 25),
(357, 'LORATADINA', '5 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 131, 3, 34),
(358, 'LORATADINA', '5 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 148, 3, 34),
(359, 'LOSARTAN', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(360, 'LOSARTAN', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(361, 'MACRODANTINA', '50 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 223, 3, 7),
(362, 'MACRODANTINA', '100 mg', 'Caja Envase Folio Cápsulas', 1, 'prod_default.png', 'A', 223, 3, 7),
(363, 'MACRODANTINA', '25 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 223, 3, 27),
(364, 'MEBENDAZOL', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(365, 'MEBENDAZOL', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(366, 'MEBENDAZOL', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(367, 'MEDICORT', '4 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(368, 'MEDICORT', '2 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(369, 'MEGACILINA', '1 000 000 UI', 'Caja Vial + Solvente x 3 mL', 1, 'prod_default.png', 'A', 158, 2, 16),
(370, 'MEGACILINA ORAL', '1 000 000 UI', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 158, 2, 30),
(371, 'MEJORAL', '500 mg + 30 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(372, 'MELOXICAM', '15 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 245, 3, 30),
(373, 'MELOXIFLAM FORTE', '15 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 245, 2, 30),
(374, 'MERTHIOLATE PLUS INCOLORO', '0.13 %', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 165, 2, 5),
(375, 'MERTHIOLATE PLUS INCOLORO', '0.13 %', 'Frasco Atomizador X 12 X 50 mL', 1, 'prod_default.png', 'A', 165, 2, 5),
(376, 'METAMIZOL SODICO', '0.5 g/mL', 'Frasco x 10 mL', 1, 'prod_default.png', 'A', 131, 3, 34),
(377, 'METFORMINA CLORHIDRATO', '850 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(378, 'METFORMINA', '850 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 306, 3, 30),
(379, 'METFORMINA CLORHIDRATO', '850 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(380, 'METOCLOPRAMIDA', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(381, 'METRONIDAZOL', '500 mg/100 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 53, 3, 16),
(382, 'METRONIDAZOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(383, 'METRONIDAZOL', '125 mg', 'Caja Envase x 60 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(384, 'METRONIDAZOL', '125 mg', 'Caja Envase x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(385, 'METRONIDAZOL', '250 mg/5 mL', 'Caja Frasco x 60 mL + Accesorio', 1, 'prod_default.png', 'A', 1, 3, 27),
(386, 'METRONIDAZOL', '250 mg/5 mL', 'Caja Frasco x 120 mL + Accesorio', 1, 'prod_default.png', 'A', 1, 3, 27),
(387, 'METRONIDAZOL', '250 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 148, 3, 27),
(388, 'METRONIDAZOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(389, 'METRONIDAZOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(390, 'MICOMISIL', '1%', 'Caja Tubo X 15 g', 1, 'prod_default.png', 'A', 301, 2, 9),
(391, 'MIGRADORIXINA', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(392, 'MIODEL RELAX', '', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 77, 2, 30),
(393, 'MUCODILAT', '2 mg + 7.5 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(394, 'MUCOTRIM PLUS', '2 mg + 7.5 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 301, 2, 34),
(395, 'NAPROXENO SODICO', '550 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 284, 3, 30),
(396, 'NAPROXENO SODICO', '550 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 131, 3, 30),
(397, 'NASTIZOL COMPOSITUM NF ANTIGRIPAL', '500 mg + 15 mg + 5 mg + 2 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 31, 2, 30),
(398, 'NEUROBION 5000', '', 'Caja Grageas', 1, 'prod_default.png', 'A', 231, 2, 30),
(399, 'NEURYL', '2.5 mg/mL', 'Frasco X 20 mL', 1, 'prod_default.png', 'A', 31, 2, 34),
(400, 'NIFEDIPINO', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(401, 'NIMODIPINO', '30 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(402, 'NISTAGLOS', '', 'Tubo X 15 g', 1, 'prod_default.png', 'A', 158, 2, 9),
(403, 'NISTAGLOS', '', 'Tubo X 30 g', 1, 'prod_default.png', 'A', 158, 2, 9),
(404, 'OMEPRAZOL', '40 mg', 'Caja Vial', 1, 'prod_default.png', 'A', 341, 3, 16),
(405, 'OMEPRAZOL', '20 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 171, 3, 7),
(406, 'OMEPRAZOL', '20 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 3, 7),
(407, 'ORFENADRINA CITRATO', '60 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 76, 3, 16),
(408, 'ORFENADRINA CITRATO', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 110, 3, 30),
(409, 'OTIDOL NUEVA FORMULA', '', 'Frasco X 5 mL', 1, 'prod_default.png', 'A', 200, 2, 25),
(410, 'OTOZAMBON', '', 'Frasco Gotero X 10 mL', 1, 'prod_default.png', 'A', 210, 2, 25),
(411, 'PANADOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 162, 2, 30),
(412, 'PANADOL PARA NIÑOS LIQUIDO', '160 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 162, 2, 34),
(413, 'PANKREOFLAT N', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 33, 2, 30),
(414, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 212, 3, 30),
(415, 'PARACETAMOL', '120 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 212, 3, 34),
(416, 'PARACETAMOL', '120 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 212, 3, 34),
(417, 'PARACETAMOL', '120 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 3, 34),
(418, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 3, 30),
(419, 'PARACETAMOL', '120 mg/5 mL', 'Caja Envase x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(420, 'PARACETAMOL', '120 mg/5 mL', 'Caja Envase x 60 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(421, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(422, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(423, 'PARACETAMOL', '150 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 148, 3, 34),
(424, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(425, 'PARACETAMOL', '120 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 183, 3, 34),
(426, 'PARACETAMOL', '120 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 183, 3, 34),
(427, 'PARACETAMOL', '100 mg/mL', 'Frasco x 10 mL', 1, 'prod_default.png', 'A', 183, 3, 34),
(428, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(429, 'PARACETAMOL', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(430, 'PIROXICAM', '0.5 %', 'Tubo X 40 g', 1, 'prod_default.png', 'A', 148, 3, 18),
(431, 'PIROXICAM', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(432, 'PLIDAN', '1%', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 296, 2, 34),
(433, 'PLIDAN FORTE', '10 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(434, 'POSIPEN', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 162, 2, 7),
(435, 'POSTINOR 1', '1.5 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 144, 2, 30),
(436, 'POSTINOR 2', '0.75 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 144, 2, 30),
(437, 'PREDNISONA', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(438, 'PREDNISONA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 3, 30),
(439, 'PREDNISONA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 212, 3, 30),
(440, 'PREDNISONA', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 212, 3, 30),
(441, 'PREDNISONA', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 212, 3, 30),
(442, 'PREDNISONA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(443, 'PREDNISONA', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(444, 'PREDNISONA', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 284, 3, 30),
(445, 'PREDNISONA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(446, 'PREDNISONA', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(447, 'PREDNISONA', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(448, 'PROXIDOL', '275 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 216, 2, 30),
(449, 'PROXIDOL', '550 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 216, 2, 30),
(450, 'PYRIDIUM', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 2, 30),
(451, 'RANITIDINA', '300 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 3, 30),
(452, 'RANITIDINA', '300 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(453, 'RANITIDINA', '150 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 3, 30),
(454, 'RANITIDINA', '300 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 3, 30),
(455, 'RANITIDINA', '300 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(456, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 115 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(457, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 60 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(458, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 37 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(459, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 32 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(460, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 22 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(461, 'REUMA SOL EXTRAFUERTE', '', 'Pote x 5 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(462, 'REUMA SOL EXTRAFUERTE', '', 'Tubo x 35 g', 1, 'prod_default.png', 'A', 127, 2, 31),
(463, 'RHINO BB', '0.9 %', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 326, 2, 5),
(464, 'ROWACHOL', '', 'Caja Frasco Capsulas', 1, 'prod_default.png', 'A', 291, 2, 7),
(465, 'ROWACHOL', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 291, 2, 7),
(467, 'ROWATINEX', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 291, 2, 7),
(468, 'ROXTIL', '', 'Tubo x 10 g', 1, 'prod_default.png', 'A', 301, 2, 9),
(469, 'ROXTRIM BALSAMICO', '200 mg + 40 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 301, 2, 27),
(470, 'RYNATAN', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(471, 'RYNATAN', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(472, 'SALBUTAMOL', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(473, 'SALBUTAMOL', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(474, 'SALBUTAMOL', '2 mg/5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(475, 'SALBUTAMOL', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(477, 'SALBUTRAL AC', '', 'Caja Frasco X 250 Dosis', 1, 'prod_default.png', 'A', 75, 2, 5),
(478, 'SILDENAFILO', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(479, 'SILDENAFILO', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(480, 'SIMETICONA SABOR A FRESA', '80 mg/mL', 'Caja Frasco Gotero X 15 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(481, 'SIMETICONA', '80 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(482, 'SOLUNA', '', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(483, 'SULFAMETOXAZOL + TRIMETOPRIMA + GUAIFENESINA', '200 mg + 40 mg + 50 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(484, 'SULFAMETOXAZOL + TRIMETOPRIMA', '200 mg + 40 mg/5 mL', 'Caja Frasco x 60mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(485, 'SULFAMETOXAZOL + TRIMETOPRIMA', '400 mg + 80 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(486, 'SULFAMETOXAZOL + TRIMETOPRIMA', '800 mg + 160 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(487, 'SULFAMETOXAZOL + TRIMETOPRIMA + GUAIFENESINA', '200 mg + 40 mg + 50 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(488, 'SULFAMED', '1%', 'Frasco X 10 g', 1, 'prod_default.png', 'A', 223, 2, 22),
(489, 'SULFAMED L', '', 'Tubo X 15 g', 1, 'prod_default.png', 'A', 223, 2, 31),
(490, 'SULFAMETOXAZOL + TRIMETOPRIMA', '200 mg + 40 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 171, 3, 27),
(491, 'SULFATO DE MAGNESIO', '20%', 'Caja Ampolla X 10 mL', 1, 'prod_default.png', 'A', 76, 3, 16),
(492, 'SUPRACALM', '1 g', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 323, 2, 30),
(493, 'TAPSIN MUJER', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 219, 2, 30),
(494, 'TERBINAFINA', '250 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(495, 'TERBINAFINA', '250 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(496, 'TERRAMICINA', '5 mg/g + 10 000 U/g', 'Tubo X 6 g', 1, 'prod_default.png', 'A', 259, 2, 32),
(497, 'TETRACICLINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 3, 7),
(498, 'TETRACICLINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(499, 'TETRACICLINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 171, 3, 7),
(500, 'TETRACICLINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 237, 3, 7),
(501, 'THIMOLINA LEONARD', '', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 131, 2, 34),
(502, 'THIMOLINA LEONARD', '', 'Frasco X 200 mL', 1, 'prod_default.png', 'A', 131, 2, 34),
(503, 'TOBAN', '2 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 110, 2, 7),
(504, 'TOPICREM', '', 'Tubo x 10 g', 1, 'prod_default.png', 'A', 165, 2, 9),
(505, 'TRAMADOL', '50 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 341, 3, 16),
(506, 'TRAMADOL', '100 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 341, 3, 16),
(507, 'TRAMADOL', '50 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 148, 3, 16),
(508, 'TRAMADOL', '100 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 148, 3, 16),
(509, 'TRAMAL', '50 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 158, 2, 7),
(510, 'TRAMAL GOTAS', '100 mg/mL', 'Frasco X 10 mL', 1, 'prod_default.png', 'A', 158, 2, 34),
(511, 'TRAMAL LONG', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 158, 2, 30),
(512, 'TRIMETOPRIM SULFA', '40 mg + 200 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 148, 2, 27),
(513, 'TRIMETOPRIM SULFA F', '80 mg + 400 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 148, 2, 27),
(514, 'TRIMETOPRIM SULFA F', '800 mg + 160 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 2, 30),
(515, 'TRIOVAL', '', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 129, 2, 27),
(516, 'TRIOVAL', '', 'Frasco X 15 mL', 1, 'prod_default.png', 'A', 129, 2, 27),
(517, 'TUSQUIM', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 171, 2, 30),
(518, 'UROBIOTIC FORTE', '400 mg + 100 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 315, 2, 7),
(519, 'VOLTAREN AEROSOL', '1.16 %', 'Frasco X 85 mL', 1, 'prod_default.png', 'A', 244, 2, 5),
(520, 'VOLTAREN EMULGEL', '1%', 'Tubo X 30 g', 1, 'prod_default.png', 'A', 244, 2, 18),
(521, 'VOLTAREN EMULGEL', '1%', 'Tubo X 60 g', 1, 'prod_default.png', 'A', 244, 2, 18),
(522, 'VOLTAREN EMULGEL', '1%', 'Tubo X 100 g', 1, 'prod_default.png', 'A', 244, 2, 18),
(523, 'VOLTAREN EMULGEL', '1%', 'Caja Dispensadora Tubo X 30 g', 1, 'prod_default.png', 'A', 244, 2, 18),
(524, 'VOLTAREN SR', '100 mg', 'Caja Grageas', 1, 'prod_default.png', 'A', 244, 2, 30),
(525, 'ZATRIX', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(526, 'ZATRIX', '2 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(527, 'ZATRIX SL', '0.25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(528, 'ALERGICAL LP', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 165, 2, 7),
(529, 'ALERGICAL LP', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 165, 2, 34),
(530, 'ALERGICAL SF', '', 'Frasco x 15 mL', 1, 'prod_default.png', 'A', 165, 2, 34),
(531, 'ALERGICAL SF', '', 'Frasco x 10 mL', 1, 'prod_default.png', 'A', 165, 2, 34),
(532, 'ALERGICAL SF', '', 'Frasco X 20 mL', 1, 'prod_default.png', 'A', 165, 2, 34),
(533, 'ALERGICAL SF', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 2, 30),
(534, 'ALERGIPLUS', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(535, 'ALPRAZOLAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(536, 'ALPRAZOLAM', '0.25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(537, 'AMOXICILINA', '250 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 183, 3, 27),
(538, 'AMOXICLIN CL 250', '250 mg + 62.5 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(539, 'AMOXIDAL DUO', '875 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(540, 'ANTALGINA', '400 mg/mL', 'Frasco X 10 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(541, 'ANTALGINA', '250 mg/5 mL', 'Frasco X 10 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(542, 'ANTALGINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(543, 'AZITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(544, 'BETAMETASONA', '0.1 %', 'Tubo X 40 g', 1, 'prod_default.png', 'A', 148, 3, 9),
(545, 'BRONCO AMOXICLIN', '125 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(546, 'BRONCO MAGNIMOX', '500 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(547, 'BRONCO MEDIMOX', '250 mg + 4 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(548, 'BRONCO MEDIMOX', '500 mg + 8 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(549, 'BRONCO TRIFAMOX', '500 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(550, 'BRONCO MAGNIMOX', '500 mg + 8 mg', 'Caja Dispensadora Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 326, 2, 7),
(551, 'CEFABRONCOL', '500 mg', 'Caja Dispensadora Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 223, 2, 7),
(552, 'CEFACROL IM 1000', '1000 mg', 'Vial', 1, 'prod_default.png', 'A', 223, 2, 16),
(553, 'CEFACROL IM', '250 mg', 'Vial', 1, 'prod_default.png', 'A', 223, 2, 16),
(554, 'CEFACROL IM', '500 mg', 'Vial', 1, 'prod_default.png', 'A', 223, 2, 16),
(555, 'CEFTRIAXONA', '1 g', 'Vial', 1, 'prod_default.png', 'A', 223, 3, 16),
(556, 'AB MOKS', '250 mg + 15 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(557, 'AB MOKS', '250 mg + 15 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(558, 'AB MOKS', '250 mg + 15 mg/5 mL', 'Frasco X 75 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(559, 'AB MOKS FORTE', '1000 mg + 60 mg', 'Caja Envase Blister Tabletas Recubiertas', 1, 'prod_default.png', 'A', 223, 2, 30),
(560, 'AB-BRONCOL NF 1200', '1000 mg + 200 mg', 'Caja Vial + Solvente x 5 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(561, 'AB-BRONCOL NF 300', '250 mg + 50 mg', 'Caja Vial + 1 Ampolla x 3 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(562, 'AB-BRONCOL NF 600', '600 mg', 'Caja 1 Vial + 1 Ampolla Solvente x 5 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(563, 'AB-MOKS', '500 mg + 30 mg', 'Caja Envase Blister Tabletas Recubiertas', 1, 'prod_default.png', 'A', 223, 2, 30);
INSERT INTO `producto` (`id_producto`, `nombre`, `concentracion`, `adicional`, `precio`, `avatar`, `estado`, `prod_lab`, `prod_tip_prod`, `prod_present`) VALUES
(564, 'AB-MOKS FORTE', '', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 223, 2, 30),
(565, 'ACETILCISTEINA', '200 mg', 'Sobre X 5 g', 1, 'prod_default.png', 'A', 226, 3, 14),
(566, 'ACETILCISTEINA', '200 mg', 'Caja Sobre x 3 g', 1, 'prod_default.png', 'A', 306, 3, 14),
(567, 'ACETILCISTEINA', '600 mg', 'Caja Sobre x 2 g', 1, 'prod_default.png', 'A', 339, 3, 14),
(568, 'ACI BASIC', '400 mg + 30 mg / 5 mL', 'Frasco x 150 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(569, 'ACI BASIC', '400 mg + 30 mg / 5 mL', 'Frasco x 220 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(570, 'ACI BASIC UVA', '800 mg + 60 mg/ 10 mL', 'Frasco x 150 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(571, 'ACI TIP', '800 mg + 40 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(572, 'ACICLAV', '500 mg + 125 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 346, 2, 30),
(573, 'ACICLAV', '250 mg + 62.5 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 346, 2, 27),
(574, 'ACICLAV', '875 mg + 125 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 346, 2, 30),
(575, 'ACIDO FOLICO', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 14, 3, 30),
(576, 'AERO OM', '40 mg', 'Caja Envase Blister Comprimidos', 1, 'prod_default.png', 'A', 252, 2, 30),
(577, 'AERO OM FORTE - SABOR ANIS', '125 mg', 'Caja Envase Blister Comprimidos', 1, 'prod_default.png', 'A', 252, 2, 30),
(578, 'AERO OM SABOR A FRESAS', '100 mg/mL', 'Caja Frasco gotero x 15mL', 1, 'prod_default.png', 'A', 252, 2, 27),
(579, 'AERO OM SABOR A FRESAS', '100 mg/mL', 'Caja Frasco gotero x 60 mL', 1, 'prod_default.png', 'A', 252, 2, 27),
(580, 'AERO OM SABOR ANIS', '100 mg/mL', 'Frasco X 15 mL', 1, 'prod_default.png', 'A', 252, 2, 27),
(581, 'AERO OM SABOR ANIS', '80 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 252, 2, 30),
(582, 'ALERCET', '5 mg/ 5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 332, 2, 34),
(583, 'ALERCET', '10 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 332, 2, 7),
(584, 'ALERCET D', '', 'Caja Envase Blíster Cápsulas de Liberación Prolongada', 1, 'prod_default.png', 'A', 332, 2, 7),
(585, 'ALERGIZINA', '5 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 179, 2, 34),
(586, 'ALERGIZINA', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 179, 2, 30),
(587, 'AMBROMOX', '250 mg + 15 mg', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(588, 'AMBROMOX', '500 mg + 30 mg', 'Caja Envase Blister Cápsula', 1, 'prod_default.png', 'A', 131, 2, 7),
(589, 'AMBROXIL', '500 mg + 30 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 2, 30),
(590, 'AMBROXIL', '250 mg + 15 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 183, 2, 27),
(591, 'AMBROXOL', '30 mg/5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 131, 3, 34),
(592, 'AMBROXOL', '30 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(593, 'AMBROXOL', '15 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(594, 'AMBROXOL', '15 mg/5 mL', 'Caja Frasco x 100 mL', 1, 'prod_default.png', 'A', 325, 3, 34),
(595, 'AMBROXOL', '30 mg/5 mL', 'Caja Frasco x 100 mL', 1, 'prod_default.png', 'A', 325, 3, 34),
(596, 'AMBROXOL', '30 mg/ 5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 34),
(597, 'AMITRIPTILINA', '25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(598, 'AMITRIPTILINA', '25 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(599, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 237, 3, 7),
(600, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 3, 30),
(601, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 195, 3, 7),
(602, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 268, 3, 7),
(603, 'AMOXICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(604, 'AMOXICILINA', '500 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 306, 3, 7),
(605, 'AMOXICILINA + ACIDO CLAVULANICO', '500 mg + 125 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(606, 'AMOXICILINA + ACIDO CLAVULANICO', '250 mg + 62.5 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 237, 3, 27),
(607, 'AMOXICILINA + ACIDO CLAVULANICO', '250 mg + 62.5 mg/5 mL', 'Frasco x 30 mL', 1, 'prod_default.png', 'A', 237, 3, 27),
(608, 'AMOXICILINA + ACIDO CLAVULANICO', '875 mg + 125 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 306, 3, 30),
(609, 'AMOXICLIN', '250 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(610, 'AMOXICLIN', '125 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(611, 'AMOXICLIN', '250 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(612, 'AMOXICLIN', '500 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(613, 'AMOXICLIN DUO', '750 mg/5 mL', 'Frasco x 70 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(614, 'AMOXICLIN DUO RESPIRATORIO', '', 'Caja Frasco x 70 mL + Accesorio', 1, 'prod_default.png', 'A', 315, 2, 27),
(615, 'AMOXIDAL DUO 250', '250 mg/5 mL', 'Caja Frasco x 90 mL + Accesorio', 1, 'prod_default.png', 'A', 296, 2, 27),
(616, 'AMOXIDAL DUO 500', '500 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(617, 'AMOXIDAL PLUS', '400 mg + 57 mg/5 mL', 'Caja Frasco x 100 mL', 1, 'prod_default.png', 'A', 296, 2, 27),
(618, 'AMOXIDAL PLUS', '875 mg + 125 mg', 'Caja Envase Blíster Comprimidos Recubiertos', 1, 'prod_default.png', 'A', 296, 2, 30),
(619, 'AMOXIDIN DUO', '875 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(620, 'AMOXIL', '250 mg/5 mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 162, 2, 27),
(621, 'AMOXIL', '500 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 162, 2, 27),
(622, 'AMOXIL', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 162, 2, 7),
(623, 'AMPICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 237, 3, 7),
(624, 'AMPICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(625, 'AMPICILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 239, 3, 7),
(626, 'AMPICILINA', '500 mg', 'Caja Envase Blister Cápsula', 1, 'prod_default.png', 'A', 1, 3, 7),
(627, 'AMPICILINA', '500 mg', 'Caja Envase Blíster Cápsula', 1, 'prod_default.png', 'A', 314, 3, 7),
(628, 'ANAFLEX MUJER', '25 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 31, 2, 7),
(629, 'ANDREWS', '', 'Frasco x 200 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(630, 'ANDREWS TRIPLE ACCION', '1 g + 1.408 g + 60 mg /7.9 g', 'Caja Sobre X 7.9 g', 1, 'prod_default.png', 'A', 223, 2, 22),
(631, 'ANEURIN', '25000', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 284, 2, 16),
(632, 'ANEURIN 1000', '100 mg + 100 mg + 1000mcg', 'Caja Ampolla x 3 mL + Accesorios', 1, 'prod_default.png', 'A', 284, 2, 16),
(633, 'ANEURIN 10000', '10 000', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 284, 2, 16),
(634, 'ANEURIN 5000', '100 mg + 100 mg + 5 mg/ 3 mL', 'Caja Ampolla x 3 mL + Accesorios', 1, 'prod_default.png', 'A', 284, 2, 16),
(635, 'ANEURIN FORTE NF', '100 mg + 200 mg + 1 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 284, 2, 30),
(636, 'ANTIGRIPINA PLUS', '500 mg + 5 mg + 2 mg', 'Caja Envase Blister Comprimidos Recubiertos', 1, 'prod_default.png', 'A', 284, 2, 30),
(637, 'APRONAX', '550 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 33, 2, 30),
(638, 'APROXIL', '550 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 39, 2, 30),
(639, 'ARTRIGAN PLUS', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 140, 2, 30),
(640, 'ASPIRINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 33, 2, 30),
(641, 'ASPIRINA 100', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 33, 2, 30),
(642, 'ASPIRINA FORTE', '650 mg + 65 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 33, 2, 30),
(643, 'ATROPINA SULFATO', '1 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 268, 3, 16),
(644, 'ATROPINA SULFATO', '0.25 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(645, 'ATROPINA SULFATO', '0.5 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 268, 3, 16),
(646, 'AZO BACCIDAL', '500 mg + 100 mg', 'Caja Envase Blister Tableta Recubierta', 1, 'prod_default.png', 'A', 99, 2, 30),
(647, 'AZOCEFASABAL 100', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 2, 30),
(649, 'BACSULFIN BALSAMICO', '200 mg + 40 mg + 50 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 338, 2, 27),
(650, 'BACSULFIN BALSAMICO', '800 mg + 160 mg + 200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 338, 2, 30),
(651, 'BACSULFIN FORTE', '800 mg + 160 mg', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 338, 2, 30),
(652, 'BACTEROL BALSAMICO', '800 mg + 160 mg + 200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(653, 'BACTEROL BALSAMICO', '', 'Caja Frasco X 50 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(654, 'BACTEROL FORTE', '400 mg + 80 mg/5 mL', 'Caja Frasco X 50 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(655, 'BACTEROL FORTE', '800 mg + 160 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(656, 'BACTEROL INFANTIL', '200 mg + 40 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 131, 2, 27),
(657, 'BACTRIM', '200 mg + 40 mg/5 mL', 'Caja Frasco x 100 mL', 1, 'prod_default.png', 'A', 294, 2, 27),
(658, 'BACTRIM', '200 mg + 40 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 294, 2, 27),
(659, 'BACTRIM BALSAMICO', '200 mg + 40 mg + 50 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 294, 2, 34),
(660, 'BACTRIM BALSAMICO', '800 mg + 160 mg + 200 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 294, 2, 30),
(661, 'BACTRIM F', '800 mg + 160 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 294, 2, 30),
(662, 'BACTRIM FORTE', '800 mg + 160 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 294, 2, 30),
(663, 'BACTRIM FORTE', '400 mg + 80 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 294, 2, 27),
(664, 'BENCILPENICILINA BENZATINICA', '1 200 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 181, 3, 16),
(665, 'BENCILPENICILINA BENZATINICA', '1 200 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 268, 3, 16),
(666, 'BENCILPENICILINA BENZATINICA', '1 200 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 76, 3, 16),
(667, 'BENCILPENICILINA PROCAINICA', '1 000 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 181, 3, 16),
(668, 'BENCILPENICILINA SODICA', '1 000 000 UI', 'Caja Vial', 1, 'prod_default.png', 'A', 181, 3, 16),
(669, 'BENZOATO DE BENCILO', '25%', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 301, 3, 10),
(670, 'BENZOATO DE BENCILO', '25%', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 301, 3, 10),
(671, 'BENZOATO DE BENCILO', '25%', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 347, 3, 19),
(672, 'BETACORT', '4 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(673, 'BETACORT DEPOT', '5 mg + 2 mg', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(674, 'BETACREM', '0.05 %', 'Caja Tubo x 20 g', 1, 'prod_default.png', 'A', 165, 2, 9),
(675, 'BETACREM', '0.05%', 'Caja Tubo x 30 g', 1, 'prod_default.png', 'A', 165, 2, 9),
(676, 'BETACREM', '0.05%', 'Caja Tubo x 20 g', 1, 'prod_default.png', 'A', 165, 2, 9),
(677, 'BETAMETASONA', '4 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 120, 3, 16),
(678, 'BETAMETASONA', '4 mg/mL', 'caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 306, 3, 16),
(679, 'BICARBONATO DE SODIO', '8.4 %', 'Caja Ampolla x 20 mL', 1, 'prod_default.png', 'A', 212, 3, 16),
(680, 'BICARBONATO DE SODIO', '8.4 %', 'Caja Ampolla x 20 mL', 1, 'prod_default.png', 'A', 268, 3, 16),
(681, 'BIO ELECTRO', '250 mg + 250 mg + 65 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 149, 2, 30),
(682, 'BIOBRONCOL', '500 mg + 30 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 183, 2, 7),
(683, 'BIOBRONCOL', '250 mg + 15 mg/5 mL', 'Frasco x 75 mL', 1, 'prod_default.png', 'A', 183, 2, 27),
(684, 'BISMUALIV', '262.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 2, 30),
(685, 'BISMUALIV', '262.5 mg', 'Caja Sobres x 2 Tabletas', 1, 'prod_default.png', 'A', 1, 2, 30),
(686, 'BISMUTOL', '87.33 mg/5 mL', 'Frasco X 150 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(687, 'BISMUTOL', '87.33 mg/5 mL', 'Frasco X 340 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(688, 'BISMUTOL', '262 mg', 'Caja Sobre x 2 Tabletas Masticables', 1, 'prod_default.png', 'A', 326, 2, 30),
(689, 'BISOLVON ADULTOS', '8 mg/5 mL', 'Caja Frasco x 120 mL + Cuchara dosificadora', 1, 'prod_default.png', 'A', 47, 2, 34),
(690, 'BISOLVON PARA NIÑOS', '4 mg/5 mL', 'Caja Frasco x 120 mL + Vaso dosificador', 1, 'prod_default.png', 'A', 47, 2, 25),
(691, 'BROMAZEPAM', '3 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 239, 3, 30),
(692, 'BROMAZEPAM', '3 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(693, 'BRONCO AMOXICLIN', '250 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 315, 2, 27),
(694, 'BRONCO AMOXICLIN 500', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 315, 2, 30),
(695, 'BRONCO AMOXIDIN 250', '250 mg + 150 mg/ 5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(696, 'BRONCO MAGNIMOX 250', '250 mg + 4 mg/5 mL', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(697, 'BRONCO MEDIMOX', '125 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(698, 'BRONCO MEDIMOX', '500 mg + 4 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(699, 'BRONCO MEDIMOX', '250 mg + 4 mg/5 mL', 'Caja Frasco x 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(700, 'BRONCO TRIFAMOX 125', '125 mg + 4 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(701, 'BRONCO TRIFAMOX 125', '', 'Caja Frasco x 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(702, 'BRONCO TRIFAMOX 250', '250 mg + 4 mg/5 mL', 'Caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(703, 'BRONCO TRIFAMOX 250', '', 'Caja Frasco x 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(704, 'BRONCODILAT ADULTO', '15 mg + 0.010 mg/ 5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 2, 34),
(705, 'BRONCOPULMIN NF', '5 mg + 100 mg/5mL', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 165, 2, 34),
(706, 'BRONCOPULMIN NF', '5 mg + 7.5 mg', 'Caja Sobre x 4 Pastillas Duras para Chupar', 1, 'prod_default.png', 'A', 165, 2, 7),
(707, 'BRONPAMOX', '500 mg + 30 mg', 'Caja Envase Blister Cápsula', 1, 'prod_default.png', 'A', 131, 2, 7),
(708, 'BUSCAPINA', '10 mg', 'Caja Envase Blister Grageas', 1, 'prod_default.png', 'A', 47, 2, 30),
(709, 'BUSCAPINA', '10 mg', 'Caja Envase Blister Grageas', 1, 'prod_default.png', 'A', 306, 2, 30),
(710, 'BUSCAPINA', '20 mg/mL', 'Caja Ampolla x 1 mL', 1, 'prod_default.png', 'A', 306, 2, 16),
(711, 'BUSCAPINA COMPOSITUM N', 'Caja Envase Blíster Comprimidos', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 47, 2, 30),
(712, 'CADITAR', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(713, 'CADITAR', '400 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(714, 'CARBAMAZEPINA', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(715, 'CARBAMAZEPINA', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(716, 'CARBAMAZEPINA', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(717, 'CEFABRONCOL', '250 mg + 15 mg/5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(718, 'CEFABRONCOL', '250 mg + 15 mg/5 mL', 'Caja Frasco x 75 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(719, 'CEFADROXILO', '500 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 131, 3, 30),
(720, 'CEFADROXILO', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(721, 'CEFADROXILO', '500 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 306, 3, 7),
(722, 'CEFALEXINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(723, 'CEFALEXINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 268, 3, 7),
(724, 'CEFALEXINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(725, 'CEFATRIAX', '1 g', 'Caja Vial', 1, 'prod_default.png', 'A', 268, 2, 16),
(726, 'CEFTRIAXONA', '1 g', 'Caja Vial', 1, 'prod_default.png', 'A', 110, 3, 16),
(727, 'CEFTRIAXONA', '1 g', 'Caja Vial', 1, 'prod_default.png', 'A', 76, 3, 16),
(728, 'CEFTRIAXONA', '1 g', 'Caja vial', 1, 'prod_default.png', 'A', 268, 3, 16),
(729, 'CELECOXIB', '200 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 171, 3, 7),
(730, 'CELECOXIB', '200 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 197, 3, 7),
(731, 'CELECOXIB', '200 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 226, 3, 7),
(732, 'CELECOXIB', '200 mg', 'Caja Envase Blister Cápsula', 1, 'prod_default.png', 'A', 1, 3, 7),
(733, 'CETIRIZINA', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(734, 'CETIRIZINA', '10 mg', 'Caja Envase Blister Tabletas Recubiertas', 1, 'prod_default.png', 'A', 131, 3, 30),
(735, 'CETIRIZINA', '10 mg', 'Caja Envase Blister Comprimidos', 1, 'prod_default.png', 'A', 284, 3, 30),
(736, 'CETIRIZINA', '10 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(737, 'CIPROALLEN', '500 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 348, 2, 30),
(738, 'CLINDAMICINA', '300 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 131, 3, 7),
(739, 'CLINDAMICINA', '300 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 226, 3, 7),
(740, 'CLINDAMICINA', '300 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 268, 3, 7),
(741, 'CLONAZEPAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(742, 'CLONAZEPAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(743, 'CLONAZEPAM', '2 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(744, 'CLONAZEPAM', '2 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(745, 'CLONAZEPAM', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(746, 'CLONAZEPAM', '2 mg', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 110, 3, 30),
(747, 'CLORANFENICOL', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 226, 3, 7),
(748, 'CLORANFENICOL', '1 g', 'Caja Vial', 1, 'prod_default.png', 'A', 268, 3, 16),
(749, 'CLORANFENICOL', '500 mg', 'Caja Envase Blíster', 1, 'prod_default.png', 'A', 1, 3, 7),
(750, 'CLORO ALERGAN', '10 mg/mL', 'Ampolla X 1 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(751, 'CLORO ALERGAN', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(752, 'CLORO ALERGAN', '1 mg/mL', 'Frasco Gotero X 20 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(753, 'CLORO ALERGAN', '2 mg/ 5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(754, 'CODIPRONT', '', 'Caja Frasco X 60 mL', 1, 'prod_default.png', 'A', 158, 2, 27),
(755, 'CODIPRONT', '30 mg + 10 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 158, 2, 7),
(756, 'CODIPRONT EXPECTORANTE', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 158, 2, 27),
(757, 'CODIPRONT EXPECTORANTE', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 158, 2, 7),
(758, 'DAFLON', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 38, 2, 30),
(761, 'DENCORUB FORTE PLUS', '', 'Caja Tubo x 33.5 g', 1, 'prod_default.png', 'A', 131, 2, 9),
(762, 'DEXALER', '1 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 213, 2, 30),
(763, 'DEXALER', '4 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 213, 2, 30),
(764, 'DIAZEPAM', '10 mg/2 mL', 'Ampolla X 2 mL', 1, 'prod_default.png', 'A', 185, 3, 16),
(765, 'DIBROLAX', '10 mg/mL', 'Caja Frasco Gotero x 20 mL', 1, 'prod_default.png', 'A', 131, 2, 34),
(766, 'DICLO K', '75 mg/3 mL', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 296, 2, 16),
(767, 'DICLO K 50', '50 mg', 'Caja Envase Blister Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(768, 'DICLOXACILINA', '250 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 183, 3, 27),
(769, 'DICLOXACILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 237, 3, 7),
(770, 'DICLOXACILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 326, 3, 7),
(771, 'DICLOXACILINA', '500 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 148, 3, 7),
(772, 'DICLOXACILINA', '500 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 306, 3, 7),
(773, 'DICLOXACILINA', '500 mg', 'Caja Envase Blister Cápsula', 1, 'prod_default.png', 'A', 1, 3, 7),
(774, 'DIGESTASE', '80 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 22, 2, 30),
(775, 'DIMENHIDRINATO', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(776, 'DIMENHIDRINATO', '50 mg/5 mL', 'Caja Ampolla x 5 mL', 1, 'prod_default.png', 'A', 120, 3, 16),
(777, 'DIMENHIDRINATO', '50 mg', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(778, 'DIMENHIDRINATO', '50 mg', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 1, 3, 30),
(779, 'DOLNIX', '60 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 131, 2, 16),
(780, 'DOLO ANEURIN', '', 'Caja Ampolla x 1 mL + Ampolla x 3 mL + Jeringa descartable', 1, 'prod_default.png', 'A', 14, 2, 16),
(781, 'DOLO EXTRA FUERTE', '', 'Caja Envase Blister Tabletas Recubiertas', 1, 'prod_default.png', 'A', 339, 2, 30),
(782, 'DOLO LIVIOLEX PEDIATRICO SABOR A UVA', '10 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(783, 'DOLO LIVIOLEX PEDIATRICO SABOR A UVA', '5 mg/mL', 'Frasco X 20 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(784, 'DOLO LIVIOLEX PEDIATRICO SABOR A UVA', '5 mg/mL', 'Caja Frasco Gotero x 20 mL', 1, 'prod_default.png', 'A', 326, 2, 27),
(785, 'DOLO NEUROBION', '', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 231, 2, 7),
(786, 'DOLO NEUROBION FORTE', '', 'Caja Jeringa prellenada doble cámara x 3 mL + Accesorio', 1, 'prod_default.png', 'A', 231, 2, 16),
(787, 'DOLO NEUROBION FORTE', '', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 231, 2, 30),
(788, 'DOLO NEUROBION FORTE', '', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 231, 2, 16),
(789, 'DOLO NEUROPRESS FORTE', '', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 99, 2, 30),
(790, 'DOLO QUIMAGESICO FLEX', '', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 131, 2, 16),
(791, 'DOLO QUIMAGESICO FLEX', '', 'Caja Envase Folio Cápsulas', 1, 'prod_default.png', 'A', 131, 2, 7),
(792, 'DOLO TENSODOX', '5 mg + 15 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 2, 30),
(793, 'DOLOCORDRALAN EXTRA FORTE', '', 'Caja Envase Blíster Tableta Recubierta', 1, 'prod_default.png', 'A', 22, 2, 30),
(794, 'DOLODRAN', '1%', 'Caja tubo x 50 g', 1, 'prod_default.png', 'A', 1, 2, 18),
(795, 'DOLODRAN EXTRA FORTE', '500 mg + 50 mg', 'Caja Envase Blister Tableta Recubierta', 1, 'prod_default.png', 'A', 1, 2, 30),
(796, 'DOLOFARMALAN', '75 mg/3 mL', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(797, 'DOLOFLAM', '200 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 187, 2, 30),
(798, 'DOLOFLAM EXTRAFORTE', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 187, 2, 30),
(799, 'DOLOMAX', '400 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(800, 'DOLOMAX', '40 mg/mL', 'Frasco Gotero X 20 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(801, 'DOLOMAX', '400 mg', 'Caja Envase Blister Cápsulas Blandas', 1, 'prod_default.png', 'A', 223, 2, 7),
(802, 'DOLOMAX PLUS', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(803, 'DOLOMELOXIC', '500 mg + 15 mg', 'Caja Envase Blister Tableta Recubierta', 1, 'prod_default.png', 'A', 326, 2, 30),
(804, 'DOLONET FORTE', '400 mg', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 332, 2, 7),
(806, 'DOLOPLUS FORTE', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 245, 2, 30),
(807, 'DOLOPLUS RELAX', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 245, 2, 30),
(808, 'DOLOPRESS', '50 mg', 'Caja Envase Blister Tabletas Recubierta de Liberación Retardada', 1, 'prod_default.png', 'A', 99, 2, 30),
(809, 'DOLOPRESS FORTE', '500 mg + 50 mg', 'Caja Envase Blíster Tabletas Recubiertas', 1, 'prod_default.png', 'A', 99, 2, 30),
(810, 'DOLOTRINEURAL R', '60 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(811, 'DORIXINA', '125 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 296, 2, 30),
(812, 'DORIXINA', '5%', 'Caja Tubo x 50 g', 1, 'prod_default.png', 'A', 296, 2, 18),
(813, 'DOXICICLINA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 3, 30),
(814, 'DOXICICLINA', '100 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 148, 3, 30),
(815, 'DOXICICLINA', '100 mg', 'Caja Envase Blister Comprimidos', 1, 'prod_default.png', 'A', 306, 3, 30),
(816, 'DOXICICLINA', '100 mg', 'Caja Envase Blíster Cápsulas', 1, 'prod_default.png', 'A', 1, 3, 7),
(817, 'ELECTRORAL NF SABOR A ANIS', '', 'Caja Frasco X 1 L', 1, 'prod_default.png', 'A', 223, 2, 34),
(818, 'ELECTRORAL NF SABOR A FRESA', '', 'Caja Frasco X 1 L', 1, 'prod_default.png', 'A', 223, 2, 34),
(819, 'ELECTRORAL NF SABOR A FRESA', '', 'Frasco x 1000 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(820, 'ELECTRORAL PEDIATRICO SABOR ANÍS', '', 'Frasco x 1000 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(821, 'ELITON', '25 mg/mL', 'Caja Frasco x 20 mL', 1, 'prod_default.png', 'A', 102, 2, 34),
(822, 'ELITON FE 50', '50 mg/5 mL', 'Caja Frasco x 100 mL', 1, 'prod_default.png', 'A', 102, 2, 34),
(823, 'ELITON FORTE', '', 'Frasco X 340 mL + Accesorio', 1, 'prod_default.png', 'A', 102, 2, 34),
(824, 'ENTEROGERMINA', '2000 millones (2 millardos)', 'Caja Envase Blister Cápsulas', 1, 'prod_default.png', 'A', 306, 2, 7),
(825, 'ENTEROGERMINA PLUS', '4 millardos/5 mL', 'Caja Frasco x 5 mL', 1, 'prod_default.png', 'A', 306, 2, 27),
(826, 'ERITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(827, 'ERITROMICINA', '500 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 9, 3, 30),
(828, 'ERITROMICINA', '500 mg', 'Caja Envase Blíster Tableta Recubierta', 1, 'prod_default.png', 'A', 306, 3, 30),
(829, 'ESOMEPRAZOL', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(830, 'ESOMEPRAZOL', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 267, 3, 30),
(831, 'ESOMEPRAZOL', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 267, 3, 30),
(832, 'ESOMEPRAZOL', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(833, 'ESOMEPRAZOL', '20 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(834, 'ESPASMO ANTALGINA', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 326, 2, 30),
(835, 'ESPASMO ANTALGINA', '2500 mg + 20 mg', 'Caja Ampolla x 5 mL', 1, 'prod_default.png', 'A', 326, 2, 16),
(836, 'FAMIDAL', '', 'Caja Tubo x 60 g', 1, 'prod_default.png', 'A', 158, 2, 9),
(837, 'FEBRAX', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 158, 2, 27),
(838, 'FENAZOPIRIDINA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 339, 3, 30),
(839, 'FENAZOPIRIDINA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 131, 3, 30),
(840, 'FENAZOPIRIDINA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(841, 'FLAMICOX®', '20000 UI/ 100 G + 2%', 'Tubo x 20 g', 1, 'prod_default.png', 'A', 301, 2, 9),
(842, 'FLUCONAZOL', '50 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 226, 3, 30),
(843, 'FLUCONAZOL', '100 mg/50 mL', 'Caja Vial X 50 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(844, 'FRAMIDEX NF', '1 % + 0.1 %', 'Frasco X 2.5 mL', 1, 'prod_default.png', 'A', 200, 2, 24),
(845, 'FRUTTIFLEX 50 - SABOR TUTTI FRUTTI', '50 mEq/L Na', 'Caja Frasco x 1000 mL', 1, 'prod_default.png', 'A', 53, 2, 34),
(846, 'FRUTTIFLEX 50 CON SABOR A ANIS', 'ELECTROLITOS 50 mEq/L Na', 'Frasco x 1 000 mL', 1, 'prod_default.png', 'A', 53, 2, 34),
(847, 'FRUTTIFLEX 50 SABOR A FRESA', '', 'Frasco x 1L', 1, 'prod_default.png', 'A', 53, 2, 34),
(848, 'FURAZOLIDONA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 171, 3, 30),
(849, 'FURAZOLIDONA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 3, 30),
(850, 'FURAZOLIDONA', '100 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 239, 3, 30),
(851, 'FURAZOLIDONA', '50 mg/ 5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 1, 3, 27),
(852, 'FURAZOLIDONA', '100 mg', 'Caja Envase Blister Tableta', 1, 'prod_default.png', 'A', 1, 3, 30),
(853, 'FUROSEMIDA', '20 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 223, 3, 16),
(854, 'FUROSEMIDA', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(855, 'FUROSEMIDA', '20 mg/2 mL', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 305, 3, 16),
(856, 'FUROSEMIDA', '40 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 148, 3, 30),
(857, 'FUROXONA', '16.66 mg/5 mL', 'Caja Frasco x 120 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(858, 'FUROXONA', '30 mg /mL', 'Caja Frasco Gotero x 20mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(859, 'GASEOVET', '80 mg/5 mL', 'Frasco X 100 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(860, 'GASEOVET', '80 mg/5 mL', 'Frasco X 105 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(861, 'GASEOVET', '80 mg/5 mL', 'Frasco X 120 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(862, 'GASEOVET', '80 mg/5 mL', 'Frasco X 150 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(863, 'GASEOVET', '80 mg/5 mL', 'Frasco X 240 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(864, 'GASEOVET', '80 mg/5 mL', 'Frasco x 30 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(865, 'GASEOVET', '80 mg/5 mL', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(866, 'GASEOVET', '80 mg/5 mL', 'Frasco X 90 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(867, 'GASEOVET FORTE SABOR ANIS', '100 mg/mL', 'Caja Frasco Gotero x 15 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(868, 'GASEOVET FORTE SABOR FRESA', '100 mg/mL', 'Caja Frasco Gotero x 15 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(869, 'GASEOVET SABOR A ANIS', '80 mg/mL', 'Caja Frasco gotero x 15 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(870, 'GASEOVET SABOR A ANIS', '80 mg/mL', 'Caja Frasco gotero x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(871, 'GASEOVET SABOR A FRESA', '80 mg/mL', 'Caja Frasco Gotero X 15 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(872, 'GASEOVET SABOR A FRESA', '80 mg /mL', 'Caja Frasco Gotero x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 27),
(873, 'GEMFIBROZILO', '600 mg', 'Caja Envase Blister Tableta Recubierta', 1, 'prod_default.png', 'A', 1, 3, 30),
(874, 'GENTAMICINA', '0.3 %', 'Frasco Gotero X 10 mL', 1, 'prod_default.png', 'A', 340, 3, 24),
(875, 'GENTAMICINA', '0.3 %', 'Frasco Gotero X 8 mL', 1, 'prod_default.png', 'A', 212, 3, 24),
(876, 'GENTAMICINA', '0.3 %', 'Frasco Gotero X 5 mL', 1, 'prod_default.png', 'A', 212, 3, 24),
(877, 'GINGISONA B', '0.15 %', 'Frasco X 180 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(878, 'GINGISONA B', '3 mg', 'Caja Sobres x 4 Pastillas c/u', 1, 'prod_default.png', 'A', 326, 2, 7),
(879, 'GINGISONA B', '0.30%', 'Caja Frasco atomizador x 15 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(880, 'GINGISONA B', '0.30%', 'Caja Frasco atomizador x 30 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(881, 'GINGISONA L NF TOQUES', '460 mg + 500 mg + 2000 mg', 'Caja Frasco x 30 mL', 1, 'prod_default.png', 'A', 326, 2, 34),
(882, 'GLIBENCLAMIDA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 183, 3, 30),
(883, 'GLIBENCLAMIDA', '5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 268, 3, 30),
(884, 'GLUCOSA', '5%', 'Frasco x 1 L', 1, 'prod_default.png', 'A', 349, 3, 16),
(885, 'GRAVOL', '50 mg/5 mL', 'Ampolla x 5 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(886, 'GRAVOL FORTE', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(887, 'GRAVOL PEDIATRICO', '30 mg /3 mL', 'Caja Ampolla x 3 mL', 1, 'prod_default.png', 'A', 223, 2, 16),
(888, 'GRIPA C JUNIOR', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(889, 'GRIPA C MAXIMA POTENCIA', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 223, 2, 30),
(890, 'GRIPALIV', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 237, 2, 30),
(891, 'GRIPAMYCIN ALERT', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 309, 2, 30),
(892, 'GRIPAMYCIN CLASSIC', '', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 309, 2, 30),
(893, 'GYNO CANESTEN 1', '500 mg', 'Caja Folio Comprimido vaginal', 1, 'prod_default.png', 'A', 33, 2, 30),
(894, 'GYNO DEXACORT PLUS', '', 'Caja Envase Blister Ovulos', 1, 'prod_default.png', 'A', 326, 2, 20),
(895, 'GYNOCANESTEN®', '1%', 'Caja Tubo x 50 g + Accesorio', 1, 'prod_default.png', 'A', 33, 2, 9),
(896, 'HEMORRODIL', '5 % + 0.25 %', 'Caja Tubo x 20 g', 1, 'prod_default.png', 'A', 131, 2, 31),
(897, 'HEPABIONTA', '', 'Caja Ampolla x 2 mL', 1, 'prod_default.png', 'A', 274, 2, 16),
(898, 'HIDRAX', '', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(899, 'HIDRAX SABOR MANZANA', '', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 34),
(900, 'HIDRAX® FRESA', '0.26 g + 0.15 g + 0.29 g + 1.35 g', 'Frasco x 1 L', 1, 'prod_default.png', 'A', 223, 2, 34),
(901, 'HIPOGLOS', '', 'Tubo X 100 g', 1, 'prod_default.png', 'A', 158, 2, 31),
(902, 'HIRUDOID', '0.3%', 'Caja Tubo x 14 g', 1, 'prod_default.png', 'A', 79, 2, 31),
(903, 'HIRUDOID FORTE', '0.45 %', 'Caja Tubo x 14 g', 1, 'prod_default.png', 'A', 79, 2, 31),
(904, 'HIRUDOID FORTE', '0,45%', 'Caja Tubo x 25 g', 1, 'prod_default.png', 'A', 79, 2, 31),
(905, 'HISALER', '10 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 31, 2, 30),
(906, 'HISALER', '10 mg/mL', 'Caja Frasco x 15mL', 1, 'prod_default.png', 'A', 31, 2, 34),
(907, 'HISALER D', '120 mg + 5 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 31, 2, 30),
(908, 'INFECTRIM', '200 mg + 40 mg/5mL', 'caja Frasco x 60 mL', 1, 'prod_default.png', 'A', 165, 2, 27),
(909, 'INFECTRIM BALSAMICO', '', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'A', 165, 2, 30),
(910, 'INFECTRIM BALSAMICO', '200 mg + 40 mg + 50 mg/ 5 mL', 'Frasco x 100 mL', 1, 'prod_default.png', 'A', 165, 2, 27),
(911, 'INFECTRIM FORTE', '400 mg + 80 mg/5 mL', 'Frasco x 100 mL', 1, 'prod_default.png', 'A', 165, 2, 27),
(912, 'INFECTRIM FORTE', '800 mg + 160 mg', 'Caja Envase Blíster Tabletas', 1, 'prod_default.png', 'A', 165, 2, 30),
(913, 'IRRIGOR', '30 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 323, 2, 30),
(914, 'IRRIGOR', '10 mg/50 mL', 'Caja Vial', 1, 'prod_default.png', 'A', 323, 2, 16),
(915, 'IRRIGOR PLUS', '100 mg + 30 mg', 'Caja Envase Blíster Comprimidos', 1, 'prod_default.png', 'A', 323, 2, 30),
(916, 'ISODINE', '200 mg', 'Caja Envase Blister Ovulos', 1, 'prod_default.png', 'A', 223, 2, 20),
(917, 'ISODINE', '10%', 'Frasco x 60 mL', 1, 'prod_default.png', 'A', 223, 2, 5),
(918, 'ISODINE', '10%', 'Frasco x 120 mL', 1, 'prod_default.png', 'A', 223, 2, 5),
(919, 'ISODINE', '10%', 'Caja Frasco gotero x 20 mL', 1, 'prod_default.png', 'A', 223, 2, 5),
(920, 'ISODINE ESPUMA', '7.5 %', 'Frasco X 60 mL', 1, 'prod_default.png', 'A', 223, 2, 5),
(943, 'prueba', '0.5 mg', 'Caja Envase Blister Tabletas', 1, 'prod_default.png', 'I', 375, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tip_prod` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tip_prod`, `nombre`, `estado`) VALUES
(2, 'Comercial', 'A'),
(3, 'Generico', 'A'),
(13, 'Regalos', 'A'),
(14, 'Joyeria', 'A'),
(16, 'ejemplo2', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_us`
--

CREATE TABLE `tipo_us` (
  `id_tipo_us` int(11) NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_us`
--

INSERT INTO `tipo_us` (`id_tipo_us`, `nombre_tipo`) VALUES
(1, 'Administrador'),
(2, 'Tecnico'),
(3, 'Root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_us` varchar(45) NOT NULL,
  `apellidos_us` varchar(45) NOT NULL,
  `edad` date NOT NULL,
  `dni_us` varchar(45) NOT NULL,
  `contrasena_us` varchar(255) NOT NULL,
  `telefono_us` int(11) DEFAULT NULL,
  `residencia_us` varchar(45) DEFAULT NULL,
  `correo_us` varchar(50) DEFAULT NULL,
  `sexo_us` varchar(25) DEFAULT NULL,
  `adicional_us` varchar(500) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `us_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_us`, `apellidos_us`, `edad`, `dni_us`, `contrasena_us`, `telefono_us`, `residencia_us`, `correo_us`, `sexo_us`, `adicional_us`, `avatar`, `us_tipo`) VALUES
(1, 'Uusuario', 'prueba', '2000-11-13', '12345', '12345', 2147483647, 'Perú/Perú/Perú', 'prueba@gmail.com', 'Masculino', 'Analista Programador', '5f826c34c9b3a-3.png', 3);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `vendedor` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE `venta_producto` (
  `id_ventaproducto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `venta_id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta_producto`
--



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado_pago` (`id_estado_pago`,`id_proveedor`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_det_venta_idx` (`id_det_venta`);

--
-- Indices de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `prod_lab_idx` (`prod_lab`),
  ADD KEY `prod_tip_prod_idx` (`prod_tip_prod`),
  ADD KEY `prod_present_idx` (`prod_present`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tip_prod`);

--
-- Indices de la tabla `tipo_us`
--
ALTER TABLE `tipo_us`
  ADD PRIMARY KEY (`id_tipo_us`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `us_tipo_idx` (`us_tipo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `vendedor` (`vendedor`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`id_ventaproducto`),
  ADD KEY `fk_venta_has_producto_producto1_idx` (`producto_id_producto`),
  ADD KEY `fk_venta_has_producto_venta1_idx` (`venta_id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=944;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tip_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_us`
--
ALTER TABLE `tipo_us`
  MODIFY `id_tipo_us` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  MODIFY `id_ventaproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_estado_pago`) REFERENCES `estado_pago` (`id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `id_det_venta` FOREIGN KEY (`id_det_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `lote_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `prod_lab` FOREIGN KEY (`prod_lab`) REFERENCES `laboratorio` (`id_laboratorio`),
  ADD CONSTRAINT `prod_present` FOREIGN KEY (`prod_present`) REFERENCES `presentacion` (`id_presentacion`),
  ADD CONSTRAINT `prod_tip_prod` FOREIGN KEY (`prod_tip_prod`) REFERENCES `tipo_producto` (`id_tip_prod`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `us_tipo` FOREIGN KEY (`us_tipo`) REFERENCES `tipo_us` (`id_tipo_us`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`vendedor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `fk_venta_has_producto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_venta_has_producto_venta1` FOREIGN KEY (`venta_id_venta`) REFERENCES `venta` (`id_venta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
