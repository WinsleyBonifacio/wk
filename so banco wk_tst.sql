-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 12-Jun-2022 às 13:31
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wk_tst`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cli_id` int(10) NOT NULL,
  `cli_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cli_cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cli_UF` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `ped_num` int(11) NOT NULL,
  `ped_data` date NOT NULL,
  `ped_cliid` int(11) NOT NULL,
  `ped_valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_detalhe`
--

CREATE TABLE `pedido_detalhe` (
  `autoincrem` int(11) NOT NULL,
  `ped_num` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qtd` double NOT NULL,
  `vlr_unit` double NOT NULL,
  `vlr_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `prod_id` int(10) NOT NULL,
  `prod_descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_precovenda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ped_num`),
  ADD KEY `fk_cliente_cliid` (`ped_cliid`);

--
-- Indexes for table `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  ADD PRIMARY KEY (`autoincrem`),
  ADD KEY `fk_pedido_pednum` (`ped_num`),
  ADD KEY `fk_pedido_prodid` (`prod_id`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  MODIFY `autoincrem` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_cliente_cliid` FOREIGN KEY (`ped_cliid`) REFERENCES `cliente` (`cli_id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  ADD CONSTRAINT `fk_pedido_pednum` FOREIGN KEY (`ped_num`) REFERENCES `pedido` (`ped_num`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_prodid` FOREIGN KEY (`prod_id`) REFERENCES `produto` (`prod_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
