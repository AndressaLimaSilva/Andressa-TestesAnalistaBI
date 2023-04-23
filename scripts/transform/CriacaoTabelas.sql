USE [TesteAnalistaBI]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO 

CREATE TABLE [dbo].[tb_empresas_bolsa](
	[id] int primary key,
	[cd_acao_rdz] [varchar](100) not null,
	[nm_empresa] [varchar](100) not null,
	[setor_economico] [varchar](200) not null,
	[subsetor] [varchar](200) not null,
	[segmento] [varchar](500) not null,
	[segmento_b3] [varchar](50) not null,
	[nm_segmento_b3] [varchar](50) not null,
	[cd_acao] [varchar](100) not null,
	[tx_cnpj] [varchar](50) not null,
	[vl_cnpj] numeric not null,
	[cnpj] [varchar](20) not null,
	[created_at] datetime not null,
	[updated_at] datetime not null
) 
GO

CREATE TABLE [dbo].[tb_cotacoes_bolsa](
	[id] int primary key,
	[tp_reg] numeric not null,
	[dt_pregao] date not null,
	[cd_bdi] int not null,
	[cd_acao] [varchar](50) not null,
	[tp_merc] int not null,
	[nm_empresa_rdz] [varchar](50) not null,
	[especi] [varchar](50) not null,
	[prazot] numeric not null,
	[moeda_ref] [varchar](50) not null,
	[vl_abertura] money not null,
	[vl_maximo] money not null,
	[vl_minimo] money not null,
	[vl_medio] money not null,
	[vl_fechamento] money not null,
	[vl_mlh_oft_compra] money not null,
	[vl_mlh_oft_venda] money not null,
	[vl_ttl_neg] money not null,
	[qt_tit_neg] int not null,
	[vl_volume] money not null,
	[vl_exec_opc] money not null,
	[in_opc] int not null,
	[dt_vnct_opc] date not null,
	[ft_cotacao] int not null,
	[vl_exec_moeda_corrente] money not null,
	[cd_isin] [varchar](100) not null,
	[cd_acao_rdz] [varchar](50) not null,
	[created_at] datetime not null,
	[updated_at] datetime not null
) 
GO

CREATE TABLE [dbo].[tb_df_empresas](
	[cnpj] [varchar](20) primary key,
	[dt_abertura] date not null,
	[matriz_empresaMatriz] bit not null,
	[cd_cnae_principal] numeric not null,
	[de_cnae_principal] [varchar](500) not null,
	[de_ramo_atividade] [varchar](500) not null,
	[de_setor] [varchar](50) not null,
	[endereco_cep] [varchar](10) not null,
	[endereco_municipio] [varchar](500) not null,
	[endereco_uf] [varchar](2) not null,
	[endereco_regiao] [varchar](50) not null,
	[endereco_mesorregiao] [varchar](100) not null,
	[situacao_cadastral] [varchar](50) not null
) 
GO

CREATE TABLE [dbo].[tb_empresas_nivel_atividade](
	[cnpj] [varchar](20) primary key,
	[nivel_atividade] [varchar](100) not null
) 
GO

CREATE TABLE [dbo].[tb_empresas_porte](
	[cnpj] [varchar](20) primary key,
	[empresa_porte] [varchar](100) not null
) 
GO 

CREATE TABLE [dbo].[tb_empresas_saude_tributaria](
	[cnpj] [varchar](20) primary key,
	[saude_tributaria] [varchar](100) not null
) 
GO

CREATE TABLE [dbo].[tb_empresas_simples](
	[cnpj] [varchar](20) primary key,
	[optante_simples] bit not null,
	[optante_simei] bit not null
) 
GO

/*Criação das chaves estrangeiras*/
ALTER TABLE [tb_empresas_bolsa]
   ADD CONSTRAINT FK_df_empresas FOREIGN KEY (CNPJ)
      REFERENCES [tb_df_empresas] (CNPJ);

ALTER TABLE [tb_empresas_bolsa]
   ADD CONSTRAINT FK_empresas_nivel_atividade FOREIGN KEY (CNPJ)
      REFERENCES [tb_empresas_nivel_atividade] (CNPJ);

ALTER TABLE [tb_empresas_bolsa]
   ADD CONSTRAINT FK_empresas_porte FOREIGN KEY (CNPJ)
      REFERENCES [tb_empresas_porte] (CNPJ);

ALTER TABLE [tb_empresas_bolsa]
   ADD CONSTRAINT FK_empresas_saude_tributaria FOREIGN KEY (CNPJ)
      REFERENCES [tb_empresas_saude_tributaria] (CNPJ);

ALTER TABLE [tb_empresas_simples]
   ADD CONSTRAINT FK_empresas_simples FOREIGN KEY (CNPJ)
      REFERENCES [tb_empresas_simples] (CNPJ);

