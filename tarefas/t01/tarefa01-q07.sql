-- View
CREATE VIEW vw_total_funcionarios AS
SELECT
    cod_depto,
    COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY cod_depto;

-- Consulta
SELECT 
    d.descricao AS nome_departamento,
    f.nome AS nome_gerente,
    COALESCE(v.total_funcionarios, 0) AS numero_funcionarios
FROM departamento d
LEFT JOIN funcionario f ON d.cod_gerente = f.codigo
LEFT JOIN vw_total_funcionarios v ON d.codigo = v.cod_depto
ORDER BY d.codigo;
