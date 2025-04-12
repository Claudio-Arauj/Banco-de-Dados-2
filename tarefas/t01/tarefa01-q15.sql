-- View: quantidade de atividades por projeto
CREATE OR REPLACE VIEW vw_qtd_atividades_projeto AS
SELECT 
    p.codigo AS cod_projeto,
    COUNT(ap.cod_atividade) AS qtd_atividades
FROM projeto p
LEFT JOIN atividade_projeto ap ON p.codigo = ap.cod_projeto
GROUP BY p.codigo;

-- View: quantidade de responsáveis únicos por atividades por projeto
CREATE OR REPLACE VIEW vw_qtd_responsaveis_atividade AS
SELECT 
    ap.cod_projeto,
    COUNT(DISTINCT a.cod_responsavel) AS qtd_responsaveis
FROM atividade_projeto ap
JOIN atividade a ON ap.cod_atividade = a.codigo
GROUP BY ap.cod_projeto;

-- Consulta final usando as views
SELECT 
    p.nome AS nome_projeto,
    f.nome AS responsavel_projeto,
    COALESCE(v1.qtd_atividades, 0) AS qtd_atividades,
    COALESCE(v2.qtd_responsaveis, 0) AS qtd_responsaveis_atividade
FROM projeto p
LEFT JOIN funcionario f ON p.cod_responsavel = f.codigo
LEFT JOIN vw_qtd_atividades_projeto v1 ON p.codigo = v1.cod_projeto
LEFT JOIN vw_qtd_responsaveis_atividade v2 ON p.codigo = v2.cod_projeto;
