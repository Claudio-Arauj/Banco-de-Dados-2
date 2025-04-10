WITH SalariosDepto2 AS (
    SELECT salario 
    FROM funcionario 
    WHERE cod_depto = 2
)
SELECT f.nome 
FROM funcionario f
LEFT JOIN SalariosDepto2 s ON f.salario > s.salario;
