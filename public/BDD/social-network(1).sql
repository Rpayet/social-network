-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 26 mars 2023 à 21:16
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `social-network`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230323145531', '2023-03-23 14:55:42', 145),
('DoctrineMigrations\\Version20230323155652', '2023-03-23 15:57:06', 177),
('DoctrineMigrations\\Version20230323162728', '2023-03-23 16:27:33', 34);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user_id`, `content`, `created_at`) VALUES
(1, 3, 'Quam maxime exercitationem impedit. Optio magni sunt tempora debitis. Corrupti non at ad voluptas perspiciatis aut. Dolorem id dolores totam sit consequatur et.', '1979-06-03 00:56:41'),
(2, 4, 'Quia omnis quia quidem quo consequatur maiores. Excepturi corporis ut dignissimos. Id architecto unde velit sit porro quas blanditiis. Maxime voluptatibus quia aut occaecati minus beatae.', '1998-10-25 17:37:27'),
(3, 5, 'Veniam consequuntur dolorem in debitis autem. Cum perspiciatis ducimus sed officia qui ea similique. Totam deleniti sed voluptatem enim. Quo ut explicabo sapiente tempore qui.', '1975-09-24 20:39:35'),
(4, 6, 'Aut harum rerum et ea quia et. Odio fugiat aperiam nihil et sed odio. Et voluptatem cum sed nam. Doloribus quia temporibus maiores aut.', '2016-03-20 02:40:17'),
(5, 7, 'Corporis quibusdam est quis voluptate non. Quas sit ipsum voluptatem sequi incidunt ipsum et. Ut repellendus in quia doloremque et.', '2023-01-07 08:26:38'),
(6, 8, 'Illo voluptas quis ratione mollitia debitis. Iusto aliquam ea dolorum vel. Dolor non numquam non laboriosam.', '1975-02-13 23:39:52'),
(7, 9, 'Delectus et nemo tempore id fugit et libero fugit. Numquam atque expedita et rerum voluptatem numquam. Eius aut quo iste. Ut magni dicta tempora iusto iure qui.', '2015-03-23 15:37:11'),
(8, 10, 'Veniam id beatae et possimus delectus quo. Expedita et sit cumque nam et. Officia a sit tempora. Beatae sint sit placeat est debitis ea.', '2016-05-06 17:34:44'),
(9, 2, 'La première publication d\'une longue série ! Alors peut-être ?', '2023-03-20 17:05:19'),
(10, 2, 'On se lâche sur les publications, On en peut plus !', '2023-03-25 17:07:25'),
(11, 11, '\"Vous me dîtes, monsieur, que j\'ai mauvaise mine ? \r\nQu\'avec cette vie que je mène je me ruine ?\r\nQue l\'on ne gagne rien à trop se prodiguer ?\r\nVous me dîtes enfin que je suis fatigué.\"', '2023-03-25 17:53:13'),
(12, 11, '\"Oui, je suis fatigué. Mais je m\'en flatte.\r\nJ\'ai tout de fatigué : la voix, le cœur, la rate.\r\nJe m\'endors épuisé, je me réveille las.\r\nMais grâce à Dieu, monsieur, je ne m\'en soucis pas.\"', '2023-03-25 17:57:43'),
(13, 12, '\"Si je m\'en soucis, je me ridiculise.\r\nLa fatigue, souvent, n\'est qu\'une vantardise.\r\nOn est jamais aussi fatigué qu\'on le croit.\r\nMais, quand cela serait, n\'en a-ton pas le droit ?\"', '2023-03-25 18:24:34'),
(14, 12, 'Je me permet de me citer moi-même les pouilleux.\r\n#ResteTranquille #PitchouneTexplique', '2023-03-25 18:27:51');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pseudo`, `birthdate`, `picture`, `biography`, `roles`, `password`) VALUES
(2, 'Robin Admin', 'sechs@mail.com', 'Sechs', '1987-10-08', 'https://randomuser.me/api/portraits/lego/1.jpg', 'Toujours regarder sous le lit avant d\'aller dormir', '[\"ROLE_ADMIN\"]', '$2y$13$AcqXhaosenvesTYmjb3HCOdCOHeP//G8MklpPGJIdkncB9/QMigsa'),
(3, 'Joséphine Collin', 'maryse98@gregoire.fr', 'Joséphine-Collin', '1994-12-06', 'https://randomuser.me/api/portraits/lego/0.jpg', 'Quia veniam id sint repellendus voluptatem. Odit autem sequi quo sint dolor nulla impedit. Beatae distinctio voluptas ullam laudantium ut libero dolor.', '[\"ROLE_USER\"]', '\"MDmq996WgK:I|hg*^'),
(4, 'Jacques-Benoît Bailly', 'henry.robert@gmail.com', 'Jacques-Benoît-Bailly', '2022-08-05', 'https://randomuser.me/api/portraits/lego/1.jpg', 'Non ut et rerum consequatur quia voluptatem est. Fugiat nam et odio. Minus animi eum maiores enim quidem sit distinctio. Hic voluptas soluta sed ipsum. Possimus quo totam error velit.', '[\"ROLE_USER\"]', 'r5HHbaUx=k+B\\G'),
(5, 'Roger Guillaume', 'arnaude02@brunet.org', 'Roger-Guillaume', '1983-03-23', 'https://randomuser.me/api/portraits/lego/2.jpg', 'Eum velit fuga ut velit neque minus at est. Dicta adipisci omnis voluptatem sapiente nihil libero enim sunt. Blanditiis sunt quia at veritatis.', '[\"ROLE_USER\"]', ');je(QVtu$S'),
(6, 'Susanne Riviere', 'aleclercq@club-internet.fr', 'Susanne-Riviere', '1978-05-12', 'https://randomuser.me/api/portraits/lego/3.jpg', 'Iusto voluptatem quisquam quas voluptate libero natus et. Ex aspernatur aut enim nostrum rem sequi fugit. Et aut temporibus sed laboriosam aut. Consequuntur qui ut numquam.', '[\"ROLE_USER\"]', 'Z9]E6b'),
(7, 'Raymond-Joseph Charles', 'meunier.charles@sfr.fr', 'Raymond-Joseph-Charles', '2020-12-02', 'https://randomuser.me/api/portraits/lego/4.jpg', 'Voluptatem earum vel rerum maiores neque nobis. Minus ut perspiciatis consequatur cum voluptatum quia aut. Repudiandae magni est tempora aut est.', '[\"ROLE_USER\"]', 'hlQBq)(y\'%.'),
(8, 'André Bonnin', 'bernard.lecomte@dbmail.com', 'André-Bonnin', '2001-09-08', 'https://randomuser.me/api/portraits/lego/5.jpg', 'Sunt nostrum distinctio ut quis sit. Facere ullam autem impedit ipsam voluptatem libero. Rerum totam maiores saepe excepturi. Minima repellat qui dolorum libero recusandae illum.', '[\"ROLE_USER\"]', '*9z\")L'),
(9, 'Charles Lacombe', 'iguillet@hotmail.fr', 'Charles-Lacombe', '1994-04-10', 'https://randomuser.me/api/portraits/lego/6.jpg', 'Dolores perspiciatis molestiae ratione quaerat magnam eveniet. Alias voluptatem ipsa et perspiciatis aut. Iure quia est hic nobis.', '[\"ROLE_USER\"]', '@[z$BBl]b'),
(10, 'Antoine Labbe', 'richard30@free.fr', 'Antoine-Labbe', '2021-08-08', 'https://randomuser.me/api/portraits/lego/7.jpg', 'Et laudantium omnis quis quaerat laborum eum. Et molestias qui ducimus quos. Quos quam consequatur et ea. Ratione aliquid et voluptatum.', '[\"ROLE_USER\"]', ']ae`mH&o+P'),
(11, 'Robi Bak', 'robibak@mail.com', NULL, NULL, NULL, NULL, '[]', '$2y$13$4cc1xMOUsxDlMJoxwSdye.NQEW/poIowEM3Shh7fC67wiSs/cq8zi'),
(12, 'Robert Lamoureux', 'robert@mail.com', 'Le-GOAT', '1923-03-04', NULL, 'J\'écris des conneries de temps en temps.', '[]', '$2y$13$SK3XEHvtrcl7wwpFlzda1.NzdV6gsCldUuqTr6l1PUP2/usdiI.Hu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
