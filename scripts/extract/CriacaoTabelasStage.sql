USE [TesteAnalistaBI]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_empresas_bolsa](
	[id] [varchar](max) NULL,
	[cd_acao_rdz] [varchar](max) NULL,
	[nm_empresa] [varchar](max) NULL,
	[setor_economico] [varchar](max) NULL,
	[subsetor] [varchar](max) NULL,
	[segmento] [varchar](max) NULL,
	[segmento_b3] [varchar](max) NULL,
	[nm_segmento_b3] [varchar](max) NULL,
	[cd_acao] [varchar](max) NULL,
	[tx_cnpj] [varchar](max) NULL,
	[vl_cnpj] [varchar](max) NULL,
	[created_at] [varchar](max) NULL,
	[updated_at] [varchar](max) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[stg_df_empresas](
	[cnpj] [varchar](max) NULL,
	[dt_abertura] [varchar](max) NULL,
	[matriz empresaMatriz] [varchar](max) NULL,
	[cd_cnae_principal] [varchar](max) NULL,
	[de_cnae_principal] [varchar](max) NULL,
	[de_ramo_atividade] [varchar](max) NULL,
	[de_setor] [varchar](max) NULL,
	[endereco_cep] [varchar](max) NULL,
	[endereco_municipio] [varchar](max) NULL,
	[endereco_uf] [varchar](max) NULL,
	[endereco_regiao] [varchar](max) NULL,
	[endereco_mesorregiao] [varchar](max) NULL,
	[situacao_cadastral] [varchar](max) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[stg_cotacoes_bolsa](
	[id] [varchar](max) NULL,
	[tp_reg] [varchar](max) NULL,
	[dt_pregao] [varchar](max) NULL,
	[cd_bdi] [varchar](max) NULL,
	[cd_acao] [varchar](max) NULL,
	[tp_merc] [varchar](max) NULL,
	[nm_empresa_rdz] [varchar](max) NULL,
	[especi] [varchar](max) NULL,
	[prazot] [varchar](max) NULL,
	[moeda_ref] [varchar](max) NULL,
	[vl_abertura] [varchar](max) NULL,
	[vl_maximo] [varchar](max) NULL,
	[vl_minimo] [varchar](max) NULL,
	[vl_medio] [varchar](max) NULL,
	[vl_fechamento] [varchar](max) NULL,
	[vl_mlh_oft_compra] [varchar](max) NULL,
	[vl_mlh_oft_venda] [varchar](max) NULL,
	[vl_ttl_neg] [varchar](max) NULL,
	[qt_tit_neg] [varchar](max) NULL,
	[vl_volume] [varchar](max) NULL,
	[vl_exec_opc] [varchar](max) NULL,
	[in_opc] [varchar](max) NULL,
	[dt_vnct_opc] [varchar](max) NULL,
	[ft_cotacao] [varchar](max) NULL,
	[vl_exec_moeda_corrente] [varchar](max) NULL,
	[cd_isin] [varchar](max) NULL,
	[cd_acao_rdz] [varchar](max) NULL,
	[created_at] [varchar](max) NULL,
	[updated_at] [varchar](max) NULL,
	[__index_level_0__] [varchar](max) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[stg_empresas_nivel_atividade](
	[cnpj] [varchar](max) NULL,
	[nivel_atividade] [varchar](max) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[stg_empresas_porte](
	[cnpj] [varchar](max) NULL,
	[empresa_porte] [varchar](max) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[stg_empresas_saude_tributaria](
	[cnpj] [varchar](max) NULL,
	[saude_tributaria] [varchar](max) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[stg_empresas_simples](
	[cnpj] [varchar](max) NULL,
	[optante_simples] [varchar](max) NULL,
	[optante_simei] [varchar](max) NULL
) ON [PRIMARY]
GO