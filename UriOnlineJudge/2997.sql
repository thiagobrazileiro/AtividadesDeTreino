-- Para cada empregado, listar nome do departamento, nome do empregado,
-- salário bruto, total de descontos e salário líquido. 
-- A saída deve estar agrupada por departamento e divisão.
-- Dentro de cada divisão, a lista de empregados deve
-- estar de forma decrescente por salário líquido.

-- Dica: Você pode utilizar a função COALESCE(check_expression , 0)
-- para substituir algum valor null por zero;
-- Além disso, você também pode utilizar a função ROUND(value, 2)
-- para exibir os valores com 2 casas decimais.

select departamento.nome as "Departamento", empregado.nome as "Empregado",
round(coalesce(sum(vencimento.valor), 0), 2) as "Salario Bruto", round(coalesce(sum(desconto.valor), 0), 2) as "Total Desconto",
round(coalesce(sum(vencimento.valor) - sum(desconto.valor), 0), 2) as "Salario Liquidoaws" from empregado
left join emp_venc ev on ev.matr = empregado.matr
left join vencimento on vencimento.cod_venc = ev.cod_venc
left join emp_desc ed on ed.matr = empregado.matr
left join desconto on desconto.cod_desc = ed.cod_desc
inner join departamento on departamento.cod_dep = empregado.lotacao
inner join divisao on divisao.cod_divisao = empregado.lotacao_div
group by empregado.nome, departamento.nome, divisao.cod_divisao
order by round(coalesce(sum(vencimento.valor) - sum(desconto.valor), 0), 2) desc;



select Departamento.nome as 'Departamento', Empregado.nome as 'Empregado',
ROUND(COALESCE(sum(Vencimento.valor), 0), 2) as 'Salario Bruto', ROUND(COALESCE(sum(Desconto.valor), 0), 2) as 'Total Desconto',
ROUND(COALESCE(sum(Vencimento.valor) - sum(Desconto.valor), 0), 2) as 'Salario Liquidoaws' from Empregado
left join Emp_venc ev on ev.matr = Empregado.matr
left join Vencimento on Vencimento.cod_venc = ev.cod_venc
left join Emp_desc ed on ed.matr = Empregado.matr
left join Desconto on Desconto.cod_desc = ed.cod_desc
inner join Departamento on Departamento.cod_dep = Empregado.lotacao
inner join Divisao on Divisao.cod_divisao = Empregado.lotacao_div
group by Empregado.nome, Departamento.nome, Divisao.cod_divisao
order by ROUND(COALESCE(sum(Vencimento.valor) - sum(Desconto.valor), 0), 2) desc;


select departamento.nome as 'departamento', empregado.nome as 'empregado',
ROUND(COALESCE(sum(vencimento.valor), 0), 2) as 'Salario Bruto', ROUND(COALESCE(sum(desconto.valor), 0), 2) as 'Total desconto',
ROUND(COALESCE(sum(vencimento.valor) - sum(desconto.valor), 0), 2) as 'Salario Liquidoaws' from empregado
left join emp_venc ev on ev.matr = empregado.matr
left join vencimento on vencimento.cod_venc = ev.cod_venc
left join emp_desc ed on ed.matr = empregado.matr
left join desconto on desconto.cod_desc = ed.cod_desc
inner join departamento on departamento.cod_dep = empregado.lotacao
inner join divisao on divisao.cod_divisao = empregado.lotacao_div
group by empregado.nome, departamento.nome, divisao.cod_divisao
order by ROUND(COALESCE(sum(vencimento.valor) - sum(desconto.valor), 0), 2) desc;




select 
departamento.nome as "Departamento",
empregado.nome as "Empregado",
round(coalesce(sum(vencimento.valor),0),2) as "Salario Bruto",
round(coalesce(tabela.val_desc,0),2) as "Total Desconto",
round(coalesce(sum(vencimento.valor),0) - coalesce(tabela.val_desc,0),2) as "Salario Liquidoaws"
from 
    emp_venc right join 
    empregado on empregado.matr = emp_venc.matr left join
    vencimento on vencimento.cod_venc = emp_venc.cod_venc left join
    departamento on departamento.cod_dep = empregado.lotacao left join
    (select empregado.matr, sum(desconto.valor) as val_desc
    from 
    empregado inner join 
    emp_desc on emp_desc.matr = empregado.matr left join
    desconto on desconto.cod_desc = emp_desc.cod_desc
    group by empregado.matr) as tabela on tabela.matr = empregado.matr

