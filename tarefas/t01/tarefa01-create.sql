CREATE TABLE funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    dt_nasc DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    cod_depto INT
);

CREATE TABLE departamento (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    cod_gerente INT UNIQUE, 
    FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo) ON DELETE SET NULL
);

ALTER TABLE funcionario 
ADD CONSTRAINT fk_funcionario_depto FOREIGN KEY (cod_depto) REFERENCES departamento(codigo);

CREATE TABLE projeto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    cod_depto INT,
    cod_responsavel INT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) ON DELETE CASCADE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL
);

CREATE TABLE atividade (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    cod_responsavel INT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL
);

CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    PRIMARY KEY (cod_projeto, cod_atividade),
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) ON DELETE CASCADE,
    FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo) ON DELETE CASCADE
);
