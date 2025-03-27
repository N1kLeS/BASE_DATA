CREATE TABLE hazard (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);

CREATE TABLE planet (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_hazard INT REFERENCES hazard(id)
);

CREATE TABLE equipment (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    required_for_suit BOOLEAN NOT NULL
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_pers INT REFERENCES person(id)
);

CREATE TABLE mission (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_planet INT REFERENCES planet(id),
    goal TEXT NOT NULL,
    id_team INT REFERENCES team(id),
    date DATE NOT NULL
);

CREATE TABLE mis_equ (
    id_equ INT REFERENCES equipment(id),
    id_mis INT REFERENCES mission(id),
    PRIMARY KEY (id_equ, id_mis)
);

CREATE TABLE spacesuit (
    id SERIAL PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    weight DECIMAL(5,2) NOT NULL,
    automation BOOLEAN NOT NULL,
    protection VARCHAR(255) NOT NULL
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
);

CREATE TABLE per_suit (
    id_suit INT REFERENCES spacesuit(id),
    id_per INT REFERENCES person(id),
    PRIMARY KEY (id_suit, id_per)
);


---------------------------------------------------------------------------------------------------------------------------------


INSERT INTO hazard (name, type) VALUES ('Радиация', 'Экологическая');
INSERT INTO hazard (name, type) VALUES ('Низкая гравитация', 'Физическая');


INSERT INTO planet (name, id_hazard) VALUES ('Луна', 1);
INSERT INTO planet (name, id_hazard) VALUES ('Марс', 2);


INSERT INTO equipment (name, type, required_for_suit) VALUES ('Кислородный баллон', 'Жизнеобеспечение', TRUE);
INSERT INTO equipment (name, type, required_for_suit) VALUES ('Радиационный щит', 'Защита', FALSE);


INSERT INTO spacesuit (model, weight, automation, protection) VALUES ('MK-V', 45.00, TRUE, 'Полная защита');
INSERT INTO spacesuit (model, weight, automation, protection) VALUES ('Apollo-Lite', 30.00, FALSE, 'Базовая защита');


INSERT INTO person (name, age) VALUES ('Доктор Флойд', 50);
INSERT INTO person (name, age) VALUES ('Инженер Смит', 35);


INSERT INTO team (name, id_pers) VALUES ('Исследователи', 1);
INSERT INTO team (name, id_pers) VALUES ('Техники', 2);


INSERT INTO mission (name, id_planet, goal, id_team, date) VALUES ('Изучение Луны', 1, 'Изучить поверхность Луны и её опасности', 1, '2025-03-01');
INSERT INTO mission (name, id_planet, goal, id_team, date) VALUES ('Создание базы на Марсе', 2, 'Создать постоянную исследовательскую базу', 2, '2025-06-15');


INSERT INTO mis_equ (id_equ, id_mis) VALUES (1, 1);
INSERT INTO mis_equ (id_equ, id_mis) VALUES (2, 2);


INSERT INTO per_suit (id_suit, id_per) VALUES (1, 1);
INSERT INTO per_suit (id_suit, id_per) VALUES (2, 2);

------------------------------------------------------------------------------------------------------------------------------------------


SELECT * FROM hazard;
SELECT * FROM planet;
SELECT * FROM equipment;
SELECT * FROM spacesuit;
SELECT * FROM person;
SELECT * FROM team;
SELECT * FROM mission;
SELECT * FROM mis_equ;
SELECT * FROM per_suit;