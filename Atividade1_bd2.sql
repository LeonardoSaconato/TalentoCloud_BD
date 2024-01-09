/*
Nome: Leonardo Saconato
Turma: 08
    *Atividade 1 Banco de dados II*
Desenvolva um banco de dados e relacione tabelas através de chaves estrangeiras ou nomes de colunas iguais. Siga as instruções:
-crie uma base de dados; 
-crie tabelas nessa base de dados;
-em cada tabela, adicione atributos;
-insira dados em cada tabela;
-utilize os comandos Joins para realizar consultas nas tabelas.*/


-- Criação do banco de dados
CREATE DATABASE Loja;

-- Uso do banco de dados criado
USE Loja;

-- Criação da tabela 'Clientes' com os atributos
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

-- Criação da tabela 'Pedidos'
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    Produto VARCHAR(100),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Inserção de dados na tabela 'Clientes'
INSERT INTO Clientes (ID, Nome, Email) VALUES
(1, 'João Silva', 'joao.silva@email.com'),
(2, 'Maria Santos', 'maria.santos@email.com');

-- Inserção de dados na tabela 'Pedidos'
INSERT INTO Pedidos (PedidoID, ClienteID, Produto) VALUES
(1, 1, 'Produto A'),
(2, 2, 'Produto B'),
(3, 1, 'Produto C');

-- Consulta utilizando JOIN
SELECT Clientes.Nome, Pedidos.Produto
FROM Clientes
JOIN Pedidos ON Clientes.ID = Pedidos.ClienteID;
