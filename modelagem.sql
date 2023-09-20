-- Criação do banco
CREATE DATABASE ecommerce;
GO

-- Coloca o banco em uso
USE ecommerce;
GO

-- Criação da tabela cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(60) NOT NULL,
    identificacao VARCHAR(14) NOT NULL,
    tipo_cliente CHAR(2) NOT NULL CHECK (tipo_cliente IN ('PF', 'PJ'))
);
GO

-- Criação da tabela endereco
CREATE TABLE endereco (
    id INT PRIMARY KEY IDENTITY(1,1),
    rua VARCHAR(30) NOT NULL,
    numero INT,
    complemento VARCHAR(30),
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    fone VARCHAR(11),
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
);
GO

-- Criação da tabela entrega
CREATE TABLE entrega (
    id INT PRIMARY KEY IDENTITY(1,1),
    empresa VARCHAR(45) NOT NULL,
    data_prevista DATE NOT NULL,
    data_entrega DATE,
    status_entrega SMALLINT NOT NULL CHECK (status_entrega IN (0,1,2,3,4,5,6,7)),
    valor_frete FLOAT NOT NULL,
    codigo_rastreio VARCHAR(30)
);
GO

-- Criação da tabela pagamento
CREATE TABLE pagamento (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo_pagamento CHAR(1) NOT NULL CHECK (tipo_pagamento IN ('C', 'D', 'P', 'B')),
    pix_copia_cola VARCHAR(255),
    numero_cartao VARCHAR(20),
    data_validade CHAR(6),
    bandeira_cartao VARCHAR(20),
    nome_portador VARCHAR(45),
    identificao VARCHAR(14) NOT NULL,
    codigo_barras VARCHAR(48),
    emissao_boleto DATE,
    vencimento_boleto DATE,
    data_recebimento DATE,
    status_pagamento SMALLINT NOT NULL CHECK (status_pagamento IN (0,1,2,3,4,5,6)),
    data_status DATETIME DEFAULT NULL,
    valor FLOAT
);
GO

-- Criação da tabela pedido
CREATE TABLE pedido (
    id INT PRIMARY KEY IDENTITY(1,1),
    status_pedido SMALLINT NOT NULL CHECK (status_pedido IN (0,1,2)),
    tipo_cancelamento CHAR(1) CHECK (tipo_cancelamento IN ('X', 'C', 'R')),
    cliente_id INT NOT NULL,
    entrega_id INT NOT NULL,
    pagamento_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (entrega_id) REFERENCES entrega(id),
    FOREIGN KEY (pagamento_id) REFERENCES pagamento(id)
);
GO

-- Criação da tabela estoque
CREATE TABLE estoque (
    id INT PRIMARY KEY IDENTITY(1,1),
    cidade VARCHAR(30)
);
GO

-- Criação da tabela produto
CREATE TABLE produto (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(30) NOT NULL,
    descricacao TEXT NOT NULL,
    valor FLOAT
);
GO

-- Criação da tabela estoque_produto
CREATE TABLE estoque_produto (
    estoque_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT CHECK (quantidade >= 0),
    PRIMARY KEY (estoque_id, produto_id),
    FOREIGN KEY (estoque_id) REFERENCES estoque(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);
GO

-- Criação da tabela pedido_produto
CREATE TABLE pedido_produto (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);
GO

-- Criação da tabela fornecedor
CREATE TABLE fornecedor (
    id INT PRIMARY KEY IDENTITY(1,1),
    razao_social VARCHAR(45),
    cnpj CHAR(14) NOT NULL
);
GO

-- Criação da tabela fornecedor_produto
CREATE TABLE fornecedor_produto (
    fornecedor_id INT NOT NULL,
    produto_id INT NOT NULL,
    PRIMARY KEY (fornecedor_id, produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);
GO


--TODO: fazer os inserts

--TODO: fazer os selects
