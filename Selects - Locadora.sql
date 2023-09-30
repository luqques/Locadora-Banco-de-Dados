
use locadora;

#Consultar as tabelas
select * from conta;
select * from usuario;
select * from filme;
select * from estudio;
select * from genero;
select * from lista;
select * from aluguel;

##################################

# 1. Consulta de FILMES mais ALUGADOS
select f.nome as filme, count(ID) as quantidade_filmes
from filme f
join aluguel a
	on a.filme_id = f.id
group by filme
order by quantidade_filmes desc;

# 2. Consulta de quantidade de FILMES na LISTA por USUARIO
select u.nome as usuario, count(l.filme_id) as quantidade_filmes
from filme f
join lista l
	on l.filme_id = f.id
join usuario u
	on l.usuario_id = u.id
group by usuario;

# 3. Consulta de quantidade de USUARIOS por CONTA
select c.email as conta, count(u.id) as quantidade_usuarios
from conta c
join usuario u
	on c.id = u.conta_id
group by conta;

# 4. Consulta de quantidade de FILMES por GENERO.
select g.nome as genero, count(f.id) as quantidade_filmes
from filme f
join genero g
    on g.id = f.genero_id
group by genero;

# Extra: Consulta de quantidade de FILME ALUGADO para cada CONTA
select count(f.nome) as filme, c.email as conta 
from filme f 
join aluguel a 
	on a.filme_id = f.id 
join conta c 
	on c.id = a.conta_id
group by conta;

#################### SELECTS RELATÓRIOS ####################

# 1 - Qual o total de filmes vendidos por gênero e estúdio ao longo de x tempo?
select g.nome as genero, count(1) as total_filmes_alugados
from aluguel a
join filme f
	on f.id = a.filme_id
join genero g
	on g.id = f.genero_id where a.data_aluguel between '2023-09-19' and '2023-09-21'
group by genero;

select e.nome as estudio, count(1) as total_filmes_alugados
from aluguel a
join filme f
	on f.id = a.filme_id
join estudio e
	on e.id = f.estudio_id where a.data_aluguel between '2023-09-19' and '2023-09-21'
group by estudio;

# 2 - Qual a média de usuários por conta?
select avg(quantidade_usuarios) as media_usuarios_por_conta
from (select c.email as conta, count(u.id) as quantidade_usuarios
from conta c
join usuario u
	on c.id = u.conta_id
group by conta) as a;
#from vw_quantidade_usuarios_por_conta;

# 3 - Quais os gêneros mais assistidos por mês/ano?
select g.nome as genero, month(a.data_aluguel) as mes
from genero g
join filme f
	on f.genero_id = g.id
join aluguel a
	on a.filme_id = f.id
where a.data_aluguel between '2023-09-01' and '2023-10-01'
group by genero
order by mes desc;

# 4 - Qual a média de tempo que os filmes são alugados e quais os dias da semana mais movimentados em termos de aluguel?


# 5 - Qual a distribuição do gosto por filmes entre diferentes faixas etárias? Qual a distribuição geográfica dos filmes mais alugados?


##################################

#Inserts nas tabelas

insert into aluguel (filme_id, conta_id, tempo_locacao, valor_aluguel, data_aluguel, data_final_aluguel) 
values (2, 6, 5, 10, current_timestamp, data_aluguel + tempo_locacao);

insert into genero values (null, "Ficção Científica");

insert into lista values (6, 6);

insert into filme values (null, "Alladin", 2019, 10, "Aladdin é um filme musical de fantasia e romance estadunidense de 2019, dirigido por Guy Ritchie e escrito por Ritchie em colaboração com John August e Vanessa Taylor, sendo o remake em live-action do longa-metragem animado Aladdin, de 1992, baseado no conto árabe Aladim e a Lâmpada Maravilhosa de autoria de Hanna Diyab, que foi adicionado às As Mil e Uma Noites por Antoine Galland, aparecendo em sua tradução francesa Les mille et une nuits.", 1, 5),
	(null, "Frozen", 2013, 8.5, "Frozen é um filme de animação musical estadunidense de 2013, o 53.º animado dos Clássicos Disney produzido pela Walt Disney Animation Studios e distribuído pela Walt Disney Pictures.", 1, 4),
    (null, "Resgate", 2020, 20, "Resgate (Extraction) é um filme de suspense de ação americano de 2020, dirigido por Sam Hargrave e roteiro de Joe Russo, baseado no Romance gráfico de 2014 ciudad de Ande Parks, Joe Russo, Anthony Russo, Fernando Leon Gonzalez e Eric Skillman", 2, 6),
    (null, "Barbie", 2023, 25, "Barbie é um filme estadunidense dos gêneros comédia e fantasia dirigido por Greta Gerwig, com o roteiro co-escrito com Noah Baumbach. ", 3, 3);