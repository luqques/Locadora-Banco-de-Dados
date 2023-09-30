
use locadora;

#Consultar as tabelas
select * from conta;
select * from usuario;
select * from filme;
select * from estudio;
select * from genero;
select * from lista;
select * from aluguel;

############################################### ALTER TABLES ###############################################

#################### ALUGUEL ####################
#Adicionar coluna de DATA_ALUGUEL que serve para gravar a data em que ocorreu o aluguel.
alter table aluguel
add DATA_ALUGUEL date not null;

alter table aluguel
drop column DATA_FINAL_ALUGUEL;

#Adicionar coluna de DATA_ALUGUEL que serve para gravar a data em que ocorreu o aluguel.
alter table aluguel 
add column DATA_FINAL_ALUGUEL datetime not null default current_timestamp;

#################### USUARIO ####################
#Adicionar coluna de IDADE 
alter table usuario
add column IDADE int not null;

####################  ####################

