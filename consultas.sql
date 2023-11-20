SELECT p.id_pessoa, p.nome, p.logradouro, p.cidade, p.estado, p.telefone, p.email,pf.id_pessoa, pf.cpf
FROM pessoas p
JOIN pessoaFisica pf ON p.id_pessoa = pf.id_pessoa

SELECT p.id_pessoa, p.nome, p.logradouro, p.cidade, p.estado, p.telefone, p.email, pj.id_pessoa, pj.cnpj
FROM pessoas p
JOIN pessoaJuridica pj ON p.id_pessoa = pj.id_pessoa

SELECT p.nome AS fornecedor, pr.nome AS produto, m.quantidade, m.preco_unitario, m.quantidade * m.preco_unitario AS valor_total
FROM movimentos m
JOIN produtos pr ON m.id_produto = pr.id_produto
JOIN pessoas p ON m.id_pessoa = p.id_pessoa
WHERE m.tipo_movimento = 'E';

SELECT p.nome AS comprador, pr.nome AS produto, m.quantidade, m.preco_unitario, m.quantidade * m.preco_unitario AS valor_total
FROM movimentos m
JOIN produtos pr ON m.id_produto = pr.id_produto
JOIN pessoas p ON m.id_pessoa = p.id_pessoa
WHERE m.tipo_movimento = 'S';

SELECT pr.nome AS produto, SUM(m.quantidade * m.preco_unitario) AS valor_total
FROM movimentos m
JOIN produtos pr ON m.id_produto = pr.id_produto
WHERE m.tipo_movimento = 'E'
GROUP BY pr.nome;

SELECT pr.nome AS produto, SUM(m.quantidade * m.preco_unitario) AS valor_total
FROM movimentos m
JOIN produtos pr ON m.id_produto = pr.id_produto
WHERE m.tipo_movimento = 'S'
GROUP BY pr.nome;

SELECT u.login as operador
FROM usuarios u
LEFT JOIN movimentos m ON u.id_usuario = m.id_usuario AND m.tipo_movimento = 'E'
WHERE m.id_movimento IS NULL;

SELECT u.login as operador, SUM(m.quantidade * m.preco_unitario) AS valor_total
FROM movimentos m
JOIN usuarios u ON m.id_usuario = u.id_usuario
WHERE m.tipo_movimento = 'E'
GROUP BY u.login;

SELECT u.login as operador, SUM(m.quantidade * m.preco_unitario) AS valor_total
FROM movimentos m
JOIN usuarios u ON m.id_usuario = u.id_usuario
WHERE m.tipo_movimento = 'S'
GROUP BY u.login;

SELECT id_produto, CAST(SUM(preco_unitario * quantidade) / SUM(quantidade) AS DECIMAL(10, 2)) AS valor_medio_venda
FROM movimentos
WHERE tipo_movimento = 'S'
GROUP BY id_produto;