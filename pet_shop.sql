-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 10-Maio-2023 às 16:49
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pet_shop`
--

CREATE DATABASE pet_shop;

USE pet_shop;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animais`
--

CREATE TABLE `animais` (
  `id_animal` int(11) NOT NULL,
  `raca` varchar(30) DEFAULT NULL,
  `porte` varchar(30) DEFAULT NULL,
  `peso` decimal(4,3) DEFAULT NULL,
  `sexo` varchar(2) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `id_proprietario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animais`
--

INSERT INTO `animais` (`id_animal`, `raca`, `porte`, `peso`, `sexo`, `idade`, `id_proprietario`) VALUES
(1, 'Vira lata', 'Médio', '2.450', 'M', 5, 1),
(2, 'Labrador', 'Grande', '8.940', 'F', 3, 2),
(3, 'Pintcher', 'Pequeno', '0.980', 'F', 2, 3),
(4, 'São Bernardo', 'Grande', '9.999', 'M', 4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietarios`
--

CREATE TABLE `proprietarios` (
  `id_proprietario` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `logradouro` text DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `proprietarios`
--

INSERT INTO `proprietarios` (`id_proprietario`, `nome`, `cpf`, `logradouro`, `numero`, `cep`, `cidade`) VALUES
(1, 'Julho Costa', '000.000.000-00', 'Avenida Tal', 111, '11111-111', 'Cachoeirinha'),
(2, 'Novembra Silva', '222.222.222-22', 'Rua Qualquer', 222, '22222-222', 'Gravataí'),
(3, 'Agosto Augusto', '333.333.333-33', 'Beco sem Saída', 333, '33333-333', 'Novo Hamburg'),
(4, 'Janeiro Fevereiro', '444.444.444-44', 'Travessa Atravessada', 444, '44444-444', 'Sapucaia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `id_telefone` int(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `id_proprietario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`id_telefone`, `telefone`, `id_proprietario`) VALUES
(3, '(00)0000', 2),
(4, '(00)0000', 3),
(5, '(00)0000', 4),
(6, '(00)0000', 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_proprietario` (`id_proprietario`);

--
-- Índices para tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  ADD PRIMARY KEY (`id_proprietario`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`id_telefone`),
  ADD KEY `telefone_ibfk_1` (`id_proprietario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  MODIFY `id_proprietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`id_proprietario`) REFERENCES `proprietarios` (`id_proprietario`),
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_proprietario`) REFERENCES `proprietarios` (`id_proprietario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
