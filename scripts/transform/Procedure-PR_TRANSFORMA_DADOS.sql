USE [TesteAnalistaBI]
GO
/****** Object:  StoredProcedure [dbo].[pr_transforma_dados]    Script Date: 21/04/2023 15:12:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_transforma_dados]
as
begin

	declare @erro varchar(max)

	begin try
	insert into [tb_empresas_bolsa]
	select
		try_convert(numeric,rtrim(ltrim(id)))									as id,
		isnull(rtrim(ltrim(cd_acao_rdz)),'N/A')									as cd_acao_rdz,
		isnull(rtrim(ltrim(nm_empresa)),'N/A')									as nm_empresa,
		isnull(rtrim(ltrim(setor_economico)),'N/A')								as setor_economico,
		isnull(rtrim(ltrim(subsetor)),'N/A')									as subsetor,
		isnull(rtrim(ltrim(segmento)),'N/A')									as segmento,
		isnull(rtrim(ltrim(segmento_b3)),'N/A')									as segmento_b3,
		isnull(rtrim(ltrim(nm_segmento_b3)),'N/A')								as nm_segmento_b3,
		isnull(rtrim(ltrim(cd_acao)),'N/A')										as cd_acao,
		isnull(rtrim(ltrim(tx_cnpj)),'N/A')										as tx_cnpj,
		isnull(rtrim(ltrim(vl_cnpj)),0)											as vl_cnpj,
		isnull(replicate('0',14-len(vl_cnpj))+rtrim(vl_cnpj),'00000000000000')	as cnpj,
		try_convert(date,created_at)											as created_at,
		try_convert(date,updated_at)											as updated_at
	from
		[stg_empresas_bolsa] eb
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_empresas_bolsa] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_cotacoes_bolsa]
	select
		try_convert(numeric,rtrim(ltrim(id)))					as id,
		try_convert(numeric,rtrim(ltrim(tp_reg)))				as tp_reg,
		try_convert(date,rtrim(ltrim(dt_pregao)))				as dt_pregao,
		try_convert(numeric,rtrim(ltrim(cd_bdi)))				as cd_bdi,
		isnull(rtrim(ltrim(cd_acao_rdz)),'N/A')					as cd_acao,
		try_convert(numeric,rtrim(ltrim(tp_merc)))				as tp_merc,
		isnull(rtrim(ltrim(nm_empresa_rdz)),'N/A')				as nm_empresa_rdz,
		isnull(rtrim(ltrim(especi)),'N/A')						as especi,
		isnull(rtrim(ltrim(prazot)),'000')						as prazot,
		isnull(rtrim(ltrim(moeda_ref)),'R$')					as moeda_ref,
		isnull(try_convert(money,vl_abertura),0)				as vl_abertura,
		isnull(try_convert(money,vl_maximo),0)					as vl_maximo,
		isnull(try_convert(money,vl_minimo),0)					as vl_minimo,
		isnull(try_convert(money,vl_medio),0)					as vl_medio,
		isnull(try_convert(money,vl_fechamento),0)				as vl_fechamento,
		isnull(try_convert(money,vl_mlh_oft_compra),0)			as vl_mlh_oft_compra,
		isnull(try_convert(money,vl_mlh_oft_venda),0)			as vl_mlh_oft_venda,
		isnull(try_convert(money,vl_ttl_neg),0)					as vl_mlh_oft_venda,
		isnull(try_convert(numeric,qt_tit_neg),0)				as qt_tit_ne,
		isnull(try_convert(money,vl_volume)	,0)					as vl_volume,
		isnull(try_convert(money,vl_exec_opc),0)				as vl_exec_opc,
		isnull(try_convert(numeric,in_opc),0)					as in_opc,
		try_convert(date,rtrim(ltrim(dt_vnct_opc)))				as dt_vnct_opc,
		isnull(try_convert(numeric,ft_cotacao),0)				as ft_cotacao,
		isnull(try_convert(money,vl_exec_moeda_corrente),0)		as vl_exec_moeda_corrente,
		isnull(rtrim(ltrim(cd_isin)),'N/A')						as cd_isin,
		isnull(rtrim(ltrim(cd_acao_rdz)),'N/A')					as cd_acao_rdz,
		try_convert(date,created_at)							as created_at,
		try_convert(date,updated_at)							as updated_at
	from
		[stg_cotacoes_bolsa] cb
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_cotacoes_bolsa] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_df_empresas]
	select
		isnull(replicate('0',14-len(cnpj))+rtrim(cnpj),'00000000000000')	as cnpj,
		try_convert(date,dt_abertura)										as dt_abertura,
		case
			when [matriz empresaMatriz] = 'true' then 1
			else 0
		end																	as matriz_empresaMatriz,
		isnull(try_convert(numeric,cd_cnae_principal),0)					as cd_cnae_principal,
		isnull(rtrim(ltrim(de_cnae_principal)),'N/A')						as de_cnae_principal,
		isnull(rtrim(ltrim(de_ramo_atividade)),'N/A')						as de_ramo_atividade,
		isnull(rtrim(ltrim(de_setor)),'N/A')								as de_setor,
		left(rtrim(ltrim(endereco_cep)),8)									as endereco_cep,
		isnull(rtrim(ltrim(endereco_municipio)),'N/A')						as endereco_municipio,
		left(rtrim(ltrim(endereco_uf)),2)									as endereco_uf,
		isnull(rtrim(ltrim(endereco_regiao)),'N/A')							as endereco_regiao,
		isnull(rtrim(ltrim(endereco_mesorregiao)),'N/A')					as endereco_mesorregiao,
		iif(situacao_cadastral = 'ATIVA','ATIVA','INATIVA')					as situacao_cadastral
	from
		[stg_df_empresas] dfe
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_df_empresas] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_empresas_nivel_atividade]
	select
		isnull(replicate('0',14-len(cnpj))+rtrim(cnpj),'00000000000000')	as cnpj,
		case
			when nivel_atividade = 'ALTO' then 'ALTO'
			when nivel_atividade = 'MEDIO' then 'MEDIO'
			when nivel_atividade = 'BAIXO' then 'BAIXO'
			when nivel_atividade = 'MUITO BAIXO' then 'MUITO BAIXO'
			else 'INATIVO'
		end																	as de_cnae_principal
	from
		[stg_empresas_nivel_atividade] na
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_empresas_nivel_atividade] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_empresas_porte]
	select
		isnull(replicate('0',14-len(cnpj))+rtrim(cnpj),'00000000000000')	as cnpj,
		case
			when empresa_porte = 'PEQUENA' then 'PEQUENA'
			when empresa_porte = 'MICRO' then 'MICRO'
			when empresa_porte = 'MEDIA' then 'MEDIA'
			when empresa_porte = 'GRANDE' then 'GRANDE'
			when empresa_porte = 'MEI' then 'MEI'
			else 'N/A'
		end																	as de_cnae_principal
	from
		[stg_empresas_porte] ep
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_empresas_porte] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_empresas_saude_tributaria]
	select
		isnull(replicate('0',14-len(cnpj))+rtrim(cnpj),'00000000000000')	as cnpj,
		isnull(lower(saude_tributaria),'N/A')								as de_cnae_principal
	from
		[stg_empresas_saude_tributaria] est
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_empresas_saude_tributaria] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch
	
	begin try
	insert into [tb_empresas_simples]
	select
		isnull(replicate('0',14-len(cnpj))+rtrim(cnpj),'00000000000000')	as cnpj,
		iif(optante_simples='true',1,0)										as optante_simples,
		iif(optante_simei='true',1,0)										as optante_simei
	from
		[stg_empresas_simples] est
	end try
	begin catch
		set @erro = 'Procedure: pr_transforma_dados - Erro ao inserir dados na tabela [tb_empresas_simples] - Erro: '+ ERROR_MESSAGE()
		return @erro
	end catch

 end