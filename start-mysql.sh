docker run --name edw -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -v $(pwd)/data:/var/lib/mysql -d mysql
