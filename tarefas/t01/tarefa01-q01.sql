WITH SalarioMaxDepto2 AS (
    SELECT MAX(salario) AS max_salario 
    FROM funcionario 
    WHERE cod_depto = 2
)
SELECT f.nome 
FROM funcionario f
WHERE f.salario > (SELECT max_salario FROM SalarioMaxDepto2);
