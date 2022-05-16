-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Juridica (
Razao_Social Varchar(120),
CNPJ Int,
Cod_Cliente Int
);

CREATE TABLE Fisica (
CPF Int,
RG Int,
Cod_Cliente Int
);

CREATE TABLE Clientes (
Email Varchar(120),
Nome Varchar(120),
Login Varchar(120),
Senha Varchar(120),
Endereco_Cobranca Varchar(300),
Cod_Cliente Int PRIMARY KEY
);

CREATE TABLE Produtos (
Qtd_Estoque Int,
Preco_Embalagem Float,
Qtd_Embalagem Int,
Cod_Produto Int PRIMARY KEY,
Preco_Unitario Float,
Desc_Produto Varchar(120)
);

CREATE TABLE Pedidos (
Data_Entrega Datetime,
Cod_Pedido Int PRIMARY KEY,
Endereco_Entrega Varchar(300),
Data_Pedido Datetime,
Cod_Cliente Int,
FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente)
);

CREATE TABLE Item_Pedido (
Cod_Pedido Int,
Cod_Produto Int,
Situacao Varchar(120),
Qtd_Prod Int,
FOREIGN KEY(Cod_Pedido) REFERENCES Pedidos (Cod_Pedido),
FOREIGN KEY(Cod_Produto) REFERENCES Produtos (Cod_Produto)
);

CREATE TABLE Comentario (
Cod_Cliente Int,
Cod_Produto Int,
DTH Datetime,
Texto Varchar(120),
Titulo Varchar(120),
FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente),
FOREIGN KEY(Cod_Produto) REFERENCES Produtos (Cod_Produto)
);

ALTER TABLE Juridica ADD FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente);
ALTER TABLE Fisica ADD FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente);
