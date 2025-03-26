-- Permitir carregamento de dados
SET GLOBAL local_infile = 1;

-- Importar os dados do relatório das operadoras de saúde
LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/operadoras_de_plano_de_saude_ativas/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Importar os dados das demonstrações contábeis
LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2023/1T2023.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2023/2T2023.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2023/3T2023.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2023/4T2023.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2024/1T2024.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2024/2T2024.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2024/3T2024.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Fabio/Downloads/teste-nivelamento/demonstracoes_contabeis/2024/4T2024.csv'
INTO TABLE contas_financeiras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
