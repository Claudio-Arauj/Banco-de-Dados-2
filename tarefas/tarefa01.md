# Link direto para as tarefas 

* [Criação do Esquema Relacional](t01/tarefa01-create.sql)
* [Povoamento do Esquema Relacional](t01/tarefa01-inserts.sql)
* [Questão 01 da lista](t01/tarefa01-q01.sql)
* [Questão 04 da lista](t01/tarefa01-q04.sql)

#

## NATURAL JOIN

O `NATURAL JOIN` combina as tabelas automaticamente com base nas colunas de mesmo nome. Ele realiza um `INNER JOIN` utilizando implicitamente as colunas comuns entre as tabelas.

### Exemplo de `NATURAL JOIN`

```sql
CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Pedidos (
    id INT,
    produto VARCHAR(100),
    quantidade INT
);

INSERT INTO Clientes (id, nome) VALUES (1, 'João'), (2, 'Maria');
INSERT INTO Pedidos (id, produto, quantidade) VALUES (1, 'Notebook', 1), (2, 'Celular', 2);

SELECT * FROM Clientes
NATURAL JOIN Pedidos;
```

### Resultado:
| id | nome  | produto  | quantidade |
|----|------|---------|-----------|
| 1  | João  | Notebook | 1         |
| 2  | Maria | Celular  | 2         |

## CROSS JOIN

O `CROSS JOIN` gera o produto cartesiano entre as tabelas, combinando cada linha da primeira tabela com todas as linhas da segunda tabela.

### Exemplo de `CROSS JOIN`

```sql
SELECT * FROM Clientes
CROSS JOIN Pedidos;
```

### Resultado:
| id  | nome  | id  | produto  | quantidade |
|----|------|----|---------|-----------|
| 1  | João  | 1  | Notebook | 1         |
| 1  | João  | 2  | Celular  | 2         |
| 2  | Maria | 1  | Notebook | 1         |
| 2  | Maria | 2  | Celular  | 2         |

Dessa forma, enquanto `NATURAL JOIN` realiza a junção baseada em colunas comuns, o `CROSS JOIN` simplesmente combina todas as linhas possíveis das tabelas envolvidas.

#

## Funções de Janela (Window Functions) no PostgreSQL

As funções de janela no PostgreSQL permitem calcular valores agregados em um subconjunto de linhas sem agrupar os resultados. Elas são úteis para cálculos como rankings, médias móveis e totais acumulados.

### Sintaxe Básica

```sql
FUNCAO_DE_JANELA() OVER (
    [PARTITION BY coluna]
    [ORDER BY coluna]
)
```

- `PARTITION BY` (opcional) divide os dados em grupos para a função ser aplicada dentro de cada partição.
- `ORDER BY` (opcional) define a ordem de cálculo dos valores.

### Exemplos

#### 1. Usando `ROW_NUMBER()` para numerar linhas
```sql
SELECT id, nome,
       ROW_NUMBER() OVER (ORDER BY nome) AS numero_linha
FROM clientes;
```

#### 2. Usando `RANK()` e `DENSE_RANK()`
```sql
SELECT id, nome, salario,
       RANK() OVER (ORDER BY salario DESC) AS ranking,
       DENSE_RANK() OVER (ORDER BY salario DESC) AS ranking_denso
FROM funcionarios;
```

#### 3. Total acumulado com `SUM()`
```sql
SELECT id, nome, vendas,
       SUM(vendas) OVER (PARTITION BY categoria ORDER BY id) AS total_acumulado
FROM produtos;
```

#### 4. Média móvel com `AVG()`
```sql
SELECT id, nome, salario,
       AVG(salario) OVER (PARTITION BY departamento ORDER BY id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS media_movel
FROM funcionarios;
```

As funções de janela são poderosas para análise de dados sem eliminar detalhes individuais das linhas. Elas permitem cálculos eficientes e flexíveis diretamente no banco de dados.

