USE db_mkt_exam;

-- exercicio1
select campanhas_marketing.nome, canais_marketing.nome
from campanhas_marketing
left join campanhas_canais on campanhas_marketing.campanha_id = campanhas_canais.campanha_id
left join canais_marketing on campanhas_canais.canal_id = canais_marketing.canal_id;

-- exercicio3
select interacoes_marketing.tipo, campanhas_marketing.nome
from interacoes_marketing
inner join campanhas_marketing on interacoes_marketing.campanha_id = campanhas_marketing.campanha_id;

-- exercicio4
select campanhas_marketing.nome, sum(campanhas_canais.gastos)
from campanhas_marketing
inner join campanhas_canais on campanhas_marketing.campanha_id = campanhas_canais.campanha_id
group by campanhas_marketing.nome;

-- exercicio5
select campanhas_marketing.nome, sum(interacoes_marketing.interacao_id)
from campanhas_marketing
left join interacoes_marketing on campanhas_marketing.campanha_id =interacoes_marketing.campanha_id
group by campanhas_marketing.nome;

-- exercicio7
select campanhas_marketing.nome, canais_marketing.nome
from campanhas_marketing
right join campanhas_canais on campanhas_marketing.campanha_id = campanhas_canais.campanha_id
right join canais_marketing on campanhas_canais.canal_id = canais_marketing.canal_id;

-- exercicio10
select canais_marketing.nome, sum(campanhas_canais.gastos)
from canais_marketing
left join campanhas_canais on canais_marketing.canal_id = campanhas_canais.canal_id
group by canais_marketing.nome;
