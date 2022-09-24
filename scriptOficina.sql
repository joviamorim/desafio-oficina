-- Desafio oficina
drop database oficina;
create database oficina;
use oficina;

-- Tabelas

-- Equipe
create table equipe(
	idEquipe int auto_increment primary key,
    nomeEquipe varchar(25) not null
);

-- Mecânico
create table mecanico(
	idMecanico int auto_increment primary key,
    idEquipe int,
    cpf char(11) not null,
    primeiroNome varchar(25) not null,
    mNome varchar(25) default null,
    sobrenome varchar(50) not null,
    especialidade varchar(20) not null,
    rua varchar(50) not null,
    numCasa varchar(6) not null,
    complemento varchar(50) default null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    constraint fk_mecanico_cpf unique (cpf),
    constraint fk_mecanico_idEquipe foreign key (idEquipe) references equipe(idEquipe)
);

-- Cliente
create table cliente(
	idCliente int auto_increment primary key,
    idEquipe int,
    cpf char(11) not null,
    primeiroNome varchar(25) not null,
    mNome varchar(25) default null,
    sobrenome varchar(50) not null,
    rua varchar(50) not null,
    numCasa varchar(6) not null,
    complemento varchar(50) default null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    constraint fk_cliente_cpf unique (cpf),
    constraint fk_cliente_idEquipe foreign key (idEquipe) references equipe(idEquipe)
);

-- Veículo
create table veiculo(
	idVeiculo int auto_increment primary key,
    idEquipe int,
    idCliente int,
    modelo varchar(20) not null,
    marca varchar(20) not null,
    placa char(7) not null,
    ano year not null,
    constraint unique_placa unique (placa),
    constraint fk_veiculo_idEquipe foreign key (idEquipe) references equipe(idEquipe),
    constraint fk_veiculo_idCliente foreign key (idCliente) references cliente(idCliente)
);

-- Ordem de serviço
create table servico(
	idServico int auto_increment primary key,
    idEquipe int,
    dataEmissao date not null,
    dataConclusao date not null,
    statusServico enum('Em andamento','Concluído') default 'Em andamento',
    valorServico float not null,
    constraint fk_servico_idEquipe foreign key (idEquipe) references equipe(idEquipe)
);

-- Peça
create table peca(
	idPeca int auto_increment primary key,
    nomePeca varchar(50) not null
);

-- Pedido de peças
create table pedidosPecas(
	idServico int,
    idPeca int,
    quantidade int default 1,
    primary key (idServico, idPeca),
    constraint fk_pedidosPecas_idServico foreign key (idServico) references servico(idServico),
    constraint fk_pedidosPecas_idPeca foreign key (idPeca) references peca(idPeca)
);

-- Tabela referência de serviço
create table refServico(
	idRefServico int auto_increment primary key,
    tipoServico varchar(50) not null,
    valorRefServico float not null
);

-- Tabela serviço consulta tabela referência
create table consultaServico(
	idServico int,
    idRefServico int,
    primary key (idServico, idRefServico),
    constraint fk_consultaServico_idServico foreign key (idServico) references servico(idServico),
    constraint fk_consultaServico_idRefServico foreign key (idRefServico) references refServico(idRefServico)
);
