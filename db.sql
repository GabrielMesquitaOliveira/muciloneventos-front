CREATE TABLE
    IF NOT EXISTS tb_categoria (
        id_categoria INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

INSERT INTO tb_categoria (nome)
VALUES ('Manutenca'), ('Revisao'), ('Troca de oleo');

CREATE TABLE
    IF NOT EXISTS tb_cor (
        id_cor INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

INSERT INTO tb_cor (nome)
VALUES ('Roxo'), ('Azul'), ('Vermelho');

CREATE TABLE
    IF NOT EXISTS tb_combustivel (
        id_cor INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL
    );

INSERT INTO
    tb_combustivel (nome)
VALUES ('Gasolina'), ('Alcool'), ('Diesel');

CREATE TABLE
    IF NOT EXISTS tb_frabricante{id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL};

INSERT INTO
    tb_frabricante(nome)
VALUES ('Fiat'), ('Chevrolet'), ('Volkswagen');

CREATE TABLE
    IF NOT EXISTS tb_user{id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
}

INSERT INTO tb_user (nome, nickname, email, password) VALUES
('Joao', 'joaozinho', 'joazinho@gmail.com', '123456789'),
('Maria', 'mariasilva', 'maria@gmail.com', 'senha123'),
('Pedro', 'pedrinho', 'pedro@hotmail.com', 'minhasenha');

CREATE TABLE IF NOT EXISTS tipo_pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tipo_pagamento (descricao) VALUES
('Cartão de Crédito'),
('Dinheiro'),
('Pix');

CREATE TABLE IF NOT EXISTS tb_posto (
    id_posto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO tb_posto (nome) VALUES
('Posto A'),
('Posto B'),
('Posto C');

CREATE TABLE IF NOT EXISTS tb_despesa (
    id_despesa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor FLOAT NOT NULL,
    descricao TEXT,
    categoria_id INT,
    veiculo_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id_categoria),
    FOREIGN KEY (veiculo_id) REFERENCES tb_veiculo(id_veiculo)
);

CREATE TABLE IF NOT EXISTS tb_veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    fabricante_id INT,
    modelo VARCHAR(255) NOT NULL,
    ano_fabricacao INT NOT NULL,
    ano_modelo INT NOT NULL,
    placa VARCHAR(20) NOT NULL,
    cor_id INT,
    motorista_id INT,
    FOREIGN KEY (fabricante_id) REFERENCES tb_fabricante(id_fabricante),
    FOREIGN KEY (cor_id) REFERENCES tb_cor(id_cor),
    FOREIGN KEY (motorista_id) REFERENCES tb_user(id_usuario)
);

INSERT INTO tb_veiculo (fabricante_id, modelo, ano_fabricacao, ano_modelo, placa, cor_id, motorista_id) VALUES
(1, 'Gol', 2020, 2021, 'ABC1234', 2, 1),
(2, 'Civic', 2019, 2020, 'XYZ5678', 1, 2),
(3, 'Onix', 2022, 2023, 'DEF9876', 3, 3);

INSERT INTO tb_despesa (nome, valor, descricao, categoria_id, veiculo_id) VALUES
('Combustível', 150.00, 'Abastecimento do veículo', 1, 1),
('Manutenção', 200.00, 'Troca de óleo e filtros', 2, 2),
('Seguro', 500.00, 'Seguro do veículo', 3, 3);

CREATE TABLE IF NOT EXISTS tb_abastecimento (
    id_abastecimento INT AUTO_INCREMENT PRIMARY KEY,
    valor_litro FLOAT NOT NULL,
    qtd_litros FLOAT NOT NULL,
    valor_abastecido FLOAT NOT NULL,
    cashback FLOAT,
    km_veiculo INT NOT NULL,
    data_abastecimento DATE NOT NULL,
    veiculo_id INT,
    posto_id INT,
    combustivel_id INT,
    pagamento_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES tb_veiculo(id_veiculo),
    FOREIGN KEY (posto_id) REFERENCES tb_posto(id),
    FOREIGN KEY (combustivel_id) REFERENCES tb_combustivel(id_combustivel),
    FOREIGN KEY (pagamento_id) REFERENCES tb_tipo_pagamento(id)
);

INSERT INTO tb_abastecimento (valor_litro, qtd_litros, valor_abastecido, cashback, km_veiculo, data_abastecimento, veiculo_id, posto_id, combustivel_id, pagamento_id) VALUES
(5.50, 30.0, 165.00, 2.00, 50000, '2023-01-15', 1, 1, 1, 1),
(6.00, 25.0, 150.00, 2.00, 51000, '2023-02-20', 2, 2, 2, 2),
(5.80, 35.0, 203.00, 1.50, 52000, '2023-03-25', 3, 3, 3, 3);

ALTER TABLE tb_despesa
CHANGE COLUMN nome despesa VARCHAR(255) NOT NULL;

ALTER TABLE tb_veiculo
ADD COLUMN data_cadastro DATE;

SELECT valor_litro, qtd_litros, valor_abastecido, km_veiculo
FROM tb_abastecimento;