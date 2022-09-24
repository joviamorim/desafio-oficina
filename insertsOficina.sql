-- inserts do database oficina
use oficina;

-- Equipe
insert into equipe(nomeEquipe) values
	('Equipe 1'),
    ('Equipe 2');

-- Mecânico
insert into mecanico(idEquipe, cpf, primeiroNome, mNome, sobrenome, especialidade, rua, numCasa, complemento, bairro, cidade, estado) values
	('1','11122233344','João','V','Amorim','Manutenção','Rua 1','10','quadra A','Bairro joel','São Paulo','São paulo'),
    ('1','44433322211','Maria','C','Lopes','Transporte','Rua x','100',default,'Bairro Matão','São Paulo','São paulo'),
    ('1','12345678910','Carlos',default,'Lanzoni','Manutenção','Rua santos','10',default,'Bairro São Carlos','São Paulo','São paulo'),
    ('2','10987654321','Lucas','V','Matos','Limpeza','Rua 2','120','quadra B','Bairro joel','São Paulo','São paulo'),
    ('2','00011122233','Leonardo','S','Silva','Revisão','Rua y','10',default,'Bairro Amanda','São Paulo','São paulo');
    
-- Cliente
insert into cliente(idEquipe, cpf, primeiroNome, mNome, sobrenome, rua, numCasa, complemento, bairro, cidade, estado) values
	('1','33322211100','Miguel','A','Nascimento','Rua 1','10','quadra A','Bairro joel','São Paulo','São paulo'),
    ('1','33322211101','Lúcia','M','Martins','Rua x','100',default,'Bairro Matão','São Paulo','São paulo'),
    ('2','33322211102','Pedro',default,'Silva','Rua santos','10',default,'Bairro São Carlos','São Paulo','São paulo'),
    ('2','33322211103','João','P','Marques','Rua 2','120','quadra B','Bairro joel','São Paulo','São paulo'),
    ('2','33322211104','Vinícius','F','','Rua ','10',default,'Bairro Amanda','São Paulo','São paulo');

-- Veículo
insert into veiculo (idEquipe, idCliente, modelo, marca, placa, ano) values
	('1','1','Uno','Fiat','abc9090','2000'),
    ('1','2','Palio','Fiat','abc8080','2018'),
    ('1','3','Gol','Volkswagen','abc7070','2018'),
    ('2','4','Celta','Chevrolet','xyz6060','2010'),
    ('2','5','C3','Citroen','xyz5050','2012');
    
-- Ordem de servico
insert into servico (idEquipe, dataEmissao, dataConclusao, statusServico, valorServico) values
	('1','2022-08-19','2022-09-28',default,'1300.0'),
    ('2','2021-07-10','2021-07-17','Concluído','200.0'),
    ('1','2020-09-08','2020-09-18','Concluído','3000.0'),
    ('2','2022-06-08','2022-06-19','Concluído','240.0'),
    ('1','2022-07-10','2022-08-10','Concluído','900.0');
    
-- Peça
insert into peca (nomePeca) values
	('Freio'),
    ('Câmbio'),
    ('Roda'),
    ('Volante'),
    ('Carburador'),
    ('Pneu'),
    ('Lanterna');

-- Pedidos peças
insert into pedidosPecas (idServico, idPeca, quantidade) values
	('1','1','2'),
    ('1','2','1'),
    ('2','3','4'),
    ('2','7','2'),
    ('3','1','1'),
    ('4','1','2'),
    ('5','4','1');
    
-- Tabela referência de serviço
insert into refServico (tipoServico, valorRefServico) values
	('Troca de roda', '500.0'),
    ('Troca de pneu', '120.0'),
    ('Manutenção do motor', '1300.0'),
    ('Troca de direção', '1500.0'),
    ('Troca de freio', '600.0'),
    ('Revisão Geral', '200.0');

-- Tabela serviço consulta tabela referência
insert into consultaServico (idServico, idRefServico) values
	('1','2'),
    ('2','1'),
    ('3','1'),
    ('4','3'),
    ('5','5');