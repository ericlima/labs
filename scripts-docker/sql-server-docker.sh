jdbc:jtds:sqlserver://vspasr1scdbp02.ds.impresa.pt:1433/assinaturas


docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=my@S3cr3t' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest 
