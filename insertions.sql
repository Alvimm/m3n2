insert into usuarios (id_usuario, login, senha)
values (1, 'op1', 'op1'), (2, 'op2', 'op2');


insert into produtos (id_produto, nome, quantidade, preco_venda)
values 
    (1, 'Banana', 100, 5.00), 
    (2, 'Laranja', 500, 2.00), 
    (3, 'Manga', 800,  4.00), 
    (4, 'Uva', 200, 6.00), 
    (5, 'Abacaxi', 300, 7.00);

SELECT nextval('pessoa_id_seq');

INSERT INTO pessoas (id_pessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (1, 'Joao', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com');

INSERT INTO pessoaFisica (id_pessoa, cpf)
VALUES (1, '11111111111');

SELECT nextval('pessoa_id_seq');

INSERT INTO pessoas (id_pessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (2, 'JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');

INSERT INTO pessoaJuridica (id_pessoa, cnpj)
VALUES (2, '2222222222222');



INSERT INTO movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, preco_unitario, tipo_movimento)
VALUES 
    (1, 1, 1, 1, 20, 4.00, 'S'), 
    (2, 1, 1, 2, 15, 2.00, 'S'), 
    (3, 2, 1, 5, 30, 7.00, 'S'), 
    (4, 1, 2, 4, 50, 6.00, 'E'), 
    (5, 2, 2, 3, 10, 5.00, 'E');
    