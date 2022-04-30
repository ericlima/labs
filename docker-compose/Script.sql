select max(data) from covid19_opt

LOAD DATA INPATH '/datasus/HIST_PAINEL_COVIDBR_2020_Parte1_06jul2021.csv' INTO TABLE covid19;
LOAD DATA INPATH '/datasus/HIST_PAINEL_COVIDBR_2020_Parte2_06jul2021.csv' INTO TABLE covid19;
LOAD DATA INPATH '/datasus/HIST_PAINEL_COVIDBR_2021_Parte1_06jul2021.csv' INTO TABLE covid19;
LOAD DATA INPATH '/datasus/HIST_PAINEL_COVIDBR_2021_Parte2_06jul2021.csv' INTO TABLE covid19;

select count(1) from covid19;



CREATE or TABLE covid19_otimizada as select * from covid19 where codmun != null;

CREATE TABLE Customer_transactions (
 Customer_id VARCHAR(40),
 txn_amout DECIMAL(38, 2),
 txn_type  VARCHAR(100))
PARTITIONED BY (txn_date STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE;



    CREATE TABLE datasus.covid19 (
        regiao string,
        estado string,
        municipio string,
        coduf int,
        codRegiaoSaude int,
        nomeRegiaoSaude string,
        data string,
        semanaEpi int,
        populacaoTCU2019 int,
        casosAcumulado int,
        casosNovos int,
        obitosAcumulado int,
        obitosNovos int,
        Recuperadosnovos int,
        emAcompanhamentoNovos int,
        interiorMetropolitana string
        ) 
        PARTITIONED BY (codmun int)
        ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
        STORED AS TEXTFILE;

truncate table covid19;
       



set hive.exec.dynamic.partition.mode=nonstrict

insert into table covid19 partition(codmun) select regiao,estado,municipio,coduf,codregiaosaude,nomeregiaosaude,data,semanaepi,populacaotcu2019,casosacumulado,casosnovos,obitosacumulado,obitosnovos,recuperadosnovos,emacompanhamentonovos,interiormetropolitana,COALESCE(codmun, 0) codmun from covid19_opt WHERE COALESCE(codmun, 0) > 0 and data in (select max(data) from covid19_opt) order by codmun;

       
CREATE TABLE datasus.covid19 (regiao string,estado string,municipio string,coduf int,codRegiaoSaude int,nomeRegiaoSaude string,data string,semanaEpi int,populacaoTCU2019 int,casosAcumulado int,casosNovos int,obitosAcumulado int,obitosNovos int,Recuperadosnovos int,emAcompanhamentoNovos int,interiorMetropolitana string) PARTITIONED BY (codmun int) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

-- default.covid19 definition

CREATE TABLE `default.covid19`(
  `regiao` string, 
  `estado` string, 
  `municipio` string, 
  `coduf` int, 
  `codregiaosaude` int, 
  `nomeregiaosaude` string, 
  `data` TIMESTAMP, 
  `semanaepi` int, 
  `populacaotcu2019` int, 
  `casosacumulado` DECIMAL(10,0), 
  `casosnovos` int, 
  `obitosacumulado` int, 
  `obitosnovos` int, 
  `recuperadosnovos` int, 
  `emacompanhamentonovos` int, 
  `interiormetropolitana` int)
PARTITIONED BY ( 
  `codmun` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='|', 
  'line.delim'='\n', 
  'serialization.format'='|') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://namenode:8020/user/hive/warehouse/covid19'
;
       