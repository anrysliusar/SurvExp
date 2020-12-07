-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SurvExp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SurvExp` ;

-- -----------------------------------------------------
-- Schema SurvExp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SurvExp` DEFAULT CHARACTER SET utf8 ;
USE `SurvExp` ;

-- -----------------------------------------------------
-- Table `SurvExp`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Roles` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Roles` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Users` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Users` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `Role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Role1_idx` (`Role_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `SurvExp`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`Surveys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Surveys` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Surveys` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `topic` TEXT NOT NULL,
  `deadline` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`QuestionTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`QuestionTypes` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`QuestionTypes` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`Questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Questions` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Questions` (
  `id` INT NOT NULL,
  `text` TEXT NOT NULL,
  `Survey_id` INT NOT NULL,
  `QuestionType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Question_Survey_idx` (`Survey_id` ASC) VISIBLE,
  INDEX `fk_Question_QuestionType1_idx` (`QuestionType_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_Survey`
    FOREIGN KEY (`Survey_id`)
    REFERENCES `SurvExp`.`Surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_QuestionType1`
    FOREIGN KEY (`QuestionType_id`)
    REFERENCES `SurvExp`.`QuestionTypes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`Experts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Experts` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Experts` (
  `id` INT NOT NULL,
  `occupation` TEXT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Expert_User1_idx` (`User_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Expert_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `SurvExp`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`Answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`Answers` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`Answers` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `text` TEXT NOT NULL,
  `Expert_id` INT NOT NULL,
  `Question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Answer_Expert1_idx` (`Expert_id` ASC) VISIBLE,
  INDEX `fk_Answer_Question1_idx` (`Question_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_Expert1`
    FOREIGN KEY (`Expert_id`)
    REFERENCES `SurvExp`.`Experts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `SurvExp`.`Questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurvExp`.`PossibleAnswers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurvExp`.`PossibleAnswers` ;

CREATE TABLE IF NOT EXISTS `SurvExp`.`PossibleAnswers` (
  `id` INT NOT NULL,
  `text` TEXT NOT NULL,
  `Question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PossibleAnswers_Question1_idx` (`Question_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_PossibleAnswers_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `SurvExp`.`Questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SurvExp`.`Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Roles` (`id`, `name`) VALUES (1, 'Manager');
INSERT INTO `SurvExp`.`Roles` (`id`, `name`) VALUES (2, 'Analyst');
INSERT INTO `SurvExp`.`Roles` (`id`, `name`) VALUES (3, 'Expert');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (1, 'Даниил Сныченков', 1);
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (2, 'Владислав Диденко', 3);
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (3, 'Владислав Павлюк', 3);
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (4, 'Андрей Слюсаренко', 2);
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (5, 'Даниэль Рихтик', 3);
INSERT INTO `SurvExp`.`Users` (`id`, `name`, `Role_id`) VALUES (6, 'Андрей Дикун', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`Surveys`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Surveys` (`id`, `name`, `topic`, `deadline`) VALUES (1, 'Оценка служб такси', 'Услуги', '2020-12-20');
INSERT INTO `SurvExp`.`Surveys` (`id`, `name`, `topic`, `deadline`) VALUES (2, 'Использование мобильных устройств', 'ИТ', '2020-12-20');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`QuestionTypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`QuestionTypes` (`id`, `name`) VALUES (1, 'radio');
INSERT INTO `SurvExp`.`QuestionTypes` (`id`, `name`) VALUES (2, 'check');
INSERT INTO `SurvExp`.`QuestionTypes` (`id`, `name`) VALUES (3, 'open');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`Questions`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (1, 'Как часто Вы пользуетесь услугами такси?', 1, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (2, 'По какой причине Вы чаще всего пользуетесь услугами такси?', 1, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (3, 'В какое время дня Вы больше всего пользуетесь услугами такси?', 1, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (4, 'По каким причинам Вы больше не пользуетесь услугами такси?', 1, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (5, 'Каким способом Вы чаще всего заказываете такси?', 1, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (6, 'Каким из следующих мобильных устройств Вы владеете?', 2, 2);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (7, 'Для подключения к Интернету Вы пользуетесь', 2, 2);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (8, 'Для общения чаще всего Вы пользуетесь', 2, 1);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (9, 'Какую фирму мобильных устройств Вы предпочитаете?', 2, 3);
INSERT INTO `SurvExp`.`Questions` (`id`, `text`, `Survey_id`, `QuestionType_id`) VALUES (10, 'Какой была цена Вашего мобильного телефона?', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`Experts`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Experts` (`id`, `occupation`, `User_id`) VALUES (1, 'ИТ', 2);
INSERT INTO `SurvExp`.`Experts` (`id`, `occupation`, `User_id`) VALUES (2, 'ИТ', 3);
INSERT INTO `SurvExp`.`Experts` (`id`, `occupation`, `User_id`) VALUES (3, 'Услуги', 5);
INSERT INTO `SurvExp`.`Experts` (`id`, `occupation`, `User_id`) VALUES (4, 'Услуги', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`Answers`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (1, '2020-12-07', 'Один раз в месяц', 1, 1);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (2, '2020-12-07', 'В случае спешки', 1, 2);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (3, '2020-12-07', 'Вечером', 1, 3);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (4, '2020-12-07', '	Цена', 1, 4);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (5, '2020-12-07', 'По Интернету', 1, 5);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (6, '2020-12-10', '	Ноутбук/Нетбук', 3, 6);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (7, '2020-12-10', 'Ноутбуком', 3, 7);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (8, '2020-12-10', '	Ноутбуком', 3, 8);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (9, '2020-12-10', 'ОТКРЫТЫЙ ОТВЕТ', 3, 9);
INSERT INTO `SurvExp`.`Answers` (`id`, `date`, `text`, `Expert_id`, `Question_id`) VALUES (10, '2020-12-10', '	5 001-8 500 UAH', 3, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SurvExp`.`PossibleAnswers`
-- -----------------------------------------------------
START TRANSACTION;
USE `SurvExp`;
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (1, 'Несколько раз в месяц', 1);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (2, 'Один раз в месяц', 1);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (3, 'Несколько раз в год', 1);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (4, 'Никогда', 1);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (5, 'Поездка в аэропорт/ из аэропорта', 2);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (6, 'Поездка за развлечением / домой', 2);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (7, 'Поездка на работу/ с работы', 2);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (8, 'В случае спешки', 2);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (9, '	Утром, в первой половине дня', 3);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (10, 'После обеда', 3);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (11, 'Вечером', 3);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (12, 'Ночью', 3);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (13, 'Цена', 4);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (14, 'Неприятные чувства', 4);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (15, '	Плохой опыт с таксистами', 4);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (16, '	По телефону', 5);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (17, '	По Интернету', 5);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (18, '	Лично, помахав рукой', 5);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (19, '	Я ищу стоянку такси', 5);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (20, '	Мобильный телефон', 6);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (21, 'Планшет', 6);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (22, 'Ноутбук/Нетбук', 6);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (23, 'Другое', 6);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (24, '	Мобильным телефоном', 7);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (25, '	Ноутбуком', 7);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (26, '	Электронной книгой', 7);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (27, 'Другое', 7);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (28, 'Мобильным телефоном', 8);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (29, 'Планшетом', 8);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (30, 'Ноутбуком', 8);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (31, '0-5 000 UAH', 10);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (32, '	5 001-8 500 UAH', 10);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (33, '8 501-15 000 UAH', 10);
INSERT INTO `SurvExp`.`PossibleAnswers` (`id`, `text`, `Question_id`) VALUES (34, 'Более 15 000 UAH', 10);

COMMIT;

