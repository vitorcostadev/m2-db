use `2026-2_banco-de-dados`;

CREATE TABLE StudentAddress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    chave INT AUTO_INCREMENT PRIMARY KEY,
    roll_no INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone_no VARCHAR(50),
    DOB VARCHAR(50) NOT NULL,
    chave_address INT,
    FOREIGN KEY (chave_address) REFERENCES StudentAddress(id)
);