USE [TesteAnalistaBI]
GO

/****** Object:  View [dbo].[VW_DADOS_POWERBI]    Script Date: 21/04/2023 17:42:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_DADOS_POWERBI] AS
SELECT 
	convert(varchar(7),CB.dt_pregao) Periodo,
	CB.dt_pregao,
	CB.cd_acao,
	CB.nm_empresa_rdz,
	CB.moeda_ref,
	CB.vl_abertura,
	CB.vl_maximo,
	CB.vl_minimo,
	CB.vl_medio,
	CB.vl_fechamento,
	CB.vl_mlh_oft_compra,
	CB.vl_mlh_oft_venda,
	CB.vl_ttl_neg,
	CB.qt_tit_neg,
	CB.vl_volume,
	CB.ft_cotacao,
	CB.cd_isin,
	DF.cnpj,
	EB.nm_empresa,
	EB.setor_economico,
	EB.subsetor,
	EB.segmento,
	EB.segmento_b3,
	DF.dt_abertura,
	DF.matriz_empresaMatriz,
	DF.de_cnae_principal,
	DF.de_ramo_atividade,
	DF.de_setor,
	DF.endereco_cep,
	DF.endereco_municipio,
	DF.endereco_uf,
	DF.endereco_regiao,
	DF.endereco_mesorregiao,
	DF.situacao_cadastral,
	NA.nivel_atividade,
	EP.empresa_porte,
	ST.saude_tributaria,
	ES.optante_simei,
	ES.optante_simples
FROM
	[TesteAnalistaBI]..[tb_empresas_bolsa]					EB 
	JOIN [TesteAnalistaBI]..[tb_cotacoes_bolsa]				CB ON CB.cd_acao = EB.cd_acao_rdz
	JOIN [TesteAnalistaBI]..[tb_df_empresas]				DF ON DF.cnpj = EB.cnpj
	JOIN [TesteAnalistaBI]..[tb_empresas_nivel_atividade]	NA ON DF.cnpj = NA.cnpj
	JOIN [TesteAnalistaBI]..[tb_empresas_porte]				EP ON DF.cnpj = EP.cnpj
	JOIN [TesteAnalistaBI]..[tb_empresas_saude_tributaria]	ST ON DF.cnpj = ST.cnpj
	JOIN [TesteAnalistaBI]..[tb_empresas_simples]			ES ON DF.cnpj = ES.cnpj




GO


