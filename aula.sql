create database aula;
use aula;
create table estudante(
matricula int primary key auto_increment,
cpf int not null,
idade int not null,
datadenascimento int not null,
nome varchar(20) not null,
email varchar(30)
);

create table endereco(
codigo int primary key auto_increment,
fk_matricula int,
cep int not null,
logradouro varchar(30),
estado varchar(30) not null,
numero int,
pais varchar(20) not null,
cidade varchar(20) not null,
bairro varchar(20)
);

create table projeto(
codigo int primary key auto_increment,
fk_matricula_aluno int,
foreign key (fk_matricula_aluno) references estudante(matricula),
datadeinicio varchar(20) not null,
situacao varchar(15) not null,
datadefim varchar(20),
titulo varchar(20) not null
);

create table tipodeprojeto(
cod int primary key auto_increment,
nome varchar(20) not null ,
definicao varchar(20)
);

create table projeto_tipodeprojeto(
fk_cod_tipodeprojeto int,
fk_codigo_projeto int,
foreign key (fk_cod_tipodeprojeto) references tipodeprojeto(cod),
foreign key (fk_codigo_projeto) references projeto(codigo),
primary key(fk_codigo_projeto,fk_cod_tipodeprojeto)
);

create table professor(
matricula int primary key auto_increment,
fk_codigo_projeto int,
foreign key (fk_codigo_projeto) references projeto(codigo),
datdenascimento varchar(20),
email varchar(20),
cpf int not null,
idade int not null,
nome varchar(20)
);


create table professor_participa_projeto(
fk_matricula_professor int,
fk_codigo_projeto int,
foreign key (fk_matricula_professor) references professor(matricula),
foreign key (fk_codigo_projeto) references projeto(codigo),
primary key(fk_codigo_projeto,fk_matricula_professor)
);

create table linhadepesquisa(
cod int primary key auto_increment,
descricao varchar(80),
titulo varchar(20)
);

create table linhadepesquisa_professor(
fk_matricula_professor int,
fk_cod_linhadepesquisa int,
foreign key (fk_matricula_professor) references professor(matricula),
foreign key (fk_cod_linhadepesquisa) references linhadepesquisa(cod),
primary key(fk_matricula_professor,fk_cod_linhadepesquisa)
);