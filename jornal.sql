-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/12/2024 às 01:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jornal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('administrador','escritor','leitor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(6, 'Henry', 'henry@etec', '$2y$10$CntY1GhATuDaH/rRb/4VruBj8vDKy2rFoFuD/ZzXebHG7h367FgsG', 'escritor');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(7, 'Darlan', 'darlan@etec', '$2y$10$WLLsztdipNuxDIzlsLUHUutlSytM6vY3HETgpJLdfDyyo0BZnAysK', 'administrador');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(8, 'Julia', 'julia@etec', '$2y$10$rDhGMdm11ehWrVhP32j7A.DzKzz33fo/kXMP4uvz8jc3rdwqQOe.K', 'leitor');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(9, 'Kauã', 'kaua@etec', '$2y$10$GFiyGS2t5OHblV2cfBmqAOlcSs7/wZNROkHyDLUKYr3h31zUZb2Xy', 'leitor');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(10, 'Cesar', 'Cesar@etec', '$2y$10$gS5DgnbnoajyqUgMkJMLJOpZn7L.trO/.2oaNphodtzrg0/rwjoJa', 'escritor');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(11, 'Bruno', 'bruno@etec', '$2y$10$dhYJYJqtKTX3Ts3xsPd91.KXw4vuX9h2PkRQMKKb0z34/FU8rsYtG', 'administrador');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(12, 'mago', 'mago@etec', '$2y$10$j03TEGekdRk8H30mDalkmOBXbCSTtV4NIz5IyQ0.Dm36QNFb/lEcG', 'escritor');
INSERT INTO `login` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES(13, 'Cesar Dom', 'cesar.dom@gmail.com', '$2y$10$AbIvojExraHHOOy1A0hA3OAms.X6z.5nNtrwHPAe.o4JZWWeLasB2', 'leitor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `nom_esc` varchar(255) NOT NULL,
  `manchete` varchar(255) NOT NULL,
  `res_mat` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `text_mat` text DEFAULT NULL,
  `status` enum('pendente','aprovada','rejeitada') DEFAULT 'pendente',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materia`
--

INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(1, '2025-02-10', 'Henry Lima', 'Casos de Covid19 aumentam em Xique-Xique', 'falar sobre o acontecimento resumidamente', '', 'dsffffffsondonfoksdnjosngósgnskgnsgnksgsdpglkn~sdgkndg´~knsdgksdnmg~çlsg´slkg', 'rejeitada', '2024-11-29 23:14:11');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(2, '2025-02-10', 'Henry Lima', 'Casos de Covid19 aumentam em Xique-Xique', 'falar sobre o acontecimento resumidamente', '', 'dsffffffsondonfoksdnjosngósgnskgnsgnksgsdpglkn~sdgkndg´~knsdgksdnmg~çlsg´slkg', 'rejeitada', '2024-11-29 23:14:20');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(3, '2025-02-10', 'Henry Lima', 'Casos de Covid19 aumentam em Xique-Xique', 'falar sobre o acontecimento resumidamente', '', 'dsffffffsondonfoksdnjosngósgnskgnsgnksgsdpglkn~sdgkndg´~knsdgksdnmg~çlsg´slkg', 'rejeitada', '2024-11-29 23:14:49');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(4, '5410-01-11', 'dsafd', 'sdfhgdafh', 'dsghaerhjerh', '', 'EWGFEG', 'aprovada', '2024-11-29 23:15:41');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(5, '5410-01-11', 'dsafd', 'sdfhgdafh', 'dsghaerhjerh', '', 'EWGFEG', 'rejeitada', '2024-11-29 23:15:46');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(6, '2020-03-05', 'Cesar', 'jlkjljsfa', 'sfhnkóigbnegobewgiob', '', 'sfasfasfasfasf', 'rejeitada', '2024-11-29 23:59:20');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(7, '2020-03-05', 'Cesar', 'jlkjljsfa', 'sfhnkóigbnegobewgiob', '', 'sfasfasfasfasf', 'rejeitada', '2024-11-30 00:00:39');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(8, '2020-03-05', 'Cesar', 'jlkjljsfa', 'sfhnkóigbnegobewgiob', '', 'sfasfasfasfasf', 'aprovada', '2024-11-30 00:00:52');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(9, '2020-03-05', 'Cesar', 'jlkjljsfa', 'sfhnkóigbnegobewgiob', '', 'sfasfasfasfasf', 'aprovada', '2024-11-30 00:01:17');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(10, '2000-02-10', 'sahbasuijfbuasi', 'asjfbasfbafbjkasfb', 'aaaaaaaaaaaaaaa', 'uploads/r10.png', 'safdasfasfafafa', 'aprovada', '2024-11-30 18:47:36');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(11, '2025-02-20', 'eu mesmo', 'teste', 'teste', 'uploads/r10.png', 'RONALDINHO', 'aprovada', '2024-11-30 18:57:54');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(12, '2000-02-10', 'asasdaaaaaaaaaa', 'Casos de Covid19 aumentam em Xique-Xique', 'asssssssssssss', 'uploads/r10.png', 'asdasdasd asdasdasdasfsoghjwseoiptghweiuhwsuieofhew uihewh wef hewuiofh weOIUFRHBFUOIJBEBWEFUJBEFUIJBWJUB´QJUB´QBUJBJB JFBWSDEJKB QWUJ', 'pendente', '2024-12-03 22:19:07');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(13, '1000-10-10', 'eu', 'asidasodniasdoandasdn', 'salkmnaslknfansa', 'uploads/r10.png', 'cdsdffasfasfasfasfafafsas', 'aprovada', '2024-12-03 22:31:15');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(14, '2000-02-20', 'Jonh Jones', 'sdasddasd', 'qqqqqqqqqqqqqq', 'uploads/r10.png', 'qqqqqqqqqqqqqqqqqqqqqqqqqq', 'rejeitada', '2024-12-03 22:41:56');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(15, '2020-02-10', 'aaaa', 'bbbbb', 'cccccccccc', 'uploads/r10.png', 'ddddddddddddddddddddddddddddddddddddddddddd', 'pendente', '2024-12-03 23:00:55');
INSERT INTO `materia` (`id`, `data`, `nom_esc`, `manchete`, `res_mat`, `imagem`, `text_mat`, `status`, `created_at`) VALUES(16, '2000-02-10', 'fsdfsgsdgsdg', 'sdgsdgsdgsdgsd', 'sdgsdgsdgsd', 'uploads/Cream and Beige Modern Sport Magazine (1).png', 'safasgsgfdghagawggagswdgdsgdsgdegdsg', 'pendente', '2024-12-08 00:46:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` enum('administrador','escritor','leitor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`, `tipo_usuario`) VALUES(1, 'admin', 'senha_admin', 'administrador');
INSERT INTO `usuarios` (`id`, `email`, `senha`, `tipo_usuario`) VALUES(2, 'escritor1', 'senha_escritor', 'escritor');
INSERT INTO `usuarios` (`id`, `email`, `senha`, `tipo_usuario`) VALUES(3, 'leitor1', 'senha_leitor', 'leitor');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
