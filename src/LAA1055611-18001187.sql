-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- ホスト: mysql139.phy.lolipop.lan
-- 生成日時: 2019 年 8 月 05 日 01:08
-- サーバのバージョン: 5.6.23-log
-- PHP のバージョン: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `LAA1055611-18001187`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `company_information`
--

CREATE TABLE IF NOT EXISTS `company_information` (
  `Company_id` varchar(255) NOT NULL,
  `Company_password` varchar(255) NOT NULL,
  `Company_name` varchar(255) NOT NULL,
  `Company_mail` varchar(255) DEFAULT NULL,
  `Company_phone` varchar(255) DEFAULT NULL,
  `Company_place` varchar(255) DEFAULT NULL,
  `Company_url` varchar(255) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  PRIMARY KEY (`Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `company_information`
--

INSERT INTO `company_information` (`Company_id`, `Company_password`, `Company_name`, `Company_mail`, `Company_phone`, `Company_place`, `Company_url`, `image`) VALUES
('1234', '123456789', 'ASO', 'aso@gmail.com', '00011112222', 'Japan', 'aso.com', 7),
('12345', '1122334455', '松尾', 'hdihdihdiheh', '963258741', 'いdびdじdっjぢjd', 'kdびdっhづvydヴfふhf', 9),
('aso', 'asopassword', 'ASOBUSINESS', 'aso@st.asojuku.ac.jp', '0120371007', 'Japan', 'https://entry-abcc.asojuku.ac.jp', 8),
('h002929', 'password', '株式会社小松菜', 'komatsuna@gmail.com', '09066451289', '東京都足立区', 'komatsuna.com', 3),
('kome', '123456789', '株式会社ジョーコー', 'zyoukou@gmail.com', '0952756569', '福岡県博多区', 'zyoukou@.co.jp', 7);

-- --------------------------------------------------------

--
-- テーブルの構造 `meisi`
--

CREATE TABLE IF NOT EXISTS `meisi` (
  `meisi_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `sns` varchar(100) DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `img` int(11) NOT NULL,
  PRIMARY KEY (`meisi_id`),
  KEY `meisi_user_information_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

--
-- テーブルのデータのダンプ `meisi`
--

INSERT INTO `meisi` (`meisi_id`, `user_id`, `name`, `address`, `number`, `sns`, `flag`, `company_id`, `img`) VALUES
(55, 34, '藤家竜', 'fuzifuzi@gmail.com', '09018765342', '@fuzifuzi', 0, NULL, 6),
(56, 28, '情報太郎', 'jouhou＠gmail.com', '09033457761', '@jouhou', 1, 'h002929', 2),
(57, 28, '松尾崚広', 'matsuo@gmail.com', '099034568872', '@matsuo', 0, NULL, 2),
(58, 30, '原くん', 'hara@gmail.com', '09084473675', '@hara', 0, NULL, 8),
(119, 36, 'hづh', 'ishihsdihidj', '31985484846364', 'ぢひdっjぢjd', 0, NULL, 1),
(120, 36, 'づへうへうへじぇ', 'idhieiei', '34534354531', NULL, 1, '12345', 4),
(121, 34, 'Ryu', 'Ryu@gmail.com', '09934561028', NULL, 1, '1234', 5),
(122, 38, '原和人', '1701017@st.asojuku.ac.jp', '08064631074', '@pompom236', 0, NULL, 1),
(123, 37, '松尾', 'matsuo@gmail.com', '09022653168', '@matduo', 0, NULL, 1),
(124, 38, '原和人', '1701017@st.asojuku.co.jp', '08064631074', NULL, 1, 'kome', 6),
(126, 37, 'マツオ', 'matsumatsu@gmail.com', '09036524516', NULL, 1, '1234', 6),
(131, 34, 'Kuga', 'Kuga@s.asojuku.ac.jp', '08098241538', NULL, 1, 'aso', 4);

-- --------------------------------------------------------

--
-- テーブルの構造 `meisi_collection`
--

CREATE TABLE IF NOT EXISTS `meisi_collection` (
  `user_id` int(11) NOT NULL,
  `meisi_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`meisi_id`),
  KEY `table_name_meisi_meisi_id_fk` (`meisi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `meisi_collection`
--

INSERT INTO `meisi_collection` (`user_id`, `meisi_id`) VALUES
(34, 55),
(38, 55),
(34, 56),
(38, 57),
(38, 121),
(34, 123),
(34, 124),
(38, 131);

-- --------------------------------------------------------

--
-- テーブルの構造 `user_information`
--

CREATE TABLE IF NOT EXISTS `user_information` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '名前',
  `user_password` varchar(255) NOT NULL,
  `mailaddress` varchar(255) NOT NULL COMMENT 'メールアドレス',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '電話番号',
  `Unsubscribe_flag` tinyint(1) DEFAULT NULL COMMENT '退会フラグ0=退会1＝存在',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `｀user_information_user_id_uindex｀` (`user_id`),
  UNIQUE KEY `｀user_information_mailaddress_uindex｀` (`mailaddress`),
  UNIQUE KEY `｀user_information_phone_number_uindex｀` (`phone_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- テーブルのデータのダンプ `user_information`
--

INSERT INTO `user_information` (`user_id`, `user_name`, `user_password`, `mailaddress`, `phone_number`, `Unsubscribe_flag`) VALUES
(28, 'matsuo', '12345', 'ganngi77@gmail.com', '1234567890', 1),
(29, 'LUIGI', 'Maripass', 'Mario@burabura.com', '1239456', NULL),
(30, 'WARIO', 'Maripass', 'Wario@burabura.com', '198487', NULL),
(31, 'aklsjflaskjf', 'jfoajsoifjwfoijaoifjae', 'ojasofjwoiejfioawjfaj', '652763564235695', NULL),
(33, 'raigekka', '123456789', 'raigekka0128@yahoo.co.jp', '08064691046', NULL),
(34, 'Ryu', 'password', '1801179@s.asojuku.ac.jp', '08937491254', 1),
(35, 'hakusai', 'password', 'hakusai@gmail.com', '08072115891', 1),
(36, '原和人', '123456789', '1701017@st.asojuku.ac.jp', '08064364561', 1),
(37, '松尾', 'password', 'matsuo@gmail.com', '09035249967', 1),
(38, 'きの', 'password', 'kino@gmail.com', '07412369855', 1);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `meisi`
--
ALTER TABLE `meisi`
  ADD CONSTRAINT `meisi_user_information_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- テーブルの制約 `meisi_collection`
--
ALTER TABLE `meisi_collection`
  ADD CONSTRAINT `table_name_meisi_meisi_id_fk` FOREIGN KEY (`meisi_id`) REFERENCES `meisi` (`meisi_id`),
  ADD CONSTRAINT `table_name_user_information_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
