DROP DATABASE lojinha;

CREATE DATABASE lojinha CHARSET utf8;

USE lojinha;


CREATE TABLE institucional (
	idInstituicao	int	 NOT NULL AUTO_INCREMENT,
	nome		varchar(50) DEFAULT NULL,
	cpf_cnpj	varchar(14) DEFAULT NULL UNIQUE,
	tipoPessoa 	char(1) DEFAULT 'F' COMMENT '{ ''F'' , ''J'' }',
	endereco	varchar(50) DEFAULT NULL,
	bairro		varchar(30) DEFAULT NULL,
	cidade		varchar(50) DEFAULT NULL,
	uf		varchar(2) DEFAULT NULL,
	cep		varchar(9) DEFAULT NULL,
	telefone	varchar(15) DEFAULT NULL,
	email		varchar(100) DEFAULT NULL UNIQUE,
	logo		varchar(255) DEFAULT NULL,
	PRIMARY KEY	(idInstituicao)
);

CREATE TABLE nivelUsuarios (
	idNivelUsuario	int	 NOT NULL AUTO_INCREMENT,
	nivel		varchar(20) DEFAULT NULL COMMENT '{''Cliente '', ''Funcionário'', ''Caixa '', ''Financeiro '', ''Gerente '', ''Diretor'', ''Administrador''}',
	PRIMARY KEY	(idNivelUsuario)
);

CREATE TABLE usuarios (
	idUsuario	int	 NOT NULL AUTO_INCREMENT,
	email		varchar(100) DEFAULT NULL UNIQUE,
	senha		varchar(64) NOT NULL,
	idNivelUsuario	int	 DEFAULT '1',
	nome		varchar(50) DEFAULT NULL,
	cpf		varchar(14) DEFAULT NULL UNIQUE,
	endereco	varchar(50) DEFAULT NULL,
	bairro		varchar(30) DEFAULT NULL,
	cidade		varchar(50) DEFAULT NULL,
	uf		varchar(2) DEFAULT NULL,
	cep		varchar(9) DEFAULT NULL,
	telefone	varchar(15) DEFAULT NULL,
	foto		varchar(255) DEFAULT NULL,
	ativo		varchar(1) DEFAULT 'N',
	PRIMARY KEY	(idUsuario)
);

CREATE TABLE categorias (
	idCategoria	int	 NOT NULL AUTO_INCREMENT,
	descricao	varchar(30) DEFAULT NULL,
	PRIMARY KEY	(idCategoria)
);

CREATE TABLE produtos (
	idProduto	int	 NOT NULL AUTO_INCREMENT,
	fabricante	varchar(100) DEFAULT NULL,
	nome		varchar(100) DEFAULT NULL,
	marca		varchar(100) DEFAULT NULL,
	modelo		varchar(100) DEFAULT NULL,
	idCategoria	int	 DEFAULT NULL,
	descricao	text,
	unidadeMedida	varchar(15) DEFAULT NULL,
	largura 	decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
	altura 		decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
	profundidade 	decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
	peso 		decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
	cor		varchar(7) DEFAULT NULL,
	dtFabricacao	varchar(45) DEFAULT NULL,
	PRIMARY KEY	(idProduto),
	FOREIGN KEY (idCategoria) REFERENCES categorias (idCategoria)
);

CREATE TABLE estoque (
	idEstoque	int	 NOT NULL AUTO_INCREMENT,
	idProduto	int	 DEFAULT NULL,
	dtEntrada	date	 DEFAULT NULL COMMENT 'YYYY/MM/DD',
	quantidade	int	 DEFAULT '0',
	dtFabricacao	date	 DEFAULT NULL COMMENT 'YYYY/MM/DD',
	dtVencimento	date	 DEFAULT NULL COMMENT 'YYYY/MM/DD',
	nfCompra	text,
	precoCompra 	decimal(15,2) DEFAULT NULL,
	icmsCompra 	decimal(15,2) DEFAULT NULL,
	precoVenda 	decimal(15,2) DEFAULT NULL,
	qtdVendida	int	 DEFAULT NULL,
	qtdOcorrencia	int	 DEFAULT NULL,
	ocorrencia	varchar(1024) DEFAULT NULL,
	PRIMARY KEY	(idEstoque),
	FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

CREATE TABLE pedidos (
	idPedido	int	 NOT NULL AUTO_INCREMENT,
	idUsuario	int	 DEFAULT NULL,
	dtPedido	datetime	DEFAULT NULL,
	dtPagamento 	datetime DEFAULT NULL,
	dtNotaFiscal 	datetime DEFAULT NULL,
	notaFiscal	text,
	dtEnvio 	datetime DEFAULT NULL,
	dtRecebimento 	datetime DEFAULT NULL,
	tipoFrete	int	 DEFAULT '0' COMMENT '{ { 0, Retirada }, { 1, PAC }, { 2, SEDEX }, { 3, MOTOBOY }, { 4, TRANSPORTADORA} }',
	rastreioFrete	varchar(255) DEFAULT NULL,
	entregaendereco	varchar(50) DEFAULT NULL,
	entregaNumero	varchar(10) DEFAULT NULL,
	entregaCompl	varchar(50) DEFAULT NULL,
	entregaBairro	varchar(30) DEFAULT NULL,
	entregaCidade	varchar(50) DEFAULT NULL,
	entregaUF	varchar(2) DEFAULT NULL,
	entregaCEP	varchar(9) DEFAULT NULL,
	entregaTelefone	varchar(15) DEFAULT NULL,
	entregaRefer	varchar(255) DEFAULT NULL,
	valorTotal 	decimal(12,2) DEFAULT NULL,
	qtdItems	int	 DEFAULT NULL,
	dtDevolucao	datetime	DEFAULT NULL,
	motivoDevolucao	text,
	PRIMARY KEY	(idPedido),
	FOREIGN KEY 	(idUsuario) REFERENCES usuarios (idUsuario)
);


CREATE TABLE itemsPedido (
	idItemPedido	int	 NOT NULL AUTO_INCREMENT,
	ordem		int	 DEFAULT NULL,
	idPedido	int	 DEFAULT NULL,
	idEstoque	int	 DEFAULT NULL,
	qtdItem	int	 DEFAULT NULL,
	dtDevolucao 	datetime DEFAULT NULL,
	motivoDevolucao	text,
	PRIMARY KEY	(idItemPedido),
	FOREIGN KEY 	(idEstoque) REFERENCES estoque (idEstoque)
);
