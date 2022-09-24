-- Criação de banco de dados
create database oficina;

-- Coloca o banco criado em uso  
use doficina;

-- Criação das tabelas
create table funcionario (
    id int not null auto_increment,
    nome varchar(45) not null,
    codigo varchar(100) not null,
    data_nascimento date not null,
    telefone varchar(11) not null,
    endereco varchar(100) not null,
    salario float not null,
    tipo_regime varchar(3) not null default 'CLT',
    constraint pk_funcionario primary key (id)
);

create table administrativo (
    id int not null auto_increment,
    departamento varchar(20),
    funcionario_id int not null,
    constraint pk_administrativo primary key (id),
    constraint fk_administrativo_funcionario foreign key (funcionario_id) references funcionario(id) on delete cascade
);

create table mecanico (
    id int not null auto_increment,
    especialidade varchar(30) not null,
    funcionario_id int not null,
    constraint pk_mecanico primary key (id),
    constraint fk_mecanico_funcionario foreign key (funcionario_id) references funcionario(id) on delete cascade
);

create table cliente (
    id int not null auto_increment,
    nome varchar(45) not null,
    telefone varchar(11) not null,
    endereco varchar(100) not null,
    cpf_cnpj varchar(14) not null,
    constraint pk_cliente primary key (id)
);

create table veiculo (
    id int not null auto_increment,
    marca varchar(30) not null,
    modelo varchar(30) not null,
    ano_fabricacao date not null,
    ano_modelo date,
    combustivel varchar(10),
    seguro boolean,
    cliente_id int not null,
    constraint pk_veiculo primary key (id),
    constraint fk_veiculo_cliente foreign key (cliente_id) references cliente(id) on delete cascade
);

create table pedido (
    id int not null auto_increment,
    cliente_id int not null,
    administrativo_id int not null,
    tipo varchar(30) not null,
    descricao varchar(255) not null,
    valor float not null,
    constraint pk_pedido primary key (id),
    constraint fk_pedido_cliente foreign key (cliente_id) references cliente(id) on delete cascade,
    constraint fk_pedido_administrativo foreign key (administrativo_id) references administrativo(id) on delete cascade
);

create table ordem_servico (
    id int not null auto_increment,
    pedido_id int not null,
    veiculo_id int not null,
    data_inicio date not null,
    data_entrega date,
    status_ordem smallint comment '0: Pendente, 1: Em andamento, 2: Finalizado, 3: Cancelado',
    constraint pk_ordem_servico primary key (id),
    constraint fk_ordem_servico_pedido foreign key (pedido_id) references pedido(id) on delete cascade,
    constraint fk_ordem_servico_veiculo foreign key (veiculo_id) references veiculo(id) on delete cascade
);

create table mecanico_ordem_servico (
    mecanico_id int not null,
    ordem_servico_id int not null,
    constraint pk_mecanico_ordem_servico primary key (mecanico_id, ordem_servico_id),
    constraint fk_mecanico_ordem_servico_mecanico foreign key (mecanico_id) references mecanico(id) on delete cascade,
    constraint fk_mecanico_ordem_servico_ordem_servico foreign key (ordem_servico_id) references ordem_servico(id) on delete cascade
);