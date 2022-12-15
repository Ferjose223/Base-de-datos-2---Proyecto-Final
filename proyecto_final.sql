-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2022 a las 20:13:10
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `id_dentista` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id`, `id_dentista`, `fecha`, `hora`, `estado`) VALUES
(1, 7, '2022-02-14', '10:00:00', 1),
(2, 1, '2022-03-05', '11:30:00', 1),
(3, 10, '2022-04-16', '13:45:00', 1),
(4, 7, '2022-05-20', '14:15:00', 1),
(5, 7, '2022-06-30', '15:00:00', 1),
(6, 9, '2022-07-01', '14:20:00', 1),
(7, 6, '2022-08-23', '16:30:00', 1),
(8, 1, '2022-09-15', '17:00:00', 1),
(9, 3, '2022-10-03', '11:00:00', 1),
(10, 1, '2022-11-22', '10:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id`, `id_paciente`, `id_agenda`, `id_tratamiento`, `observaciones`, `estado`) VALUES
(1, 1, 8, 5, 'Caries en 4 dientes', 1),
(2, 2, 1, 2, 'Dolor en varias muelas', 1),
(3, 3, 2, 1, 'El paciente muesta alergia a la anestesia', 1),
(4, 4, 3, 7, 'Ninguna', 1),
(5, 5, 4, 8, 'Diente n°37 necesita endodoncia', 1),
(6, 6, 5, 11, 'Ninguna', 1),
(7, 7, 6, 4, 'Infeccion', 1),
(8, 8, 7, 9, 'Destruccion de la corona dental anterior', 1),
(9, 9, 9, 12, 'Debilitamiento en la fijacion de la protesis', 1),
(10, 10, 10, 5, 'Caries en diente n°25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `complicades`
--

CREATE TABLE `complicades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `complicades`
--

INSERT INTO `complicades` (`id`, `nombre`, `estado`) VALUES
(1, 'Hipertension', 1),
(2, 'Fiebre', 1),
(3, 'Diabetes', 1),
(4, 'Anemia', 1),
(5, 'Leucemia', 1),
(6, 'Asma', 1),
(7, 'Mareos', 1),
(8, 'Artritis', 1),
(9, 'Dolor en el pecho', 1),
(10, 'Cancer', 1),
(11, 'Hepatitis', 1),
(12, 'Cansancio Frecuente', 1),
(13, 'Ninguno', 1),
(14, 'Otro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dentista`
--

CREATE TABLE `dentista` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_localidad` int(11) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dentista`
--

INSERT INTO `dentista` (`id`, `nombre`, `apellido`, `cedula`, `id_tipo_identificacion`, `direccion`, `id_localidad`, `correo_electronico`, `telefono`, `genero`, `fecha_nacimiento`, `fecha_ingreso`, `estado`) VALUES
(1, 'Rosa', 'Jarvis', '8-203-1365', 1, 'Calle 2, frente supermercado', 1, 'rose_jarvis@hotmail.com', '7890-3044', 'Femenino', '1956-10-08', '2000-01-02', 1),
(2, 'Lucian', 'Sevilla', '8-105-2030', 1, 'Av. El cairo, 2 cuadras', 2, 'LucianSevillaRiojas@gmail.com', '9556-0893', 'Masculino', '1997-06-06', '2002-12-25', 1),
(3, 'Aida', 'Campos', '8-727-9314', 1, 'Frente Estacion de bus', 3, 'AidaBritoCampos@gmail.com', '9717-5792', 'Femenino', '1991-06-04', '2001-05-10', 1),
(4, 'Michelle', 'Garcia', '8-277-3419', 1, 'Al lado del supermarcado 99', 4, 'MarieMiran@hotmail.com', '6350-7841', 'Femenino', '1979-05-21', '2020-05-30', 1),
(5, 'Rolan', 'Vaca', 'AX7762014', 3, 'Calle Teresa', 5, 'RolanVacaEsquivel@yahoo.com', '9537-0745', 'Masculino', '1992-11-14', '2009-07-22', 1),
(6, 'Remo', 'Pichardo', '2-132-5614', 1, 'Estacion de bus, 75 mts al este', 6, 'RemOlivarez@live.com', '6619-9224', 'Masculino', '1980-02-06', '2002-10-05', 1),
(7, 'Nathanel', 'Hurtado', '7-815-3047', 1, 'Gasolinera texaco, 50 mts al norte', 7, 'NathaHuttade@hotmail.com', '7700-4043', 'Masculino', '1989-04-01', '2005-03-15', 1),
(8, 'Greta', 'Aguilera', '8-278-1236', 1, 'Av. Martinez', 8, 'Greta777Aguil@live.com', '5014-7896', 'Femenino', '1993-08-14', '2010-09-13', 1),
(9, 'Melisa', 'Perez', 'E-8-134429', 4, 'Calle 20, Ed Miraflor', 9, 'Meliss983Pr@gmial.com', '4051-5724', 'Femenino', '1983-01-20', '2008-06-03', 1),
(10, 'Francisco', 'Navarro', '8-896-1236', 1, 'Calle San Agustin, frente estacion de bus', 10, 'FrancoMav2288@hotmail.com', '9118-1130', 'Masculino', '1984-08-12', '2015-10-30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dentista_especialidad`
--

CREATE TABLE `dentista_especialidad` (
  `id` int(11) NOT NULL,
  `id_dentista` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dentista_especialidad`
--

INSERT INTO `dentista_especialidad` (`id`, `id_dentista`, `id_especialidad`, `estado`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id` int(11) NOT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id`, `id_provincia`, `nombre`, `estado`) VALUES
(1, 1, 'Almirante', 1),
(2, 1, 'Changinola', 1),
(3, 1, 'Chiriqui Grande', 1),
(4, 2, 'David', 1),
(5, 2, 'Gualaca', 1),
(6, 3, 'Aguadulce', 1),
(7, 4, 'Changres', 1),
(8, 5, 'Santa Fe', 1),
(9, 6, 'Chitre', 1),
(10, 7, 'Las Tablas', 1),
(11, 8, 'Panama', 1),
(12, 8, 'San Miguelito', 1),
(13, 9, 'La Chorrera', 1),
(14, 10, 'Las Palmas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Dentista general', 'Los dentistas generales son proveedores de cuidado primario de la salud oral y son una de las especialidades dentales más comunes.', 1),
(2, 'Odontopediatra', 'Los dentistas pediátricos se especializan en el cuidado dental y los tratamientos para niños y adolescentes. ', 1),
(3, 'Ortodoncia ', 'Los ortodoncistas se especializan en la alineación de los dientes y la mandíbula mediante el uso de alambres, aparatos dentales, retenedores y otros dispositivos.', 1),
(4, 'Periodoncia', 'Los periodoncistas ayudan a tratar y curar enfermedades y problemas de las encías.', 1),
(5, 'Endodoncia', 'Los endodoncistas tratan específicamente los problemas que afectan al nervio de los dientes y el dolor asociado.', 1),
(6, 'Patología oral', 'Los patólogos orales y los cirujanos orales se especializan en el tratamiento de las enfermedades orales de los dientes y la mandíbula', 1),
(7, 'Prostodoncia', 'Los prostodoncistas reparan los dientes y huesos de la mandíbula.', 1),
(8, 'Especialista en dolor orofacial', 'Los especialistas en dolor orofacial constituyen un tipo de dentistas que cuentan con una formación rigurosa que les permite identificar con mayor precisión los factores que generan dolor en los pacientes.', 1),
(9, 'Medicina oral', 'Una de las responsabilidades principales de estos especialistas es tratar las patologías primarias o secundarias como aftas, xerostomía, quistes, boca seca o incluso pre cáncer o cáncer oral.', 1),
(10, 'Radiología oral y maxilofacial', 'El radiólogo oral y maxilofacial es un dentista que se enfoca en la producción e interpretación de imágenes radiológicas.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL,
  `abono` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `id_paciente`, `id_tratamiento`, `abono`, `id_metodo_pago`, `fecha_pago`, `estado`) VALUES
(1, 1, 5, 10, 1, '2022-09-15', 1),
(2, 2, 2, 50, 1, '2022-02-20', 1),
(3, 3, 1, 50, 3, '2022-03-05', 1),
(4, 4, 7, 50, 5, '2022-06-30', 1),
(5, 5, 8, 120, 2, '2022-09-14', 1),
(6, 6, 11, 60, 3, '2022-07-20', 1),
(7, 7, 4, 50, 1, '2022-08-12', 1),
(8, 8, 9, 30, 4, '2022-08-23', 1),
(9, 9, 12, 2200, 2, '2022-12-14', 1),
(10, 10, 5, 10, 1, '2022-11-22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `id_paciente`, `fecha`, `hora`, `estado`) VALUES
(1, 1, '2022-09-15', '16:00:00', 1),
(2, 2, '2022-02-14', '10:00:00', 1),
(3, 3, '2022-03-05', '11:30:00', 1),
(4, 6, '2022-04-16', '13:45:00', 1),
(5, 4, '2022-05-20', '14:15:00', 1),
(6, 5, '2022-06-30', '15:00:00', 1),
(7, 7, '2022-07-01', '14:20:00', 1),
(8, 8, '2022-08-23', '16:30:00', 1),
(9, 9, '2022-10-03', '11:00:00', 1),
(10, 10, '2022-11-22', '10:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `id_distrito` int(11) DEFAULT NULL,
  `corregimiento` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `id_distrito`, `corregimiento`, `estado`) VALUES
(1, 1, 'Bajo Culubre', 1),
(2, 1, 'Ceiba', 1),
(3, 2, 'La Mesa', 1),
(4, 2, 'El Silencio', 1),
(5, 3, 'Bajo Cedro', 1),
(6, 3, 'Punta Peña', 1),
(7, 6, 'El Cristo', 1),
(8, 7, 'Nuevo Changres', 1),
(9, 8, 'Santa Fe', 1),
(10, 9, 'Chitre', 1),
(11, 10, 'El Cocal', 1),
(12, 11, '24 de Diciembre', 1),
(13, 11, 'Las Mañanitas', 1),
(14, 11, 'San Francisco', 1),
(15, 11, 'Tocumen', 1),
(16, 12, 'Mateo Iturralde', 1),
(17, 12, 'Omar Torrijos', 1),
(18, 13, 'Amador', 1),
(19, 14, 'Corozal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`, `estado`) VALUES
(1, 'Efectivo', 1),
(2, 'Tarjeta de credito', 1),
(3, 'Tarjeta clave', 1),
(4, 'Yappy', 1),
(5, 'Banca en linea', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontograma`
--

CREATE TABLE `odontograma` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `num_diente` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `odontograma`
--

INSERT INTO `odontograma` (`id`, `id_paciente`, `num_diente`, `estado`) VALUES
(1, 1, 37, 1),
(2, 2, 35, 1),
(3, 3, 16, 1),
(4, 4, 14, 1),
(5, 5, 24, 1),
(6, 6, 11, 1),
(7, 7, 28, 1),
(8, 8, 46, 1),
(9, 9, 48, 1),
(10, 10, 38, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_localidad` int(11) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_complicadez` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `apellido`, `cedula`, `id_tipo_identificacion`, `direccion`, `id_localidad`, `correo_electronico`, `telefono`, `genero`, `fecha_nacimiento`, `id_complicadez`, `estado`) VALUES
(1, 'Fernando', 'Montano', 'C02448705', 3, 'Paraiso, Calle J', 16, 'mfernandojose@hotmail.com', '6105-3011', 'Masculino', '2001-08-22', 13, 1),
(2, 'Hermina', 'Herrera', 'E-230-1147', 4, 'Calle Winstong Churchil', 14, 'socorro25@live.com', '6019-4123', 'Femenino', '1965-04-25', 7, 1),
(3, 'Juan ', 'Juarez', 'C02368745', 3, 'Av. Balboa, ed vella vista', 14, 'juamonta@gmail.com', '7896-5175', 'Masculino', '1990-10-24', 2, 1),
(4, 'Marcelo', 'Zepeda', '8-123-4321', 1, 'Frente a Texaco', 11, 'Marce26@hotmal.com', '1123-8614', 'Masculino', '2000-08-11', 8, 1),
(5, 'Maria', 'Moreno', '8-202-8674', 1, 'Calle E', 12, 'MariaMorena33@live.com', '6617-8978', 'Femenino', '1998-11-30', 5, 1),
(6, 'Ligia', 'Campos', '2-111-1478', 1, 'Calle Melina, casa 8', 17, 'LigiaCampos16@gmail.com', '9645-7435', 'Femenino', '2001-05-16', 6, 1),
(7, 'Andres', 'Cornejo', '9-321-1234', 1, 'Frente al parque', 18, 'AndresLiraCor@hotmail.com', '2012-4589', 'Masculino', '1997-09-13', 11, 1),
(8, 'Jordan', 'Garmendia', '4-456-7896', 1, 'Inac, 75 mts al este', 7, 'GatoJuarez@live.com', '8794-5612', 'Masculino', '1995-05-18', 14, 1),
(9, 'Daniel', 'Castillo', '3-654-4987', 1, 'Frente estacion de bus', 10, 'Dann1234iel@gmail.com', '7984-2614', 'Masculino', '1980-06-12', 12, 1),
(10, 'Alexa', 'Zapata', '8-852-7413', 1, 'Frente a estacion', 4, 'Aliexam123@hotmail.com', '6541-9632', 'Femenino', '2000-12-01', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `estado`) VALUES
(1, 'Bocas del Toro', 1),
(2, 'Chiriqui', 1),
(3, 'Cocle', 1),
(4, 'Colon', 1),
(5, 'Darien', 1),
(6, 'Herrera', 1),
(7, 'Los Santos', 1),
(8, 'Panama', 1),
(9, 'Panama Oeste', 1),
(10, 'Veraguas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE `tipo_identificacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_identificacion`
--

INSERT INTO `tipo_identificacion` (`id`, `nombre`, `estado`) VALUES
(1, 'Cedula', 1),
(2, 'Pasaporte Nacional', 1),
(3, 'Pasaporte Extranjero', 1),
(4, 'Tarjeta de residencia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`id`, `nombre`, `descripcion`, `costo`, `estado`) VALUES
(1, 'Limpieza dental', 'El principal objetivo o la principal función que cumple la limpieza dental es prevenir enfermedades, además de eliminar las manchas o la placa de sarro. ', 50, 1),
(2, 'Empaste', 'El empaste dental es un procedimiento odontológico que tiene como objetivo eliminar una caries del diente afectado.', 50, 1),
(3, 'Reconstruccion', 'La reconstrucción dental es aquel procedimiento dirigido a reparar las piezas dentales.', 60, 1),
(4, 'Gran reconstruccion', 'La reconstrucción dental es aquel procedimiento dirigido a reparar las piezas dentales.', 80, 1),
(5, 'Consulta general', 'Es un examen exhaustivo clínico bucal y en algunos casos también es radiográfico que permite al Odontólogo diagnosticar el estado de salud bucal del paciente.', 10, 1),
(6, 'Extraccion diente temporal', 'Extraccion de dientes temporales', 40, 1),
(7, 'Extraccion simple', 'Extraccion de dientes o muelas', 50, 1),
(8, 'Corona de metal porcelana', 'Las coronas de metal porcelana se producen tras un proceso de fundición de la porcelana sobre el metal.', 290, 1),
(9, 'Corona provisional', 'La corona provisional es una pequeña cápsula que tiene forma de diente y se fija sobre el diente o implante durante el período de espera, antes de realizar las coronas definitivas.', 60, 1),
(10, 'Endodoncia', 'La endodoncia es un procedimiento que tiene como finalidad preservar las piezas dentales dañadas, evitando así su pérdida.', 400, 1),
(11, 'Implante dental', 'Un implante dental es un perno metálico que reemplaza la parte de la raíz de un diente faltante.', 1200, 1),
(12, 'Protesis dental fija', 'La prótesis dental es un producto sanitario a medida (es decir, que se fabrica expresamente a la medida del paciente) que permite reemplazar los dientes perdidos y las partes atrofiadas de las encías.', 3500, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vcantcitas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vcantcitas` (
`Dentista` varchar(201)
,`Cantidad de citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vcita`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vcita` (
`Paciente` varchar(201)
,`Dentista` varchar(201)
,`Tratamiento` varchar(100)
,`fecha` date
,`hora` time
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vespecialidad_dentista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vespecialidad_dentista` (
`Nombre` varchar(201)
,`Especialidad` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vfactura`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vfactura` (
`Paciente` varchar(201)
,`Tratamiento` varchar(100)
,`costo` int(11)
,`abono` int(11)
,`Metodo de pago` varchar(100)
,`Fecha de pago` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vpaciente_expediente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vpaciente_expediente` (
`Paciente` varchar(201)
,`Edad` double(17,0)
,`Odontograma n°diente` int(11)
,`Dolecia o enfermedad` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vcantcitas`
--
DROP TABLE IF EXISTS `vcantcitas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcantcitas`  AS SELECT concat(`a`.`nombre`,' ',`a`.`apellido`) AS `Dentista`, count(0) AS `Cantidad de citas` FROM (`dentista` `a` join `agenda` `ag` on(`ag`.`id_dentista` = `a`.`id`)) GROUP BY `a`.`id``id`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vcita`
--
DROP TABLE IF EXISTS `vcita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcita`  AS SELECT concat(`p`.`nombre`,' ',`p`.`apellido`) AS `Paciente`, concat(`a`.`nombre`,' ',`a`.`apellido`) AS `Dentista`, `t`.`nombre` AS `Tratamiento`, `ag`.`fecha` AS `fecha`, `ag`.`hora` AS `hora` FROM ((((`paciente` `p` join `cita` `c` on(`c`.`id_paciente` = `p`.`id`)) join `agenda` `ag` on(`c`.`id_agenda` = `ag`.`id`)) join `dentista` `a` on(`ag`.`id_dentista` = `a`.`id`)) join `tratamiento` `t` on(`c`.`id_tratamiento` = `t`.`id`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vespecialidad_dentista`
--
DROP TABLE IF EXISTS `vespecialidad_dentista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vespecialidad_dentista`  AS SELECT concat(`a`.`nombre`,' ',`a`.`apellido`) AS `Nombre`, `e`.`nombre` AS `Especialidad` FROM ((`dentista` `a` join `dentista_especialidad` `b` on(`a`.`id` = `b`.`id_dentista`)) join `especialidades` `e` on(`e`.`id` = `b`.`id_especialidad`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vfactura`
--
DROP TABLE IF EXISTS `vfactura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vfactura`  AS SELECT concat(`p`.`nombre`,' ',`p`.`apellido`) AS `Paciente`, `t`.`nombre` AS `Tratamiento`, `t`.`costo` AS `costo`, `f`.`abono` AS `abono`, `m`.`nombre` AS `Metodo de pago`, `f`.`fecha_pago` AS `Fecha de pago` FROM (((`paciente` `p` join `factura` `f` on(`p`.`id` = `f`.`id_paciente`)) join `tratamiento` `t` on(`f`.`id_tratamiento` = `t`.`id`)) join `metodo_pago` `m` on(`f`.`id_metodo_pago` = `m`.`id`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vpaciente_expediente`
--
DROP TABLE IF EXISTS `vpaciente_expediente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpaciente_expediente`  AS SELECT concat(`p`.`nombre`,' ',`p`.`apellido`) AS `Paciente`, date_format(from_days(to_days(current_timestamp()) - to_days(`p`.`fecha_nacimiento`)),'%y') + 0 AS `Edad`, `o`.`num_diente` AS `Odontograma n°diente`, `co`.`nombre` AS `Dolecia o enfermedad` FROM ((`paciente` `p` join `complicades` `co` on(`co`.`id` = `p`.`id_complicadez`)) join `odontograma` `o` on(`o`.`id_paciente` = `p`.`id`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dentista` (`id_dentista`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_agenda` (`id_agenda`),
  ADD KEY `id_tratamiento` (`id_tratamiento`);

--
-- Indices de la tabla `complicades`
--
ALTER TABLE `complicades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dentista`
--
ALTER TABLE `dentista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_identificacion` (`id_tipo_identificacion`),
  ADD KEY `id_localidad` (`id_localidad`);

--
-- Indices de la tabla `dentista_especialidad`
--
ALTER TABLE `dentista_especialidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dentista` (`id_dentista`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_tratamiento` (`id_tratamiento`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_distrito` (`id_distrito`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `odontograma`
--
ALTER TABLE `odontograma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_identificacion` (`id_tipo_identificacion`),
  ADD KEY `id_localidad` (`id_localidad`),
  ADD KEY `id_complicadez` (`id_complicadez`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `complicades`
--
ALTER TABLE `complicades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `dentista`
--
ALTER TABLE `dentista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `dentista_especialidad`
--
ALTER TABLE `dentista_especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `odontograma`
--
ALTER TABLE `odontograma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id`);

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`);

--
-- Filtros para la tabla `dentista`
--
ALTER TABLE `dentista`
  ADD CONSTRAINT `dentista_ibfk_1` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id`),
  ADD CONSTRAINT `dentista_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `dentista_especialidad`
--
ALTER TABLE `dentista_especialidad`
  ADD CONSTRAINT `dentista_especialidad_ibfk_1` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id`),
  ADD CONSTRAINT `dentista_especialidad_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`);

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `distrito_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id`);

--
-- Filtros para la tabla `odontograma`
--
ALTER TABLE `odontograma`
  ADD CONSTRAINT `odontograma_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id`),
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`),
  ADD CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`id_complicadez`) REFERENCES `complicades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
