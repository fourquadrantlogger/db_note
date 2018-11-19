```
docker run --restart=always --name test-mysql -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -p:33306:3306 -d mysql:5.7
docker exec  -it test-mysql /bin/bash

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
