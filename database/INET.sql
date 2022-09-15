-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2022 a las 02:42:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_exhibitions`
--

CREATE TABLE `tb_exhibitions` (
  `exhibition_key` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `information` text NOT NULL,
  `room_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_exhibitions`
--

INSERT INTO `tb_exhibitions` (`exhibition_key`, `name`, `information`, `room_key`) VALUES
(4, 'Veloziraptor', 'Fue encontrado en el año 1915', 1),
(6, 'Tiranosaurio Rex', 'Come carne', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rols`
--

CREATE TABLE `tb_rols` (
  `rol_key` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_rols`
--

INSERT INTO `tb_rols` (`rol_key`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rooms`
--

CREATE TABLE `tb_rooms` (
  `room_key` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `theme` varchar(30) NOT NULL,
  `information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_rooms`
--

INSERT INTO `tb_rooms` (`room_key`, `name`, `theme`, `information`) VALUES
(1, 'SALA_01', 'Dinosaurios', ''),
(2, 'SALA_02', 'Obras de Arte', 'En esta sala hay 10 obras y una escultura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_turns`
--

CREATE TABLE `tb_turns` (
  `turn_key` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_turns`
--

INSERT INTO `tb_turns` (`turn_key`, `date`, `user_key`) VALUES
(5, '2022-09-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_users`
--

CREATE TABLE `tb_users` (
  `user_key` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `surname` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rol_key` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_users`
--

INSERT INTO `tb_users` (`user_key`, `name`, `surname`, `email`, `rol_key`) VALUES
(1, 'jeremias', '', 'jeremias@gmail.com', 2),
(2, 'jesus', '', 'jesus@gmail.com', 2),
(3, 'admin', '', 'cuellojeremiasnatanael@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_valorations`
--

CREATE TABLE `tb_valorations` (
  `valoration_key` int(11) NOT NULL,
  `valoration` int(1) NOT NULL,
  `comment` text NOT NULL,
  `user_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_valorations`
--

INSERT INTO `tb_valorations` (`valoration_key`, `valoration`, `comment`, `user_key`) VALUES
(6, 5, 'Muy Bueno!', 1),
(12, 3, 'algo bien', 1),
(16, 3, 'algo bien', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_exhibitions`
--
ALTER TABLE `tb_exhibitions`
  ADD PRIMARY KEY (`exhibition_key`),
  ADD KEY `rl_exhibitions_room` (`room_key`);

--
-- Indices de la tabla `tb_rols`
--
ALTER TABLE `tb_rols`
  ADD PRIMARY KEY (`rol_key`);

--
-- Indices de la tabla `tb_rooms`
--
ALTER TABLE `tb_rooms`
  ADD PRIMARY KEY (`room_key`);

--
-- Indices de la tabla `tb_turns`
--
ALTER TABLE `tb_turns`
  ADD PRIMARY KEY (`turn_key`),
  ADD UNIQUE KEY `user_key` (`user_key`);

--
-- Indices de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_key`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rl_users_rol` (`rol_key`);

--
-- Indices de la tabla `tb_valorations`
--
ALTER TABLE `tb_valorations`
  ADD PRIMARY KEY (`valoration_key`),
  ADD KEY `rl_valorations_users` (`user_key`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_exhibitions`
--
ALTER TABLE `tb_exhibitions`
  MODIFY `exhibition_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_rooms`
--
ALTER TABLE `tb_rooms`
  MODIFY `room_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_turns`
--
ALTER TABLE `tb_turns`
  MODIFY `turn_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_valorations`
--
ALTER TABLE `tb_valorations`
  MODIFY `valoration_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_exhibitions`
--
ALTER TABLE `tb_exhibitions`
  ADD CONSTRAINT `rl_exhibitions_room` FOREIGN KEY (`room_key`) REFERENCES `tb_rooms` (`room_key`);

--
-- Filtros para la tabla `tb_turns`
--
ALTER TABLE `tb_turns`
  ADD CONSTRAINT `rl_turns_users` FOREIGN KEY (`user_key`) REFERENCES `tb_users` (`user_key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `rl_users_rol` FOREIGN KEY (`rol_key`) REFERENCES `tb_rols` (`rol_key`);

--
-- Filtros para la tabla `tb_valorations`
--
ALTER TABLE `tb_valorations`
  ADD CONSTRAINT `rl_valorations_users` FOREIGN KEY (`user_key`) REFERENCES `tb_users` (`user_key`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
