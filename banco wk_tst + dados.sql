-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 13-Jun-2022 às 04:11
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

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cli_id`, `cli_nome`, `cli_cidade`, `cli_UF`) VALUES
(1, 'Cliente CompraTudo', 'Maringá', 'PR'),
(2, 'Maria Boa Sorte', 'Blumenau', 'SC'),
(3, 'EuSou Cliente', 'São José do Rio Preto', 'SP'),
(4, 'José Riqueza', 'Joinvile', 'SC'),
(5, 'Akenaton Brasilis', 'Ribeirão Preto', 'SP'),
(6, 'Antonio Saúde Plena', 'Ribeirão Preto', 'SP'),
(7, 'Super Cliente Amado', 'Maringá', 'PR'),
(8, 'Pedro Mora Bem', 'Curitiba', 'PR'),
(9, 'Winsley Feliz e Grato', 'Maringá', 'PR'),
(10, 'Jesus Religare', 'Brasil', 'DF'),
(11, 'Paulo Paz', 'Maringa', 'PR'),
(12, 'Marcio Luz', 'Curitiba', 'PR'),
(13, 'Marta Bella', 'Ribeirão Preto', 'SP'),
(14, 'Pascoalina ', 'São Paulo', 'SP'),
(15, 'Aaron Abencoado', 'Maringá', 'PR'),
(16, 'Rebeca Lucca', 'Maringá', 'PR'),
(17, 'Testa Tudo ', 'Maringá', 'PR'),
(18, 'Heloisa Linda', 'Maringá', 'PR'),
(19, 'Cliente Teste', 'Maringá', 'PR'),
(20, 'João da Luz', 'Maringá', 'PR');

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

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`ped_num`, `ped_data`, `ped_cliid`, `ped_valor`) VALUES
(1, '2022-06-12', 1, 14),
(2, '2022-06-12', 2, 2362),
(3, '2022-06-12', 3, 466),
(4, '2022-06-12', 1, 14),
(5, '2022-06-12', 5, 54),
(6, '2022-06-13', 1, 1),
(7, '2022-06-13', 6, 0),
(8, '2022-06-13', 5, 0),
(9, '2022-06-13', 2, 0),
(10, '2022-06-13', 6, 24);

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

--
-- Extraindo dados da tabela `pedido_detalhe`
--

INSERT INTO `pedido_detalhe` (`autoincrem`, `ped_num`, `prod_id`, `qtd`, `vlr_unit`, `vlr_total`) VALUES
(2, 2, 4, 2, 81, 162),
(7, 1, 1, 1, 1, 1),
(8, 1, 2, 2, 2, 4),
(12, 4, 1, 1, 1, 1),
(16, 4, 2, 2, 2, 4),
(18, 6, 1, 1, 1, 1),
(19, 5, 5, 5, 5, 25),
(20, 5, 4, 4, 4, 16),
(21, 3, 2, 1, 66, 66),
(22, 5, 2, 2, 2, 4),
(23, 5, 3, 3, 3, 9),
(26, 1, 3, 3, 3, 9),
(27, 4, 3, 3, 3, 9),
(28, 3, 1, 4, 100, 400),
(29, 2, 1, 22, 100, 2200),
(32, 10, 5, 2, 12, 24);

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
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`prod_id`, `prod_descricao`, `prod_precovenda`) VALUES
(1, 'Produto numero 1', 100),
(2, 'Produto Fetiche da Mercadoria', 66),
(3, 'Produto dos sonhos', 369),
(4, 'Mercadoria de primeira ', 81),
(5, 'Bebida que faz bem', 12),
(6, 'Produto 006', 66),
(7, 'Item 007', 77),
(8, 'Mercadoria 008', 88),
(9, 'Produto 009', 99),
(10, 'Produto 010', 100),
(11, 'Produto 11', 11),
(12, 'Produto 12', 120),
(13, 'Produto 13', 13),
(14, 'Produto 14', 140),
(15, 'Artigo 15', 155),
(16, 'Produto 16', 16),
(17, 'Mercadoria 17', 17),
(18, 'Produto 18', 18),
(19, 'Artigo 19', 190),
(20, 'Produto 20', 200);

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
  MODIFY `autoincrem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
