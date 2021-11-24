docker run --name mysql -e MYSQL_ROOT_PASSWORD=s3cr3t -d mysql

docker run -p 3306:3306 -v /tmp:/tmp --name mysql --detach -e MYSQL_ROOT_PASSWORD="s3cr3t" -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=mysql -d mysql/mysql-server:5.6 --lower_case_table_names=1 --init-connect='GRANT CREATE USER ON *.* TO 'root'@'%';FLUSH PRIVILEGES;'
