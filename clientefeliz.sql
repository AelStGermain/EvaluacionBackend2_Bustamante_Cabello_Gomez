-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2025 a las 07:45:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clientefeliz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedenteacademico`
--

CREATE TABLE `antecedenteacademico` (
  `id` int(11) NOT NULL,
  `candidato_id` int(11) NOT NULL,
  `institucion` varchar(150) NOT NULL,
  `titulo_obtenido` varchar(150) NOT NULL,
  `anio_ingreso` year(4) DEFAULT NULL,
  `anio_egreso` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentelaboral`
--

CREATE TABLE `antecedentelaboral` (
  `id` int(11) NOT NULL,
  `candidato_id` int(11) NOT NULL,
  `empresa` varchar(150) NOT NULL,
  `cargo` varchar(150) NOT NULL,
  `funciones` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_termino` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertalaboral`
--

CREATE TABLE `ofertalaboral` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `tipo_contrato` enum('Indefinido','Temporal','Honorarios','Práctica') DEFAULT 'Indefinido',
  `fecha_publicacion` date DEFAULT curdate(),
  `fecha_cierre` date DEFAULT NULL,
  `estado` enum('Vigente','Cerrada','Baja') DEFAULT 'Vigente',
  `reclutador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ofertalaboral`
--

INSERT INTO `ofertalaboral` (`id`, `titulo`, `descripcion`, `ubicacion`, `salario`, `tipo_contrato`, `fecha_publicacion`, `fecha_cierre`, `estado`, `reclutador_id`) VALUES
(1, 'Desarrollador Backend', 'Node.js y MYSQL ', 'Santiago', 1200000.00, 'Indefinido', '2025-05-25', '2025-07-25', 'Vigente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulacion`
--

CREATE TABLE `postulacion` (
  `id` int(11) NOT NULL,
  `candidato_id` int(11) NOT NULL,
  `oferta_laboral_id` int(11) NOT NULL,
  `estado_postulacion` enum('Postulando','Revisando','Entrevista Psicológica','Entrevista Personal','Seleccionado','Descartado') DEFAULT 'Postulando',
  `comentario` text DEFAULT NULL,
  `fecha_postulacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postulacion`
--

INSERT INTO `postulacion` (`id`, `candidato_id`, `oferta_laboral_id`, `estado_postulacion`, `comentario`, `fecha_postulacion`, `fecha_actualizacion`) VALUES
(1, 2, 1, 'Revisando', 'Revisando Postulacion', '2025-05-26 04:49:03', '2025-05-26 04:49:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `rol` enum('Reclutador','Candidato') NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`, `contraseña`, `fecha_nacimiento`, `telefono`, `direccion`, `rol`, `fecha_registro`, `estado`) VALUES
(1, 'Frank', 'Bustamante', 'FRB@gmail.com', '2342', '1998-03-28', '998456735', 'el pino 70', 'Reclutador', '2025-05-26 04:12:41', 'Activo'),
(2, 'Andrea', 'Gomez', 'AndraeBee@gmail.com', '252342', '1997-06-20', '996423726', 'Santo domingo 2999', 'Candidato', '2025-05-26 04:14:03', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antecedenteacademico`
--
ALTER TABLE `antecedenteacademico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidato_id` (`candidato_id`);

--
-- Indices de la tabla `antecedentelaboral`
--
ALTER TABLE `antecedentelaboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidato_id` (`candidato_id`);

--
-- Indices de la tabla `ofertalaboral`
--
ALTER TABLE `ofertalaboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclutador_id` (`reclutador_id`);

--
-- Indices de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidato_id` (`candidato_id`),
  ADD KEY `oferta_laboral_id` (`oferta_laboral_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antecedenteacademico`
--
ALTER TABLE `antecedenteacademico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antecedentelaboral`
--
ALTER TABLE `antecedentelaboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertalaboral`
--
ALTER TABLE `ofertalaboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antecedenteacademico`
--
ALTER TABLE `antecedenteacademico`
  ADD CONSTRAINT `antecedenteacademico_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `antecedentelaboral`
--
ALTER TABLE `antecedentelaboral`
  ADD CONSTRAINT `antecedentelaboral_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `ofertalaboral`
--
ALTER TABLE `ofertalaboral`
  ADD CONSTRAINT `ofertalaboral_ibfk_1` FOREIGN KEY (`reclutador_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD CONSTRAINT `postulacion_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `postulacion_ibfk_2` FOREIGN KEY (`oferta_laboral_id`) REFERENCES `ofertalaboral` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
