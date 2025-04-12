SELECT 
    p.nome AS nome_projeto,
    d1.descricao AS departamento_projeto,
    f.nome AS responsavel_projeto,
    d2.descricao AS departamento_responsavel
FROM projeto p
JOIN departamento d1 ON p.cod_depto = d1.codigo
JOIN funcionario f ON p.cod_responsavel = f.codigo
JOIN departamento d2 ON f.cod_depto = d2.codigo
WHERE p.cod_depto <> f.cod_depto;
