-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 19 2021 г., 19:38
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schedule`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classroom`
--

CREATE TABLE `classroom` (
  `classroom_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `active` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `classroom`
--

INSERT INTO `classroom` (`classroom_id`, `name`, `active`) VALUES
(1, '3305', 1),
(2, '2210', 1),
(3, '2145', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `day`
--

CREATE TABLE `day` (
  `day_id` tinyint NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `day`
--

INSERT INTO `day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `gender_id` tinyint NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa`
--

CREATE TABLE `gruppa` (
  `gruppa_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `special_id` int NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `gruppa`
--

INSERT INTO `gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, 'ИС-18-6б', 1, '2018-09-01', '2022-06-22'),
(2, 'П-18-44к', 5, '2018-09-01', '2022-06-22'),
(3, 'С-18-19б', 3, '2018-09-01', '2022-06-22'),
(4, 'Ди-18-1', 7, '2018-04-12', '2022-04-12');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_num`
--

CREATE TABLE `lesson_num` (
  `lesson_num_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `time_lesson` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `lesson_num`
--

INSERT INTO `lesson_num` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_plan`
--

CREATE TABLE `lesson_plan` (
  `lesson_plan_id` int NOT NULL,
  `gruppa_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `lesson_plan`
--

INSERT INTO `lesson_plan` (`lesson_plan_id`, `gruppa_id`, `subject_id`, `user_id`) VALUES
(2, 1, 1, 27),
(4, 4, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `otdel`
--

CREATE TABLE `otdel` (
  `otdel_id` smallint NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `otdel`
--

INSERT INTO `otdel` (`otdel_id`, `name`, `active`) VALUES
(1, 'Программирование', 1),
(2, 'Общеобразовательные дисциплины', 1),
(3, 'Строительство', 1),
(4, 'Дизайн', 1),
(9, 'Инженерия', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `role_id` tinyint NOT NULL,
  `sys_name` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `lesson_plan_id` int NOT NULL,
  `day_id` tinyint NOT NULL,
  `lesson_num_id` int NOT NULL,
  `classroom_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `lesson_plan_id`, `day_id`, `lesson_num_id`, `classroom_id`) VALUES
(2, 2, 1, 1, 1),
(3, 2, 3, 1, 1),
(4, 2, 5, 3, 2),
(5, 4, 4, 4, 1),
(6, 4, 2, 1, 1),
(7, 4, 2, 2, 1),
(8, 2, 2, 1, 1),
(9, 2, 2, 3, 1),
(10, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `special`
--

CREATE TABLE `special` (
  `special_id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `otdel_id` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `special`
--

INSERT INTO `special` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'Информационные системы', 1, 1),
(2, 'Нефтегазовое дело', 2, 1),
(3, 'Строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'Электроснабжение', 3, 1),
(5, 'Вычислительная техника и программное обеспечение', 1, 1),
(6, 'Астроном-инженер', 9, 1),
(7, 'Дизайнер', 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `user_id` bigint NOT NULL,
  `gruppa_id` int NOT NULL,
  `num_zach` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`user_id`, `gruppa_id`, `num_zach`) VALUES
(5, 4, 'TX45215'),
(8, 1, 'XA213'),
(24, 1, 'NOVA512'),
(25, 2, 'AP14215'),
(26, 1, 'AF124');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `subject_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `otdel_id` smallint NOT NULL,
  `hours` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`subject_id`, `name`, `otdel_id`, `hours`, `active`) VALUES
(1, 'Астрофизика', 9, 10, 1),
(2, 'Математика', 2, 4, 1),
(3, 'основы дизайна', 4, 1000, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `user_id` bigint NOT NULL,
  `otdel_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`user_id`, `otdel_id`) VALUES
(6, 1),
(2, 3),
(27, 3),
(3, 4),
(4, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` bigint NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `gender_id` tinyint NOT NULL,
  `birthday` date DEFAULT NULL,
  `role_id` tinyint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `lastname`, `firstname`, `patronymic`, `login`, `pass`, `gender_id`, `birthday`, `role_id`, `active`) VALUES
(1, 'Смит', 'Джон', 'Тимофеевич', 'admin', '$2y$10$mFlJsQgNvDQ27XfADrMh8O9OQA47f2gLmqYdwGeg8SpsvdoRUX95S', 1, '2000-07-10', 1, 1),
(2, 'john', 'doe', '', 'johndoe89', '$2y$10$tZagpzTuN.Ym2B7s82L8ouBM4ITxN.pM0v/Oe/fkpAgEhYDMiO/.S', 1, '1989-05-15', 3, 1),
(3, 'Doe', 'Jhon', '', 'doejohn68', '$2y$10$odoAWTo86P0silddKO6fW.2HKtzNA.pSm9LRGg2cIEaZ0eauASqxG', 1, '1967-08-09', 3, 1),
(4, 'butcher', 'frank', 'fre', 'butcher202', '$2y$10$b5TuSyU1NcJkIgjiLZDdzumrxlVZPVBK17Ku70F/OkPnbS.Piv/TG', 1, '2000-12-04', 3, 1),
(5, 'mark', 'mark', '', 'mark13', '$2y$10$6CrvMZIw.4lgaREowens7eVbOC6EtDkMU/PbxIP0URy.Q/TCZbmNK', 1, '2002-12-05', 4, 1),
(6, 'Afqw', 'Afqw', '', 'Afqw12', '$2y$10$DkAclEOmT1j4/MmVSq/BbOIFPvH7U52/E4NoVR69WRQCEebM2bqXO', 2, '1990-04-21', 3, 1),
(8, 'nova', 'kostya', '', 'kostya15', '$2y$10$LAlnYbFUkiAnoz0NP05cNuScqGvtfOjw518psZqpqtyHv/9ANm8rW', 1, '2002-12-23', 4, 1),
(24, 'Nova', 'Proxima', '', 'Proxima17', '$2y$10$kwRvzqxKA6R81tJ7VRvXReM.GYMwwPB/LqnlNDtSK3N6VafEbr9DK', 2, '1991-01-01', 4, 1),
(25, 'Alpha', 'Centaurus', '', 'Centaurus92', '$2y$10$vzP2NKiiQ93egHQazjBgiOoWL95dkupt1ldA2FYYNE1A9dW/Ay.RG', 1, '1900-01-01', 4, 1),
(26, 'New', 'Student', '', 'student12', '$2y$10$0KxTRrjrwif8L0JSilHZNO7Ke3y4UuBVMZlpMfeBc/vtqcBwX3yky', 1, '1999-04-12', 4, 1),
(27, 'New', 'Teacher', '', 'Tech90', '$2y$10$Bij5WVzODSrhC7fQ6w7c5OqUA0kecjKTXHKbtg9Nhd9EN3QLPHjsy', 2, '1990-12-01', 3, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `gruppa_id` (`gruppa_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `otdel`
--
ALTER TABLE `otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `lesson_plan_id` (`lesson_plan_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `lesson_num_id` (`lesson_num_id`),
  ADD KEY `day_id` (`day_id`);

--
-- Индексы таблицы `special`
--
ALTER TABLE `special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `active` (`active`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classroom`
--
ALTER TABLE `classroom`
  MODIFY `classroom_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `day`
--
ALTER TABLE `day`
  MODIFY `day_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `gruppa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  MODIFY `lesson_num_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  MODIFY `lesson_plan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `otdel`
--
ALTER TABLE `otdel`
  MODIFY `otdel_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `role_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `special`
--
ALTER TABLE `special`
  MODIFY `special_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  ADD CONSTRAINT `lesson_plan_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa` (`gruppa_id`),
  ADD CONSTRAINT `lesson_plan_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  ADD CONSTRAINT `lesson_plan_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`classroom_id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `day` (`day_id`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`lesson_num_id`) REFERENCES `lesson_num` (`lesson_num_id`),
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`lesson_plan_id`) REFERENCES `lesson_plan` (`lesson_plan_id`);

--
-- Ограничения внешнего ключа таблицы `special`
--
ALTER TABLE `special`
  ADD CONSTRAINT `special_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa` (`gruppa_id`);

--
-- Ограничения внешнего ключа таблицы `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