group by departamento.nome, empregado.nome, tabela.val_desc
order by (coalesce(sum(vencimento.valor),0) - coalesce(tabela.val_desc,0)) desc















CREATE TABLE Departamento
(
cod_dep int NOT NULL,
nome varchar(50) NULL,
endereco varchar(50) NULL,
CONSTRAINT PK_Departamento PRIMARY KEY CLUSTERED ( cod_dep ASC )
);
CREATE TABLE Dependente
(
matr int NOT NULL,
nome varchar(50) NULL,
endereco varchar(50) NULL,
CONSTRAINT PK_Dependente PRIMARY KEY CLUSTERED (matr ASC)
);
CREATE TABLE Desconto(
cod_desc int NOT NULL,
nome varchar(50) NULL,
tipo nchar(10) NULL,
valor float NULL,
CONSTRAINT PK_Desconto PRIMARY KEY CLUSTERED (cod_desc ASC)
);
CREATE TABLE Divisao
(
cod_divisao int NOT NULL,
nome varchar(50) NULL,
endereco nchar(10) NULL,
cod_dep int NULL,
CONSTRAINT PK_Divisao PRIMARY KEY CLUSTERED ( cod_divisao ASC )
);
CREATE TABLE Emp_desc
(
cod_desc int NOT NULL,
matr int NOT NULL,
CONSTRAINT PK_emp_desc PRIMARY KEY CLUSTERED
( cod_desc ASC, matr ASC )
);
CREATE TABLE Emp_venc
(
cod_venc int NOT NULL,
matr int NOT NULL,
CONSTRAINT PK_emp_venc PRIMARY KEY CLUSTERED
( cod_venc ASC, matr ASC )
);
CREATE TABLE Empregado(
matr int NOT NULL,
nome varchar(50) NULL,
endereco varchar(50) NULL,
data_lotacao datetime NULL,
lotacao int NULL,
gerencia_cod_dep int NULL,
lotacao_div int NULL,
gerencia_div int NULL,
CONSTRAINT PK_Empregado PRIMARY KEY CLUSTERED ( matr ASC )
);
CREATE TABLE Vencimento(
cod_venc int NOT NULL,
nome varchar(50) NULL,
tipo varchar(10) NULL,
valor float NULL,
CONSTRAINT PK_Vencimento PRIMARY KEY CLUSTERED ( cod_venc ASC )
);

