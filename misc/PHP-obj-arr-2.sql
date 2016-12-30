CREATE DATABASE IF NOT EXISTS `testDB`;
USE `testDB` ;

CREATE TABLE IF NOT EXISTS `testDB`.`users` (
`id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(45) NULL DEFAULT NULL,
`firstname` VARCHAR(45) NULL DEFAULT NULL,
`surname` VARCHAR(45) NULL DEFAULT NULL,
`role` VARCHAR(45) NULL DEFAULT NULL);

INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`) VALUES (DEFAULT, 'Person1', 'Person', 'One', 'Admin');
INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`) VALUES (DEFAULT, 'Person2', 'Person', 'Two', 'Moderator');
INSERT INTO `testDB`.`users` (`id`, `username`, `firstname`, `surname`, `role`) VALUES (DEFAULT, 'Person3', 'Person', 'Three', 'User');
