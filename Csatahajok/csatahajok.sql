-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gep: 127.0.0.1
-- Letrehozas ideje: 2025. Apr 15. 13:43
-- Kiszolgalo verzioja: 10.4.32-MariaDB
-- PHP verzio: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbazis: `csatahajok`
--
CREATE DATABASE IF NOT EXISTS `csatahajok` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `csatahajok`;

-- --------------------------------------------------------

--
-- Tabla szerkezet ehhez a tablazhoz `csata`
--

CREATE TABLE IF NOT EXISTS `csata` (
  `nev` varchar(32) NOT NULL,
  `kezdes` date DEFAULT NULL,
  `befejezes` date DEFAULT NULL,
  PRIMARY KEY (`nev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tabla adatainak kiiratasa `csata`
--

INSERT INTO `csata` (`nev`, `kezdes`, `befejezes`) VALUES
('Denmark Strait', '1941-05-24', '1941-05-27'),
('Guadalcanal', '1942-11-15', '1942-11-15'),
('North Cape', '1943-12-26', '1943-12-26'),
('Pearl Harbour', '1941-12-07', '1941-12-07'),
('Surigao Strait', '1944-10-25', '1944-10-25');

-- --------------------------------------------------------

--
-- Tabla szerkezet ehhez a tablazhoz `hajo`
--

CREATE TABLE IF NOT EXISTS `hajo` (
  `nev` varchar(32) NOT NULL,
  `osztaly` varchar(32) DEFAULT NULL,
  `felavatva` int(4) DEFAULT NULL,
  `agyukSzama` int(2) NOT NULL,
  `kaliber` int(2) NOT NULL,
  `vizkiszoritas` int(11) NOT NULL,
  PRIMARY KEY (`nev`),
  KEY `idx_hajoosztaly` (`osztaly`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tabla adatainak kiiratasa `hajo`
--

INSERT INTO `hajo` (`nev`, `osztaly`, `felavatva`, `agyukSzama`, `kaliber`, `vizkiszoritas`) VALUES
('Arizona', 'Pennsylvania', 1915, 12, 18, 31400),
('Bismarck', 'Bismarck', 1939, 8, 15, 42000),
('California', 'Tennesse', 1921, 12, 14, 32000),
('Duke of York', 'George V', 1941, 12, 18, 31400),
('Fuso', 'Pennsylvania', 1913, 12, 18, 31400),
('Haruna', 'Kongo', 1915, 8, 14, 36600),
('Hiei', 'Kongo', 1914, 8, 14, 32000),
('Hood', 'Admiral', 1918, 8, 40, 45200),
('Iowa', 'Iowa', 1943, 9, 16, 48000),
('King George V', 'George V', 1940, 12, 18, 31400),
('Kirishima', 'Kongo', 1915, 8, 14, 32000),
('Kongo', 'Kongo', 1913, 8, 14, 32000),
('Missuri', 'Iowa', 1944, 9, 16, 46000),
('Musashi', 'Yamato', 1942, 9, 18, 65000),
('New Jersey', 'Iowa', 1943, 9, 16, 46000),
('North Carolina', 'North Carolina', 1941, 9, 16, 37000),
('Prince of Wales', 'George V', 1940, 12, 18, 31400),
('Ramillies', 'Revenge', 1917, 8, 15, 29000),
('Renown', 'Renown', 1916, 6, 15, 32000),
('Repulse', 'Renown', 1916, 6, 15, 32000),
('Resolution', 'Revenge', 1916, 8, 15, 29000),
('Revenge', 'Revenge', 1916, 8, 15, 29000),
('Rodney', 'Nelson ', 1925, 9, 45, 33000),
('Royal Oak', 'Revenge', 1916, 8, 15, 29000),
('Royal Sovereign', 'Revenge', 1916, 8, 15, 29000),
('Scharnhorst', 'Scharnhorst', 1936, 9, 54, 32000),
('South of Dakota', 'Dakota', 1941, 9, 16, 35000),
('Tennessee', 'Tennesse', 1920, 12, 14, 32000),
('Washington', 'North Carolina', 1941, 9, 16, 37000),
('West Virginia', 'North Carolina', 1921, 9, 16, 37000),
('Wisconsin', 'Iowa', 1944, 9, 16, 48500),
('Yamashiro', 'Fuso', 1913, 12, 45, 34700),
('Yamato', 'Yamato', 1941, 9, 18, 65000);

-- --------------------------------------------------------

--
-- Tabla szerkezet ehhez a tablazhoz `kimenet`
--

CREATE TABLE IF NOT EXISTS `kimenet` (
  `hajo` varchar(32) NOT NULL,
  `csata` varchar(32) NOT NULL,
  `eredmeny` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`hajo`,`csata`),
  KEY `idx_csata` (`csata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tabla adatainak kiiratasa `kimenet`
--

INSERT INTO `kimenet` (`hajo`, `csata`, `eredmeny`) VALUES
('Arizona', 'Pearl Harbour', 'elsulyedt'),
('Bismarck', 'Denmark Strait', 'elsulyedt'),
('California', 'Surigao Strait', 'Ok'),
('Duke of York', 'North Cape', 'Ok'),
('Fuso', 'Surigao Strait', 'elsulyedt'),
('Hood', 'Denmark Strait', 'elsulyedt'),
('King George V', 'Denmark Strait', 'Ok'),
('Kirishima', 'Guadalcanal', 'elsulyedt'),
('Prince of Wales', 'Denmark Strait', 'serult'),
('Rodney', 'Denmark Strait', 'Ok'),
('Scharnhorst', 'North Cape', 'elsulyedt'),
('South of Dakota', 'Guadalcanal', 'serult'),
('Tennessee', 'Surigao Strait', 'Ok'),
('Washington', 'Guadalcanal', 'Ok'),
('West Virginia', 'Surigao Strait', 'Ok'),
('Yamashiro', 'Surigao Strait', 'elsulyedt');

--
-- Megkotesek a kiirt tablakhoz
--

--
-- Megkotesek a tablazhoz `kimenet`
--
ALTER TABLE `kimenet`
  ADD CONSTRAINT `kimenet_ibfk_1` FOREIGN KEY (`hajo`) REFERENCES `hajo` (`nev`),
  ADD CONSTRAINT `kimenet_ibfk_2` FOREIGN KEY (`csata`) REFERENCES `csata` (`nev`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
