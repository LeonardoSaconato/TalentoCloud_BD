CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Matricula INT,
    E_mail VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15)
);

INSERT INTO ALUNO (ID, Nome, Matricula, E_mail, Endereco, Telefone) VALUES 
(01, 'João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio', '(11)7825-4489'),
(02, 'José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
(03, 'Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol', '(11)7825-4495');
