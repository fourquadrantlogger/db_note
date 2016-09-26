# MYSQL server

MySQL 可以看成是二层架构

+ 第一层我们通常叫做 SQL Layer

在 MySQL 数
据库系统处理底层数据之前的所有工作都是在这一层完成的，包括权限判断，sql 解析，执行计划优化，query cache 的处理等等；

+ 第二层就是存储引擎层，我们通常叫做 Storage Engine Layer

也就是底层数据存取操作实现部分，由多种存储引擎共同组成