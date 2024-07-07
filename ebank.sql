-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 06 juil. 2024 à 19:03
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ebank`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account` (
  `account_id` bigint(20) NOT NULL,
  `balance` double DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `closed` bit(1) NOT NULL,
  `closure_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`account_id`, `balance`, `creation_date`, `type`, `user_id`, `closed`, `closure_reason`) VALUES
(1, 12345, '2024-07-12', 'current', 1, b'1', 'Account no longer needed'),
(2, 12345, '2024-07-12', 'current', 1, b'0', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `bank_card`
--

CREATE TABLE `bank_card` (
  `id` bigint(20) NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bank_card`
--

INSERT INTO `bank_card` (`id`, `card_number`, `expiration_date`, `is_active`, `type`, `user_id`, `is_blocked`) VALUES
(1, '1234567890123456\r\n\r\n', '2025-12-31 00:00:00.000000', b'1', 'Debit', 1, b'0'),
(2, '1234567890123456\r\n\r\n', '2025-12-31 00:00:00.000000', b'1', 'CREDIT', 1, b'0'),
(7, '1234567812345678', '2025-12-31 00:00:00.000000', b'1', 'CREDIT', 1, b'0'),
(10, '1234556778999', '2025-12-31 00:00:00.000000', b'1', 'CREDIT', 1, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `account_account_id` bigint(20) DEFAULT NULL,
  `user_user_id` bigint(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `external_account_details_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `beneficiary`
--

INSERT INTO `beneficiary` (`id`, `email`, `name`, `phone`, `account_account_id`, `user_user_id`, `money`, `external_account_details_id`) VALUES
(1, 'john.doe@example.com', 'John Doe', '123-456-7890', 1, 1, 1000, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `credit_card`
--

CREATE TABLE `credit_card` (
  `id` bigint(20) NOT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `credit_limit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `debit_card`
--

CREATE TABLE `debit_card` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `external_account_details`
--

CREATE TABLE `external_account_details` (
  `id` bigint(20) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('CREDIT','DEBIT') DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `amount`, `date`, `description`, `type`, `account_id`) VALUES
(1, 100, '2024-07-05 17:46:12.000000', 'Payment for services', 'DEBIT', 1),
(2, 100, '2024-07-05 17:55:21.000000', 'Payment for services', 'CREDIT', 1),
(3, 100, '2024-07-06 15:08:20.000000', 'Transfert à bénéficiaire', 'DEBIT', 1),
(4, 100, '2024-07-06 15:08:20.000000', 'Transfert à bénéficiaire', 'CREDIT', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `email`, `name`, `password`) VALUES
(1, 'hajar@gmail.com', 'hajar', 'hajar12rrRT');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `FK7m8ru44m93ukyb61dfxw0apf6` (`user_id`);

--
-- Index pour la table `bank_card`
--
ALTER TABLE `bank_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK86cg0iprp24ynnsqfp3kc8tic` (`user_id`);

--
-- Index pour la table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6ctlwbh5a4ivuqd1s5lg07oat` (`account_account_id`),
  ADD UNIQUE KEY `UKvl7u26es315a2byguymx8oe5` (`external_account_details_id`),
  ADD KEY `FKm8q80pgyfk6k3me946ftmk7uu` (`user_user_id`);

--
-- Index pour la table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `debit_card`
--
ALTER TABLE `debit_card`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `external_account_details`
--
ALTER TABLE `external_account_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `FK6g20fcr3bhr6bihgy24rq1r1b` (`account_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `bank_card`
--
ALTER TABLE `bank_card`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `beneficiary`
--
ALTER TABLE `beneficiary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `external_account_details`
--
ALTER TABLE `external_account_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `FK7m8ru44m93ukyb61dfxw0apf6` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `bank_card`
--
ALTER TABLE `bank_card`
  ADD CONSTRAINT `FK86cg0iprp24ynnsqfp3kc8tic` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD CONSTRAINT `FK6j5xx1p6jqcuuvi680afl1e27` FOREIGN KEY (`account_account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `FKkoh4r5molvyy4aqvgkc94jrce` FOREIGN KEY (`external_account_details_id`) REFERENCES `external_account_details` (`id`),
  ADD CONSTRAINT `FKm8q80pgyfk6k3me946ftmk7uu` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `FKh3hp347fett74f4s5gb0js753` FOREIGN KEY (`id`) REFERENCES `bank_card` (`id`);

--
-- Contraintes pour la table `debit_card`
--
ALTER TABLE `debit_card`
  ADD CONSTRAINT `FK8kgimp0f221dsjyovdtn9d6rf` FOREIGN KEY (`id`) REFERENCES `bank_card` (`id`);

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK6g20fcr3bhr6bihgy24rq1r1b` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
