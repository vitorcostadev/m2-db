USE  `2026-2_banco-de-dados`;

START TRANSACTION;

INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Hauptstraße, 120');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (101, 'Carlos Eduardo', '48999999999', '2000-05-15', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Bahnhofstraße, 45');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (102, 'Ana Beatriz', '11988888888', '2001-08-22', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Neue Straße, 78');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (103, 'Lucas Henrique', '21977777777', '1999-12-10', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Brazil', 'Santa Catarina', 'Florianópolis', 'Rua das Palmeiras, 120');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (104, 'Mariana Silva', '41966666666', '2002-03-18', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Karlstraße, 230');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (105, 'Gabriel Souza', '31955555555', '2000-11-27', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Brazil', 'São Paulo', 'São Paulo', 'Avenida Paulista, 1500');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (106, 'Juliana Oliveira', '51944444444', '2001-06-09', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Münsterplatz, 15');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (107, 'Rafael Martins', '71933333333', '1998-09-14', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Brazil', 'Paraná', 'Curitiba', 'Rua XV de Novembro, 780');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (108, 'Beatriz Costa', '81922222222', '2002-01-30', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Olgastraße, 310');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (109, 'Pedro Augusto', '85911111111', '2000-07-25', LAST_INSERT_ID());


INSERT INTO StudentAddress(country, state, city, street)
VALUES ('Germany', 'Baden-Württemberg', 'Ulm', 'Einsteinstraße, 90');

INSERT INTO Student(roll_no, name, phone_no, DOB, chave_address)
VALUES (110, 'Larissa Almeida', '48900000000', '2001-10-05', LAST_INSERT_ID());

COMMIT;