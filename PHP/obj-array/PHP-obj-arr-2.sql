CREATE DATABASE IF NOT EXISTS `testDB`;
USE `testDB` ;

CREATE TABLE IF NOT EXISTS `testDB`.`users` (
`id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(45) NULL DEFAULT NULL,
`firstname` VARCHAR(45) NULL DEFAULT NULL,
`surname` VARCHAR(45) NULL DEFAULT NULL,
`role` VARCHAR(45) NULL DEFAULT NULL,
`created` INT NULL DEFAULT NULL);

INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`, `created`) VALUES (DEFAULT, 'Person1', 'Person', 'One', 'Admin', 1483105206);
INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`, `created`) VALUES (DEFAULT, 'Person2', 'Person', 'Two', 'Moderator', 1483105106);
INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`, `created`) VALUES (DEFAULT, 'Person3', 'Person', 'Three', 'User', 1483105159);
