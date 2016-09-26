# mysql注入攻击

“SQL 注入攻击”这个术语我想大部分读者朋友都听说过了？指的就是攻击者根据数据
库的 SQL 语句解析器的原理，利用程序中对客户端所提交数据的校验漏洞，从而通过程序动
态提交数据接口提交非法数据，达到攻击者的入侵目的

## 权限系统

MySQL 的权限系统在实现上比较简单，相关权限信息主要存储在几个被称为 grant tables 的系统表中，即：

mysql.User
mysql.db
mysql.Host
mysql.table_priv
mysql.column_priv由于权限信息数据量比较小，而且访问又非常频繁，所以 Mysql 在启动的时候，就会将所有的权限信息都 Load 到内存中保存在几个特定的结构中。所以才有我们每次手工修改了权限相关的表之后，都需要执行“FLUSH PRIVILEGES”命令重新加载 MySQL的权限信息。当然，如果我们通过 GRANT，REVOKE 或者 DROP USER 命令来修改相关权限，则不需要手工执行 FLUSH PRIVILEGES 命令，因为通过 GRANT，REVOKE 或者 DROP USER 命令所做的权限修改在修改系统表的同时也会更新内存结构中的权限信息。

在 MySQL5.0.2 或更高版本的时候，MySQL还增加了CREATE USER命令，以此创建无任何特别权限（仅拥有初始USAGE权限）的用户，通过 CREATE USER 命令创建新了新用户之后，新用户的信息也会自动更新到内存结构中。所以，建议读者一般情况下尽量使用 GRANT，REVOKE，CREATE USER 以及 DROP USER 命令来进行用户和权限的变更操作，尽量减少直接修改 grant tables 来实现用户和权限变更的操作。