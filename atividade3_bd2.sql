-- Atividade 3 Banco de Dados II
-- Nome: Leonardo Saconato Turma:08
-- Utilizei a IDE Sqlite para realização dos scripts e testes.
-- Proposta de atividade:Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.

--Criação das tabelas Produtos, Clientes e Vendas
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255),
    preco_produto DECIMAL(10, 2)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(255),
    email_cliente VARCHAR(255)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    data_venda DATE,
    quantidade_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

--inserção de dados para testar a procedure
INSERT INTO produtos VALUES (1, 'Camisa Polo', 39.99);
INSERT INTO produtos VALUES (2, 'Tênis Esportivo', 199.99);
INSERT INTO produtos VALUES (3, 'Calça Jeans', 109.99);

-- Inserir nomes de clientes
INSERT INTO clientes VALUES (1, 'Maria Silva', 'maria.silva@examplo.com');
INSERT INTO clientes VALUES (2, 'João Santos', 'joao.santos@examplo.com');
INSERT INTO clientes VALUES (3, 'Ana Oliveira', 'ana.oliveira@examplo.com');

-- Inserção das vendas realizadas
INSERT INTO vendas VALUES (1, 1, 1, CURRENT_DATE, 2);
INSERT INTO vendas VALUES (2, 2, 2, CURRENT_DATE, 1);
INSERT INTO vendas VALUES (3, 3, 3, CURRENT_DATE, 3);

-- Consulta para o relatório diário
CREATE OR REPLACE FUNCTION RelatorioDiario()
RETURNS TABLE (data_venda DATE, total_produtos BIGINT)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        v.data_venda,
        SUM(v.quantidade_produto) AS total_produtos
    FROM
        vendas v
    WHERE
        v.data_venda = CURRENT_DATE
    GROUP BY
        v.data_venda;

END $$ LANGUAGE plpgsql;


-- Exibe a função onde mostra a data da venda e total_produtos
SELECT * FROM RelatorioDiario();