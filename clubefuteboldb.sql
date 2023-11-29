-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/11/2023 às 01:13
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clubefuteboldb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `gol`
--

CREATE TABLE `gol` (
  `GolID` int(11) NOT NULL,
  `PartidaID` int(11) DEFAULT NULL,
  `JogadorID` int(11) DEFAULT NULL,
  `Minuto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gol`
--

INSERT INTO `gol` (`GolID`, `PartidaID`, `JogadorID`, `Minuto`) VALUES
(1, 1, 1, 30),
(2, 1, 2, 45);

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogador`
--

CREATE TABLE `jogador` (
  `JogadorID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Posicao` varchar(50) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `TimeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogador`
--

INSERT INTO `jogador` (`JogadorID`, `Nome`, `Posicao`, `DataNascimento`, `TimeID`) VALUES
(1, 'Jogador 1', 'Atacante', '1990-01-01', 1),
(2, 'Jogador 2', 'Defensor', '1995-01-01', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partida`
--

CREATE TABLE `partida` (
  `PartidaID` int(11) NOT NULL,
  `DataPartida` date DEFAULT NULL,
  `Local` varchar(100) DEFAULT NULL,
  `TimeCasaID` int(11) DEFAULT NULL,
  `TimeVisitanteID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `partida`
--

INSERT INTO `partida` (`PartidaID`, `DataPartida`, `Local`, `TimeCasaID`, `TimeVisitanteID`) VALUES
(1, '2023-11-28', 'Estádio X', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `time`
--

CREATE TABLE `time` (
  `TimeID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Fundacao` date DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `time`
--

INSERT INTO `time` (`TimeID`, `Nome`, `Fundacao`, `Cidade`) VALUES
(1, 'Clube A', '1900-01-01', 'Cidade A'),
(2, 'Clube B', '1910-01-01', 'Cidade B');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `gol`
--
ALTER TABLE `gol`
  ADD PRIMARY KEY (`GolID`),
  ADD KEY `PartidaID` (`PartidaID`),
  ADD KEY `JogadorID` (`JogadorID`);

--
-- Índices de tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`JogadorID`),
  ADD KEY `TimeID` (`TimeID`);

--
-- Índices de tabela `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`PartidaID`),
  ADD KEY `TimeCasaID` (`TimeCasaID`),
  ADD KEY `TimeVisitanteID` (`TimeVisitanteID`);

--
-- Índices de tabela `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`TimeID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `gol`
--
ALTER TABLE `gol`
  MODIFY `GolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `partida`
--
ALTER TABLE `partida`
  MODIFY `PartidaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `time`
--
ALTER TABLE `time`
  MODIFY `TimeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `gol`
--
ALTER TABLE `gol`
  ADD CONSTRAINT `gol_ibfk_1` FOREIGN KEY (`PartidaID`) REFERENCES `partida` (`PartidaID`),
  ADD CONSTRAINT `gol_ibfk_2` FOREIGN KEY (`JogadorID`) REFERENCES `jogador` (`JogadorID`);

--
-- Restrições para tabelas `jogador`
--
ALTER TABLE `jogador`
  ADD CONSTRAINT `jogador_ibfk_1` FOREIGN KEY (`TimeID`) REFERENCES `time` (`TimeID`);

--
-- Restrições para tabelas `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`TimeCasaID`) REFERENCES `time` (`TimeID`),
  ADD CONSTRAINT `partida_ibfk_2` FOREIGN KEY (`TimeVisitanteID`) REFERENCES `time` (`TimeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
