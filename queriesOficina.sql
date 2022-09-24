-- Queries da oficina
use oficina;

-- Cliente e seu veículo
select concat(c.primeiroNome,' ',c.sobrenome) as cliente, v.modelo, v.placa from cliente c, veiculo v
	where c.idCliente = v.idCliente;
    
-- Consultar quais equipes possuem mais de 2 veículos na sua responsabilidade
select nomeEquipe as equipe, count(*) as qtd_veiculos from equipe
	inner join veiculo
		using (idEquipe)
        group by (idEquipe)
        having qtd_veiculos > 2;
        
-- Consultar quantidade de pedidos feitos por serviço
select idServico, idEquipe, count(*) as qtd_pedidos from servico
	inner join pedidosPecas
		using (idServico)
        group by (idServico)
        order by(qtd_pedidos) desc;

-- Consultar nome da peça pedida em cada serviço
select idServico, nomePeca, quantidade from pedidosPecas
	inner join peca
    using (idPeca)
    order by (idServico);