INSERT INTO Departamento (cod_dep, nome, endereco)
VALUES (1,'Contabilidade','R. X');
INSERT INTO Departamento (cod_dep, nome, endereco)
VALUES (2,'TI','R. Y');
INSERT INTO Departamento (cod_dep, nome, endereco)
VALUES (3,'Engenharia','R. Y');
INSERT INTO Dependente (matr, nome, endereco)
VALUES(9999,'Francisco Jose','R. Z');
INSERT INTO Dependente (matr, nome, endereco)
VALUES(88,'Maria da Silva','R. T');
INSERT INTO Dependente (matr, nome, endereco)
VALUES(55,'Virgulino da Silva','R. 31');
INSERT INTO Desconto (cod_desc, nome, tipo, valor)
VALUES (91,'IR','V',400);
INSERT INTO Desconto (cod_desc, nome, tipo, valor)
VALUES (92,'Plano de saude','V',300);
INSERT INTO Desconto (cod_desc, nome, tipo, valor)
VALUES (93,null,null,null);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (11,'Ativo','R. X',1);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (12,'Passivo','R. X',1);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (21,'Desenvolvimento de Projetos','R. Y',2);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (22,'Analise de Sistemas','R. Y',2);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (23,'Programacao','R. W',2);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (31,'Concreto','R. Y',3);
INSERT INTO Divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (32,'Calculo Estrutural','R. Y',3);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(91,3);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(91,27);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(91,9999);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(92,27);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(92,71);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(92,88);
INSERT INTO Emp_desc (cod_desc, matr) VALUES(92,9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (1, 27);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (1, 88);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (1, 135);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (1, 254);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (1, 431);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 1);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 5);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 7);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 13);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 33);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (2, 9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (3, 3);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (3, 55);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (3, 71);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (3, 222);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (4, 25);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (4, 476);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (5, 371);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (6, 3);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (6, 27);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (6, 9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 5);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 33);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 55);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 71);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 88);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 254);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (7, 476);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (8, 25);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (8, 91);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 1);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 27);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 91);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 135);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 371);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (9, 9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (10 ,371);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (10 ,9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (11 ,91);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (12 ,3);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (12 ,27);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (12 ,254);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (12 ,9999);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,3);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,5);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,7);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,25);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,33);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,88);
INSERT INTO Emp_venc (cod_venc,matr) VALUES (13 ,135);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(9999,'Jose Sampaio','R. Z','2006-06-06',1,1,12,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(33,'Jose Maria','R. 21','2006-03-01',1,null,11,11);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(1,'Maria Jose','R. 52','2003-03-01',1,null,11,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(7,'Yasmim','R. 13','2014-07-02',1,null,11,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(5,'Rebeca','R. 1','2011-04-01',1,null,12,12);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(13,'Sofia','R. 28','2010-09-09',1,null,12,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(27,'Andre','R. Z','2005-05-01',2,2,22,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(88,'Yami','R. T','2014-02-01',2,null,21,21);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(431,'Joao da Silva','R. Y','2011-07-03',2,null,21,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(135,'Ricardo Reis','R. 33','2009-08-01',2,null,21,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(254,'Barbara','R. Z','2008-01-03',2,null,22,22);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(371,'Ines','R. Y','2005-01-01',2,null,22,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(476,'Flor','R. Z','2015-10-28',2,null,23,23);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(25,'Lina','R. 67','2014-09-01',2,null,23,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(3,'Jose da Silva','R. 8','2011-01-02',3,3,31,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(71,'Silverio dos Reis','R. C','2009-01-05',3,null,31,31);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(91,'Reis da Silva','R. Z','2011-11-05',3,null,31,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(55,'Lucas','R. 31','2013-07-01',3,null,32,32);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(222,'Marina','R. 31','2015-01-07',3,null,32,null);
INSERT INTO Empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(725,'Angelo','R. X','2001-03-01',2,null,21,null);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(1 ,'Salario base Analista de Sistemas', 'V', 5000);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(2 ,'Salario base Contador', 'V', 3000);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(3 ,'Salario Base Engenheiro', 'V', 4500);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(4 ,'Salario Base Projetista Software ', 'V', 5000);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(5 ,'Salario Base Programador de Sistemas ', 'V', 3000);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(6 ,'Gratificacao Chefia Departamento ', 'V', 3750);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(7 ,'Gratificacao Chefia Divisao', 'V', 2200);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(8 ,'Salario Trabalhador Costrucao Civil', 'V', 800);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(9 ,'Auxilio Salario Familia', 'V', 300);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(10 ,'Gratificacao Tempo de servico', 'V', 350);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(11 ,'Insalubridade', 'V', 800);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(12 ,'Gratificacao por titulacao - Doutorado ', 'V', 2000);
INSERT INTO Vencimento (cod_venc, nome, tipo, valor)
VALUES(13 ,'Gratificacao por Titularidade - Mestrado ', 'V', 800);





INSERT INTO departamento (cod_dep, nome, endereco)
VALUES (1,'Contabilidade','R. X');
INSERT INTO departamento (cod_dep, nome, endereco)
VALUES (2,'TI','R. Y');
INSERT INTO departamento (cod_dep, nome, endereco)
VALUES (3,'Engenharia','R. Y');
INSERT INTO dependente (matr, nome, endereco)
VALUES(9999,'Francisco Jose','R. Z');
INSERT INTO dependente (matr, nome, endereco)
VALUES(88,'Maria da Silva','R. T');
INSERT INTO dependente (matr, nome, endereco)
VALUES(55,'Virgulino da Silva','R. 31');
INSERT INTO desconto (cod_desc, nome, tipo, valor)
VALUES (91,'IR','V',400);
INSERT INTO desconto (cod_desc, nome, tipo, valor)
VALUES (92,'Plano de saude','V',300);
INSERT INTO desconto (cod_desc, nome, tipo, valor)
VALUES (93,null,null,null);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (11,'Ativo','R. X',1);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (12,'Passivo','R. X',1);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (21,'Desenvolvimento de Projetos','R. Y',2);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (22,'Analise de Sistemas','R. Y',2);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (23,'Programacao','R. W',2);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (31,'Concreto','R. Y',3);
INSERT INTO divisao (cod_divisao, nome, endereco, cod_dep)
VALUES (32,'Calculo Estrutural','R. Y',3);
INSERT INTO emp_desc (cod_desc, matr) VALUES(91,9999);
INSERT INTO emp_desc (cod_desc, matr) VALUES(92,9999);
INSERT INTO emp_venc (cod_venc,matr) VALUES (2, 9999);
INSERT INTO emp_venc (cod_venc,matr) VALUES (6, 9999);
INSERT INTO emp_venc (cod_venc,matr) VALUES (9, 9999);
INSERT INTO emp_venc (cod_venc,matr) VALUES (10 ,9999);
INSERT INTO emp_venc (cod_venc,matr) VALUES (12 ,9999);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(9999,'Jose Sampaio','R. Z','2006-06-06',1,1,12,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(33,'Jose Maria','R. 21','2006-03-01',1,null,11,11);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(1,'Maria Jose','R. 52','2003-03-01',1,null,11,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(7,'Yasmim','R. 13','2014-07-02',1,null,11,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(5,'Rebeca','R. 1','2011-04-01',1,null,12,12);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(13,'Sofia','R. 28','2010-09-09',1,null,12,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(27,'Andre','R. Z','2005-05-01',2,2,22,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(88,'Yami','R. T','2014-02-01',2,null,21,21);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(431,'Joao da Silva','R. Y','2011-07-03',2,null,21,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(135,'Ricardo Reis','R. 33','2009-08-01',2,null,21,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(254,'Barbara','R. Z','2008-01-03',2,null,22,22);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(371,'Ines','R. Y','2005-01-01',2,null,22,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(476,'Flor','R. Z','2015-10-28',2,null,23,23);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(25,'Lina','R. 67','2014-09-01',2,null,23,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(55,'Lucas','R. 31','2013-07-01',3,null,32,32);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(222,'Marina','R. 31','2015-01-07',3,null,32,null);
INSERT INTO empregado (matr, nome, endereco, data_lotacao,
lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES(725,'Angelo','R. X','2001-03-01',2,null,21,null);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(1 ,'Salario base Analista de Sistemas', 'V', 5000);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(2 ,'Salario base Contador', 'V', 3000);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(3 ,'Salario Base Engenheiro', 'V', 4500);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(4 ,'Salario Base Projetista Software ', 'V', 5000);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(5 ,'Salario Base Programador de Sistemas ', 'V', 3000);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(6 ,'Gratificacao Chefia Departamento ', 'V', 3750);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(7 ,'Gratificacao Chefia Divisao', 'V', 2200);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(8 ,'Salario Trabalhador Costrucao Civil', 'V', 800);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(9 ,'Auxilio Salario Familia', 'V', 300);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(10 ,'Gratificacao Tempo de servico', 'V', 350);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(11 ,'Insalubridade', 'V', 800);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(12 ,'Gratificacao por titulacao - Doutorado ', 'V', 2000);
INSERT INTO vencimento (cod_venc, nome, tipo, valor)
VALUES(13 ,'Gratificacao por Titularidade - Mestrado ', 'V', 800);