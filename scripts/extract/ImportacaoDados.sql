
/*Importa dados - Tabela [empresas_bolsa]*/
BULK INSERT [dbo].[stg_empresas_bolsa]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\empresas_bolsa.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');


/*Importa dados - Tabela [df_empresas]*/
BULK INSERT [dbo].[stg_df_empresas]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\df_empresas.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');

/*Importa dados - Tabela [cotacoes_bolsa]*/
BULK INSERT [dbo].[stg_cotacoes_bolsa]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\cotacoes_bolsa.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');

/*Importa dados - Tabela [empresas_nivel_atividade]*/
BULK INSERT [dbo].[stg_empresas_nivel_atividade]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\empresas_nivel_atividade.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');

/*Importa dados - Tabela [empresas_porte]*/
BULK INSERT [dbo].[stg_empresas_porte]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\empresas_porte.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');

/*Importa dados - Tabela [empresas_saude_tributaria]*/
BULK INSERT [dbo].[stg_empresas_saude_tributaria]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\empresas_saude_tributaria.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');

/*Importa dados - Tabela [empresas_simples]*/
BULK INSERT [dbo].[stg_empresas_simples]
FROM 'C:\Users\Notebook\Desktop\TesteAnalistaBI\files\raw\empresas_simples.csv'
WITH (FORMAT = 'CSV'
	  , CODEPAGE = '65001'
      , FIRSTROW = 2
      , FIELDTERMINATOR = ';'
      , ROWTERMINATOR = '0x0a');