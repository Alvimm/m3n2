-- CRIANDO O BANCO DE DADOS LOJA
CREATE DATABASE Loja
    WITH
    OWNER = loja
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- CRIANDO A TABELA USUARIOS
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    login VARCHAR(20) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- CRIANDO A TABELA PRODUTOS
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE pessoas (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
);

-- CRIANDO A TABELA PESSOAFISICA
CREATE TABLE pessoaFisica (
    id_pessoa INT NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    CONSTRAINT pessoa_fisica_FK FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa) ON DELETE CASCADE ON UPDATE CASCADE
);

-- CRIANDO A TABELA PESSOAJURIDICA
CREATE TABLE pessoaJuridica (
    id_pessoa INT NOT NULL,
     cnpj VARCHAR(18) NOT NULL UNIQUE,
    CONSTRAINT pessoa_juridica_FK FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE movimentos (
    id_movimento INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_pessoa INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    tipo_movimento VARCHAR(10) NOT NULL CHECK (tipo_movimento IN ('E', 'S')),
    CONSTRAINT "movimentos_id_usuario_fk" FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT "movimentos_id_pessoa_fk" FOREIGN KEY(id_pessoa) REFERENCES pessoas(id_pessoa) ON DELETE CASCADE,
    CONSTRAINT "movimentos_id_produto_fk" FOREIGN KEY(id_produto) REFERENCES produtos(id_produto)
);


CREATE SEQUENCE pessoa_id_seq;

ALTER TABLE pessoas
  ALTER COLUMN id_pessoa SET DEFAULT nextval('pessoa_id_seq');

ALTER TABLE pessoaFisica
  ALTER COLUMN id_pessoa SET DEFAULT nextval('pessoa_id_seq');

ALTER TABLE pessoaJuridica
  ALTER COLUMN id_pessoa SET DEFAULT nextval('pessoa_id_seq');