-- Inserindo dados na tabela departamento
INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Recursos Humanos', NULL),
(2, 'TI', NULL),
(3, 'Financeiro', NULL),
(4, 'Marketing', NULL),
(5, 'Produção', NULL),
(6, 'Jurídico', NULL),
(7, 'Logística', NULL),
(8, 'Pesquisa e Desenvolvimento', NULL),
(9, 'Compras', NULL),
(10, 'Atendimento ao Cliente', NULL);

-- Inserindo dados na tabela funcionario
INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(1, 'Carlos Silva', 'M', '1985-04-23', 5000.00, 2),
(2, 'Mariana Costa', 'F', '1990-08-12', 4800.00, 3),
(3, 'Roberto Lima', 'M', '1982-01-17', 5500.00, 1),
(4, 'Ana Souza', 'F', '1995-06-30', 4600.00, 4),
(5, 'Fernando Alves', 'M', '1988-11-21', 5300.00, 5),
(6, 'Paula Mendes', 'F', '1993-02-14', 4700.00, 6),
(7, 'Júlio Rocha', 'M', '1987-07-07', 5100.00, 7),
(8, 'Sofia Martins', 'F', '1996-09-18', 4900.00, 8),
(9, 'Diego Ferreira', 'M', '1991-05-25', 5200.00, 9),
(10, 'Lúcia Carvalho', 'F', '1984-12-02', 5600.00, 10);

-- Atualizando os gerentes dos departamentos
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 3 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 4 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 5 WHERE codigo = 5;

-- Inserindo dados na tabela projeto
INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Sistema de RH', 'Desenvolvimento de software para RH', 2, 1, '2023-01-10', '2024-06-15'),
(2, 'Portal Financeiro', 'Criação de um portal para controle financeiro', 3, 2, '2022-11-05', '2024-03-30'),
(3, 'Campanha Publicitária', 'Campanha de marketing para novo produto', 4, 4, '2023-09-12', '2024-05-20'),
(4, 'Linha de Produção 4.0', 'Automação da linha de produção', 5, 5, '2023-07-01', '2025-01-01'),
(5, 'Treinamento Interno', 'Programa de capacitação de funcionários', 1, 3, '2023-05-20', '2024-12-31'),
(6, 'Sistema Jurídico', 'Plataforma para processos jurídicos', 6, 6, '2023-03-15', '2024-08-20'),
(7, 'Otimização Logística', 'Melhoria no sistema de entregas', 7, 7, '2023-04-10', '2024-09-30'),
(8, 'Pesquisa de Novos Produtos', 'Investigação de tendências de mercado', 8, 8, '2023-02-05', '2024-07-15'),
(9, 'Eficiência nas Compras', 'Sistema para otimização de compras', 9, 9, '2023-06-01', '2024-10-10'),
(10, 'Atendimento Digital', 'Plataforma para suporte ao cliente', 10, 10, '2023-08-15', '2025-02-28');

-- Inserindo dados na tabela atividade
INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Análise de Requisitos', 'Coleta de requisitos para novo sistema', 1, '2023-02-01', '2023-04-01'),
(2, 'Modelagem Financeira', 'Criação de modelos de controle financeiro', 2, '2022-12-01', '2023-06-30'),
(3, 'Design de Campanha', 'Desenvolvimento de peças publicitárias', 4, '2023-10-01', '2024-02-28'),
(4, 'Implementação de Automação', 'Instalação de sistemas automatizados', 5, '2023-08-01', '2024-10-01'),
(5, 'Capacitação em Liderança', 'Treinamento para líderes da empresa', 3, '2023-06-15', '2024-09-30'),
(6, 'Treinamento Jurídico', 'Capacitação de advogados internos', 6, '2023-03-01', '2024-06-30'),
(7, 'Melhoria no Transporte', 'Planejamento de rotas logísticas', 7, '2023-05-01', '2024-07-31'),
(8, 'Pesquisa de Inovação', 'Análise de novas tecnologias', 8, '2023-04-01', '2024-08-31'),
(9, 'Controle de Fornecedores', 'Auditoria de fornecedores estratégicos', 9, '2023-07-01', '2024-09-30'),
(10, 'Automação de Suporte', 'Implementação de chatbot para suporte', 10, '2023-09-01', '2025-01-31');

-- Inserindo dados na tabela atividade_projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

