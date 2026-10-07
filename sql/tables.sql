use `db-m2`;

CREATE TABLE IF NOT EXISTS Unidade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS Vendedor(
	matricula INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Venda(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    quantidade INT NOT NULL,
    unidade_idx INT,
    produto_idx INT,
    vendedor_idx INT,
    
    FOREIGN KEY (unidade_idx) REFERENCES Unidade(id),
    FOREIGN KEY (produto_idx) REFERENCES Produto(id),
    FOREIGN KEY (vendedor_idx) REFERENCES Vendedor(matricula)
);