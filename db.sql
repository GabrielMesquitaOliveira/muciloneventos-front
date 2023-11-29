CREATE TABLE IF NOT EXISTS tb_categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO
    tb_categoria (nome)
VALUES
    ('Manutenca'),
    ('Revisao'),
    ('Troca de oleo');

CREATE TABLE IF NOT EXISTS tb_cor (
    id_cor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO
    tb_cor (nome)
VALUES
    ('Roxo'),
    ('Azul'),
    ('Vermelho');

CREATE TABLE IF NOT EXISTS tb_combustivel (
    id_cor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO
    tb_combustivel (nome)
VALUES
    ('Gasolina'),
    ('Alcool'),
    ('Diesel');

CREATE TABLE IF NOT EXISTS tb_frabricante { id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL };

INSERT INTO
    tb_frabricante(nome)
VALUES
    ('Fiat'),
    ('Chevrolet'),
    ('Volkswagen');

    CREATE TABLE IF NOT EXISTS tb_user {
        id_usuario INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        nickname VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
    }
